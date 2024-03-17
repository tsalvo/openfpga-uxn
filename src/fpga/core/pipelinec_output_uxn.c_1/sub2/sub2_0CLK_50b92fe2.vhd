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
-- BIN_OP_EQ[uxn_opcodes_h_l2497_c6_ecfb]
signal BIN_OP_EQ_uxn_opcodes_h_l2497_c6_ecfb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2497_c6_ecfb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2497_c6_ecfb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2497_c2_31cb]
signal result_u8_value_MUX_uxn_opcodes_h_l2497_c2_31cb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2497_c2_31cb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_31cb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2497_c2_31cb]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_31cb_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2497_c2_31cb]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2497_c2_31cb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_31cb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2497_c2_31cb]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_31cb_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2497_c2_31cb]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2497_c2_31cb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_31cb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2497_c2_31cb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_31cb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2497_c2_31cb]
signal tmp16_MUX_uxn_opcodes_h_l2497_c2_31cb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2497_c2_31cb]
signal n16_MUX_uxn_opcodes_h_l2497_c2_31cb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2497_c2_31cb]
signal t16_MUX_uxn_opcodes_h_l2497_c2_31cb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2510_c11_6103]
signal BIN_OP_EQ_uxn_opcodes_h_l2510_c11_6103_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2510_c11_6103_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2510_c11_6103_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2510_c7_be31]
signal result_u8_value_MUX_uxn_opcodes_h_l2510_c7_be31_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2510_c7_be31_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2510_c7_be31]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_be31_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_be31_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2510_c7_be31]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_be31_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_be31_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2510_c7_be31]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_be31_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_be31_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2510_c7_be31]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_be31_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_be31_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2510_c7_be31]
signal tmp16_MUX_uxn_opcodes_h_l2510_c7_be31_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2510_c7_be31_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2510_c7_be31]
signal n16_MUX_uxn_opcodes_h_l2510_c7_be31_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2510_c7_be31_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2510_c7_be31]
signal t16_MUX_uxn_opcodes_h_l2510_c7_be31_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2510_c7_be31_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2513_c11_3024]
signal BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3024_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3024_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3024_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2513_c7_0c65]
signal result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0c65_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2513_c7_0c65]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0c65_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2513_c7_0c65]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0c65_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2513_c7_0c65]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0c65_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2513_c7_0c65]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0c65_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2513_c7_0c65]
signal tmp16_MUX_uxn_opcodes_h_l2513_c7_0c65_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2513_c7_0c65]
signal n16_MUX_uxn_opcodes_h_l2513_c7_0c65_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2513_c7_0c65]
signal t16_MUX_uxn_opcodes_h_l2513_c7_0c65_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2518_c11_4292]
signal BIN_OP_EQ_uxn_opcodes_h_l2518_c11_4292_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2518_c11_4292_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2518_c11_4292_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2518_c7_d8d2]
signal result_u8_value_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2518_c7_d8d2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2518_c7_d8d2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2518_c7_d8d2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2518_c7_d8d2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2518_c7_d8d2]
signal tmp16_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2518_c7_d8d2]
signal n16_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2518_c7_d8d2]
signal t16_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2519_c3_fe72]
signal BIN_OP_OR_uxn_opcodes_h_l2519_c3_fe72_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2519_c3_fe72_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2519_c3_fe72_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2522_c11_c459]
signal BIN_OP_EQ_uxn_opcodes_h_l2522_c11_c459_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2522_c11_c459_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2522_c11_c459_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2522_c7_fd09]
signal result_u8_value_MUX_uxn_opcodes_h_l2522_c7_fd09_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2522_c7_fd09_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2522_c7_fd09_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2522_c7_fd09]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_fd09_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_fd09_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_fd09_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2522_c7_fd09]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_fd09_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_fd09_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_fd09_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2522_c7_fd09]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_fd09_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_fd09_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_fd09_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2522_c7_fd09]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_fd09_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_fd09_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_fd09_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2522_c7_fd09]
signal tmp16_MUX_uxn_opcodes_h_l2522_c7_fd09_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2522_c7_fd09_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2522_c7_fd09_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2522_c7_fd09]
signal n16_MUX_uxn_opcodes_h_l2522_c7_fd09_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2522_c7_fd09_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2522_c7_fd09_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2526_c11_5be7]
signal BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5be7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5be7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5be7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2526_c7_779d]
signal result_u8_value_MUX_uxn_opcodes_h_l2526_c7_779d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2526_c7_779d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2526_c7_779d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2526_c7_779d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2526_c7_779d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_779d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_779d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_779d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_779d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2526_c7_779d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_779d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_779d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_779d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_779d_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2526_c7_779d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_779d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_779d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_779d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_779d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2526_c7_779d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_779d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_779d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_779d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_779d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2526_c7_779d]
signal tmp16_MUX_uxn_opcodes_h_l2526_c7_779d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2526_c7_779d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2526_c7_779d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2526_c7_779d_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2526_c7_779d]
signal n16_MUX_uxn_opcodes_h_l2526_c7_779d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2526_c7_779d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2526_c7_779d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2526_c7_779d_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2527_c3_b73d]
signal BIN_OP_OR_uxn_opcodes_h_l2527_c3_b73d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2527_c3_b73d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2527_c3_b73d_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2528_c11_d486]
signal BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_d486_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_d486_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_d486_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2529_c30_d7db]
signal sp_relative_shift_uxn_opcodes_h_l2529_c30_d7db_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2529_c30_d7db_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2529_c30_d7db_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2529_c30_d7db_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2534_c11_fc7e]
signal BIN_OP_EQ_uxn_opcodes_h_l2534_c11_fc7e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2534_c11_fc7e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2534_c11_fc7e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2534_c7_88e2]
signal result_u8_value_MUX_uxn_opcodes_h_l2534_c7_88e2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2534_c7_88e2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2534_c7_88e2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2534_c7_88e2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2534_c7_88e2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_88e2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_88e2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_88e2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_88e2_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2534_c7_88e2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_88e2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_88e2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_88e2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_88e2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2534_c7_88e2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_88e2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_88e2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_88e2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_88e2_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2537_c31_5303]
signal CONST_SR_8_uxn_opcodes_h_l2537_c31_5303_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2537_c31_5303_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2524_l2515_DUPLICATE_d095
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2524_l2515_DUPLICATE_d095_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2524_l2515_DUPLICATE_d095_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_243c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_pc_updated := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2497_c6_ecfb
BIN_OP_EQ_uxn_opcodes_h_l2497_c6_ecfb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2497_c6_ecfb_left,
BIN_OP_EQ_uxn_opcodes_h_l2497_c6_ecfb_right,
BIN_OP_EQ_uxn_opcodes_h_l2497_c6_ecfb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2497_c2_31cb
result_u8_value_MUX_uxn_opcodes_h_l2497_c2_31cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2497_c2_31cb_cond,
result_u8_value_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_31cb
result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_31cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_31cb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_31cb
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_31cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_31cb_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_31cb
result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_31cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_31cb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_31cb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_31cb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_31cb
result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_31cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_31cb_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_31cb
result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_31cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_31cb
result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_31cb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_31cb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_31cb
result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_31cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_31cb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2497_c2_31cb
tmp16_MUX_uxn_opcodes_h_l2497_c2_31cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2497_c2_31cb_cond,
tmp16_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue,
tmp16_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse,
tmp16_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output);

