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
-- Submodules: 67
entity swp2_0CLK_814c2afd is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end swp2_0CLK_814c2afd;
architecture arch of swp2_0CLK_814c2afd is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16_high : unsigned(7 downto 0) := to_unsigned(0, 8);
signal t16_low : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16_high : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16_low : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16_high : unsigned(7 downto 0);
signal REG_COMB_t16_low : unsigned(7 downto 0);
signal REG_COMB_n16_high : unsigned(7 downto 0);
signal REG_COMB_n16_low : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2602_c6_f571]
signal BIN_OP_EQ_uxn_opcodes_h_l2602_c6_f571_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2602_c6_f571_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2602_c6_f571_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2602_c2_336c]
signal t16_high_MUX_uxn_opcodes_h_l2602_c2_336c_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2602_c2_336c_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2602_c2_336c]
signal n16_low_MUX_uxn_opcodes_h_l2602_c2_336c_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2602_c2_336c_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2602_c2_336c]
signal t16_low_MUX_uxn_opcodes_h_l2602_c2_336c_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2602_c2_336c_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2602_c2_336c]
signal n16_high_MUX_uxn_opcodes_h_l2602_c2_336c_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2602_c2_336c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2602_c2_336c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2602_c2_336c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2602_c2_336c_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2602_c2_336c]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2602_c2_336c_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2602_c2_336c_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2602_c2_336c]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c2_336c_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c2_336c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2602_c2_336c]
signal result_u8_value_MUX_uxn_opcodes_h_l2602_c2_336c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2602_c2_336c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2602_c2_336c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2602_c2_336c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2602_c2_336c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2602_c2_336c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c2_336c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c2_336c_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2602_c2_336c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2602_c2_336c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2602_c2_336c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2602_c2_336c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c2_336c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c2_336c_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2602_c2_336c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2602_c2_336c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2602_c2_336c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2615_c11_d8b7]
signal BIN_OP_EQ_uxn_opcodes_h_l2615_c11_d8b7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2615_c11_d8b7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2615_c11_d8b7_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2615_c7_d90e]
signal t16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2615_c7_d90e]
signal n16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2615_c7_d90e]
signal t16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2615_c7_d90e]
signal n16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2615_c7_d90e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c7_d90e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2615_c7_d90e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c7_d90e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2615_c7_d90e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_d90e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2615_c7_d90e]
signal result_u8_value_MUX_uxn_opcodes_h_l2615_c7_d90e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2615_c7_d90e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_d90e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2618_c11_f2df]
signal BIN_OP_EQ_uxn_opcodes_h_l2618_c11_f2df_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2618_c11_f2df_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2618_c11_f2df_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2618_c7_833b]
signal t16_high_MUX_uxn_opcodes_h_l2618_c7_833b_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2618_c7_833b_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2618_c7_833b]
signal n16_low_MUX_uxn_opcodes_h_l2618_c7_833b_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2618_c7_833b_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2618_c7_833b]
signal t16_low_MUX_uxn_opcodes_h_l2618_c7_833b_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2618_c7_833b_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2618_c7_833b]
signal n16_high_MUX_uxn_opcodes_h_l2618_c7_833b_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2618_c7_833b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2618_c7_833b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2618_c7_833b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2618_c7_833b_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2618_c7_833b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2618_c7_833b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2618_c7_833b_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2618_c7_833b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2618_c7_833b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2618_c7_833b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2618_c7_833b]
signal result_u8_value_MUX_uxn_opcodes_h_l2618_c7_833b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2618_c7_833b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2618_c7_833b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2618_c7_833b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2618_c7_833b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2622_c11_8310]
signal BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8310_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8310_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8310_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2622_c7_1c9a]
signal n16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2622_c7_1c9a]
signal t16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2622_c7_1c9a]
signal n16_high_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2622_c7_1c9a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2622_c7_1c9a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2622_c7_1c9a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2622_c7_1c9a]
signal result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2622_c7_1c9a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2626_c11_4131]
signal BIN_OP_EQ_uxn_opcodes_h_l2626_c11_4131_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2626_c11_4131_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2626_c11_4131_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2626_c7_02be]
signal n16_low_MUX_uxn_opcodes_h_l2626_c7_02be_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2626_c7_02be_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2626_c7_02be_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2626_c7_02be_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2626_c7_02be]
signal n16_high_MUX_uxn_opcodes_h_l2626_c7_02be_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2626_c7_02be_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2626_c7_02be_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2626_c7_02be_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2626_c7_02be]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_02be_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_02be_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_02be_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_02be_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2626_c7_02be]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_02be_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_02be_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_02be_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_02be_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2626_c7_02be]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_02be_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_02be_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_02be_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_02be_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2626_c7_02be]
signal result_u8_value_MUX_uxn_opcodes_h_l2626_c7_02be_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2626_c7_02be_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2626_c7_02be_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2626_c7_02be_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2626_c7_02be]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_02be_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_02be_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_02be_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_02be_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2628_c30_c8c4]
signal sp_relative_shift_uxn_opcodes_h_l2628_c30_c8c4_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2628_c30_c8c4_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2628_c30_c8c4_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2628_c30_c8c4_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2633_c11_ab5a]
signal BIN_OP_EQ_uxn_opcodes_h_l2633_c11_ab5a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2633_c11_ab5a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2633_c11_ab5a_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2633_c7_6fd0]
signal n16_low_MUX_uxn_opcodes_h_l2633_c7_6fd0_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2633_c7_6fd0_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2633_c7_6fd0_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2633_c7_6fd0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2633_c7_6fd0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_6fd0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_6fd0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_6fd0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_6fd0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2633_c7_6fd0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_6fd0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_6fd0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_6fd0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_6fd0_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2633_c7_6fd0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_6fd0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_6fd0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_6fd0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_6fd0_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2633_c7_6fd0]
signal result_u8_value_MUX_uxn_opcodes_h_l2633_c7_6fd0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2633_c7_6fd0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2633_c7_6fd0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2633_c7_6fd0_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2639_c11_417a]
signal BIN_OP_EQ_uxn_opcodes_h_l2639_c11_417a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2639_c11_417a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2639_c11_417a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2639_c7_8ab5]
signal result_u8_value_MUX_uxn_opcodes_h_l2639_c7_8ab5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2639_c7_8ab5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2639_c7_8ab5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2639_c7_8ab5_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2639_c7_8ab5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_8ab5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_8ab5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_8ab5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_8ab5_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2639_c7_8ab5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_8ab5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_8ab5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_8ab5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_8ab5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2643_c11_0a21]
signal BIN_OP_EQ_uxn_opcodes_h_l2643_c11_0a21_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2643_c11_0a21_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2643_c11_0a21_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2643_c7_8d07]
signal result_u8_value_MUX_uxn_opcodes_h_l2643_c7_8d07_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2643_c7_8d07_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2643_c7_8d07_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2643_c7_8d07_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2643_c7_8d07]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2643_c7_8d07_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2643_c7_8d07_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2643_c7_8d07_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2643_c7_8d07_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2643_c7_8d07]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2643_c7_8d07_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2643_c7_8d07_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2643_c7_8d07_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2643_c7_8d07_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_188e( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_ram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2602_c6_f571
BIN_OP_EQ_uxn_opcodes_h_l2602_c6_f571 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2602_c6_f571_left,
BIN_OP_EQ_uxn_opcodes_h_l2602_c6_f571_right,
BIN_OP_EQ_uxn_opcodes_h_l2602_c6_f571_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2602_c2_336c
t16_high_MUX_uxn_opcodes_h_l2602_c2_336c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2602_c2_336c_cond,
t16_high_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue,
t16_high_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse,
t16_high_MUX_uxn_opcodes_h_l2602_c2_336c_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2602_c2_336c
n16_low_MUX_uxn_opcodes_h_l2602_c2_336c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2602_c2_336c_cond,
n16_low_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue,
n16_low_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse,
n16_low_MUX_uxn_opcodes_h_l2602_c2_336c_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2602_c2_336c
t16_low_MUX_uxn_opcodes_h_l2602_c2_336c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2602_c2_336c_cond,
t16_low_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue,
t16_low_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse,
t16_low_MUX_uxn_opcodes_h_l2602_c2_336c_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2602_c2_336c
n16_high_MUX_uxn_opcodes_h_l2602_c2_336c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2602_c2_336c_cond,
n16_high_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue,
n16_high_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse,
n16_high_MUX_uxn_opcodes_h_l2602_c2_336c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2602_c2_336c
result_is_stack_write_MUX_uxn_opcodes_h_l2602_c2_336c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2602_c2_336c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2602_c2_336c_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2602_c2_336c
result_is_vram_write_MUX_uxn_opcodes_h_l2602_c2_336c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2602_c2_336c_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2602_c2_336c_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c2_336c
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c2_336c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c2_336c_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c2_336c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2602_c2_336c
result_u8_value_MUX_uxn_opcodes_h_l2602_c2_336c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2602_c2_336c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2602_c2_336c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2602_c2_336c
result_is_opc_done_MUX_uxn_opcodes_h_l2602_c2_336c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2602_c2_336c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2602_c2_336c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c2_336c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c2_336c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c2_336c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c2_336c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2602_c2_336c
result_is_pc_updated_MUX_uxn_opcodes_h_l2602_c2_336c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2602_c2_336c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2602_c2_336c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c2_336c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c2_336c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c2_336c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c2_336c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2602_c2_336c
result_is_ram_write_MUX_uxn_opcodes_h_l2602_c2_336c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2602_c2_336c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2602_c2_336c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2615_c11_d8b7
BIN_OP_EQ_uxn_opcodes_h_l2615_c11_d8b7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2615_c11_d8b7_left,
BIN_OP_EQ_uxn_opcodes_h_l2615_c11_d8b7_right,
BIN_OP_EQ_uxn_opcodes_h_l2615_c11_d8b7_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2615_c7_d90e
t16_high_MUX_uxn_opcodes_h_l2615_c7_d90e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_cond,
t16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue,
t16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse,
t16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2615_c7_d90e
n16_low_MUX_uxn_opcodes_h_l2615_c7_d90e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_cond,
n16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue,
n16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse,
n16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2615_c7_d90e
t16_low_MUX_uxn_opcodes_h_l2615_c7_d90e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_cond,
t16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue,
t16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse,
t16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2615_c7_d90e
n16_high_MUX_uxn_opcodes_h_l2615_c7_d90e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_cond,
n16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue,
n16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse,
n16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c7_d90e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c7_d90e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c7_d90e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c7_d90e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c7_d90e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c7_d90e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_d90e
result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_d90e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_d90e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2615_c7_d90e
result_u8_value_MUX_uxn_opcodes_h_l2615_c7_d90e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2615_c7_d90e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_d90e
result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_d90e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_d90e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2618_c11_f2df
BIN_OP_EQ_uxn_opcodes_h_l2618_c11_f2df : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2618_c11_f2df_left,
BIN_OP_EQ_uxn_opcodes_h_l2618_c11_f2df_right,
BIN_OP_EQ_uxn_opcodes_h_l2618_c11_f2df_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2618_c7_833b
t16_high_MUX_uxn_opcodes_h_l2618_c7_833b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2618_c7_833b_cond,
t16_high_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue,
t16_high_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse,
t16_high_MUX_uxn_opcodes_h_l2618_c7_833b_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2618_c7_833b
n16_low_MUX_uxn_opcodes_h_l2618_c7_833b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2618_c7_833b_cond,
n16_low_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue,
n16_low_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse,
n16_low_MUX_uxn_opcodes_h_l2618_c7_833b_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2618_c7_833b
t16_low_MUX_uxn_opcodes_h_l2618_c7_833b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2618_c7_833b_cond,
t16_low_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue,
t16_low_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse,
t16_low_MUX_uxn_opcodes_h_l2618_c7_833b_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2618_c7_833b
n16_high_MUX_uxn_opcodes_h_l2618_c7_833b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2618_c7_833b_cond,
n16_high_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue,
n16_high_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse,
n16_high_MUX_uxn_opcodes_h_l2618_c7_833b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2618_c7_833b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2618_c7_833b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2618_c7_833b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2618_c7_833b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2618_c7_833b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2618_c7_833b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2618_c7_833b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2618_c7_833b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2618_c7_833b
result_is_stack_write_MUX_uxn_opcodes_h_l2618_c7_833b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2618_c7_833b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2618_c7_833b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2618_c7_833b
result_u8_value_MUX_uxn_opcodes_h_l2618_c7_833b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2618_c7_833b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2618_c7_833b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2618_c7_833b
result_is_opc_done_MUX_uxn_opcodes_h_l2618_c7_833b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2618_c7_833b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2618_c7_833b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8310
BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8310 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8310_left,
BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8310_right,
BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8310_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a
n16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond,
n16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue,
n16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse,
n16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a
t16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond,
t16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue,
t16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse,
t16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2622_c7_1c9a
n16_high_MUX_uxn_opcodes_h_l2622_c7_1c9a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond,
n16_high_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue,
n16_high_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse,
n16_high_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c9a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c9a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2622_c7_1c9a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2622_c7_1c9a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2622_c7_1c9a
result_is_stack_write_MUX_uxn_opcodes_h_l2622_c7_1c9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c9a
result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c9a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c9a
result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2626_c11_4131
BIN_OP_EQ_uxn_opcodes_h_l2626_c11_4131 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2626_c11_4131_left,
BIN_OP_EQ_uxn_opcodes_h_l2626_c11_4131_right,
BIN_OP_EQ_uxn_opcodes_h_l2626_c11_4131_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2626_c7_02be
n16_low_MUX_uxn_opcodes_h_l2626_c7_02be : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2626_c7_02be_cond,
n16_low_MUX_uxn_opcodes_h_l2626_c7_02be_iftrue,
n16_low_MUX_uxn_opcodes_h_l2626_c7_02be_iffalse,
n16_low_MUX_uxn_opcodes_h_l2626_c7_02be_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2626_c7_02be
n16_high_MUX_uxn_opcodes_h_l2626_c7_02be : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2626_c7_02be_cond,
n16_high_MUX_uxn_opcodes_h_l2626_c7_02be_iftrue,
n16_high_MUX_uxn_opcodes_h_l2626_c7_02be_iffalse,
n16_high_MUX_uxn_opcodes_h_l2626_c7_02be_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_02be
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_02be : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_02be_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_02be_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_02be_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_02be_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_02be
result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_02be : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_02be_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_02be_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_02be_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_02be_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_02be
result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_02be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_02be_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_02be_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_02be_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_02be_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2626_c7_02be
result_u8_value_MUX_uxn_opcodes_h_l2626_c7_02be : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2626_c7_02be_cond,
result_u8_value_MUX_uxn_opcodes_h_l2626_c7_02be_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2626_c7_02be_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2626_c7_02be_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_02be
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_02be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_02be_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_02be_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_02be_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_02be_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2628_c30_c8c4
sp_relative_shift_uxn_opcodes_h_l2628_c30_c8c4 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2628_c30_c8c4_ins,
sp_relative_shift_uxn_opcodes_h_l2628_c30_c8c4_x,
sp_relative_shift_uxn_opcodes_h_l2628_c30_c8c4_y,
sp_relative_shift_uxn_opcodes_h_l2628_c30_c8c4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2633_c11_ab5a
BIN_OP_EQ_uxn_opcodes_h_l2633_c11_ab5a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2633_c11_ab5a_left,
BIN_OP_EQ_uxn_opcodes_h_l2633_c11_ab5a_right,
BIN_OP_EQ_uxn_opcodes_h_l2633_c11_ab5a_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2633_c7_6fd0
n16_low_MUX_uxn_opcodes_h_l2633_c7_6fd0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2633_c7_6fd0_cond,
n16_low_MUX_uxn_opcodes_h_l2633_c7_6fd0_iftrue,
n16_low_MUX_uxn_opcodes_h_l2633_c7_6fd0_iffalse,
n16_low_MUX_uxn_opcodes_h_l2633_c7_6fd0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_6fd0
result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_6fd0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_6fd0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_6fd0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_6fd0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_6fd0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_6fd0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_6fd0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_6fd0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_6fd0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_6fd0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_6fd0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_6fd0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_6fd0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_6fd0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_6fd0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_6fd0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_6fd0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2633_c7_6fd0
result_u8_value_MUX_uxn_opcodes_h_l2633_c7_6fd0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2633_c7_6fd0_cond,
result_u8_value_MUX_uxn_opcodes_h_l2633_c7_6fd0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2633_c7_6fd0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2633_c7_6fd0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2639_c11_417a
BIN_OP_EQ_uxn_opcodes_h_l2639_c11_417a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2639_c11_417a_left,
BIN_OP_EQ_uxn_opcodes_h_l2639_c11_417a_right,
BIN_OP_EQ_uxn_opcodes_h_l2639_c11_417a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2639_c7_8ab5
result_u8_value_MUX_uxn_opcodes_h_l2639_c7_8ab5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2639_c7_8ab5_cond,
result_u8_value_MUX_uxn_opcodes_h_l2639_c7_8ab5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2639_c7_8ab5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2639_c7_8ab5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_8ab5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_8ab5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_8ab5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_8ab5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_8ab5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_8ab5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_8ab5
result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_8ab5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_8ab5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_8ab5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_8ab5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_8ab5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2643_c11_0a21
BIN_OP_EQ_uxn_opcodes_h_l2643_c11_0a21 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2643_c11_0a21_left,
BIN_OP_EQ_uxn_opcodes_h_l2643_c11_0a21_right,
BIN_OP_EQ_uxn_opcodes_h_l2643_c11_0a21_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2643_c7_8d07
result_u8_value_MUX_uxn_opcodes_h_l2643_c7_8d07 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2643_c7_8d07_cond,
result_u8_value_MUX_uxn_opcodes_h_l2643_c7_8d07_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2643_c7_8d07_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2643_c7_8d07_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2643_c7_8d07
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2643_c7_8d07 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2643_c7_8d07_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2643_c7_8d07_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2643_c7_8d07_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2643_c7_8d07_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2643_c7_8d07
result_is_opc_done_MUX_uxn_opcodes_h_l2643_c7_8d07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2643_c7_8d07_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2643_c7_8d07_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2643_c7_8d07_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2643_c7_8d07_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16_high,
 t16_low,
 n16_high,
 n16_low,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2602_c6_f571_return_output,
 t16_high_MUX_uxn_opcodes_h_l2602_c2_336c_return_output,
 n16_low_MUX_uxn_opcodes_h_l2602_c2_336c_return_output,
 t16_low_MUX_uxn_opcodes_h_l2602_c2_336c_return_output,
 n16_high_MUX_uxn_opcodes_h_l2602_c2_336c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2602_c2_336c_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2602_c2_336c_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c2_336c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2602_c2_336c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2602_c2_336c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c2_336c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2602_c2_336c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c2_336c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2602_c2_336c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2615_c11_d8b7_return_output,
 t16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output,
 n16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output,
 t16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output,
 n16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2618_c11_f2df_return_output,
 t16_high_MUX_uxn_opcodes_h_l2618_c7_833b_return_output,
 n16_low_MUX_uxn_opcodes_h_l2618_c7_833b_return_output,
 t16_low_MUX_uxn_opcodes_h_l2618_c7_833b_return_output,
 n16_high_MUX_uxn_opcodes_h_l2618_c7_833b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2618_c7_833b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2618_c7_833b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2618_c7_833b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2618_c7_833b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2618_c7_833b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8310_return_output,
 n16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output,
 t16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output,
 n16_high_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2626_c11_4131_return_output,
 n16_low_MUX_uxn_opcodes_h_l2626_c7_02be_return_output,
 n16_high_MUX_uxn_opcodes_h_l2626_c7_02be_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_02be_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_02be_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_02be_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2626_c7_02be_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_02be_return_output,
 sp_relative_shift_uxn_opcodes_h_l2628_c30_c8c4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2633_c11_ab5a_return_output,
 n16_low_MUX_uxn_opcodes_h_l2633_c7_6fd0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_6fd0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_6fd0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_6fd0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2633_c7_6fd0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2639_c11_417a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2639_c7_8ab5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_8ab5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_8ab5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2643_c11_0a21_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2643_c7_8d07_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2643_c7_8d07_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2643_c7_8d07_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c6_f571_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c6_f571_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c6_f571_return_output : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2602_c2_336c_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2602_c2_336c_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2602_c2_336c_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2602_c2_336c_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2602_c2_336c_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2602_c2_336c_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2602_c2_336c_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2602_c2_336c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c2_336c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c2_336c_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2602_c2_336c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2602_c2_336c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2602_c2_336c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2602_c2_336c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c2_336c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c2_336c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c2_336c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c2_336c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c2_336c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c2_336c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2607_c3_07ae : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c2_336c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c2_336c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2602_c2_336c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2602_c2_336c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2602_c2_336c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2612_c3_def1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c2_336c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c2_336c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2602_c2_336c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2602_c2_336c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2602_c2_336c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c11_d8b7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c11_d8b7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c11_d8b7_return_output : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2618_c7_833b_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2618_c7_833b_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2618_c7_833b_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2618_c7_833b_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2616_c3_9c03 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2618_c7_833b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c7_d90e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2618_c7_833b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c7_d90e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2618_c7_833b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_d90e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2618_c7_833b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2615_c7_d90e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2618_c7_833b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_d90e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2618_c11_f2df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2618_c11_f2df_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2618_c11_f2df_return_output : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2618_c7_833b_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2618_c7_833b_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2618_c7_833b_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2618_c7_833b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2620_c3_79a0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2618_c7_833b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2618_c7_833b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2618_c7_833b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2618_c7_833b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2618_c7_833b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8310_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8310_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8310_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2626_c7_02be_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2626_c7_02be_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2624_c3_3580 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_02be_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_02be_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_02be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_02be_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_02be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_4131_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_4131_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_4131_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2626_c7_02be_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2626_c7_02be_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2633_c7_6fd0_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2626_c7_02be_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2626_c7_02be_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2626_c7_02be_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2626_c7_02be_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_02be_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2630_c3_47f1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_02be_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_6fd0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_02be_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_02be_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_02be_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_6fd0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_02be_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_02be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_02be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_02be_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_02be_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_02be_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2633_c7_6fd0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_02be_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_02be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_02be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_6fd0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_02be_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2628_c30_c8c4_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2628_c30_c8c4_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2628_c30_c8c4_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2628_c30_c8c4_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c11_ab5a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c11_ab5a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c11_ab5a_return_output : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2633_c7_6fd0_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2633_c7_6fd0_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2633_c7_6fd0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_6fd0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_6fd0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_8ab5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_6fd0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_6fd0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2635_c3_616c : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_6fd0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_6fd0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_6fd0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2636_c3_447a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_6fd0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_8ab5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_6fd0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2633_c7_6fd0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2633_c7_6fd0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2639_c7_8ab5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2633_c7_6fd0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2639_c11_417a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2639_c11_417a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2639_c11_417a_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2639_c7_8ab5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2639_c7_8ab5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2643_c7_8d07_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2639_c7_8ab5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_8ab5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2640_c3_9bf6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_8ab5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2643_c7_8d07_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_8ab5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_8ab5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_8ab5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2643_c7_8d07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_8ab5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2643_c11_0a21_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2643_c11_0a21_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2643_c11_0a21_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2643_c7_8d07_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2643_c7_8d07_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2643_c7_8d07_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2643_c7_8d07_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2644_c3_036c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2643_c7_8d07_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2643_c7_8d07_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2643_c7_8d07_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2643_c7_8d07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2643_c7_8d07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2643_c7_8d07_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2622_l2618_l2643_l2615_l2602_DUPLICATE_ebd1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2622_l2615_l2618_l2633_DUPLICATE_3c6b_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2622_l2615_l2626_l2618_DUPLICATE_ee42_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2626_l2622_l2618_l2643_l2615_l2639_l2633_DUPLICATE_426c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l2649_l2598_DUPLICATE_0901_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16_high : unsigned(7 downto 0);
variable REG_VAR_t16_low : unsigned(7 downto 0);
variable REG_VAR_n16_high : unsigned(7 downto 0);
variable REG_VAR_n16_low : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16_high := t16_high;
  REG_VAR_t16_low := t16_low;
  REG_VAR_n16_high := n16_high;
  REG_VAR_n16_low := n16_low;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2643_c7_8d07_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2636_c3_447a := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_6fd0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2636_c3_447a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8310_right := to_unsigned(3, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2639_c11_417a_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2616_c3_9c03 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2616_c3_9c03;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c11_d8b7_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2630_c3_47f1 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_02be_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2630_c3_47f1;
     VAR_sp_relative_shift_uxn_opcodes_h_l2628_c30_c8c4_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c6_f571_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_4131_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2644_c3_036c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2643_c7_8d07_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2644_c3_036c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c11_ab5a_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2640_c3_9bf6 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_8ab5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2640_c3_9bf6;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2618_c11_f2df_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2624_c3_3580 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2624_c3_3580;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2635_c3_616c := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_6fd0_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2635_c3_616c;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_02be_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2643_c11_0a21_right := to_unsigned(7, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2628_c30_c8c4_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2607_c3_07ae := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2607_c3_07ae;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2620_c3_79a0 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2620_c3_79a0;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2612_c3_def1 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2612_c3_def1;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2628_c30_c8c4_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2626_c7_02be_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2639_c7_8ab5_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2626_c7_02be_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2633_c7_6fd0_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2643_c7_8d07_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c6_f571_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c11_d8b7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2618_c11_f2df_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8310_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_4131_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c11_ab5a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2639_c11_417a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2643_c11_0a21_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l2626_c7_02be_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l2633_c7_6fd0_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_02be_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2633_c7_6fd0_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse := t16_low;
     -- BIN_OP_EQ[uxn_opcodes_h_l2639_c11_417a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2639_c11_417a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2639_c11_417a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2639_c11_417a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2639_c11_417a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2639_c11_417a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2639_c11_417a_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2643_c7_8d07] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2643_c7_8d07_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2626_l2622_l2618_l2643_l2615_l2639_l2633_DUPLICATE_426c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2626_l2622_l2618_l2643_l2615_l2639_l2633_DUPLICATE_426c_return_output := result.is_opc_done;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2602_c2_336c] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2602_c2_336c_return_output := result.is_pc_updated;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2602_c2_336c] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2602_c2_336c_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2615_c11_d8b7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2615_c11_d8b7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c11_d8b7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2615_c11_d8b7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c11_d8b7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c11_d8b7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2615_c11_d8b7_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2622_l2615_l2618_l2633_DUPLICATE_3c6b LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2622_l2615_l2618_l2633_DUPLICATE_3c6b_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2622_c11_8310] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8310_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8310_left;
     BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8310_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8310_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8310_return_output := BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8310_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2602_c2_336c] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2602_c2_336c_return_output := result.is_stack_index_flipped;

     -- sp_relative_shift[uxn_opcodes_h_l2628_c30_c8c4] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2628_c30_c8c4_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2628_c30_c8c4_ins;
     sp_relative_shift_uxn_opcodes_h_l2628_c30_c8c4_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2628_c30_c8c4_x;
     sp_relative_shift_uxn_opcodes_h_l2628_c30_c8c4_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2628_c30_c8c4_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2628_c30_c8c4_return_output := sp_relative_shift_uxn_opcodes_h_l2628_c30_c8c4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2643_c11_0a21] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2643_c11_0a21_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2643_c11_0a21_left;
     BIN_OP_EQ_uxn_opcodes_h_l2643_c11_0a21_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2643_c11_0a21_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2643_c11_0a21_return_output := BIN_OP_EQ_uxn_opcodes_h_l2643_c11_0a21_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2626_c11_4131] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2626_c11_4131_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_4131_left;
     BIN_OP_EQ_uxn_opcodes_h_l2626_c11_4131_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_4131_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_4131_return_output := BIN_OP_EQ_uxn_opcodes_h_l2626_c11_4131_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2618_c11_f2df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2618_c11_f2df_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2618_c11_f2df_left;
     BIN_OP_EQ_uxn_opcodes_h_l2618_c11_f2df_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2618_c11_f2df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2618_c11_f2df_return_output := BIN_OP_EQ_uxn_opcodes_h_l2618_c11_f2df_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2622_l2615_l2626_l2618_DUPLICATE_ee42 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2622_l2615_l2626_l2618_DUPLICATE_ee42_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2622_l2618_l2643_l2615_l2602_DUPLICATE_ebd1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2622_l2618_l2643_l2615_l2602_DUPLICATE_ebd1_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2602_c6_f571] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2602_c6_f571_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c6_f571_left;
     BIN_OP_EQ_uxn_opcodes_h_l2602_c6_f571_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c6_f571_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c6_f571_return_output := BIN_OP_EQ_uxn_opcodes_h_l2602_c6_f571_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2602_c2_336c] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2602_c2_336c_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2633_c11_ab5a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2633_c11_ab5a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c11_ab5a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2633_c11_ab5a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c11_ab5a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c11_ab5a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2633_c11_ab5a_return_output;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l2602_c2_336c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c6_f571_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2602_c2_336c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c6_f571_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c2_336c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c6_f571_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2602_c2_336c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c6_f571_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2602_c2_336c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c6_f571_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c2_336c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c6_f571_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c2_336c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c6_f571_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2602_c2_336c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c6_f571_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c2_336c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c6_f571_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c2_336c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c6_f571_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c2_336c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c6_f571_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2602_c2_336c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c6_f571_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2602_c2_336c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2602_c6_f571_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c11_d8b7_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c11_d8b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_d90e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c11_d8b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_d90e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c11_d8b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c7_d90e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c11_d8b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c7_d90e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c11_d8b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2615_c7_d90e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c11_d8b7_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c11_d8b7_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2615_c11_d8b7_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2618_c7_833b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2618_c11_f2df_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2618_c7_833b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2618_c11_f2df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2618_c7_833b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2618_c11_f2df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2618_c7_833b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2618_c11_f2df_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2618_c7_833b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2618_c11_f2df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2618_c7_833b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2618_c11_f2df_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2618_c7_833b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2618_c11_f2df_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2618_c7_833b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2618_c11_f2df_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2618_c7_833b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2618_c11_f2df_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8310_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8310_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8310_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8310_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8310_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8310_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8310_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2622_c11_8310_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2626_c7_02be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_4131_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2626_c7_02be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_4131_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_02be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_4131_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_02be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_4131_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_02be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_4131_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_02be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_4131_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_02be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_4131_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2633_c7_6fd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c11_ab5a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_6fd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c11_ab5a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_6fd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c11_ab5a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_6fd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c11_ab5a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2633_c7_6fd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2633_c11_ab5a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_8ab5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2639_c11_417a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_8ab5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2639_c11_417a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2639_c7_8ab5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2639_c11_417a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2643_c7_8d07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2643_c11_0a21_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2643_c7_8d07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2643_c11_0a21_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2643_c7_8d07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2643_c11_0a21_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2622_l2615_l2618_l2633_DUPLICATE_3c6b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2622_l2615_l2618_l2633_DUPLICATE_3c6b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2622_l2615_l2618_l2633_DUPLICATE_3c6b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_6fd0_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2622_l2615_l2618_l2633_DUPLICATE_3c6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2626_l2622_l2618_l2643_l2615_l2639_l2633_DUPLICATE_426c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2626_l2622_l2618_l2643_l2615_l2639_l2633_DUPLICATE_426c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2626_l2622_l2618_l2643_l2615_l2639_l2633_DUPLICATE_426c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_02be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2626_l2622_l2618_l2643_l2615_l2639_l2633_DUPLICATE_426c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_6fd0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2626_l2622_l2618_l2643_l2615_l2639_l2633_DUPLICATE_426c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_8ab5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2626_l2622_l2618_l2643_l2615_l2639_l2633_DUPLICATE_426c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2643_c7_8d07_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2626_l2622_l2618_l2643_l2615_l2639_l2633_DUPLICATE_426c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2622_l2615_l2626_l2618_DUPLICATE_ee42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2622_l2615_l2626_l2618_DUPLICATE_ee42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2622_l2615_l2626_l2618_DUPLICATE_ee42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_02be_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2622_l2615_l2626_l2618_DUPLICATE_ee42_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2622_l2618_l2643_l2615_l2602_DUPLICATE_ebd1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2622_l2618_l2643_l2615_l2602_DUPLICATE_ebd1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2622_l2618_l2643_l2615_l2602_DUPLICATE_ebd1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2622_l2618_l2643_l2615_l2602_DUPLICATE_ebd1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2643_c7_8d07_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2622_l2618_l2643_l2615_l2602_DUPLICATE_ebd1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2602_c2_336c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2602_c2_336c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2602_c2_336c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2602_c2_336c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2643_c7_8d07_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2643_c7_8d07_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_02be_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2628_c30_c8c4_return_output;
     -- t16_low_MUX[uxn_opcodes_h_l2622_c7_1c9a] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond;
     t16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output := t16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2602_c2_336c] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c2_336c_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c2_336c_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c2_336c_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c2_336c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2633_c7_6fd0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_6fd0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_6fd0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_6fd0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_6fd0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_6fd0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_6fd0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_6fd0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_6fd0_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2602_c2_336c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2602_c2_336c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2602_c2_336c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2602_c2_336c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2602_c2_336c_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2626_c7_02be] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2626_c7_02be_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2626_c7_02be_cond;
     n16_high_MUX_uxn_opcodes_h_l2626_c7_02be_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2626_c7_02be_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2626_c7_02be_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2626_c7_02be_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2626_c7_02be_return_output := n16_high_MUX_uxn_opcodes_h_l2626_c7_02be_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2633_c7_6fd0] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2633_c7_6fd0_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2633_c7_6fd0_cond;
     n16_low_MUX_uxn_opcodes_h_l2633_c7_6fd0_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2633_c7_6fd0_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2633_c7_6fd0_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2633_c7_6fd0_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2633_c7_6fd0_return_output := n16_low_MUX_uxn_opcodes_h_l2633_c7_6fd0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2626_c7_02be] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_02be_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_02be_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_02be_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_02be_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_02be_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_02be_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_02be_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_02be_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2602_c2_336c] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2602_c2_336c_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2602_c2_336c_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2602_c2_336c_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2602_c2_336c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2643_c7_8d07] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2643_c7_8d07_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2643_c7_8d07_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2643_c7_8d07_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2643_c7_8d07_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2643_c7_8d07_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2643_c7_8d07_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2643_c7_8d07_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2643_c7_8d07_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2602_c2_336c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2602_c2_336c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2602_c2_336c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2602_c2_336c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2602_c2_336c_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2618_c7_833b] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2618_c7_833b_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2618_c7_833b_cond;
     t16_high_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2618_c7_833b_return_output := t16_high_MUX_uxn_opcodes_h_l2618_c7_833b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2643_c7_8d07] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2643_c7_8d07_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2643_c7_8d07_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2643_c7_8d07_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2643_c7_8d07_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2643_c7_8d07_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2643_c7_8d07_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2643_c7_8d07_return_output := result_u8_value_MUX_uxn_opcodes_h_l2643_c7_8d07_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2643_c7_8d07] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2643_c7_8d07_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2643_c7_8d07_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2643_c7_8d07_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2643_c7_8d07_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2643_c7_8d07_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2643_c7_8d07_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2643_c7_8d07_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2643_c7_8d07_return_output;

     -- Submodule level 2
     VAR_n16_high_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2626_c7_02be_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2626_c7_02be_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2633_c7_6fd0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_8ab5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2643_c7_8d07_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_02be_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_02be_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2633_c7_6fd0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_8ab5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2643_c7_8d07_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2639_c7_8ab5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2643_c7_8d07_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2618_c7_833b_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output;
     -- t16_high_MUX[uxn_opcodes_h_l2615_c7_d90e] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_cond;
     t16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output := t16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2626_c7_02be] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2626_c7_02be_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2626_c7_02be_cond;
     n16_low_MUX_uxn_opcodes_h_l2626_c7_02be_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2626_c7_02be_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2626_c7_02be_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2626_c7_02be_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2626_c7_02be_return_output := n16_low_MUX_uxn_opcodes_h_l2626_c7_02be_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2618_c7_833b] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2618_c7_833b_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2618_c7_833b_cond;
     t16_low_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2618_c7_833b_return_output := t16_low_MUX_uxn_opcodes_h_l2618_c7_833b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2639_c7_8ab5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_8ab5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_8ab5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_8ab5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_8ab5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_8ab5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_8ab5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_8ab5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_8ab5_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2622_c7_1c9a] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond;
     n16_high_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output := n16_high_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2622_c7_1c9a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2639_c7_8ab5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2639_c7_8ab5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2639_c7_8ab5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2639_c7_8ab5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2639_c7_8ab5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2639_c7_8ab5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2639_c7_8ab5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2639_c7_8ab5_return_output := result_u8_value_MUX_uxn_opcodes_h_l2639_c7_8ab5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2639_c7_8ab5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_8ab5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_8ab5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_8ab5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_8ab5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_8ab5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_8ab5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_8ab5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_8ab5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2626_c7_02be] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_02be_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_02be_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_02be_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_02be_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_02be_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_02be_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_02be_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_02be_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2626_c7_02be_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_6fd0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2639_c7_8ab5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2626_c7_02be_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_6fd0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2639_c7_8ab5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2633_c7_6fd0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2639_c7_8ab5_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2618_c7_833b_return_output;
     -- t16_high_MUX[uxn_opcodes_h_l2602_c2_336c] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2602_c2_336c_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2602_c2_336c_cond;
     t16_high_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2602_c2_336c_return_output := t16_high_MUX_uxn_opcodes_h_l2602_c2_336c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2618_c7_833b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2618_c7_833b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2618_c7_833b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2618_c7_833b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2618_c7_833b_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2615_c7_d90e] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_cond;
     t16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output := t16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2633_c7_6fd0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_6fd0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_6fd0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_6fd0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_6fd0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_6fd0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_6fd0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_6fd0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_6fd0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2633_c7_6fd0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_6fd0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_6fd0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_6fd0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_6fd0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_6fd0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_6fd0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_6fd0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_6fd0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2633_c7_6fd0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2633_c7_6fd0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2633_c7_6fd0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2633_c7_6fd0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2633_c7_6fd0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2633_c7_6fd0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2633_c7_6fd0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2633_c7_6fd0_return_output := result_u8_value_MUX_uxn_opcodes_h_l2633_c7_6fd0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2622_c7_1c9a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2622_c7_1c9a] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond;
     n16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output := n16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2618_c7_833b] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2618_c7_833b_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2618_c7_833b_cond;
     n16_high_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2618_c7_833b_return_output := n16_high_MUX_uxn_opcodes_h_l2618_c7_833b_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2618_c7_833b_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_02be_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2633_c7_6fd0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2618_c7_833b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_02be_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2633_c7_6fd0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_02be_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2633_c7_6fd0_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l2602_c2_336c_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2626_c7_02be] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_02be_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_02be_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_02be_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_02be_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_02be_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_02be_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_02be_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_02be_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2615_c7_d90e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_d90e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_d90e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2626_c7_02be] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2626_c7_02be_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_02be_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2626_c7_02be_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_02be_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2626_c7_02be_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_02be_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_02be_return_output := result_u8_value_MUX_uxn_opcodes_h_l2626_c7_02be_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2615_c7_d90e] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_cond;
     n16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output := n16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2626_c7_02be] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_02be_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_02be_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_02be_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_02be_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_02be_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_02be_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_02be_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_02be_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2618_c7_833b] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2618_c7_833b_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2618_c7_833b_cond;
     n16_low_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2618_c7_833b_return_output := n16_low_MUX_uxn_opcodes_h_l2618_c7_833b_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2602_c2_336c] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2602_c2_336c_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2602_c2_336c_cond;
     t16_low_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2602_c2_336c_return_output := t16_low_MUX_uxn_opcodes_h_l2602_c2_336c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2618_c7_833b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2618_c7_833b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2618_c7_833b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2618_c7_833b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2618_c7_833b_return_output;

     -- Submodule level 5
     VAR_n16_high_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2618_c7_833b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_02be_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2618_c7_833b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_02be_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2626_c7_02be_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l2602_c2_336c_return_output;
     -- n16_high_MUX[uxn_opcodes_h_l2602_c2_336c] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2602_c2_336c_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2602_c2_336c_cond;
     n16_high_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2602_c2_336c_return_output := n16_high_MUX_uxn_opcodes_h_l2602_c2_336c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2622_c7_1c9a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2602_c2_336c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2602_c2_336c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c2_336c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c2_336c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2602_c2_336c_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2615_c7_d90e] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_cond;
     n16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output := n16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2615_c7_d90e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c7_d90e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c7_d90e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2622_c7_1c9a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2622_c7_1c9a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c9a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c9a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c9a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output;

     -- Submodule level 6
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l2602_c2_336c_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2622_c7_1c9a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2618_c7_833b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2618_c7_833b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2618_c7_833b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2618_c7_833b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2618_c7_833b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2618_c7_833b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2618_c7_833b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2618_c7_833b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2618_c7_833b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2618_c7_833b_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2602_c2_336c] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2602_c2_336c_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2602_c2_336c_cond;
     n16_low_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2602_c2_336c_return_output := n16_low_MUX_uxn_opcodes_h_l2602_c2_336c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2618_c7_833b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2618_c7_833b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2618_c7_833b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2618_c7_833b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2618_c7_833b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2618_c7_833b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2618_c7_833b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2602_c2_336c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c2_336c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c2_336c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c2_336c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c2_336c_return_output;

     -- Submodule level 7
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l2602_c2_336c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2618_c7_833b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2618_c7_833b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2618_c7_833b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2615_c7_d90e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_d90e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_d90e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2615_c7_d90e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2615_c7_d90e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2615_c7_d90e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2615_c7_d90e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c7_d90e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c7_d90e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c7_d90e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c7_d90e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2615_c7_d90e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2602_c2_336c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2602_c2_336c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c2_336c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c2_336c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2602_c2_336c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2602_c2_336c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2602_c2_336c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c2_336c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c2_336c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2602_c2_336c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2602_c2_336c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c2_336c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c2_336c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c2_336c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c2_336c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c2_336c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c2_336c_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l2649_l2598_DUPLICATE_0901 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l2649_l2598_DUPLICATE_0901_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_188e(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2602_c2_336c_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2602_c2_336c_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2602_c2_336c_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2602_c2_336c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2602_c2_336c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2602_c2_336c_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2602_c2_336c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2602_c2_336c_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2602_c2_336c_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l2649_l2598_DUPLICATE_0901_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l2649_l2598_DUPLICATE_0901_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16_high <= REG_VAR_t16_high;
REG_COMB_t16_low <= REG_VAR_t16_low;
REG_COMB_n16_high <= REG_VAR_n16_high;
REG_COMB_n16_low <= REG_VAR_n16_low;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16_high <= REG_COMB_t16_high;
     t16_low <= REG_COMB_t16_low;
     n16_high <= REG_COMB_n16_high;
     n16_low <= REG_COMB_n16_low;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
