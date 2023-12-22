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
-- Submodules: 102
entity rot2_0CLK_8e773831 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end rot2_0CLK_8e773831;
architecture arch of rot2_0CLK_8e773831 is
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
signal l16_high : unsigned(7 downto 0) := to_unsigned(0, 8);
signal l16_low : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16_high : unsigned(7 downto 0);
signal REG_COMB_t16_low : unsigned(7 downto 0);
signal REG_COMB_n16_high : unsigned(7 downto 0);
signal REG_COMB_n16_low : unsigned(7 downto 0);
signal REG_COMB_l16_high : unsigned(7 downto 0);
signal REG_COMB_l16_low : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2703_c6_bd55]
signal BIN_OP_EQ_uxn_opcodes_h_l2703_c6_bd55_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2703_c6_bd55_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2703_c6_bd55_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2703_c2_4192]
signal t16_high_MUX_uxn_opcodes_h_l2703_c2_4192_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2703_c2_4192_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2703_c2_4192]
signal l16_low_MUX_uxn_opcodes_h_l2703_c2_4192_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2703_c2_4192_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2703_c2_4192]
signal n16_low_MUX_uxn_opcodes_h_l2703_c2_4192_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2703_c2_4192_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2703_c2_4192]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2703_c2_4192_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2703_c2_4192_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2703_c2_4192]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2703_c2_4192_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2703_c2_4192_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2703_c2_4192]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2703_c2_4192_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2703_c2_4192_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2703_c2_4192]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2703_c2_4192_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2703_c2_4192_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2703_c2_4192]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2703_c2_4192_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2703_c2_4192_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2703_c2_4192]
signal result_u8_value_MUX_uxn_opcodes_h_l2703_c2_4192_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2703_c2_4192_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2703_c2_4192]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c2_4192_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c2_4192_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2703_c2_4192]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2703_c2_4192_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2703_c2_4192_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2703_c2_4192]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2703_c2_4192_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2703_c2_4192_return_output : unsigned(0 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2703_c2_4192]
signal l16_high_MUX_uxn_opcodes_h_l2703_c2_4192_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2703_c2_4192_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2703_c2_4192]
signal t16_low_MUX_uxn_opcodes_h_l2703_c2_4192_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2703_c2_4192_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2703_c2_4192]
signal n16_high_MUX_uxn_opcodes_h_l2703_c2_4192_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2703_c2_4192_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2716_c11_dded]
signal BIN_OP_EQ_uxn_opcodes_h_l2716_c11_dded_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2716_c11_dded_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2716_c11_dded_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2716_c7_cc14]
signal t16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2716_c7_cc14]
signal l16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2716_c7_cc14]
signal n16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2716_c7_cc14]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2716_c7_cc14_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2716_c7_cc14]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2716_c7_cc14_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2716_c7_cc14]
signal result_u8_value_MUX_uxn_opcodes_h_l2716_c7_cc14_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2716_c7_cc14]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2716_c7_cc14_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2716_c7_cc14]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2716_c7_cc14_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output : signed(3 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2716_c7_cc14]
signal l16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2716_c7_cc14]
signal t16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2716_c7_cc14]
signal n16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2719_c11_3a4d]
signal BIN_OP_EQ_uxn_opcodes_h_l2719_c11_3a4d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2719_c11_3a4d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2719_c11_3a4d_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2719_c7_1d91]
signal t16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2719_c7_1d91]
signal l16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2719_c7_1d91]
signal n16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2719_c7_1d91]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2719_c7_1d91_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2719_c7_1d91]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c7_1d91_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2719_c7_1d91]
signal result_u8_value_MUX_uxn_opcodes_h_l2719_c7_1d91_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2719_c7_1d91]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2719_c7_1d91_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2719_c7_1d91]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c7_1d91_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output : signed(3 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2719_c7_1d91]
signal l16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2719_c7_1d91]
signal t16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2719_c7_1d91]
signal n16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2723_c11_41bb]
signal BIN_OP_EQ_uxn_opcodes_h_l2723_c11_41bb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2723_c11_41bb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2723_c11_41bb_return_output : unsigned(0 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2723_c7_5a06]
signal l16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2723_c7_5a06]
signal n16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2723_c7_5a06]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_5a06_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2723_c7_5a06]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_5a06_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2723_c7_5a06]
signal result_u8_value_MUX_uxn_opcodes_h_l2723_c7_5a06_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2723_c7_5a06]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_5a06_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2723_c7_5a06]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_5a06_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output : signed(3 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2723_c7_5a06]
signal l16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2723_c7_5a06]
signal t16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2723_c7_5a06]
signal n16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2727_c11_45ec]
signal BIN_OP_EQ_uxn_opcodes_h_l2727_c11_45ec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2727_c11_45ec_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2727_c11_45ec_return_output : unsigned(0 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2727_c7_6008]
signal l16_low_MUX_uxn_opcodes_h_l2727_c7_6008_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2727_c7_6008_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2727_c7_6008]
signal n16_low_MUX_uxn_opcodes_h_l2727_c7_6008_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2727_c7_6008_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2727_c7_6008]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_6008_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_6008_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2727_c7_6008]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_6008_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_6008_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2727_c7_6008]
signal result_u8_value_MUX_uxn_opcodes_h_l2727_c7_6008_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2727_c7_6008_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2727_c7_6008]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_6008_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_6008_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2727_c7_6008]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_6008_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_6008_return_output : signed(3 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2727_c7_6008]
signal l16_high_MUX_uxn_opcodes_h_l2727_c7_6008_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2727_c7_6008_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2727_c7_6008]
signal n16_high_MUX_uxn_opcodes_h_l2727_c7_6008_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2727_c7_6008_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2731_c11_24e4]
signal BIN_OP_EQ_uxn_opcodes_h_l2731_c11_24e4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2731_c11_24e4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2731_c11_24e4_return_output : unsigned(0 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2731_c7_fede]
signal l16_low_MUX_uxn_opcodes_h_l2731_c7_fede_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2731_c7_fede_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2731_c7_fede]
signal n16_low_MUX_uxn_opcodes_h_l2731_c7_fede_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2731_c7_fede_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2731_c7_fede]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_fede_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_fede_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2731_c7_fede]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_fede_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_fede_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2731_c7_fede]
signal result_u8_value_MUX_uxn_opcodes_h_l2731_c7_fede_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2731_c7_fede_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2731_c7_fede]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_fede_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_fede_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2731_c7_fede]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_fede_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_fede_return_output : signed(3 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2731_c7_fede]
signal l16_high_MUX_uxn_opcodes_h_l2731_c7_fede_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2731_c7_fede_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2735_c11_f974]
signal BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f974_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f974_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f974_return_output : unsigned(0 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2735_c7_5f71]
signal l16_low_MUX_uxn_opcodes_h_l2735_c7_5f71_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2735_c7_5f71_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2735_c7_5f71_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2735_c7_5f71]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_5f71_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_5f71_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_5f71_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2735_c7_5f71]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_5f71_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_5f71_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_5f71_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2735_c7_5f71]
signal result_u8_value_MUX_uxn_opcodes_h_l2735_c7_5f71_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2735_c7_5f71_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2735_c7_5f71_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2735_c7_5f71]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_5f71_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_5f71_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_5f71_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2735_c7_5f71]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_5f71_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_5f71_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_5f71_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output : signed(3 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2735_c7_5f71]
signal l16_high_MUX_uxn_opcodes_h_l2735_c7_5f71_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2735_c7_5f71_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2735_c7_5f71_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2737_c30_88a2]
signal sp_relative_shift_uxn_opcodes_h_l2737_c30_88a2_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2737_c30_88a2_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2737_c30_88a2_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2737_c30_88a2_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2742_c11_40b2]
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_40b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_40b2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_40b2_return_output : unsigned(0 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2742_c7_a62d]
signal l16_low_MUX_uxn_opcodes_h_l2742_c7_a62d_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2742_c7_a62d_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2742_c7_a62d_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2742_c7_a62d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2742_c7_a62d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_a62d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_a62d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_a62d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_a62d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2742_c7_a62d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_a62d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_a62d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_a62d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_a62d_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2742_c7_a62d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_a62d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_a62d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_a62d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_a62d_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2742_c7_a62d]
signal result_u8_value_MUX_uxn_opcodes_h_l2742_c7_a62d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2742_c7_a62d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2742_c7_a62d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2742_c7_a62d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2748_c11_f398]
signal BIN_OP_EQ_uxn_opcodes_h_l2748_c11_f398_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2748_c11_f398_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2748_c11_f398_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2748_c7_3a75]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2748_c7_3a75_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2748_c7_3a75_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2748_c7_3a75_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2748_c7_3a75_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2748_c7_3a75]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c7_3a75_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c7_3a75_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c7_3a75_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c7_3a75_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2748_c7_3a75]
signal result_u8_value_MUX_uxn_opcodes_h_l2748_c7_3a75_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2748_c7_3a75_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2748_c7_3a75_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2748_c7_3a75_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2752_c11_c0ca]
signal BIN_OP_EQ_uxn_opcodes_h_l2752_c11_c0ca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2752_c11_c0ca_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2752_c11_c0ca_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2752_c7_86d1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_86d1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_86d1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_86d1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_86d1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2752_c7_86d1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_86d1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_86d1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_86d1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_86d1_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2752_c7_86d1]
signal result_u8_value_MUX_uxn_opcodes_h_l2752_c7_86d1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2752_c7_86d1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2752_c7_86d1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2752_c7_86d1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2756_c11_a253]
signal BIN_OP_EQ_uxn_opcodes_h_l2756_c11_a253_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2756_c11_a253_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2756_c11_a253_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2756_c7_4eb9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_4eb9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_4eb9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_4eb9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_4eb9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2756_c7_4eb9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_4eb9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_4eb9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_4eb9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_4eb9_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2756_c7_4eb9]
signal result_u8_value_MUX_uxn_opcodes_h_l2756_c7_4eb9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2756_c7_4eb9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2756_c7_4eb9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2756_c7_4eb9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2760_c11_1801]
signal BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1801_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1801_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1801_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2760_c7_274b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_274b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_274b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_274b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_274b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2760_c7_274b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_274b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_274b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_274b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_274b_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2760_c7_274b]
signal result_u8_value_MUX_uxn_opcodes_h_l2760_c7_274b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2760_c7_274b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2760_c7_274b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2760_c7_274b_return_output : unsigned(7 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_c580( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.u8_value := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.is_pc_updated := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2703_c6_bd55
BIN_OP_EQ_uxn_opcodes_h_l2703_c6_bd55 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2703_c6_bd55_left,
BIN_OP_EQ_uxn_opcodes_h_l2703_c6_bd55_right,
BIN_OP_EQ_uxn_opcodes_h_l2703_c6_bd55_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2703_c2_4192
t16_high_MUX_uxn_opcodes_h_l2703_c2_4192 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2703_c2_4192_cond,
t16_high_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue,
t16_high_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse,
t16_high_MUX_uxn_opcodes_h_l2703_c2_4192_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2703_c2_4192
l16_low_MUX_uxn_opcodes_h_l2703_c2_4192 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2703_c2_4192_cond,
l16_low_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue,
l16_low_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse,
l16_low_MUX_uxn_opcodes_h_l2703_c2_4192_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2703_c2_4192
n16_low_MUX_uxn_opcodes_h_l2703_c2_4192 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2703_c2_4192_cond,
n16_low_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue,
n16_low_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse,
n16_low_MUX_uxn_opcodes_h_l2703_c2_4192_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2703_c2_4192
result_is_opc_done_MUX_uxn_opcodes_h_l2703_c2_4192 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2703_c2_4192_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2703_c2_4192_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2703_c2_4192
result_is_vram_write_MUX_uxn_opcodes_h_l2703_c2_4192 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2703_c2_4192_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2703_c2_4192_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2703_c2_4192
result_is_ram_write_MUX_uxn_opcodes_h_l2703_c2_4192 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2703_c2_4192_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2703_c2_4192_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2703_c2_4192
result_is_stack_write_MUX_uxn_opcodes_h_l2703_c2_4192 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2703_c2_4192_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2703_c2_4192_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2703_c2_4192
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2703_c2_4192 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2703_c2_4192_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2703_c2_4192_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2703_c2_4192
result_u8_value_MUX_uxn_opcodes_h_l2703_c2_4192 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2703_c2_4192_cond,
result_u8_value_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2703_c2_4192_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c2_4192
result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c2_4192 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c2_4192_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c2_4192_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2703_c2_4192
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2703_c2_4192 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2703_c2_4192_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2703_c2_4192_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2703_c2_4192
result_is_pc_updated_MUX_uxn_opcodes_h_l2703_c2_4192 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2703_c2_4192_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2703_c2_4192_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2703_c2_4192
l16_high_MUX_uxn_opcodes_h_l2703_c2_4192 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2703_c2_4192_cond,
l16_high_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue,
l16_high_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse,
l16_high_MUX_uxn_opcodes_h_l2703_c2_4192_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2703_c2_4192
t16_low_MUX_uxn_opcodes_h_l2703_c2_4192 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2703_c2_4192_cond,
t16_low_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue,
t16_low_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse,
t16_low_MUX_uxn_opcodes_h_l2703_c2_4192_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2703_c2_4192
n16_high_MUX_uxn_opcodes_h_l2703_c2_4192 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2703_c2_4192_cond,
n16_high_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue,
n16_high_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse,
n16_high_MUX_uxn_opcodes_h_l2703_c2_4192_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2716_c11_dded
BIN_OP_EQ_uxn_opcodes_h_l2716_c11_dded : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2716_c11_dded_left,
BIN_OP_EQ_uxn_opcodes_h_l2716_c11_dded_right,
BIN_OP_EQ_uxn_opcodes_h_l2716_c11_dded_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2716_c7_cc14
t16_high_MUX_uxn_opcodes_h_l2716_c7_cc14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_cond,
t16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue,
t16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse,
t16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2716_c7_cc14
l16_low_MUX_uxn_opcodes_h_l2716_c7_cc14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_cond,
l16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue,
l16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse,
l16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2716_c7_cc14
n16_low_MUX_uxn_opcodes_h_l2716_c7_cc14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_cond,
n16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue,
n16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse,
n16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2716_c7_cc14
result_is_opc_done_MUX_uxn_opcodes_h_l2716_c7_cc14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2716_c7_cc14_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2716_c7_cc14
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2716_c7_cc14 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2716_c7_cc14_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2716_c7_cc14
result_u8_value_MUX_uxn_opcodes_h_l2716_c7_cc14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2716_c7_cc14_cond,
result_u8_value_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2716_c7_cc14
result_is_stack_write_MUX_uxn_opcodes_h_l2716_c7_cc14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2716_c7_cc14_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2716_c7_cc14
result_sp_relative_shift_MUX_uxn_opcodes_h_l2716_c7_cc14 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2716_c7_cc14_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2716_c7_cc14
l16_high_MUX_uxn_opcodes_h_l2716_c7_cc14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_cond,
l16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue,
l16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse,
l16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2716_c7_cc14
t16_low_MUX_uxn_opcodes_h_l2716_c7_cc14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_cond,
t16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue,
t16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse,
t16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2716_c7_cc14
n16_high_MUX_uxn_opcodes_h_l2716_c7_cc14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_cond,
n16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue,
n16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse,
n16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2719_c11_3a4d
BIN_OP_EQ_uxn_opcodes_h_l2719_c11_3a4d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2719_c11_3a4d_left,
BIN_OP_EQ_uxn_opcodes_h_l2719_c11_3a4d_right,
BIN_OP_EQ_uxn_opcodes_h_l2719_c11_3a4d_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2719_c7_1d91
t16_high_MUX_uxn_opcodes_h_l2719_c7_1d91 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_cond,
t16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue,
t16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse,
t16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2719_c7_1d91
l16_low_MUX_uxn_opcodes_h_l2719_c7_1d91 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_cond,
l16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue,
l16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse,
l16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2719_c7_1d91
n16_low_MUX_uxn_opcodes_h_l2719_c7_1d91 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_cond,
n16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue,
n16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse,
n16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2719_c7_1d91
result_is_opc_done_MUX_uxn_opcodes_h_l2719_c7_1d91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2719_c7_1d91_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c7_1d91
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c7_1d91 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c7_1d91_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2719_c7_1d91
result_u8_value_MUX_uxn_opcodes_h_l2719_c7_1d91 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2719_c7_1d91_cond,
result_u8_value_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2719_c7_1d91
result_is_stack_write_MUX_uxn_opcodes_h_l2719_c7_1d91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2719_c7_1d91_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c7_1d91
result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c7_1d91 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c7_1d91_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2719_c7_1d91
l16_high_MUX_uxn_opcodes_h_l2719_c7_1d91 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_cond,
l16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue,
l16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse,
l16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2719_c7_1d91
t16_low_MUX_uxn_opcodes_h_l2719_c7_1d91 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_cond,
t16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue,
t16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse,
t16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2719_c7_1d91
n16_high_MUX_uxn_opcodes_h_l2719_c7_1d91 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_cond,
n16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue,
n16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse,
n16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2723_c11_41bb
BIN_OP_EQ_uxn_opcodes_h_l2723_c11_41bb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2723_c11_41bb_left,
BIN_OP_EQ_uxn_opcodes_h_l2723_c11_41bb_right,
BIN_OP_EQ_uxn_opcodes_h_l2723_c11_41bb_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2723_c7_5a06
l16_low_MUX_uxn_opcodes_h_l2723_c7_5a06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_cond,
l16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue,
l16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse,
l16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2723_c7_5a06
n16_low_MUX_uxn_opcodes_h_l2723_c7_5a06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_cond,
n16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue,
n16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse,
n16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_5a06
result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_5a06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_5a06_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_5a06
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_5a06 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_5a06_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2723_c7_5a06
result_u8_value_MUX_uxn_opcodes_h_l2723_c7_5a06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2723_c7_5a06_cond,
result_u8_value_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_5a06
result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_5a06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_5a06_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_5a06
result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_5a06 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_5a06_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2723_c7_5a06
l16_high_MUX_uxn_opcodes_h_l2723_c7_5a06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_cond,
l16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue,
l16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse,
l16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2723_c7_5a06
t16_low_MUX_uxn_opcodes_h_l2723_c7_5a06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_cond,
t16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue,
t16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse,
t16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2723_c7_5a06
n16_high_MUX_uxn_opcodes_h_l2723_c7_5a06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_cond,
n16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue,
n16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse,
n16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2727_c11_45ec
BIN_OP_EQ_uxn_opcodes_h_l2727_c11_45ec : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2727_c11_45ec_left,
BIN_OP_EQ_uxn_opcodes_h_l2727_c11_45ec_right,
BIN_OP_EQ_uxn_opcodes_h_l2727_c11_45ec_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2727_c7_6008
l16_low_MUX_uxn_opcodes_h_l2727_c7_6008 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2727_c7_6008_cond,
l16_low_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue,
l16_low_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse,
l16_low_MUX_uxn_opcodes_h_l2727_c7_6008_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2727_c7_6008
n16_low_MUX_uxn_opcodes_h_l2727_c7_6008 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2727_c7_6008_cond,
n16_low_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue,
n16_low_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse,
n16_low_MUX_uxn_opcodes_h_l2727_c7_6008_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_6008
result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_6008 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_6008_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_6008_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_6008
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_6008 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_6008_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_6008_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2727_c7_6008
result_u8_value_MUX_uxn_opcodes_h_l2727_c7_6008 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2727_c7_6008_cond,
result_u8_value_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2727_c7_6008_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_6008
result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_6008 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_6008_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_6008_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_6008
result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_6008 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_6008_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_6008_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2727_c7_6008
l16_high_MUX_uxn_opcodes_h_l2727_c7_6008 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2727_c7_6008_cond,
l16_high_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue,
l16_high_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse,
l16_high_MUX_uxn_opcodes_h_l2727_c7_6008_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2727_c7_6008
n16_high_MUX_uxn_opcodes_h_l2727_c7_6008 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2727_c7_6008_cond,
n16_high_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue,
n16_high_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse,
n16_high_MUX_uxn_opcodes_h_l2727_c7_6008_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2731_c11_24e4
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_24e4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_24e4_left,
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_24e4_right,
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_24e4_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2731_c7_fede
l16_low_MUX_uxn_opcodes_h_l2731_c7_fede : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2731_c7_fede_cond,
l16_low_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue,
l16_low_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse,
l16_low_MUX_uxn_opcodes_h_l2731_c7_fede_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2731_c7_fede
n16_low_MUX_uxn_opcodes_h_l2731_c7_fede : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2731_c7_fede_cond,
n16_low_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue,
n16_low_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse,
n16_low_MUX_uxn_opcodes_h_l2731_c7_fede_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_fede
result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_fede : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_fede_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_fede_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_fede
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_fede : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_fede_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_fede_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2731_c7_fede
result_u8_value_MUX_uxn_opcodes_h_l2731_c7_fede : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2731_c7_fede_cond,
result_u8_value_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2731_c7_fede_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_fede
result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_fede : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_fede_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_fede_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_fede
result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_fede : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_fede_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_fede_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2731_c7_fede
l16_high_MUX_uxn_opcodes_h_l2731_c7_fede : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2731_c7_fede_cond,
l16_high_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue,
l16_high_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse,
l16_high_MUX_uxn_opcodes_h_l2731_c7_fede_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f974
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f974 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f974_left,
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f974_right,
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f974_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2735_c7_5f71
l16_low_MUX_uxn_opcodes_h_l2735_c7_5f71 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2735_c7_5f71_cond,
l16_low_MUX_uxn_opcodes_h_l2735_c7_5f71_iftrue,
l16_low_MUX_uxn_opcodes_h_l2735_c7_5f71_iffalse,
l16_low_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_5f71
result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_5f71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_5f71_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_5f71_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_5f71_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_5f71
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_5f71 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_5f71_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_5f71_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_5f71_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2735_c7_5f71
result_u8_value_MUX_uxn_opcodes_h_l2735_c7_5f71 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2735_c7_5f71_cond,
result_u8_value_MUX_uxn_opcodes_h_l2735_c7_5f71_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2735_c7_5f71_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_5f71
result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_5f71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_5f71_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_5f71_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_5f71_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_5f71
result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_5f71 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_5f71_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_5f71_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_5f71_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2735_c7_5f71
l16_high_MUX_uxn_opcodes_h_l2735_c7_5f71 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2735_c7_5f71_cond,
l16_high_MUX_uxn_opcodes_h_l2735_c7_5f71_iftrue,
l16_high_MUX_uxn_opcodes_h_l2735_c7_5f71_iffalse,
l16_high_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2737_c30_88a2
sp_relative_shift_uxn_opcodes_h_l2737_c30_88a2 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2737_c30_88a2_ins,
sp_relative_shift_uxn_opcodes_h_l2737_c30_88a2_x,
sp_relative_shift_uxn_opcodes_h_l2737_c30_88a2_y,
sp_relative_shift_uxn_opcodes_h_l2737_c30_88a2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2742_c11_40b2
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_40b2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_40b2_left,
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_40b2_right,
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_40b2_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2742_c7_a62d
l16_low_MUX_uxn_opcodes_h_l2742_c7_a62d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2742_c7_a62d_cond,
l16_low_MUX_uxn_opcodes_h_l2742_c7_a62d_iftrue,
l16_low_MUX_uxn_opcodes_h_l2742_c7_a62d_iffalse,
l16_low_MUX_uxn_opcodes_h_l2742_c7_a62d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_a62d
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_a62d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_a62d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_a62d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_a62d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_a62d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_a62d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_a62d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_a62d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_a62d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_a62d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_a62d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_a62d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_a62d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_a62d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_a62d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_a62d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_a62d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2742_c7_a62d
result_u8_value_MUX_uxn_opcodes_h_l2742_c7_a62d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2742_c7_a62d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2742_c7_a62d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2742_c7_a62d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2742_c7_a62d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2748_c11_f398
BIN_OP_EQ_uxn_opcodes_h_l2748_c11_f398 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2748_c11_f398_left,
BIN_OP_EQ_uxn_opcodes_h_l2748_c11_f398_right,
BIN_OP_EQ_uxn_opcodes_h_l2748_c11_f398_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2748_c7_3a75
result_is_opc_done_MUX_uxn_opcodes_h_l2748_c7_3a75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2748_c7_3a75_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2748_c7_3a75_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2748_c7_3a75_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2748_c7_3a75_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c7_3a75
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c7_3a75 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c7_3a75_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c7_3a75_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c7_3a75_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c7_3a75_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2748_c7_3a75
result_u8_value_MUX_uxn_opcodes_h_l2748_c7_3a75 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2748_c7_3a75_cond,
result_u8_value_MUX_uxn_opcodes_h_l2748_c7_3a75_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2748_c7_3a75_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2748_c7_3a75_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2752_c11_c0ca
BIN_OP_EQ_uxn_opcodes_h_l2752_c11_c0ca : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2752_c11_c0ca_left,
BIN_OP_EQ_uxn_opcodes_h_l2752_c11_c0ca_right,
BIN_OP_EQ_uxn_opcodes_h_l2752_c11_c0ca_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_86d1
result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_86d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_86d1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_86d1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_86d1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_86d1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_86d1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_86d1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_86d1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_86d1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_86d1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_86d1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2752_c7_86d1
result_u8_value_MUX_uxn_opcodes_h_l2752_c7_86d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2752_c7_86d1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2752_c7_86d1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2752_c7_86d1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2752_c7_86d1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2756_c11_a253
BIN_OP_EQ_uxn_opcodes_h_l2756_c11_a253 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2756_c11_a253_left,
BIN_OP_EQ_uxn_opcodes_h_l2756_c11_a253_right,
BIN_OP_EQ_uxn_opcodes_h_l2756_c11_a253_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_4eb9
result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_4eb9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_4eb9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_4eb9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_4eb9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_4eb9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_4eb9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_4eb9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_4eb9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_4eb9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_4eb9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_4eb9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2756_c7_4eb9
result_u8_value_MUX_uxn_opcodes_h_l2756_c7_4eb9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2756_c7_4eb9_cond,
result_u8_value_MUX_uxn_opcodes_h_l2756_c7_4eb9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2756_c7_4eb9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2756_c7_4eb9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1801
BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1801 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1801_left,
BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1801_right,
BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1801_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_274b
result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_274b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_274b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_274b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_274b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_274b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_274b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_274b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_274b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_274b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_274b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_274b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2760_c7_274b
result_u8_value_MUX_uxn_opcodes_h_l2760_c7_274b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2760_c7_274b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2760_c7_274b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2760_c7_274b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2760_c7_274b_return_output);



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
 l16_high,
 l16_low,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2703_c6_bd55_return_output,
 t16_high_MUX_uxn_opcodes_h_l2703_c2_4192_return_output,
 l16_low_MUX_uxn_opcodes_h_l2703_c2_4192_return_output,
 n16_low_MUX_uxn_opcodes_h_l2703_c2_4192_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2703_c2_4192_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2703_c2_4192_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2703_c2_4192_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2703_c2_4192_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2703_c2_4192_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2703_c2_4192_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c2_4192_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2703_c2_4192_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2703_c2_4192_return_output,
 l16_high_MUX_uxn_opcodes_h_l2703_c2_4192_return_output,
 t16_low_MUX_uxn_opcodes_h_l2703_c2_4192_return_output,
 n16_high_MUX_uxn_opcodes_h_l2703_c2_4192_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2716_c11_dded_return_output,
 t16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output,
 l16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output,
 n16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output,
 l16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output,
 t16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output,
 n16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2719_c11_3a4d_return_output,
 t16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output,
 l16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output,
 n16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output,
 l16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output,
 t16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output,
 n16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2723_c11_41bb_return_output,
 l16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output,
 n16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output,
 l16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output,
 t16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output,
 n16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2727_c11_45ec_return_output,
 l16_low_MUX_uxn_opcodes_h_l2727_c7_6008_return_output,
 n16_low_MUX_uxn_opcodes_h_l2727_c7_6008_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_6008_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_6008_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2727_c7_6008_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_6008_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_6008_return_output,
 l16_high_MUX_uxn_opcodes_h_l2727_c7_6008_return_output,
 n16_high_MUX_uxn_opcodes_h_l2727_c7_6008_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2731_c11_24e4_return_output,
 l16_low_MUX_uxn_opcodes_h_l2731_c7_fede_return_output,
 n16_low_MUX_uxn_opcodes_h_l2731_c7_fede_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_fede_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_fede_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2731_c7_fede_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_fede_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_fede_return_output,
 l16_high_MUX_uxn_opcodes_h_l2731_c7_fede_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f974_return_output,
 l16_low_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output,
 l16_high_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output,
 sp_relative_shift_uxn_opcodes_h_l2737_c30_88a2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2742_c11_40b2_return_output,
 l16_low_MUX_uxn_opcodes_h_l2742_c7_a62d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_a62d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_a62d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_a62d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2742_c7_a62d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2748_c11_f398_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2748_c7_3a75_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c7_3a75_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2748_c7_3a75_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2752_c11_c0ca_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_86d1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_86d1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2752_c7_86d1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2756_c11_a253_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_4eb9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_4eb9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2756_c7_4eb9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1801_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_274b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_274b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2760_c7_274b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c6_bd55_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c6_bd55_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c6_bd55_return_output : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2703_c2_4192_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2703_c2_4192_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2703_c2_4192_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2703_c2_4192_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2703_c2_4192_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2703_c2_4192_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2703_c2_4192_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2703_c2_4192_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2703_c2_4192_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2703_c2_4192_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2703_c2_4192_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2703_c2_4192_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2703_c2_4192_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2703_c2_4192_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2703_c2_4192_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2703_c2_4192_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2713_c3_b727 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2703_c2_4192_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2703_c2_4192_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2703_c2_4192_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2703_c2_4192_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2708_c3_b372 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c2_4192_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c2_4192_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2703_c2_4192_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2703_c2_4192_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2703_c2_4192_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2703_c2_4192_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2703_c2_4192_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2703_c2_4192_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2703_c2_4192_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2703_c2_4192_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2703_c2_4192_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2703_c2_4192_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2703_c2_4192_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2703_c2_4192_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_dded_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_dded_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_dded_return_output : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2716_c7_cc14_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2717_c3_a5ad : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2716_c7_cc14_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2716_c7_cc14_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2716_c7_cc14_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2716_c7_cc14_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_3a4d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_3a4d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_3a4d_return_output : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2719_c7_1d91_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2721_c3_eea2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c7_1d91_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2719_c7_1d91_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2719_c7_1d91_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c7_1d91_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_41bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_41bb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_41bb_return_output : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2727_c7_6008_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2727_c7_6008_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_6008_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_5a06_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2725_c3_dd9c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_6008_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_5a06_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2727_c7_6008_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2723_c7_5a06_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_6008_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_5a06_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_6008_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_5a06_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2727_c7_6008_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2727_c7_6008_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_45ec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_45ec_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_45ec_return_output : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2731_c7_fede_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2727_c7_6008_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2731_c7_fede_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2727_c7_6008_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_fede_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_6008_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2729_c3_2d7f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_fede_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_6008_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_fede_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2727_c7_6008_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_fede_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_6008_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_fede_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_6008_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2731_c7_fede_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2727_c7_6008_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2727_c7_6008_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_24e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_24e4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_24e4_return_output : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2731_c7_fede_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2731_c7_fede_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_fede_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2733_c3_e63f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_fede_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_fede_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_fede_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_fede_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2731_c7_fede_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f974_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f974_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f974_return_output : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2735_c7_5f71_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2735_c7_5f71_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2742_c7_a62d_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2735_c7_5f71_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_5f71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_5f71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_a62d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_5f71_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_5f71_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2739_c3_2000 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_5f71_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_a62d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_5f71_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_5f71_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_5f71_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_a62d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_5f71_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_5f71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_5f71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_5f71_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_5f71_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_5f71_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_a62d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_5f71_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2735_c7_5f71_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2735_c7_5f71_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2735_c7_5f71_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2737_c30_88a2_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2737_c30_88a2_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2737_c30_88a2_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2737_c30_88a2_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_40b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_40b2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_40b2_return_output : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2742_c7_a62d_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2742_c7_a62d_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2742_c7_a62d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_a62d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_a62d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2748_c7_3a75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_a62d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_a62d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2745_c3_eb1d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_a62d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c7_3a75_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_a62d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_a62d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2744_c3_2979 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_a62d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_a62d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_a62d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_a62d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2748_c7_3a75_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_a62d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_f398_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_f398_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_f398_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2748_c7_3a75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2748_c7_3a75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_86d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2748_c7_3a75_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c7_3a75_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2749_c3_3a58 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c7_3a75_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_86d1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c7_3a75_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2748_c7_3a75_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2748_c7_3a75_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2752_c7_86d1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2748_c7_3a75_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_c0ca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_c0ca_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_c0ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_86d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_86d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_4eb9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_86d1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_86d1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2753_c3_013b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_86d1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_4eb9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_86d1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2752_c7_86d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2752_c7_86d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2756_c7_4eb9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2752_c7_86d1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_a253_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_a253_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_a253_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_4eb9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_4eb9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_274b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_4eb9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_4eb9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2757_c3_9745 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_4eb9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_274b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_4eb9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2756_c7_4eb9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2756_c7_4eb9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2760_c7_274b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2756_c7_4eb9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1801_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1801_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1801_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_274b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_274b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_274b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_274b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2761_c3_fe06 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_274b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2760_c7_274b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_274b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2760_c7_274b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2760_c7_274b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2760_c7_274b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2731_l2760_l2727_l2723_l2719_l2716_l2703_DUPLICATE_ffde_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2731_l2760_l2727_l2756_l2723_l2752_l2719_l2748_l2716_l2742_l2735_DUPLICATE_6243_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2731_l2727_l2723_l2719_l2716_l2735_DUPLICATE_cdcf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2731_l2727_l2723_l2719_l2716_l2742_DUPLICATE_975d_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l2766_l2699_DUPLICATE_f9a7_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16_high : unsigned(7 downto 0);
variable REG_VAR_t16_low : unsigned(7 downto 0);
variable REG_VAR_n16_high : unsigned(7 downto 0);
variable REG_VAR_n16_low : unsigned(7 downto 0);
variable REG_VAR_l16_high : unsigned(7 downto 0);
variable REG_VAR_l16_low : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16_high := t16_high;
  REG_VAR_t16_low := t16_low;
  REG_VAR_n16_high := n16_high;
  REG_VAR_n16_low := n16_low;
  REG_VAR_l16_high := l16_high;
  REG_VAR_l16_low := l16_low;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_274b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_f398_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2713_c3_b727 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2713_c3_b727;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2708_c3_b372 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2708_c3_b372;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c6_bd55_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2753_c3_013b := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_86d1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2753_c3_013b;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2757_c3_9745 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_4eb9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2757_c3_9745;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_a253_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2721_c3_eea2 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2721_c3_eea2;
     VAR_sp_relative_shift_uxn_opcodes_h_l2737_c30_88a2_x := signed(std_logic_vector(resize(to_unsigned(6, 3), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_5f71_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2761_c3_fe06 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_274b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2761_c3_fe06;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_24e4_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f974_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2737_c30_88a2_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2733_c3_e63f := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2733_c3_e63f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_40b2_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_dded_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2739_c3_2000 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_5f71_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2739_c3_2000;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2744_c3_2979 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_a62d_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2744_c3_2979;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_41bb_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2745_c3_eb1d := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_a62d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2745_c3_eb1d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2749_c3_3a58 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c7_3a75_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2749_c3_3a58;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2717_c3_a5ad := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2717_c3_a5ad;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2725_c3_dd9c := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2725_c3_dd9c;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_3a4d_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_45ec_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1801_right := to_unsigned(11, 4);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_c0ca_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2729_c3_2d7f := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2729_c3_2d7f;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2737_c30_88a2_ins := VAR_ins;
     VAR_l16_high_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2735_c7_5f71_iffalse := l16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2756_c7_4eb9_iftrue := l16_high;
     VAR_l16_low_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2735_c7_5f71_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2742_c7_a62d_iffalse := l16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2760_c7_274b_iftrue := l16_low;
     VAR_n16_high_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2748_c7_3a75_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2752_c7_86d1_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c6_bd55_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_dded_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_3a4d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_41bb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_45ec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_24e4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f974_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_40b2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_f398_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_c0ca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_a253_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1801_left := VAR_phase;
     VAR_l16_high_MUX_uxn_opcodes_h_l2735_c7_5f71_iftrue := VAR_previous_stack_read;
     VAR_l16_low_MUX_uxn_opcodes_h_l2742_c7_a62d_iftrue := VAR_previous_stack_read;
     VAR_n16_high_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_5f71_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_a62d_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse := t16_low;
     -- BIN_OP_EQ[uxn_opcodes_h_l2735_c11_f974] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f974_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f974_left;
     BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f974_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f974_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f974_return_output := BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f974_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2752_c11_c0ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2752_c11_c0ca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_c0ca_left;
     BIN_OP_EQ_uxn_opcodes_h_l2752_c11_c0ca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_c0ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_c0ca_return_output := BIN_OP_EQ_uxn_opcodes_h_l2752_c11_c0ca_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2737_c30_88a2] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2737_c30_88a2_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2737_c30_88a2_ins;
     sp_relative_shift_uxn_opcodes_h_l2737_c30_88a2_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2737_c30_88a2_x;
     sp_relative_shift_uxn_opcodes_h_l2737_c30_88a2_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2737_c30_88a2_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2737_c30_88a2_return_output := sp_relative_shift_uxn_opcodes_h_l2737_c30_88a2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2716_c11_dded] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2716_c11_dded_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_dded_left;
     BIN_OP_EQ_uxn_opcodes_h_l2716_c11_dded_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_dded_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_dded_return_output := BIN_OP_EQ_uxn_opcodes_h_l2716_c11_dded_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2727_c11_45ec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2727_c11_45ec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_45ec_left;
     BIN_OP_EQ_uxn_opcodes_h_l2727_c11_45ec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_45ec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_45ec_return_output := BIN_OP_EQ_uxn_opcodes_h_l2727_c11_45ec_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2742_c11_40b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2742_c11_40b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_40b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2742_c11_40b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_40b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_40b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2742_c11_40b2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2756_c11_a253] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2756_c11_a253_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_a253_left;
     BIN_OP_EQ_uxn_opcodes_h_l2756_c11_a253_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_a253_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_a253_return_output := BIN_OP_EQ_uxn_opcodes_h_l2756_c11_a253_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2719_c11_3a4d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2719_c11_3a4d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_3a4d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2719_c11_3a4d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_3a4d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_3a4d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2719_c11_3a4d_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2731_l2727_l2723_l2719_l2716_l2742_DUPLICATE_975d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2731_l2727_l2723_l2719_l2716_l2742_DUPLICATE_975d_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2760_c11_1801] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1801_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1801_left;
     BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1801_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1801_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1801_return_output := BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1801_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2703_c6_bd55] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2703_c6_bd55_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c6_bd55_left;
     BIN_OP_EQ_uxn_opcodes_h_l2703_c6_bd55_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c6_bd55_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c6_bd55_return_output := BIN_OP_EQ_uxn_opcodes_h_l2703_c6_bd55_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2760_c7_274b] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2760_c7_274b_return_output := result.stack_address_sp_offset;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2703_c2_4192] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2703_c2_4192_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2748_c11_f398] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2748_c11_f398_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_f398_left;
     BIN_OP_EQ_uxn_opcodes_h_l2748_c11_f398_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_f398_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_f398_return_output := BIN_OP_EQ_uxn_opcodes_h_l2748_c11_f398_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2723_c11_41bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2723_c11_41bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_41bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2723_c11_41bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_41bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_41bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2723_c11_41bb_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2703_c2_4192] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2703_c2_4192_return_output := result.is_stack_index_flipped;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2703_c2_4192] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2703_c2_4192_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2731_l2760_l2727_l2723_l2719_l2716_l2703_DUPLICATE_ffde LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2731_l2760_l2727_l2723_l2719_l2716_l2703_DUPLICATE_ffde_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2731_l2760_l2727_l2756_l2723_l2752_l2719_l2748_l2716_l2742_l2735_DUPLICATE_6243 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2731_l2760_l2727_l2756_l2723_l2752_l2719_l2748_l2716_l2742_l2735_DUPLICATE_6243_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2731_l2727_l2723_l2719_l2716_l2735_DUPLICATE_cdcf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2731_l2727_l2723_l2719_l2716_l2735_DUPLICATE_cdcf_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2731_c11_24e4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2731_c11_24e4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_24e4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2731_c11_24e4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_24e4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_24e4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2731_c11_24e4_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2703_c2_4192] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2703_c2_4192_return_output := result.is_ram_write;

     -- Submodule level 1
     VAR_l16_high_MUX_uxn_opcodes_h_l2703_c2_4192_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c6_bd55_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2703_c2_4192_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c6_bd55_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2703_c2_4192_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c6_bd55_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2703_c2_4192_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c6_bd55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2703_c2_4192_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c6_bd55_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2703_c2_4192_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c6_bd55_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2703_c2_4192_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c6_bd55_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2703_c2_4192_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c6_bd55_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2703_c2_4192_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c6_bd55_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2703_c2_4192_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c6_bd55_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c2_4192_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c6_bd55_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2703_c2_4192_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c6_bd55_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2703_c2_4192_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c6_bd55_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2703_c2_4192_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c6_bd55_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2703_c2_4192_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2703_c6_bd55_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_dded_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_dded_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_dded_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_dded_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2716_c7_cc14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_dded_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2716_c7_cc14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_dded_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2716_c7_cc14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_dded_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2716_c7_cc14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_dded_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2716_c7_cc14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_dded_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_dded_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2716_c11_dded_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_3a4d_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_3a4d_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_3a4d_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_3a4d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2719_c7_1d91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_3a4d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2719_c7_1d91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_3a4d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c7_1d91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_3a4d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c7_1d91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_3a4d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2719_c7_1d91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_3a4d_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_3a4d_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2719_c11_3a4d_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_41bb_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_41bb_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_41bb_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_41bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_5a06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_41bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_5a06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_41bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_5a06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_41bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_5a06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_41bb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2723_c7_5a06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_41bb_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_41bb_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2727_c7_6008_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_45ec_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2727_c7_6008_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_45ec_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2727_c7_6008_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_45ec_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2727_c7_6008_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_45ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_6008_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_45ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_6008_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_45ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_6008_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_45ec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_6008_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_45ec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2727_c7_6008_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2727_c11_45ec_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2731_c7_fede_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_24e4_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2731_c7_fede_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_24e4_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2731_c7_fede_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_24e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_fede_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_24e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_fede_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_24e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_fede_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_24e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_fede_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_24e4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_fede_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_24e4_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2735_c7_5f71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f974_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2735_c7_5f71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f974_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_5f71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f974_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_5f71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f974_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_5f71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f974_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_5f71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f974_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_5f71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_f974_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2742_c7_a62d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_40b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_a62d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_40b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_a62d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_40b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_a62d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_40b2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_a62d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_40b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2748_c7_3a75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_f398_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c7_3a75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_f398_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2748_c7_3a75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2748_c11_f398_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_86d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_c0ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_86d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_c0ca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2752_c7_86d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2752_c11_c0ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_4eb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_a253_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_4eb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_a253_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2756_c7_4eb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2756_c11_a253_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_274b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1801_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_274b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1801_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2760_c7_274b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2760_c11_1801_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2731_l2727_l2723_l2719_l2716_l2742_DUPLICATE_975d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2731_l2727_l2723_l2719_l2716_l2742_DUPLICATE_975d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2731_l2727_l2723_l2719_l2716_l2742_DUPLICATE_975d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2731_l2727_l2723_l2719_l2716_l2742_DUPLICATE_975d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2731_l2727_l2723_l2719_l2716_l2742_DUPLICATE_975d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_a62d_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2731_l2727_l2723_l2719_l2716_l2742_DUPLICATE_975d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2731_l2760_l2727_l2756_l2723_l2752_l2719_l2748_l2716_l2742_l2735_DUPLICATE_6243_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2731_l2760_l2727_l2756_l2723_l2752_l2719_l2748_l2716_l2742_l2735_DUPLICATE_6243_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2731_l2760_l2727_l2756_l2723_l2752_l2719_l2748_l2716_l2742_l2735_DUPLICATE_6243_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2731_l2760_l2727_l2756_l2723_l2752_l2719_l2748_l2716_l2742_l2735_DUPLICATE_6243_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2731_l2760_l2727_l2756_l2723_l2752_l2719_l2748_l2716_l2742_l2735_DUPLICATE_6243_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_5f71_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2731_l2760_l2727_l2756_l2723_l2752_l2719_l2748_l2716_l2742_l2735_DUPLICATE_6243_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_a62d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2731_l2760_l2727_l2756_l2723_l2752_l2719_l2748_l2716_l2742_l2735_DUPLICATE_6243_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2748_c7_3a75_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2731_l2760_l2727_l2756_l2723_l2752_l2719_l2748_l2716_l2742_l2735_DUPLICATE_6243_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_86d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2731_l2760_l2727_l2756_l2723_l2752_l2719_l2748_l2716_l2742_l2735_DUPLICATE_6243_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_4eb9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2731_l2760_l2727_l2756_l2723_l2752_l2719_l2748_l2716_l2742_l2735_DUPLICATE_6243_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_274b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2731_l2760_l2727_l2756_l2723_l2752_l2719_l2748_l2716_l2742_l2735_DUPLICATE_6243_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2731_l2727_l2723_l2719_l2716_l2735_DUPLICATE_cdcf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2731_l2727_l2723_l2719_l2716_l2735_DUPLICATE_cdcf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2731_l2727_l2723_l2719_l2716_l2735_DUPLICATE_cdcf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2731_l2727_l2723_l2719_l2716_l2735_DUPLICATE_cdcf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2731_l2727_l2723_l2719_l2716_l2735_DUPLICATE_cdcf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_5f71_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2731_l2727_l2723_l2719_l2716_l2735_DUPLICATE_cdcf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2731_l2760_l2727_l2723_l2719_l2716_l2703_DUPLICATE_ffde_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2731_l2760_l2727_l2723_l2719_l2716_l2703_DUPLICATE_ffde_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2731_l2760_l2727_l2723_l2719_l2716_l2703_DUPLICATE_ffde_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2731_l2760_l2727_l2723_l2719_l2716_l2703_DUPLICATE_ffde_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2731_l2760_l2727_l2723_l2719_l2716_l2703_DUPLICATE_ffde_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2731_l2760_l2727_l2723_l2719_l2716_l2703_DUPLICATE_ffde_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2760_c7_274b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2731_l2760_l2727_l2723_l2719_l2716_l2703_DUPLICATE_ffde_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2703_c2_4192_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2703_c2_4192_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2703_c2_4192_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2703_c2_4192_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_274b_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2760_c7_274b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_5f71_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2737_c30_88a2_return_output;
     -- l16_low_MUX[uxn_opcodes_h_l2742_c7_a62d] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2742_c7_a62d_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2742_c7_a62d_cond;
     l16_low_MUX_uxn_opcodes_h_l2742_c7_a62d_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2742_c7_a62d_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2742_c7_a62d_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2742_c7_a62d_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2742_c7_a62d_return_output := l16_low_MUX_uxn_opcodes_h_l2742_c7_a62d_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2703_c2_4192] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2703_c2_4192_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2703_c2_4192_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2703_c2_4192_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2703_c2_4192_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2760_c7_274b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2760_c7_274b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2760_c7_274b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2760_c7_274b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2760_c7_274b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2760_c7_274b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2760_c7_274b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2760_c7_274b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2760_c7_274b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2703_c2_4192] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2703_c2_4192_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2703_c2_4192_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2703_c2_4192_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2703_c2_4192_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2723_c7_5a06] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_cond;
     t16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output := t16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2703_c2_4192] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2703_c2_4192_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2703_c2_4192_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2703_c2_4192_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2703_c2_4192_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2760_c7_274b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_274b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_274b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_274b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_274b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_274b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_274b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_274b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_274b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2742_c7_a62d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_a62d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_a62d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_a62d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_a62d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_a62d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_a62d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_a62d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_a62d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2735_c7_5f71] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_5f71_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_5f71_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_5f71_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_5f71_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_5f71_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_5f71_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2719_c7_1d91] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_cond;
     t16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output := t16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2731_c7_fede] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2731_c7_fede_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2731_c7_fede_cond;
     n16_low_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2731_c7_fede_return_output := n16_low_MUX_uxn_opcodes_h_l2731_c7_fede_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2735_c7_5f71] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2735_c7_5f71_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2735_c7_5f71_cond;
     l16_high_MUX_uxn_opcodes_h_l2735_c7_5f71_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2735_c7_5f71_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2735_c7_5f71_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2735_c7_5f71_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output := l16_high_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2703_c2_4192] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2703_c2_4192_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2703_c2_4192_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2703_c2_4192_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2703_c2_4192_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2760_c7_274b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_274b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_274b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_274b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_274b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_274b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_274b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_274b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_274b_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2727_c7_6008] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2727_c7_6008_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2727_c7_6008_cond;
     n16_high_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2727_c7_6008_return_output := n16_high_MUX_uxn_opcodes_h_l2727_c7_6008_return_output;

     -- Submodule level 2
     VAR_l16_high_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2735_c7_5f71_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2742_c7_a62d_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2727_c7_6008_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2731_c7_fede_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_4eb9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2760_c7_274b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_5f71_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_a62d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_4eb9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2760_c7_274b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2756_c7_4eb9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2760_c7_274b_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output;
     -- t16_high_MUX[uxn_opcodes_h_l2716_c7_cc14] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_cond;
     t16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output := t16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2731_c7_fede] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2731_c7_fede_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2731_c7_fede_cond;
     l16_high_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2731_c7_fede_return_output := l16_high_MUX_uxn_opcodes_h_l2731_c7_fede_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2735_c7_5f71] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2735_c7_5f71_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2735_c7_5f71_cond;
     l16_low_MUX_uxn_opcodes_h_l2735_c7_5f71_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2735_c7_5f71_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2735_c7_5f71_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2735_c7_5f71_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output := l16_low_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2756_c7_4eb9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_4eb9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_4eb9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_4eb9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_4eb9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_4eb9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_4eb9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_4eb9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_4eb9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2756_c7_4eb9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2756_c7_4eb9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2756_c7_4eb9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2756_c7_4eb9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2756_c7_4eb9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2756_c7_4eb9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2756_c7_4eb9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2756_c7_4eb9_return_output := result_u8_value_MUX_uxn_opcodes_h_l2756_c7_4eb9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2731_c7_fede] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_fede_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_fede_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_fede_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_fede_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2719_c7_1d91] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_cond;
     t16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output := t16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2756_c7_4eb9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_4eb9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_4eb9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_4eb9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_4eb9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_4eb9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_4eb9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_4eb9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_4eb9_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2727_c7_6008] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2727_c7_6008_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2727_c7_6008_cond;
     n16_low_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2727_c7_6008_return_output := n16_low_MUX_uxn_opcodes_h_l2727_c7_6008_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2723_c7_5a06] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_cond;
     n16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output := n16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2735_c7_5f71] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_5f71_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_5f71_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_5f71_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_5f71_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_5f71_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_5f71_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output;

     -- Submodule level 3
     VAR_l16_high_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2731_c7_fede_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2727_c7_6008_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_86d1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2756_c7_4eb9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2731_c7_fede_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_86d1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2756_c7_4eb9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2752_c7_86d1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2756_c7_4eb9_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output;
     -- n16_high_MUX[uxn_opcodes_h_l2719_c7_1d91] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_cond;
     n16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output := n16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2703_c2_4192] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2703_c2_4192_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2703_c2_4192_cond;
     t16_high_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2703_c2_4192_return_output := t16_high_MUX_uxn_opcodes_h_l2703_c2_4192_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2727_c7_6008] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_6008_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_6008_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_6008_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_6008_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2716_c7_cc14] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_cond;
     t16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output := t16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2727_c7_6008] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2727_c7_6008_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2727_c7_6008_cond;
     l16_high_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2727_c7_6008_return_output := l16_high_MUX_uxn_opcodes_h_l2727_c7_6008_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2731_c7_fede] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_fede_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_fede_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_fede_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_fede_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2731_c7_fede] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2731_c7_fede_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2731_c7_fede_cond;
     l16_low_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2731_c7_fede_return_output := l16_low_MUX_uxn_opcodes_h_l2731_c7_fede_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2752_c7_86d1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2752_c7_86d1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2752_c7_86d1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2752_c7_86d1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2752_c7_86d1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2752_c7_86d1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2752_c7_86d1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2752_c7_86d1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2752_c7_86d1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2752_c7_86d1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_86d1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_86d1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_86d1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_86d1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_86d1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_86d1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_86d1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_86d1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2752_c7_86d1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_86d1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_86d1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_86d1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_86d1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_86d1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_86d1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_86d1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_86d1_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2723_c7_5a06] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_cond;
     n16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output := n16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output;

     -- Submodule level 4
     VAR_l16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2727_c7_6008_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2731_c7_fede_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2748_c7_3a75_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2752_c7_86d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2727_c7_6008_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2731_c7_fede_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c7_3a75_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2752_c7_86d1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2748_c7_3a75_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2752_c7_86d1_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l2703_c2_4192_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output;
     -- l16_high_MUX[uxn_opcodes_h_l2723_c7_5a06] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_cond;
     l16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output := l16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2716_c7_cc14] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_cond;
     n16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output := n16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2703_c2_4192] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2703_c2_4192_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2703_c2_4192_cond;
     t16_low_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2703_c2_4192_return_output := t16_low_MUX_uxn_opcodes_h_l2703_c2_4192_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2748_c7_3a75] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c7_3a75_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c7_3a75_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c7_3a75_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c7_3a75_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c7_3a75_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c7_3a75_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c7_3a75_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c7_3a75_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2748_c7_3a75] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2748_c7_3a75_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2748_c7_3a75_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2748_c7_3a75_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2748_c7_3a75_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2748_c7_3a75_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2748_c7_3a75_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2748_c7_3a75_return_output := result_u8_value_MUX_uxn_opcodes_h_l2748_c7_3a75_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2727_c7_6008] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_6008_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_6008_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_6008_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_6008_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2748_c7_3a75] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2748_c7_3a75_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2748_c7_3a75_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2748_c7_3a75_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2748_c7_3a75_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2748_c7_3a75_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2748_c7_3a75_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2748_c7_3a75_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2748_c7_3a75_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2723_c7_5a06] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_5a06_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_5a06_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2727_c7_6008] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2727_c7_6008_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2727_c7_6008_cond;
     l16_low_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2727_c7_6008_return_output := l16_low_MUX_uxn_opcodes_h_l2727_c7_6008_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2719_c7_1d91] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_cond;
     n16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output := n16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output;

     -- Submodule level 5
     VAR_l16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2727_c7_6008_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_a62d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2748_c7_3a75_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2727_c7_6008_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_a62d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2748_c7_3a75_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_a62d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2748_c7_3a75_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l2703_c2_4192_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2742_c7_a62d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_a62d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_a62d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_a62d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_a62d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_a62d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_a62d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_a62d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_a62d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2742_c7_a62d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_a62d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_a62d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_a62d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_a62d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_a62d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_a62d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_a62d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_a62d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2742_c7_a62d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2742_c7_a62d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_a62d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2742_c7_a62d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_a62d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2742_c7_a62d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_a62d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_a62d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2742_c7_a62d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2723_c7_5a06] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_5a06_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_5a06_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2719_c7_1d91] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2719_c7_1d91_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2719_c7_1d91_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2703_c2_4192] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2703_c2_4192_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2703_c2_4192_cond;
     n16_high_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2703_c2_4192_return_output := n16_high_MUX_uxn_opcodes_h_l2703_c2_4192_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2716_c7_cc14] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_cond;
     n16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output := n16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2723_c7_5a06] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_cond;
     l16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output := l16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2719_c7_1d91] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_cond;
     l16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output := l16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output;

     -- Submodule level 6
     VAR_l16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output;
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l2703_c2_4192_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_5f71_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_a62d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_5f71_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_a62d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_5f71_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_a62d_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2719_c7_1d91] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c7_1d91_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c7_1d91_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2735_c7_5f71] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_5f71_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_5f71_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_5f71_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_5f71_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_5f71_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_5f71_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2716_c7_cc14] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2716_c7_cc14_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2716_c7_cc14_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2735_c7_5f71] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_5f71_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_5f71_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_5f71_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_5f71_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_5f71_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_5f71_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2716_c7_cc14] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_cond;
     l16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output := l16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2735_c7_5f71] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2735_c7_5f71_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_5f71_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2735_c7_5f71_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_5f71_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2735_c7_5f71_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_5f71_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output := result_u8_value_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2703_c2_4192] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2703_c2_4192_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2703_c2_4192_cond;
     n16_low_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2703_c2_4192_return_output := n16_low_MUX_uxn_opcodes_h_l2703_c2_4192_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2719_c7_1d91] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_cond;
     l16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output := l16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output;

     -- Submodule level 7
     VAR_l16_high_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output;
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l2703_c2_4192_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_5f71_return_output;
     -- l16_low_MUX[uxn_opcodes_h_l2716_c7_cc14] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_cond;
     l16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output := l16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2731_c7_fede] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_fede_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_fede_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_fede_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_fede_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2703_c2_4192] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2703_c2_4192_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2703_c2_4192_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2703_c2_4192_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2703_c2_4192_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2703_c2_4192] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2703_c2_4192_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2703_c2_4192_cond;
     l16_high_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2703_c2_4192_return_output := l16_high_MUX_uxn_opcodes_h_l2703_c2_4192_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2731_c7_fede] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2731_c7_fede_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_fede_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_fede_return_output := result_u8_value_MUX_uxn_opcodes_h_l2731_c7_fede_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2716_c7_cc14] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2716_c7_cc14_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2716_c7_cc14_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2731_c7_fede] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_fede_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_fede_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_fede_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_fede_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_fede_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_fede_return_output;

     -- Submodule level 8
     REG_VAR_l16_high := VAR_l16_high_MUX_uxn_opcodes_h_l2703_c2_4192_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_fede_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_fede_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_fede_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2727_c7_6008] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2727_c7_6008_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2727_c7_6008_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2727_c7_6008_return_output := result_u8_value_MUX_uxn_opcodes_h_l2727_c7_6008_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2727_c7_6008] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_6008_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_6008_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_6008_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_6008_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2703_c2_4192] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2703_c2_4192_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2703_c2_4192_cond;
     l16_low_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2703_c2_4192_return_output := l16_low_MUX_uxn_opcodes_h_l2703_c2_4192_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2703_c2_4192] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c2_4192_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c2_4192_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c2_4192_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c2_4192_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2727_c7_6008] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_6008_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_6008_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_6008_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_6008_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_6008_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_6008_return_output;

     -- Submodule level 9
     REG_VAR_l16_low := VAR_l16_low_MUX_uxn_opcodes_h_l2703_c2_4192_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2727_c7_6008_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2727_c7_6008_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2727_c7_6008_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2723_c7_5a06] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_5a06_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_5a06_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2723_c7_5a06] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_5a06_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_5a06_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2723_c7_5a06] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2723_c7_5a06_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2723_c7_5a06_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2723_c7_5a06_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2723_c7_5a06_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output := result_u8_value_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2723_c7_5a06_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2719_c7_1d91] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2719_c7_1d91_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2719_c7_1d91_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2719_c7_1d91] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2719_c7_1d91_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2719_c7_1d91_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output := result_u8_value_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2719_c7_1d91] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c7_1d91_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c7_1d91_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c7_1d91_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c7_1d91_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2719_c7_1d91_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2716_c7_cc14] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2716_c7_cc14_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2716_c7_cc14_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output := result_u8_value_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2716_c7_cc14] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2716_c7_cc14_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2716_c7_cc14_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2716_c7_cc14] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2716_c7_cc14_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2716_c7_cc14_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2716_c7_cc14_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2716_c7_cc14_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2716_c7_cc14_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2703_c2_4192] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2703_c2_4192_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2703_c2_4192_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2703_c2_4192_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2703_c2_4192_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2703_c2_4192] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2703_c2_4192_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2703_c2_4192_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2703_c2_4192_return_output := result_u8_value_MUX_uxn_opcodes_h_l2703_c2_4192_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2703_c2_4192] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2703_c2_4192_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2703_c2_4192_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2703_c2_4192_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2703_c2_4192_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2703_c2_4192_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2703_c2_4192_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l2766_l2699_DUPLICATE_f9a7 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l2766_l2699_DUPLICATE_f9a7_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c580(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2703_c2_4192_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2703_c2_4192_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2703_c2_4192_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2703_c2_4192_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2703_c2_4192_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2703_c2_4192_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2703_c2_4192_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2703_c2_4192_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2703_c2_4192_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l2766_l2699_DUPLICATE_f9a7_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l2766_l2699_DUPLICATE_f9a7_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16_high <= REG_VAR_t16_high;
REG_COMB_t16_low <= REG_VAR_t16_low;
REG_COMB_n16_high <= REG_VAR_n16_high;
REG_COMB_n16_low <= REG_VAR_n16_low;
REG_COMB_l16_high <= REG_VAR_l16_high;
REG_COMB_l16_low <= REG_VAR_l16_low;
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
     l16_high <= REG_COMB_l16_high;
     l16_low <= REG_COMB_l16_low;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