-- n16_MUX_uxn_opcodes_h_l2497_c2_31cb
n16_MUX_uxn_opcodes_h_l2497_c2_31cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2497_c2_31cb_cond,
n16_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue,
n16_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse,
n16_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output);

-- t16_MUX_uxn_opcodes_h_l2497_c2_31cb
t16_MUX_uxn_opcodes_h_l2497_c2_31cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2497_c2_31cb_cond,
t16_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue,
t16_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse,
t16_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2510_c11_6103
BIN_OP_EQ_uxn_opcodes_h_l2510_c11_6103 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2510_c11_6103_left,
BIN_OP_EQ_uxn_opcodes_h_l2510_c11_6103_right,
BIN_OP_EQ_uxn_opcodes_h_l2510_c11_6103_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2510_c7_be31
result_u8_value_MUX_uxn_opcodes_h_l2510_c7_be31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2510_c7_be31_cond,
result_u8_value_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2510_c7_be31_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_be31
result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_be31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_be31_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_be31_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_be31
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_be31 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_be31_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_be31_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_be31
result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_be31 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_be31_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_be31_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_be31
result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_be31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_be31_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_be31_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2510_c7_be31
tmp16_MUX_uxn_opcodes_h_l2510_c7_be31 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2510_c7_be31_cond,
tmp16_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue,
tmp16_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse,
tmp16_MUX_uxn_opcodes_h_l2510_c7_be31_return_output);

-- n16_MUX_uxn_opcodes_h_l2510_c7_be31
n16_MUX_uxn_opcodes_h_l2510_c7_be31 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2510_c7_be31_cond,
n16_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue,
n16_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse,
n16_MUX_uxn_opcodes_h_l2510_c7_be31_return_output);

-- t16_MUX_uxn_opcodes_h_l2510_c7_be31
t16_MUX_uxn_opcodes_h_l2510_c7_be31 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2510_c7_be31_cond,
t16_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue,
t16_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse,
t16_MUX_uxn_opcodes_h_l2510_c7_be31_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3024
BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3024 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3024_left,
BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3024_right,
BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3024_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0c65
result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0c65 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0c65_cond,
result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0c65
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0c65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0c65_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0c65
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0c65 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0c65_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0c65
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0c65 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0c65_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0c65
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0c65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0c65_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2513_c7_0c65
tmp16_MUX_uxn_opcodes_h_l2513_c7_0c65 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2513_c7_0c65_cond,
tmp16_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue,
tmp16_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse,
tmp16_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output);

-- n16_MUX_uxn_opcodes_h_l2513_c7_0c65
n16_MUX_uxn_opcodes_h_l2513_c7_0c65 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2513_c7_0c65_cond,
n16_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue,
n16_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse,
n16_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output);

-- t16_MUX_uxn_opcodes_h_l2513_c7_0c65
t16_MUX_uxn_opcodes_h_l2513_c7_0c65 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2513_c7_0c65_cond,
t16_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue,
t16_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse,
t16_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2518_c11_4292
BIN_OP_EQ_uxn_opcodes_h_l2518_c11_4292 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2518_c11_4292_left,
BIN_OP_EQ_uxn_opcodes_h_l2518_c11_4292_right,
BIN_OP_EQ_uxn_opcodes_h_l2518_c11_4292_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2518_c7_d8d2
result_u8_value_MUX_uxn_opcodes_h_l2518_c7_d8d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_d8d2
result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_d8d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_d8d2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_d8d2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_d8d2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_d8d2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_d8d2
result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_d8d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2518_c7_d8d2
tmp16_MUX_uxn_opcodes_h_l2518_c7_d8d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond,
tmp16_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue,
tmp16_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse,
tmp16_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output);

-- n16_MUX_uxn_opcodes_h_l2518_c7_d8d2
n16_MUX_uxn_opcodes_h_l2518_c7_d8d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond,
n16_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue,
n16_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse,
n16_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output);

-- t16_MUX_uxn_opcodes_h_l2518_c7_d8d2
t16_MUX_uxn_opcodes_h_l2518_c7_d8d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond,
t16_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue,
t16_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse,
t16_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2519_c3_fe72
BIN_OP_OR_uxn_opcodes_h_l2519_c3_fe72 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2519_c3_fe72_left,
BIN_OP_OR_uxn_opcodes_h_l2519_c3_fe72_right,
BIN_OP_OR_uxn_opcodes_h_l2519_c3_fe72_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2522_c11_c459
BIN_OP_EQ_uxn_opcodes_h_l2522_c11_c459 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2522_c11_c459_left,
BIN_OP_EQ_uxn_opcodes_h_l2522_c11_c459_right,
BIN_OP_EQ_uxn_opcodes_h_l2522_c11_c459_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2522_c7_fd09
result_u8_value_MUX_uxn_opcodes_h_l2522_c7_fd09 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2522_c7_fd09_cond,
result_u8_value_MUX_uxn_opcodes_h_l2522_c7_fd09_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2522_c7_fd09_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_fd09
result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_fd09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_fd09_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_fd09_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_fd09_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_fd09
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_fd09 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_fd09_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_fd09_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_fd09_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_fd09
result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_fd09 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_fd09_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_fd09_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_fd09_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_fd09
result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_fd09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_fd09_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_fd09_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_fd09_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2522_c7_fd09
tmp16_MUX_uxn_opcodes_h_l2522_c7_fd09 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2522_c7_fd09_cond,
tmp16_MUX_uxn_opcodes_h_l2522_c7_fd09_iftrue,
tmp16_MUX_uxn_opcodes_h_l2522_c7_fd09_iffalse,
tmp16_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output);

-- n16_MUX_uxn_opcodes_h_l2522_c7_fd09
n16_MUX_uxn_opcodes_h_l2522_c7_fd09 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2522_c7_fd09_cond,
n16_MUX_uxn_opcodes_h_l2522_c7_fd09_iftrue,
n16_MUX_uxn_opcodes_h_l2522_c7_fd09_iffalse,
n16_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5be7
BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5be7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5be7_left,
BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5be7_right,
BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5be7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2526_c7_779d
result_u8_value_MUX_uxn_opcodes_h_l2526_c7_779d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2526_c7_779d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2526_c7_779d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2526_c7_779d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2526_c7_779d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_779d
result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_779d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_779d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_779d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_779d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_779d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_779d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_779d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_779d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_779d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_779d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_779d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_779d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_779d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_779d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_779d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_779d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_779d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_779d
result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_779d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_779d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_779d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_779d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_779d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2526_c7_779d
tmp16_MUX_uxn_opcodes_h_l2526_c7_779d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2526_c7_779d_cond,
tmp16_MUX_uxn_opcodes_h_l2526_c7_779d_iftrue,
tmp16_MUX_uxn_opcodes_h_l2526_c7_779d_iffalse,
tmp16_MUX_uxn_opcodes_h_l2526_c7_779d_return_output);

-- n16_MUX_uxn_opcodes_h_l2526_c7_779d
n16_MUX_uxn_opcodes_h_l2526_c7_779d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2526_c7_779d_cond,
n16_MUX_uxn_opcodes_h_l2526_c7_779d_iftrue,
n16_MUX_uxn_opcodes_h_l2526_c7_779d_iffalse,
n16_MUX_uxn_opcodes_h_l2526_c7_779d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2527_c3_b73d
BIN_OP_OR_uxn_opcodes_h_l2527_c3_b73d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2527_c3_b73d_left,
BIN_OP_OR_uxn_opcodes_h_l2527_c3_b73d_right,
BIN_OP_OR_uxn_opcodes_h_l2527_c3_b73d_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_d486
BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_d486 : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_d486_left,
BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_d486_right,
BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_d486_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2529_c30_d7db
sp_relative_shift_uxn_opcodes_h_l2529_c30_d7db : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2529_c30_d7db_ins,
sp_relative_shift_uxn_opcodes_h_l2529_c30_d7db_x,
sp_relative_shift_uxn_opcodes_h_l2529_c30_d7db_y,
sp_relative_shift_uxn_opcodes_h_l2529_c30_d7db_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2534_c11_fc7e
BIN_OP_EQ_uxn_opcodes_h_l2534_c11_fc7e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2534_c11_fc7e_left,
BIN_OP_EQ_uxn_opcodes_h_l2534_c11_fc7e_right,
BIN_OP_EQ_uxn_opcodes_h_l2534_c11_fc7e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2534_c7_88e2
result_u8_value_MUX_uxn_opcodes_h_l2534_c7_88e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2534_c7_88e2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2534_c7_88e2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2534_c7_88e2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2534_c7_88e2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_88e2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_88e2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_88e2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_88e2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_88e2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_88e2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_88e2
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_88e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_88e2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_88e2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_88e2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_88e2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_88e2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_88e2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_88e2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_88e2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_88e2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_88e2_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2537_c31_5303
CONST_SR_8_uxn_opcodes_h_l2537_c31_5303 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2537_c31_5303_x,
CONST_SR_8_uxn_opcodes_h_l2537_c31_5303_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2524_l2515_DUPLICATE_d095
CONST_SL_8_uint16_t_uxn_opcodes_h_l2524_l2515_DUPLICATE_d095 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2524_l2515_DUPLICATE_d095_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2524_l2515_DUPLICATE_d095_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2497_c6_ecfb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output,
 tmp16_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output,
 n16_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output,
 t16_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2510_c11_6103_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2510_c7_be31_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_be31_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_be31_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_be31_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_be31_return_output,
 tmp16_MUX_uxn_opcodes_h_l2510_c7_be31_return_output,
 n16_MUX_uxn_opcodes_h_l2510_c7_be31_return_output,
 t16_MUX_uxn_opcodes_h_l2510_c7_be31_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3024_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output,
 tmp16_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output,
 n16_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output,
 t16_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2518_c11_4292_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output,
 tmp16_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output,
 n16_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output,
 t16_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2519_c3_fe72_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2522_c11_c459_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output,
 tmp16_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output,
 n16_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5be7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2526_c7_779d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_779d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_779d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_779d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_779d_return_output,
 tmp16_MUX_uxn_opcodes_h_l2526_c7_779d_return_output,
 n16_MUX_uxn_opcodes_h_l2526_c7_779d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2527_c3_b73d_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_d486_return_output,
 sp_relative_shift_uxn_opcodes_h_l2529_c30_d7db_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2534_c11_fc7e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2534_c7_88e2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_88e2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_88e2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_88e2_return_output,
 CONST_SR_8_uxn_opcodes_h_l2537_c31_5303_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2524_l2515_DUPLICATE_d095_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_ecfb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_ecfb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_ecfb_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_be31_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_31cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_be31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_31cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2497_c2_31cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_31cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2497_c2_31cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2507_c3_3b0d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_be31_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_31cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2497_c2_31cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_31cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2497_c2_31cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2502_c3_0b04 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_be31_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_31cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_be31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_31cb_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_be31_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_31cb_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2510_c7_be31_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2497_c2_31cb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2510_c7_be31_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2497_c2_31cb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_6103_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_6103_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_6103_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_be31_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_be31_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2511_c3_2750 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_be31_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_be31_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_be31_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_be31_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2510_c7_be31_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2510_c7_be31_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3024_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3024_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3024_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0c65_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0c65_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2516_c3_c704 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0c65_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0c65_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0c65_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_0c65_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2513_c7_0c65_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2513_c7_0c65_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_4292_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_4292_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_4292_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2520_c3_332b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2519_c3_fe72_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2519_c3_fe72_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2519_c3_fe72_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_c459_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_c459_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_c459_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_fd09_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_fd09_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_779d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_fd09_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_fd09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_fd09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_779d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_fd09_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_fd09_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_fd09_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_779d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_fd09_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_fd09_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_fd09_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_779d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_fd09_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_fd09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_fd09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_779d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_fd09_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_fd09_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_fd09_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_779d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_fd09_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2522_c7_fd09_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2522_c7_fd09_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2526_c7_779d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2522_c7_fd09_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5be7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5be7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5be7_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_779d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_779d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_88e2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_779d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_779d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_779d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_779d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_779d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2531_c3_92c2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_779d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_88e2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_779d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_779d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_779d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_88e2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_779d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_779d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_779d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_88e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_779d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_779d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_779d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_779d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2526_c7_779d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2526_c7_779d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2526_c7_779d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2527_c3_b73d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2527_c3_b73d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2527_c3_b73d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_d486_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_d486_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_d486_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_d7db_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_d7db_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_d7db_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_d7db_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2532_c21_5ec7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_fc7e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_fc7e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_fc7e_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_88e2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_88e2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_88e2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_88e2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2535_c3_698b : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_88e2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_88e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_88e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_88e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_88e2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_88e2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2536_c3_2d5c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_88e2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_88e2_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2537_c31_5303_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2537_c31_5303_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2537_c21_ccdf_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2513_l2510_l2497_l2534_l2522_l2518_DUPLICATE_3766_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2513_l2510_l2526_l2522_l2518_DUPLICATE_7b4f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2513_l2510_l2534_l2522_l2518_DUPLICATE_1375_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2513_l2510_l2534_l2526_l2522_l2518_DUPLICATE_fa23_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2514_l2527_l2519_l2523_DUPLICATE_c15d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2524_l2515_DUPLICATE_d095_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2524_l2515_DUPLICATE_d095_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2534_l2522_DUPLICATE_2526_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l2493_l2541_DUPLICATE_b896_return_output : opcode_result_t;
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
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5be7_right := to_unsigned(5, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2516_c3_c704 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2516_c3_c704;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2535_c3_698b := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_88e2_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2535_c3_698b;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_88e2_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2531_c3_92c2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_779d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2531_c3_92c2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3024_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2520_c3_332b := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2520_c3_332b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_6103_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_fc7e_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_c459_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_d7db_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_4292_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2502_c3_0b04 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2502_c3_0b04;
     VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_d7db_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2511_c3_2750 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2511_c3_2750;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2507_c3_3b0d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2507_c3_3b0d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2536_c3_2d5c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_88e2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2536_c3_2d5c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_ecfb_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_779d_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_d7db_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2527_c3_b73d_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2526_c7_779d_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_ecfb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_6103_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3024_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_4292_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_c459_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5be7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_fc7e_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_d486_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2519_c3_fe72_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2537_c31_5303_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_fd09_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_779d_iffalse := tmp16;
     -- CONST_SR_8[uxn_opcodes_h_l2537_c31_5303] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2537_c31_5303_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2537_c31_5303_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2537_c31_5303_return_output := CONST_SR_8_uxn_opcodes_h_l2537_c31_5303_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2513_l2510_l2534_l2522_l2518_DUPLICATE_1375 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2513_l2510_l2534_l2522_l2518_DUPLICATE_1375_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2510_c11_6103] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2510_c11_6103_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_6103_left;
     BIN_OP_EQ_uxn_opcodes_h_l2510_c11_6103_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_6103_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_6103_return_output := BIN_OP_EQ_uxn_opcodes_h_l2510_c11_6103_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2513_l2510_l2526_l2522_l2518_DUPLICATE_7b4f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2513_l2510_l2526_l2522_l2518_DUPLICATE_7b4f_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2514_l2527_l2519_l2523_DUPLICATE_c15d LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2514_l2527_l2519_l2523_DUPLICATE_c15d_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2497_c6_ecfb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2497_c6_ecfb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_ecfb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2497_c6_ecfb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_ecfb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_ecfb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2497_c6_ecfb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2513_c11_3024] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3024_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3024_left;
     BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3024_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3024_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3024_return_output := BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3024_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2497_c2_31cb] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2497_c2_31cb_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2522_c11_c459] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2522_c11_c459_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_c459_left;
     BIN_OP_EQ_uxn_opcodes_h_l2522_c11_c459_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_c459_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_c459_return_output := BIN_OP_EQ_uxn_opcodes_h_l2522_c11_c459_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2497_c2_31cb] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2497_c2_31cb_return_output := result.is_stack_index_flipped;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2497_c2_31cb] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2497_c2_31cb_return_output := result.is_ram_write;

     -- sp_relative_shift[uxn_opcodes_h_l2529_c30_d7db] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2529_c30_d7db_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_d7db_ins;
     sp_relative_shift_uxn_opcodes_h_l2529_c30_d7db_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_d7db_x;
     sp_relative_shift_uxn_opcodes_h_l2529_c30_d7db_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_d7db_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_d7db_return_output := sp_relative_shift_uxn_opcodes_h_l2529_c30_d7db_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2526_c11_5be7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5be7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5be7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5be7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5be7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5be7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5be7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2534_c11_fc7e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2534_c11_fc7e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_fc7e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2534_c11_fc7e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_fc7e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_fc7e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2534_c11_fc7e_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2534_l2522_DUPLICATE_2526 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2534_l2522_DUPLICATE_2526_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2513_l2510_l2534_l2526_l2522_l2518_DUPLICATE_fa23 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2513_l2510_l2534_l2526_l2522_l2518_DUPLICATE_fa23_return_output := result.is_opc_done;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2497_c2_31cb] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2497_c2_31cb_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2513_l2510_l2497_l2534_l2522_l2518_DUPLICATE_3766 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2513_l2510_l2497_l2534_l2522_l2518_DUPLICATE_3766_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2518_c11_4292] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2518_c11_4292_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_4292_left;
     BIN_OP_EQ_uxn_opcodes_h_l2518_c11_4292_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_4292_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_4292_return_output := BIN_OP_EQ_uxn_opcodes_h_l2518_c11_4292_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2497_c2_31cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_ecfb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_31cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_ecfb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_31cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_ecfb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_ecfb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_31cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_ecfb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_31cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_ecfb_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_ecfb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_31cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_ecfb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_31cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_ecfb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_31cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_ecfb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2497_c2_31cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_ecfb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_31cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c6_ecfb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2510_c7_be31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_6103_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_be31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_6103_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_be31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_6103_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_be31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_6103_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_be31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_6103_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_be31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_6103_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2510_c7_be31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_6103_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_be31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2510_c11_6103_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2513_c7_0c65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3024_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0c65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3024_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0c65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3024_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0c65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3024_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0c65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3024_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0c65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3024_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2513_c7_0c65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3024_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_0c65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2513_c11_3024_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_4292_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_4292_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_4292_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_4292_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_4292_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_4292_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_4292_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2518_c11_4292_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2522_c7_fd09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_c459_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_fd09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_c459_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_fd09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_c459_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_fd09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_c459_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_fd09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_c459_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_fd09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_c459_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_fd09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2522_c11_c459_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2526_c7_779d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5be7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_779d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5be7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_779d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5be7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_779d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5be7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_779d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5be7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_779d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5be7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_779d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2526_c11_5be7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_88e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_fc7e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_88e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_fc7e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_88e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_fc7e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_88e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2534_c11_fc7e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2519_c3_fe72_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2514_l2527_l2519_l2523_DUPLICATE_c15d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2527_c3_b73d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2514_l2527_l2519_l2523_DUPLICATE_c15d_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2524_l2515_DUPLICATE_d095_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2514_l2527_l2519_l2523_DUPLICATE_c15d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2513_l2510_l2534_l2522_l2518_DUPLICATE_1375_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2513_l2510_l2534_l2522_l2518_DUPLICATE_1375_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2513_l2510_l2534_l2522_l2518_DUPLICATE_1375_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_fd09_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2513_l2510_l2534_l2522_l2518_DUPLICATE_1375_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_88e2_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2513_l2510_l2534_l2522_l2518_DUPLICATE_1375_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2513_l2510_l2534_l2526_l2522_l2518_DUPLICATE_fa23_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2513_l2510_l2534_l2526_l2522_l2518_DUPLICATE_fa23_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2513_l2510_l2534_l2526_l2522_l2518_DUPLICATE_fa23_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_fd09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2513_l2510_l2534_l2526_l2522_l2518_DUPLICATE_fa23_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_779d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2513_l2510_l2534_l2526_l2522_l2518_DUPLICATE_fa23_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_88e2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2513_l2510_l2534_l2526_l2522_l2518_DUPLICATE_fa23_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2513_l2510_l2526_l2522_l2518_DUPLICATE_7b4f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2513_l2510_l2526_l2522_l2518_DUPLICATE_7b4f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2513_l2510_l2526_l2522_l2518_DUPLICATE_7b4f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_fd09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2513_l2510_l2526_l2522_l2518_DUPLICATE_7b4f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_779d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2513_l2510_l2526_l2522_l2518_DUPLICATE_7b4f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_fd09_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2534_l2522_DUPLICATE_2526_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_88e2_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2534_l2522_DUPLICATE_2526_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2513_l2510_l2497_l2534_l2522_l2518_DUPLICATE_3766_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2513_l2510_l2497_l2534_l2522_l2518_DUPLICATE_3766_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2513_l2510_l2497_l2534_l2522_l2518_DUPLICATE_3766_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2513_l2510_l2497_l2534_l2522_l2518_DUPLICATE_3766_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_fd09_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2513_l2510_l2497_l2534_l2522_l2518_DUPLICATE_3766_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_88e2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2513_l2510_l2497_l2534_l2522_l2518_DUPLICATE_3766_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2497_c2_31cb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2497_c2_31cb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2497_c2_31cb_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2497_c2_31cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_779d_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2529_c30_d7db_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2534_c7_88e2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_88e2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_88e2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_88e2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_88e2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_88e2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_88e2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_88e2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_88e2_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2527_c3_b73d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2527_c3_b73d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2527_c3_b73d_left;
     BIN_OP_OR_uxn_opcodes_h_l2527_c3_b73d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2527_c3_b73d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2527_c3_b73d_return_output := BIN_OP_OR_uxn_opcodes_h_l2527_c3_b73d_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2497_c2_31cb] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2497_c2_31cb] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_31cb_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_31cb_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2534_c7_88e2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_88e2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_88e2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_88e2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_88e2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_88e2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_88e2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_88e2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_88e2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2526_c7_779d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_779d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_779d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_779d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_779d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_779d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_779d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_779d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_779d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2534_c7_88e2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_88e2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_88e2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_88e2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_88e2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_88e2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_88e2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_88e2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_88e2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2497_c2_31cb] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_31cb_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_31cb_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2537_c21_ccdf] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2537_c21_ccdf_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2537_c31_5303_return_output);

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2497_c2_31cb] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2524_l2515_DUPLICATE_d095 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2524_l2515_DUPLICATE_d095_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2524_l2515_DUPLICATE_d095_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2524_l2515_DUPLICATE_d095_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2524_l2515_DUPLICATE_d095_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2519_c3_fe72] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2519_c3_fe72_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2519_c3_fe72_left;
     BIN_OP_OR_uxn_opcodes_h_l2519_c3_fe72_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2519_c3_fe72_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2519_c3_fe72_return_output := BIN_OP_OR_uxn_opcodes_h_l2519_c3_fe72_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2519_c3_fe72_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_d486_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2527_c3_b73d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2526_c7_779d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2527_c3_b73d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_88e2_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2537_c21_ccdf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2522_c7_fd09_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2524_l2515_DUPLICATE_d095_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2524_l2515_DUPLICATE_d095_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_779d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2534_c7_88e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_fd09_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2526_c7_779d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_779d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2534_c7_88e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_779d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2534_c7_88e2_return_output;
     -- t16_MUX[uxn_opcodes_h_l2518_c7_d8d2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond <= VAR_t16_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond;
     t16_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue;
     t16_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output := t16_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l2528_c11_d486] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_d486_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_d486_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_d486_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_d486_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_d486_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_d486_return_output;

     -- n16_MUX[uxn_opcodes_h_l2526_c7_779d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2526_c7_779d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2526_c7_779d_cond;
     n16_MUX_uxn_opcodes_h_l2526_c7_779d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2526_c7_779d_iftrue;
     n16_MUX_uxn_opcodes_h_l2526_c7_779d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2526_c7_779d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2526_c7_779d_return_output := n16_MUX_uxn_opcodes_h_l2526_c7_779d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2526_c7_779d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_779d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_779d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_779d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_779d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_779d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_779d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_779d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_779d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2526_c7_779d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_779d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_779d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_779d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_779d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_779d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_779d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_779d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_779d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2526_c7_779d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_779d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_779d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_779d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_779d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_779d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_779d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_779d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_779d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2534_c7_88e2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2534_c7_88e2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_88e2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2534_c7_88e2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_88e2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2534_c7_88e2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_88e2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_88e2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2534_c7_88e2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2522_c7_fd09] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_fd09_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_fd09_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_fd09_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_fd09_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_fd09_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_fd09_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_779d_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_d486_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2522_c7_fd09_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2526_c7_779d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_fd09_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2526_c7_779d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_fd09_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2526_c7_779d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_fd09_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2526_c7_779d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_779d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2534_c7_88e2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output;
     -- n16_MUX[uxn_opcodes_h_l2522_c7_fd09] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2522_c7_fd09_cond <= VAR_n16_MUX_uxn_opcodes_h_l2522_c7_fd09_cond;
     n16_MUX_uxn_opcodes_h_l2522_c7_fd09_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2522_c7_fd09_iftrue;
     n16_MUX_uxn_opcodes_h_l2522_c7_fd09_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2522_c7_fd09_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output := n16_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output;

     -- t16_MUX[uxn_opcodes_h_l2513_c7_0c65] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2513_c7_0c65_cond <= VAR_t16_MUX_uxn_opcodes_h_l2513_c7_0c65_cond;
     t16_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue;
     t16_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output := t16_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2522_c7_fd09] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_fd09_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_fd09_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_fd09_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_fd09_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_fd09_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_fd09_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2532_c21_5ec7] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2532_c21_5ec7_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2528_c11_d486_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2522_c7_fd09] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_fd09_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_fd09_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_fd09_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_fd09_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_fd09_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_fd09_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2518_c7_d8d2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2526_c7_779d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2526_c7_779d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_779d_cond;
     tmp16_MUX_uxn_opcodes_h_l2526_c7_779d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_779d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2526_c7_779d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_779d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_779d_return_output := tmp16_MUX_uxn_opcodes_h_l2526_c7_779d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2522_c7_fd09] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_fd09_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_fd09_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_fd09_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_fd09_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_fd09_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_fd09_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_779d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2532_c21_5ec7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_fd09_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2526_c7_779d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2513_c7_0c65] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0c65_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0c65_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output;

     -- t16_MUX[uxn_opcodes_h_l2510_c7_be31] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2510_c7_be31_cond <= VAR_t16_MUX_uxn_opcodes_h_l2510_c7_be31_cond;
     t16_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue;
     t16_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2510_c7_be31_return_output := t16_MUX_uxn_opcodes_h_l2510_c7_be31_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2518_c7_d8d2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output;

     -- n16_MUX[uxn_opcodes_h_l2518_c7_d8d2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond <= VAR_n16_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond;
     n16_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue;
     n16_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output := n16_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2518_c7_d8d2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2526_c7_779d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2526_c7_779d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_779d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2526_c7_779d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_779d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2526_c7_779d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_779d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_779d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2526_c7_779d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2522_c7_fd09] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2522_c7_fd09_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_fd09_cond;
     tmp16_MUX_uxn_opcodes_h_l2522_c7_fd09_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_fd09_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2522_c7_fd09_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_fd09_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output := tmp16_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2518_c7_d8d2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_fd09_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2526_c7_779d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2510_c7_be31_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2510_c7_be31] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_be31_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_be31_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_be31_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_be31_return_output;

     -- n16_MUX[uxn_opcodes_h_l2513_c7_0c65] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2513_c7_0c65_cond <= VAR_n16_MUX_uxn_opcodes_h_l2513_c7_0c65_cond;
     n16_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue;
     n16_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output := n16_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2513_c7_0c65] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0c65_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0c65_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output;

     -- t16_MUX[uxn_opcodes_h_l2497_c2_31cb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2497_c2_31cb_cond <= VAR_t16_MUX_uxn_opcodes_h_l2497_c2_31cb_cond;
     t16_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue;
     t16_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output := t16_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2518_c7_d8d2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond;
     tmp16_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output := tmp16_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2522_c7_fd09] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2522_c7_fd09_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_fd09_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2522_c7_fd09_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_fd09_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2522_c7_fd09_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_fd09_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output := result_u8_value_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2513_c7_0c65] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0c65_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0c65_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2513_c7_0c65] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0c65_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0c65_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2510_c7_be31_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2522_c7_fd09_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2510_c7_be31] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_be31_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_be31_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_be31_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_be31_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2510_c7_be31] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_be31_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_be31_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_be31_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_be31_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2497_c2_31cb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_31cb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_31cb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2510_c7_be31] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_be31_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_be31_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_be31_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_be31_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2513_c7_0c65] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2513_c7_0c65_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_0c65_cond;
     tmp16_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output := tmp16_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output;

     -- n16_MUX[uxn_opcodes_h_l2510_c7_be31] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2510_c7_be31_cond <= VAR_n16_MUX_uxn_opcodes_h_l2510_c7_be31_cond;
     n16_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue;
     n16_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2510_c7_be31_return_output := n16_MUX_uxn_opcodes_h_l2510_c7_be31_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2518_c7_d8d2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_d8d2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_d8d2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_d8d2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2510_c7_be31_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2510_c7_be31_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2510_c7_be31_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2510_c7_be31_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2518_c7_d8d2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output;
     -- n16_MUX[uxn_opcodes_h_l2497_c2_31cb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2497_c2_31cb_cond <= VAR_n16_MUX_uxn_opcodes_h_l2497_c2_31cb_cond;
     n16_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue;
     n16_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output := n16_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2513_c7_0c65] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0c65_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0c65_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0c65_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0c65_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output := result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2497_c2_31cb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_31cb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_31cb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2497_c2_31cb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_31cb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_31cb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2497_c2_31cb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_31cb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_31cb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2510_c7_be31] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2510_c7_be31_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_be31_cond;
     tmp16_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_be31_return_output := tmp16_MUX_uxn_opcodes_h_l2510_c7_be31_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2513_c7_0c65_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2510_c7_be31_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2497_c2_31cb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2497_c2_31cb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_31cb_cond;
     tmp16_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output := tmp16_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2510_c7_be31] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2510_c7_be31_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_be31_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_be31_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_be31_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_be31_return_output := result_u8_value_MUX_uxn_opcodes_h_l2510_c7_be31_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2510_c7_be31_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2497_c2_31cb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2497_c2_31cb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_31cb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_31cb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_31cb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output := result_u8_value_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l2493_l2541_DUPLICATE_b896 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l2493_l2541_DUPLICATE_b896_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_243c(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c2_31cb_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l2493_l2541_DUPLICATE_b896_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l2493_l2541_DUPLICATE_b896_return_output;
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
