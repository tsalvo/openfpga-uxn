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
-- BIN_OP_EQ[uxn_opcodes_h_l2708_c6_bbac]
signal BIN_OP_EQ_uxn_opcodes_h_l2708_c6_bbac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2708_c6_bbac_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2708_c6_bbac_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2708_c2_eac0]
signal t16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2708_c2_eac0]
signal l16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2708_c2_eac0]
signal l16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2708_c2_eac0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2708_c2_eac0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2708_c2_eac0]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2708_c2_eac0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2708_c2_eac0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2708_c2_eac0]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2708_c2_eac0]
signal result_u8_value_MUX_uxn_opcodes_h_l2708_c2_eac0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2708_c2_eac0]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2708_c2_eac0_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2708_c2_eac0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2708_c2_eac0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2708_c2_eac0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2708_c2_eac0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2708_c2_eac0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2708_c2_eac0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2708_c2_eac0]
signal n16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2708_c2_eac0]
signal t16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2708_c2_eac0]
signal n16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2721_c11_64da]
signal BIN_OP_EQ_uxn_opcodes_h_l2721_c11_64da_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2721_c11_64da_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2721_c11_64da_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2721_c7_b200]
signal t16_high_MUX_uxn_opcodes_h_l2721_c7_b200_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2721_c7_b200_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2721_c7_b200]
signal l16_high_MUX_uxn_opcodes_h_l2721_c7_b200_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2721_c7_b200_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2721_c7_b200]
signal l16_low_MUX_uxn_opcodes_h_l2721_c7_b200_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2721_c7_b200_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2721_c7_b200]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2721_c7_b200_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2721_c7_b200_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2721_c7_b200]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2721_c7_b200_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2721_c7_b200_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2721_c7_b200]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2721_c7_b200_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2721_c7_b200_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2721_c7_b200]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2721_c7_b200_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2721_c7_b200_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2721_c7_b200]
signal result_u8_value_MUX_uxn_opcodes_h_l2721_c7_b200_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2721_c7_b200_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2721_c7_b200]
signal n16_low_MUX_uxn_opcodes_h_l2721_c7_b200_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2721_c7_b200_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2721_c7_b200]
signal t16_low_MUX_uxn_opcodes_h_l2721_c7_b200_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2721_c7_b200_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2721_c7_b200]
signal n16_high_MUX_uxn_opcodes_h_l2721_c7_b200_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2721_c7_b200_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2724_c11_d421]
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_d421_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_d421_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_d421_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2724_c7_5b3c]
signal t16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2724_c7_5b3c]
signal l16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2724_c7_5b3c]
signal l16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2724_c7_5b3c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2724_c7_5b3c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2724_c7_5b3c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2724_c7_5b3c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2724_c7_5b3c]
signal result_u8_value_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2724_c7_5b3c]
signal n16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2724_c7_5b3c]
signal t16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2724_c7_5b3c]
signal n16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2728_c11_719c]
signal BIN_OP_EQ_uxn_opcodes_h_l2728_c11_719c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2728_c11_719c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2728_c11_719c_return_output : unsigned(0 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2728_c7_c368]
signal l16_high_MUX_uxn_opcodes_h_l2728_c7_c368_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2728_c7_c368_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2728_c7_c368]
signal l16_low_MUX_uxn_opcodes_h_l2728_c7_c368_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2728_c7_c368_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2728_c7_c368]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_c368_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_c368_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2728_c7_c368]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_c368_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_c368_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2728_c7_c368]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_c368_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_c368_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2728_c7_c368]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_c368_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_c368_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2728_c7_c368]
signal result_u8_value_MUX_uxn_opcodes_h_l2728_c7_c368_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2728_c7_c368_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2728_c7_c368]
signal n16_low_MUX_uxn_opcodes_h_l2728_c7_c368_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2728_c7_c368_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2728_c7_c368]
signal t16_low_MUX_uxn_opcodes_h_l2728_c7_c368_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2728_c7_c368_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2728_c7_c368]
signal n16_high_MUX_uxn_opcodes_h_l2728_c7_c368_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2728_c7_c368_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2732_c11_db7d]
signal BIN_OP_EQ_uxn_opcodes_h_l2732_c11_db7d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2732_c11_db7d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2732_c11_db7d_return_output : unsigned(0 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2732_c7_a696]
signal l16_high_MUX_uxn_opcodes_h_l2732_c7_a696_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2732_c7_a696_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2732_c7_a696]
signal l16_low_MUX_uxn_opcodes_h_l2732_c7_a696_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2732_c7_a696_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2732_c7_a696]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_a696_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_a696_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2732_c7_a696]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_a696_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_a696_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2732_c7_a696]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_a696_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_a696_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2732_c7_a696]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_a696_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_a696_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2732_c7_a696]
signal result_u8_value_MUX_uxn_opcodes_h_l2732_c7_a696_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2732_c7_a696_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2732_c7_a696]
signal n16_low_MUX_uxn_opcodes_h_l2732_c7_a696_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2732_c7_a696_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2732_c7_a696]
signal n16_high_MUX_uxn_opcodes_h_l2732_c7_a696_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2732_c7_a696_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2736_c11_4e73]
signal BIN_OP_EQ_uxn_opcodes_h_l2736_c11_4e73_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2736_c11_4e73_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2736_c11_4e73_return_output : unsigned(0 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2736_c7_94b1]
signal l16_high_MUX_uxn_opcodes_h_l2736_c7_94b1_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2736_c7_94b1]
signal l16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2736_c7_94b1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_94b1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2736_c7_94b1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_94b1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2736_c7_94b1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_94b1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2736_c7_94b1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_94b1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2736_c7_94b1]
signal result_u8_value_MUX_uxn_opcodes_h_l2736_c7_94b1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2736_c7_94b1]
signal n16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2740_c11_a9e0]
signal BIN_OP_EQ_uxn_opcodes_h_l2740_c11_a9e0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2740_c11_a9e0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2740_c11_a9e0_return_output : unsigned(0 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2740_c7_0ae8]
signal l16_high_MUX_uxn_opcodes_h_l2740_c7_0ae8_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2740_c7_0ae8_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2740_c7_0ae8_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2740_c7_0ae8]
signal l16_low_MUX_uxn_opcodes_h_l2740_c7_0ae8_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2740_c7_0ae8_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2740_c7_0ae8_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2740_c7_0ae8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2740_c7_0ae8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2740_c7_0ae8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2740_c7_0ae8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2740_c7_0ae8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2740_c7_0ae8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2740_c7_0ae8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2740_c7_0ae8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2740_c7_0ae8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2740_c7_0ae8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2740_c7_0ae8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2740_c7_0ae8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2740_c7_0ae8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2740_c7_0ae8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2740_c7_0ae8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2740_c7_0ae8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2740_c7_0ae8]
signal result_u8_value_MUX_uxn_opcodes_h_l2740_c7_0ae8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2740_c7_0ae8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2740_c7_0ae8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2742_c30_9164]
signal sp_relative_shift_uxn_opcodes_h_l2742_c30_9164_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2742_c30_9164_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2742_c30_9164_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2742_c30_9164_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2747_c11_0b5f]
signal BIN_OP_EQ_uxn_opcodes_h_l2747_c11_0b5f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2747_c11_0b5f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2747_c11_0b5f_return_output : unsigned(0 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2747_c7_835d]
signal l16_low_MUX_uxn_opcodes_h_l2747_c7_835d_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2747_c7_835d_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2747_c7_835d_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2747_c7_835d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2747_c7_835d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_835d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_835d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_835d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_835d_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2747_c7_835d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_835d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_835d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_835d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_835d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2747_c7_835d]
signal result_u8_value_MUX_uxn_opcodes_h_l2747_c7_835d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2747_c7_835d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2747_c7_835d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2747_c7_835d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2747_c7_835d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_835d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_835d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_835d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_835d_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2753_c11_f167]
signal BIN_OP_EQ_uxn_opcodes_h_l2753_c11_f167_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2753_c11_f167_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2753_c11_f167_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2753_c7_4f9f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c7_4f9f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c7_4f9f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c7_4f9f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c7_4f9f_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2753_c7_4f9f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2753_c7_4f9f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2753_c7_4f9f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2753_c7_4f9f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2753_c7_4f9f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2753_c7_4f9f]
signal result_u8_value_MUX_uxn_opcodes_h_l2753_c7_4f9f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2753_c7_4f9f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2753_c7_4f9f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2753_c7_4f9f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2757_c11_53b1]
signal BIN_OP_EQ_uxn_opcodes_h_l2757_c11_53b1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2757_c11_53b1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2757_c11_53b1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2757_c7_f7cc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_f7cc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_f7cc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_f7cc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_f7cc_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2757_c7_f7cc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_f7cc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_f7cc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_f7cc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_f7cc_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2757_c7_f7cc]
signal result_u8_value_MUX_uxn_opcodes_h_l2757_c7_f7cc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2757_c7_f7cc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2757_c7_f7cc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2757_c7_f7cc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2761_c11_bd5f]
signal BIN_OP_EQ_uxn_opcodes_h_l2761_c11_bd5f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2761_c11_bd5f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2761_c11_bd5f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2761_c7_851b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_851b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_851b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_851b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_851b_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2761_c7_851b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_851b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_851b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_851b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_851b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2761_c7_851b]
signal result_u8_value_MUX_uxn_opcodes_h_l2761_c7_851b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2761_c7_851b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2761_c7_851b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2761_c7_851b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2765_c11_c889]
signal BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c889_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c889_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c889_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2765_c7_67bd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_67bd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_67bd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_67bd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_67bd_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2765_c7_67bd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_67bd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_67bd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_67bd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_67bd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2765_c7_67bd]
signal result_u8_value_MUX_uxn_opcodes_h_l2765_c7_67bd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2765_c7_67bd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2765_c7_67bd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2765_c7_67bd_return_output : unsigned(7 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2708_c6_bbac
BIN_OP_EQ_uxn_opcodes_h_l2708_c6_bbac : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2708_c6_bbac_left,
BIN_OP_EQ_uxn_opcodes_h_l2708_c6_bbac_right,
BIN_OP_EQ_uxn_opcodes_h_l2708_c6_bbac_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2708_c2_eac0
t16_high_MUX_uxn_opcodes_h_l2708_c2_eac0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_cond,
t16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue,
t16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse,
t16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2708_c2_eac0
l16_high_MUX_uxn_opcodes_h_l2708_c2_eac0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_cond,
l16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue,
l16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse,
l16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2708_c2_eac0
l16_low_MUX_uxn_opcodes_h_l2708_c2_eac0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_cond,
l16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue,
l16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse,
l16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2708_c2_eac0
result_is_stack_write_MUX_uxn_opcodes_h_l2708_c2_eac0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2708_c2_eac0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2708_c2_eac0
result_is_ram_write_MUX_uxn_opcodes_h_l2708_c2_eac0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2708_c2_eac0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2708_c2_eac0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2708_c2_eac0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2708_c2_eac0
result_is_vram_write_MUX_uxn_opcodes_h_l2708_c2_eac0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2708_c2_eac0
result_u8_value_MUX_uxn_opcodes_h_l2708_c2_eac0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2708_c2_eac0_cond,
result_u8_value_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2708_c2_eac0
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2708_c2_eac0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2708_c2_eac0_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2708_c2_eac0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2708_c2_eac0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2708_c2_eac0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2708_c2_eac0
result_is_pc_updated_MUX_uxn_opcodes_h_l2708_c2_eac0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2708_c2_eac0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2708_c2_eac0
result_is_opc_done_MUX_uxn_opcodes_h_l2708_c2_eac0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2708_c2_eac0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2708_c2_eac0
n16_low_MUX_uxn_opcodes_h_l2708_c2_eac0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_cond,
n16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue,
n16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse,
n16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2708_c2_eac0
t16_low_MUX_uxn_opcodes_h_l2708_c2_eac0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_cond,
t16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue,
t16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse,
t16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2708_c2_eac0
n16_high_MUX_uxn_opcodes_h_l2708_c2_eac0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_cond,
n16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue,
n16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse,
n16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2721_c11_64da
BIN_OP_EQ_uxn_opcodes_h_l2721_c11_64da : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2721_c11_64da_left,
BIN_OP_EQ_uxn_opcodes_h_l2721_c11_64da_right,
BIN_OP_EQ_uxn_opcodes_h_l2721_c11_64da_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2721_c7_b200
t16_high_MUX_uxn_opcodes_h_l2721_c7_b200 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2721_c7_b200_cond,
t16_high_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue,
t16_high_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse,
t16_high_MUX_uxn_opcodes_h_l2721_c7_b200_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2721_c7_b200
l16_high_MUX_uxn_opcodes_h_l2721_c7_b200 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2721_c7_b200_cond,
l16_high_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue,
l16_high_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse,
l16_high_MUX_uxn_opcodes_h_l2721_c7_b200_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2721_c7_b200
l16_low_MUX_uxn_opcodes_h_l2721_c7_b200 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2721_c7_b200_cond,
l16_low_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue,
l16_low_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse,
l16_low_MUX_uxn_opcodes_h_l2721_c7_b200_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2721_c7_b200
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2721_c7_b200 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2721_c7_b200_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2721_c7_b200_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2721_c7_b200
result_is_stack_write_MUX_uxn_opcodes_h_l2721_c7_b200 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2721_c7_b200_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2721_c7_b200_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2721_c7_b200
result_sp_relative_shift_MUX_uxn_opcodes_h_l2721_c7_b200 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2721_c7_b200_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2721_c7_b200_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2721_c7_b200
result_is_opc_done_MUX_uxn_opcodes_h_l2721_c7_b200 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2721_c7_b200_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2721_c7_b200_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2721_c7_b200
result_u8_value_MUX_uxn_opcodes_h_l2721_c7_b200 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2721_c7_b200_cond,
result_u8_value_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2721_c7_b200_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2721_c7_b200
n16_low_MUX_uxn_opcodes_h_l2721_c7_b200 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2721_c7_b200_cond,
n16_low_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue,
n16_low_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse,
n16_low_MUX_uxn_opcodes_h_l2721_c7_b200_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2721_c7_b200
t16_low_MUX_uxn_opcodes_h_l2721_c7_b200 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2721_c7_b200_cond,
t16_low_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue,
t16_low_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse,
t16_low_MUX_uxn_opcodes_h_l2721_c7_b200_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2721_c7_b200
n16_high_MUX_uxn_opcodes_h_l2721_c7_b200 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2721_c7_b200_cond,
n16_high_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue,
n16_high_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse,
n16_high_MUX_uxn_opcodes_h_l2721_c7_b200_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2724_c11_d421
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_d421 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_d421_left,
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_d421_right,
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_d421_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c
t16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond,
t16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue,
t16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse,
t16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c
l16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond,
l16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue,
l16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse,
l16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c
l16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond,
l16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue,
l16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse,
l16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_5b3c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_5b3c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_5b3c
result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_5b3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_5b3c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_5b3c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_5b3c
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_5b3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2724_c7_5b3c
result_u8_value_MUX_uxn_opcodes_h_l2724_c7_5b3c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c
n16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond,
n16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue,
n16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse,
n16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c
t16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond,
t16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue,
t16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse,
t16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c
n16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond,
n16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue,
n16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse,
n16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2728_c11_719c
BIN_OP_EQ_uxn_opcodes_h_l2728_c11_719c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2728_c11_719c_left,
BIN_OP_EQ_uxn_opcodes_h_l2728_c11_719c_right,
BIN_OP_EQ_uxn_opcodes_h_l2728_c11_719c_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2728_c7_c368
l16_high_MUX_uxn_opcodes_h_l2728_c7_c368 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2728_c7_c368_cond,
l16_high_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue,
l16_high_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse,
l16_high_MUX_uxn_opcodes_h_l2728_c7_c368_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2728_c7_c368
l16_low_MUX_uxn_opcodes_h_l2728_c7_c368 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2728_c7_c368_cond,
l16_low_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue,
l16_low_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse,
l16_low_MUX_uxn_opcodes_h_l2728_c7_c368_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_c368
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_c368 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_c368_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_c368_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_c368
result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_c368 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_c368_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_c368_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_c368
result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_c368 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_c368_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_c368_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_c368
result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_c368 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_c368_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_c368_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2728_c7_c368
result_u8_value_MUX_uxn_opcodes_h_l2728_c7_c368 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2728_c7_c368_cond,
result_u8_value_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2728_c7_c368_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2728_c7_c368
n16_low_MUX_uxn_opcodes_h_l2728_c7_c368 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2728_c7_c368_cond,
n16_low_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue,
n16_low_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse,
n16_low_MUX_uxn_opcodes_h_l2728_c7_c368_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2728_c7_c368
t16_low_MUX_uxn_opcodes_h_l2728_c7_c368 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2728_c7_c368_cond,
t16_low_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue,
t16_low_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse,
t16_low_MUX_uxn_opcodes_h_l2728_c7_c368_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2728_c7_c368
n16_high_MUX_uxn_opcodes_h_l2728_c7_c368 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2728_c7_c368_cond,
n16_high_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue,
n16_high_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse,
n16_high_MUX_uxn_opcodes_h_l2728_c7_c368_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2732_c11_db7d
BIN_OP_EQ_uxn_opcodes_h_l2732_c11_db7d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2732_c11_db7d_left,
BIN_OP_EQ_uxn_opcodes_h_l2732_c11_db7d_right,
BIN_OP_EQ_uxn_opcodes_h_l2732_c11_db7d_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2732_c7_a696
l16_high_MUX_uxn_opcodes_h_l2732_c7_a696 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2732_c7_a696_cond,
l16_high_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue,
l16_high_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse,
l16_high_MUX_uxn_opcodes_h_l2732_c7_a696_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2732_c7_a696
l16_low_MUX_uxn_opcodes_h_l2732_c7_a696 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2732_c7_a696_cond,
l16_low_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue,
l16_low_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse,
l16_low_MUX_uxn_opcodes_h_l2732_c7_a696_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_a696
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_a696 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_a696_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_a696_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_a696
result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_a696 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_a696_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_a696_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_a696
result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_a696 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_a696_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_a696_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_a696
result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_a696 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_a696_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_a696_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2732_c7_a696
result_u8_value_MUX_uxn_opcodes_h_l2732_c7_a696 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2732_c7_a696_cond,
result_u8_value_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2732_c7_a696_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2732_c7_a696
n16_low_MUX_uxn_opcodes_h_l2732_c7_a696 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2732_c7_a696_cond,
n16_low_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue,
n16_low_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse,
n16_low_MUX_uxn_opcodes_h_l2732_c7_a696_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2732_c7_a696
n16_high_MUX_uxn_opcodes_h_l2732_c7_a696 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2732_c7_a696_cond,
n16_high_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue,
n16_high_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse,
n16_high_MUX_uxn_opcodes_h_l2732_c7_a696_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2736_c11_4e73
BIN_OP_EQ_uxn_opcodes_h_l2736_c11_4e73 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2736_c11_4e73_left,
BIN_OP_EQ_uxn_opcodes_h_l2736_c11_4e73_right,
BIN_OP_EQ_uxn_opcodes_h_l2736_c11_4e73_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2736_c7_94b1
l16_high_MUX_uxn_opcodes_h_l2736_c7_94b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2736_c7_94b1_cond,
l16_high_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue,
l16_high_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse,
l16_high_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2736_c7_94b1
l16_low_MUX_uxn_opcodes_h_l2736_c7_94b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_cond,
l16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue,
l16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse,
l16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_94b1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_94b1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_94b1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_94b1
result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_94b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_94b1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_94b1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_94b1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_94b1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_94b1
result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_94b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_94b1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2736_c7_94b1
result_u8_value_MUX_uxn_opcodes_h_l2736_c7_94b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2736_c7_94b1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2736_c7_94b1
n16_low_MUX_uxn_opcodes_h_l2736_c7_94b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_cond,
n16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue,
n16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse,
n16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2740_c11_a9e0
BIN_OP_EQ_uxn_opcodes_h_l2740_c11_a9e0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2740_c11_a9e0_left,
BIN_OP_EQ_uxn_opcodes_h_l2740_c11_a9e0_right,
BIN_OP_EQ_uxn_opcodes_h_l2740_c11_a9e0_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2740_c7_0ae8
l16_high_MUX_uxn_opcodes_h_l2740_c7_0ae8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2740_c7_0ae8_cond,
l16_high_MUX_uxn_opcodes_h_l2740_c7_0ae8_iftrue,
l16_high_MUX_uxn_opcodes_h_l2740_c7_0ae8_iffalse,
l16_high_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2740_c7_0ae8
l16_low_MUX_uxn_opcodes_h_l2740_c7_0ae8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2740_c7_0ae8_cond,
l16_low_MUX_uxn_opcodes_h_l2740_c7_0ae8_iftrue,
l16_low_MUX_uxn_opcodes_h_l2740_c7_0ae8_iffalse,
l16_low_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2740_c7_0ae8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2740_c7_0ae8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2740_c7_0ae8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2740_c7_0ae8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2740_c7_0ae8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2740_c7_0ae8
result_is_stack_write_MUX_uxn_opcodes_h_l2740_c7_0ae8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2740_c7_0ae8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2740_c7_0ae8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2740_c7_0ae8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2740_c7_0ae8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2740_c7_0ae8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2740_c7_0ae8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2740_c7_0ae8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2740_c7_0ae8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2740_c7_0ae8
result_is_opc_done_MUX_uxn_opcodes_h_l2740_c7_0ae8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2740_c7_0ae8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2740_c7_0ae8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2740_c7_0ae8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2740_c7_0ae8
result_u8_value_MUX_uxn_opcodes_h_l2740_c7_0ae8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2740_c7_0ae8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2740_c7_0ae8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2740_c7_0ae8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2742_c30_9164
sp_relative_shift_uxn_opcodes_h_l2742_c30_9164 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2742_c30_9164_ins,
sp_relative_shift_uxn_opcodes_h_l2742_c30_9164_x,
sp_relative_shift_uxn_opcodes_h_l2742_c30_9164_y,
sp_relative_shift_uxn_opcodes_h_l2742_c30_9164_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2747_c11_0b5f
BIN_OP_EQ_uxn_opcodes_h_l2747_c11_0b5f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2747_c11_0b5f_left,
BIN_OP_EQ_uxn_opcodes_h_l2747_c11_0b5f_right,
BIN_OP_EQ_uxn_opcodes_h_l2747_c11_0b5f_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2747_c7_835d
l16_low_MUX_uxn_opcodes_h_l2747_c7_835d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2747_c7_835d_cond,
l16_low_MUX_uxn_opcodes_h_l2747_c7_835d_iftrue,
l16_low_MUX_uxn_opcodes_h_l2747_c7_835d_iffalse,
l16_low_MUX_uxn_opcodes_h_l2747_c7_835d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_835d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_835d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_835d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_835d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_835d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_835d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_835d
result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_835d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_835d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_835d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_835d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_835d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2747_c7_835d
result_u8_value_MUX_uxn_opcodes_h_l2747_c7_835d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2747_c7_835d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2747_c7_835d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2747_c7_835d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2747_c7_835d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_835d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_835d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_835d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_835d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_835d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_835d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2753_c11_f167
BIN_OP_EQ_uxn_opcodes_h_l2753_c11_f167 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2753_c11_f167_left,
BIN_OP_EQ_uxn_opcodes_h_l2753_c11_f167_right,
BIN_OP_EQ_uxn_opcodes_h_l2753_c11_f167_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c7_4f9f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c7_4f9f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c7_4f9f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c7_4f9f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c7_4f9f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c7_4f9f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2753_c7_4f9f
result_is_opc_done_MUX_uxn_opcodes_h_l2753_c7_4f9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2753_c7_4f9f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2753_c7_4f9f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2753_c7_4f9f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2753_c7_4f9f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2753_c7_4f9f
result_u8_value_MUX_uxn_opcodes_h_l2753_c7_4f9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2753_c7_4f9f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2753_c7_4f9f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2753_c7_4f9f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2753_c7_4f9f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2757_c11_53b1
BIN_OP_EQ_uxn_opcodes_h_l2757_c11_53b1 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2757_c11_53b1_left,
BIN_OP_EQ_uxn_opcodes_h_l2757_c11_53b1_right,
BIN_OP_EQ_uxn_opcodes_h_l2757_c11_53b1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_f7cc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_f7cc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_f7cc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_f7cc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_f7cc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_f7cc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_f7cc
result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_f7cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_f7cc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_f7cc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_f7cc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_f7cc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2757_c7_f7cc
result_u8_value_MUX_uxn_opcodes_h_l2757_c7_f7cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2757_c7_f7cc_cond,
result_u8_value_MUX_uxn_opcodes_h_l2757_c7_f7cc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2757_c7_f7cc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2757_c7_f7cc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2761_c11_bd5f
BIN_OP_EQ_uxn_opcodes_h_l2761_c11_bd5f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2761_c11_bd5f_left,
BIN_OP_EQ_uxn_opcodes_h_l2761_c11_bd5f_right,
BIN_OP_EQ_uxn_opcodes_h_l2761_c11_bd5f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_851b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_851b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_851b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_851b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_851b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_851b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_851b
result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_851b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_851b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_851b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_851b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_851b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2761_c7_851b
result_u8_value_MUX_uxn_opcodes_h_l2761_c7_851b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2761_c7_851b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2761_c7_851b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2761_c7_851b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2761_c7_851b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c889
BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c889 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c889_left,
BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c889_right,
BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c889_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_67bd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_67bd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_67bd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_67bd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_67bd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_67bd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_67bd
result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_67bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_67bd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_67bd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_67bd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_67bd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2765_c7_67bd
result_u8_value_MUX_uxn_opcodes_h_l2765_c7_67bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2765_c7_67bd_cond,
result_u8_value_MUX_uxn_opcodes_h_l2765_c7_67bd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2765_c7_67bd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2765_c7_67bd_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2708_c6_bbac_return_output,
 t16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output,
 l16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output,
 l16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output,
 n16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output,
 t16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output,
 n16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2721_c11_64da_return_output,
 t16_high_MUX_uxn_opcodes_h_l2721_c7_b200_return_output,
 l16_high_MUX_uxn_opcodes_h_l2721_c7_b200_return_output,
 l16_low_MUX_uxn_opcodes_h_l2721_c7_b200_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2721_c7_b200_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2721_c7_b200_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2721_c7_b200_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2721_c7_b200_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2721_c7_b200_return_output,
 n16_low_MUX_uxn_opcodes_h_l2721_c7_b200_return_output,
 t16_low_MUX_uxn_opcodes_h_l2721_c7_b200_return_output,
 n16_high_MUX_uxn_opcodes_h_l2721_c7_b200_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2724_c11_d421_return_output,
 t16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output,
 l16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output,
 l16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output,
 n16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output,
 t16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output,
 n16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2728_c11_719c_return_output,
 l16_high_MUX_uxn_opcodes_h_l2728_c7_c368_return_output,
 l16_low_MUX_uxn_opcodes_h_l2728_c7_c368_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_c368_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_c368_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_c368_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_c368_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2728_c7_c368_return_output,
 n16_low_MUX_uxn_opcodes_h_l2728_c7_c368_return_output,
 t16_low_MUX_uxn_opcodes_h_l2728_c7_c368_return_output,
 n16_high_MUX_uxn_opcodes_h_l2728_c7_c368_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2732_c11_db7d_return_output,
 l16_high_MUX_uxn_opcodes_h_l2732_c7_a696_return_output,
 l16_low_MUX_uxn_opcodes_h_l2732_c7_a696_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_a696_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_a696_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_a696_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_a696_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2732_c7_a696_return_output,
 n16_low_MUX_uxn_opcodes_h_l2732_c7_a696_return_output,
 n16_high_MUX_uxn_opcodes_h_l2732_c7_a696_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2736_c11_4e73_return_output,
 l16_high_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output,
 l16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output,
 n16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2740_c11_a9e0_return_output,
 l16_high_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output,
 l16_low_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output,
 sp_relative_shift_uxn_opcodes_h_l2742_c30_9164_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2747_c11_0b5f_return_output,
 l16_low_MUX_uxn_opcodes_h_l2747_c7_835d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_835d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_835d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2747_c7_835d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_835d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2753_c11_f167_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c7_4f9f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2753_c7_4f9f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2753_c7_4f9f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2757_c11_53b1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_f7cc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_f7cc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2757_c7_f7cc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2761_c11_bd5f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_851b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_851b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2761_c7_851b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c889_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_67bd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_67bd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2765_c7_67bd_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_bbac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_bbac_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_bbac_return_output : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2721_c7_b200_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2721_c7_b200_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2721_c7_b200_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2721_c7_b200_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2708_c2_eac0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2708_c2_eac0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2713_c3_f5e0 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2721_c7_b200_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2708_c2_eac0_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2708_c2_eac0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2721_c7_b200_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2708_c2_eac0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2708_c2_eac0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2708_c2_eac0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2718_c3_bc11 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2721_c7_b200_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2708_c2_eac0_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2708_c2_eac0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2708_c2_eac0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2721_c7_b200_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2708_c2_eac0_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2721_c7_b200_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2721_c7_b200_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2721_c7_b200_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_64da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_64da_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_64da_return_output : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2721_c7_b200_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2721_c7_b200_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2721_c7_b200_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2722_c3_dec2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2721_c7_b200_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2721_c7_b200_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2721_c7_b200_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2721_c7_b200_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2721_c7_b200_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2721_c7_b200_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2721_c7_b200_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2721_c7_b200_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_d421_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_d421_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_d421_return_output : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2728_c7_c368_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2728_c7_c368_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2726_c3_049e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_c368_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_c368_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_c368_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_c368_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2728_c7_c368_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2728_c7_c368_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2728_c7_c368_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2728_c7_c368_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_719c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_719c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_719c_return_output : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2732_c7_a696_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2728_c7_c368_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2732_c7_a696_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2728_c7_c368_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2730_c3_65de : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_a696_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_c368_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_a696_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_c368_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_a696_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_c368_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_a696_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_c368_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2732_c7_a696_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2728_c7_c368_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2732_c7_a696_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2728_c7_c368_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2728_c7_c368_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2732_c7_a696_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2728_c7_c368_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_db7d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_db7d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_db7d_return_output : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2732_c7_a696_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2732_c7_a696_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2734_c3_8338 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_a696_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_a696_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_a696_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_a696_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2732_c7_a696_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2732_c7_a696_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2732_c7_a696_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_4e73_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_4e73_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_4e73_return_output : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2736_c7_94b1_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2738_c3_6aaf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_94b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_94b1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_94b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_94b1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2736_c7_94b1_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_a9e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_a9e0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_a9e0_return_output : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2740_c7_0ae8_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2740_c7_0ae8_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2740_c7_0ae8_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2740_c7_0ae8_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2740_c7_0ae8_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2747_c7_835d_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2740_c7_0ae8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2740_c7_0ae8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2744_c3_80b7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2740_c7_0ae8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_835d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2740_c7_0ae8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2740_c7_0ae8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2740_c7_0ae8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2740_c7_0ae8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2740_c7_0ae8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2740_c7_0ae8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_835d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2740_c7_0ae8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2740_c7_0ae8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2740_c7_0ae8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_835d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2740_c7_0ae8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2740_c7_0ae8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2740_c7_0ae8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2747_c7_835d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2740_c7_0ae8_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2742_c30_9164_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2742_c30_9164_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2742_c30_9164_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2742_c30_9164_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_0b5f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_0b5f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_0b5f_return_output : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2747_c7_835d_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2747_c7_835d_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2747_c7_835d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_835d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2750_c3_db68 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_835d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c7_4f9f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_835d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_835d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_835d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2753_c7_4f9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_835d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2747_c7_835d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2747_c7_835d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2753_c7_4f9f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2747_c7_835d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_835d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2749_c3_cdca : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_835d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_835d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_f167_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_f167_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_f167_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c7_4f9f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2754_c3_fe81 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c7_4f9f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_f7cc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c7_4f9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2753_c7_4f9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2753_c7_4f9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_f7cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2753_c7_4f9f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2753_c7_4f9f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2753_c7_4f9f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2757_c7_f7cc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2753_c7_4f9f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_53b1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_53b1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_53b1_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_f7cc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2758_c3_211f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_f7cc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_851b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_f7cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_f7cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_f7cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_851b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_f7cc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2757_c7_f7cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2757_c7_f7cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2761_c7_851b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2757_c7_f7cc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_bd5f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_bd5f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_bd5f_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_851b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2762_c3_1de9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_851b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_67bd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_851b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_851b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_851b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_67bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_851b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2761_c7_851b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2761_c7_851b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2765_c7_67bd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2761_c7_851b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c889_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c889_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c889_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_67bd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2766_c3_1f3d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_67bd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2765_c7_67bd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_67bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_67bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_67bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_67bd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2765_c7_67bd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2765_c7_67bd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2765_c7_67bd_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2708_l2736_l2765_l2732_l2728_l2724_l2721_DUPLICATE_26d1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2740_l2736_l2732_l2728_l2724_l2721_DUPLICATE_0ce0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2747_l2736_l2732_l2728_l2724_l2721_DUPLICATE_97f1_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2747_l2740_l2736_l2765_l2732_l2761_l2728_l2757_l2724_l2753_l2721_DUPLICATE_0673_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l2771_l2704_DUPLICATE_61ea_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2718_c3_bc11 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2718_c3_bc11;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2740_c7_0ae8_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2730_c3_65de := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2730_c3_65de;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2766_c3_1f3d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_67bd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2766_c3_1f3d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_db7d_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2726_c3_049e := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2726_c3_049e;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2762_c3_1de9 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_851b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2762_c3_1de9;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2713_c3_f5e0 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2713_c3_f5e0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_bd5f_right := to_unsigned(10, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_64da_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_0b5f_right := to_unsigned(7, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2744_c3_80b7 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2740_c7_0ae8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2744_c3_80b7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2738_c3_6aaf := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2738_c3_6aaf;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_a9e0_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_67bd_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2722_c3_dec2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2722_c3_dec2;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2749_c3_cdca := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_835d_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2749_c3_cdca;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_d421_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2734_c3_8338 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2734_c3_8338;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_4e73_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2758_c3_211f := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_f7cc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2758_c3_211f;
     VAR_sp_relative_shift_uxn_opcodes_h_l2742_c30_9164_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2754_c3_fe81 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c7_4f9f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2754_c3_fe81;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2750_c3_db68 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_835d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2750_c3_db68;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c889_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_f167_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_53b1_right := to_unsigned(9, 4);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_719c_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2742_c30_9164_x := signed(std_logic_vector(resize(to_unsigned(6, 3), 4)));
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_bbac_right := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2742_c30_9164_ins := VAR_ins;
     VAR_l16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2740_c7_0ae8_iffalse := l16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2761_c7_851b_iftrue := l16_high;
     VAR_l16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2740_c7_0ae8_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2747_c7_835d_iffalse := l16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2765_c7_67bd_iftrue := l16_low;
     VAR_n16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2753_c7_4f9f_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2757_c7_f7cc_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_bbac_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_64da_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_d421_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_719c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_db7d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_4e73_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_a9e0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_0b5f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_f167_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_53b1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_bd5f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c889_left := VAR_phase;
     VAR_l16_high_MUX_uxn_opcodes_h_l2740_c7_0ae8_iftrue := VAR_previous_stack_read;
     VAR_l16_low_MUX_uxn_opcodes_h_l2747_c7_835d_iftrue := VAR_previous_stack_read;
     VAR_n16_high_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2740_c7_0ae8_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2747_c7_835d_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse := t16_low;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2747_l2736_l2732_l2728_l2724_l2721_DUPLICATE_97f1 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2747_l2736_l2732_l2728_l2724_l2721_DUPLICATE_97f1_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2740_l2736_l2732_l2728_l2724_l2721_DUPLICATE_0ce0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2740_l2736_l2732_l2728_l2724_l2721_DUPLICATE_0ce0_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l2742_c30_9164] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2742_c30_9164_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2742_c30_9164_ins;
     sp_relative_shift_uxn_opcodes_h_l2742_c30_9164_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2742_c30_9164_x;
     sp_relative_shift_uxn_opcodes_h_l2742_c30_9164_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2742_c30_9164_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2742_c30_9164_return_output := sp_relative_shift_uxn_opcodes_h_l2742_c30_9164_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2708_c6_bbac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2708_c6_bbac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_bbac_left;
     BIN_OP_EQ_uxn_opcodes_h_l2708_c6_bbac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_bbac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_bbac_return_output := BIN_OP_EQ_uxn_opcodes_h_l2708_c6_bbac_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2724_c11_d421] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2724_c11_d421_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_d421_left;
     BIN_OP_EQ_uxn_opcodes_h_l2724_c11_d421_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_d421_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_d421_return_output := BIN_OP_EQ_uxn_opcodes_h_l2724_c11_d421_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2761_c11_bd5f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2761_c11_bd5f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_bd5f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2761_c11_bd5f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_bd5f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_bd5f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2761_c11_bd5f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2736_c11_4e73] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2736_c11_4e73_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_4e73_left;
     BIN_OP_EQ_uxn_opcodes_h_l2736_c11_4e73_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_4e73_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_4e73_return_output := BIN_OP_EQ_uxn_opcodes_h_l2736_c11_4e73_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2721_c11_64da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2721_c11_64da_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_64da_left;
     BIN_OP_EQ_uxn_opcodes_h_l2721_c11_64da_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_64da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_64da_return_output := BIN_OP_EQ_uxn_opcodes_h_l2721_c11_64da_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2708_c2_eac0] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2708_c2_eac0_return_output := result.is_vram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2708_c2_eac0] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2708_c2_eac0_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2753_c11_f167] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2753_c11_f167_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_f167_left;
     BIN_OP_EQ_uxn_opcodes_h_l2753_c11_f167_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_f167_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_f167_return_output := BIN_OP_EQ_uxn_opcodes_h_l2753_c11_f167_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2765_c11_c889] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c889_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c889_left;
     BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c889_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c889_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c889_return_output := BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c889_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2708_l2736_l2765_l2732_l2728_l2724_l2721_DUPLICATE_26d1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2708_l2736_l2765_l2732_l2728_l2724_l2721_DUPLICATE_26d1_return_output := result.u8_value;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2765_c7_67bd] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2765_c7_67bd_return_output := result.stack_address_sp_offset;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2708_c2_eac0] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2708_c2_eac0_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2740_c11_a9e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2740_c11_a9e0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_a9e0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2740_c11_a9e0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_a9e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_a9e0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2740_c11_a9e0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2747_c11_0b5f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2747_c11_0b5f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_0b5f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2747_c11_0b5f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_0b5f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_0b5f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2747_c11_0b5f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2757_c11_53b1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2757_c11_53b1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_53b1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2757_c11_53b1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_53b1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_53b1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2757_c11_53b1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2728_c11_719c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2728_c11_719c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_719c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2728_c11_719c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_719c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_719c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2728_c11_719c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2732_c11_db7d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2732_c11_db7d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_db7d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2732_c11_db7d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_db7d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_db7d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2732_c11_db7d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2747_l2740_l2736_l2765_l2732_l2761_l2728_l2757_l2724_l2753_l2721_DUPLICATE_0673 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2747_l2740_l2736_l2765_l2732_l2761_l2728_l2757_l2724_l2753_l2721_DUPLICATE_0673_return_output := result.is_opc_done;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2708_c2_eac0] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2708_c2_eac0_return_output := result.is_ram_write;

     -- Submodule level 1
     VAR_l16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_bbac_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_bbac_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_bbac_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_bbac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2708_c2_eac0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_bbac_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2708_c2_eac0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_bbac_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_bbac_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2708_c2_eac0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_bbac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2708_c2_eac0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_bbac_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_bbac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2708_c2_eac0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_bbac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2708_c2_eac0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_bbac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2708_c2_eac0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_bbac_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_bbac_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2708_c6_bbac_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2721_c7_b200_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_64da_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2721_c7_b200_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_64da_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2721_c7_b200_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_64da_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2721_c7_b200_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_64da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2721_c7_b200_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_64da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2721_c7_b200_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_64da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2721_c7_b200_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_64da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2721_c7_b200_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_64da_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2721_c7_b200_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_64da_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2721_c7_b200_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_64da_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2721_c7_b200_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2721_c11_64da_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_d421_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_d421_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_d421_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_d421_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_d421_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_d421_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_d421_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_d421_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_d421_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_d421_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_d421_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2728_c7_c368_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_719c_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2728_c7_c368_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_719c_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2728_c7_c368_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_719c_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2728_c7_c368_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_719c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_c368_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_719c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_c368_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_719c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_c368_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_719c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_c368_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_719c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2728_c7_c368_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_719c_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2728_c7_c368_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2728_c11_719c_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2732_c7_a696_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_db7d_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2732_c7_a696_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_db7d_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2732_c7_a696_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_db7d_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2732_c7_a696_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_db7d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_a696_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_db7d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_a696_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_db7d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_a696_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_db7d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_a696_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_db7d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2732_c7_a696_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2732_c11_db7d_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2736_c7_94b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_4e73_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_4e73_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_4e73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_94b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_4e73_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_94b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_4e73_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_94b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_4e73_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_94b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_4e73_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2736_c7_94b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2736_c11_4e73_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2740_c7_0ae8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_a9e0_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2740_c7_0ae8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_a9e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2740_c7_0ae8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_a9e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2740_c7_0ae8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_a9e0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2740_c7_0ae8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_a9e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2740_c7_0ae8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_a9e0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2740_c7_0ae8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2740_c11_a9e0_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2747_c7_835d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_0b5f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_835d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_0b5f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_835d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_0b5f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_835d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_0b5f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2747_c7_835d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_0b5f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2753_c7_4f9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_f167_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c7_4f9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_f167_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2753_c7_4f9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c11_f167_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_f7cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_53b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_f7cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_53b1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2757_c7_f7cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2757_c11_53b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_851b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_bd5f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_851b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_bd5f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2761_c7_851b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_bd5f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_67bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c889_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_67bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c889_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2765_c7_67bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2765_c11_c889_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2747_l2736_l2732_l2728_l2724_l2721_DUPLICATE_97f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2747_l2736_l2732_l2728_l2724_l2721_DUPLICATE_97f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2747_l2736_l2732_l2728_l2724_l2721_DUPLICATE_97f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2747_l2736_l2732_l2728_l2724_l2721_DUPLICATE_97f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2747_l2736_l2732_l2728_l2724_l2721_DUPLICATE_97f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_835d_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2747_l2736_l2732_l2728_l2724_l2721_DUPLICATE_97f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2747_l2740_l2736_l2765_l2732_l2761_l2728_l2757_l2724_l2753_l2721_DUPLICATE_0673_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2747_l2740_l2736_l2765_l2732_l2761_l2728_l2757_l2724_l2753_l2721_DUPLICATE_0673_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2747_l2740_l2736_l2765_l2732_l2761_l2728_l2757_l2724_l2753_l2721_DUPLICATE_0673_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2747_l2740_l2736_l2765_l2732_l2761_l2728_l2757_l2724_l2753_l2721_DUPLICATE_0673_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2747_l2740_l2736_l2765_l2732_l2761_l2728_l2757_l2724_l2753_l2721_DUPLICATE_0673_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2740_c7_0ae8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2747_l2740_l2736_l2765_l2732_l2761_l2728_l2757_l2724_l2753_l2721_DUPLICATE_0673_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_835d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2747_l2740_l2736_l2765_l2732_l2761_l2728_l2757_l2724_l2753_l2721_DUPLICATE_0673_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2753_c7_4f9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2747_l2740_l2736_l2765_l2732_l2761_l2728_l2757_l2724_l2753_l2721_DUPLICATE_0673_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_f7cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2747_l2740_l2736_l2765_l2732_l2761_l2728_l2757_l2724_l2753_l2721_DUPLICATE_0673_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_851b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2747_l2740_l2736_l2765_l2732_l2761_l2728_l2757_l2724_l2753_l2721_DUPLICATE_0673_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_67bd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2747_l2740_l2736_l2765_l2732_l2761_l2728_l2757_l2724_l2753_l2721_DUPLICATE_0673_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2740_l2736_l2732_l2728_l2724_l2721_DUPLICATE_0ce0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2740_l2736_l2732_l2728_l2724_l2721_DUPLICATE_0ce0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2740_l2736_l2732_l2728_l2724_l2721_DUPLICATE_0ce0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2740_l2736_l2732_l2728_l2724_l2721_DUPLICATE_0ce0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2740_l2736_l2732_l2728_l2724_l2721_DUPLICATE_0ce0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2740_c7_0ae8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2740_l2736_l2732_l2728_l2724_l2721_DUPLICATE_0ce0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2708_l2736_l2765_l2732_l2728_l2724_l2721_DUPLICATE_26d1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2708_l2736_l2765_l2732_l2728_l2724_l2721_DUPLICATE_26d1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2708_l2736_l2765_l2732_l2728_l2724_l2721_DUPLICATE_26d1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2708_l2736_l2765_l2732_l2728_l2724_l2721_DUPLICATE_26d1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2708_l2736_l2765_l2732_l2728_l2724_l2721_DUPLICATE_26d1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2708_l2736_l2765_l2732_l2728_l2724_l2721_DUPLICATE_26d1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2765_c7_67bd_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2708_l2736_l2765_l2732_l2728_l2724_l2721_DUPLICATE_26d1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2708_c2_eac0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2708_c2_eac0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2708_c2_eac0_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2708_c2_eac0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_67bd_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2765_c7_67bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2740_c7_0ae8_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2742_c30_9164_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l2736_c7_94b1] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_cond;
     n16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output := n16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2747_c7_835d] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2747_c7_835d_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2747_c7_835d_cond;
     l16_low_MUX_uxn_opcodes_h_l2747_c7_835d_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2747_c7_835d_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2747_c7_835d_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2747_c7_835d_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2747_c7_835d_return_output := l16_low_MUX_uxn_opcodes_h_l2747_c7_835d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2765_c7_67bd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_67bd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_67bd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_67bd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_67bd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_67bd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_67bd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_67bd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_67bd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2740_c7_0ae8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2740_c7_0ae8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2740_c7_0ae8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2740_c7_0ae8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2740_c7_0ae8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2740_c7_0ae8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2740_c7_0ae8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2708_c2_eac0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2708_c2_eac0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2708_c2_eac0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2765_c7_67bd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2765_c7_67bd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2765_c7_67bd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2765_c7_67bd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2765_c7_67bd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2765_c7_67bd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2765_c7_67bd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2765_c7_67bd_return_output := result_u8_value_MUX_uxn_opcodes_h_l2765_c7_67bd_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2724_c7_5b3c] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond;
     t16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output := t16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2708_c2_eac0] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2740_c7_0ae8] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2740_c7_0ae8_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2740_c7_0ae8_cond;
     l16_high_MUX_uxn_opcodes_h_l2740_c7_0ae8_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2740_c7_0ae8_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2740_c7_0ae8_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2740_c7_0ae8_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output := l16_high_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2732_c7_a696] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2732_c7_a696_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2732_c7_a696_cond;
     n16_high_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2732_c7_a696_return_output := n16_high_MUX_uxn_opcodes_h_l2732_c7_a696_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2708_c2_eac0] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2747_c7_835d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_835d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_835d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_835d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_835d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_835d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_835d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_835d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_835d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2765_c7_67bd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_67bd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_67bd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_67bd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_67bd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_67bd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_67bd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_67bd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_67bd_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2708_c2_eac0] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2708_c2_eac0_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2708_c2_eac0_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2728_c7_c368] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2728_c7_c368_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2728_c7_c368_cond;
     t16_low_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2728_c7_c368_return_output := t16_low_MUX_uxn_opcodes_h_l2728_c7_c368_return_output;

     -- Submodule level 2
     VAR_l16_high_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2740_c7_0ae8_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2747_c7_835d_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2732_c7_a696_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_851b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2765_c7_67bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2740_c7_0ae8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2747_c7_835d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_851b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2765_c7_67bd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2761_c7_851b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2765_c7_67bd_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2728_c7_c368_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2740_c7_0ae8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2740_c7_0ae8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2740_c7_0ae8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2740_c7_0ae8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2740_c7_0ae8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2740_c7_0ae8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2740_c7_0ae8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2736_c7_94b1] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2736_c7_94b1_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2736_c7_94b1_cond;
     l16_high_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output := l16_high_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2736_c7_94b1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_94b1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_94b1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2740_c7_0ae8] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2740_c7_0ae8_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2740_c7_0ae8_cond;
     l16_low_MUX_uxn_opcodes_h_l2740_c7_0ae8_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2740_c7_0ae8_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2740_c7_0ae8_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2740_c7_0ae8_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output := l16_low_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2761_c7_851b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2761_c7_851b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2761_c7_851b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2761_c7_851b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2761_c7_851b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2761_c7_851b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2761_c7_851b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2761_c7_851b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2761_c7_851b_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2724_c7_5b3c] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond;
     t16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output := t16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2761_c7_851b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_851b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_851b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_851b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_851b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_851b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_851b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_851b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_851b_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2732_c7_a696] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2732_c7_a696_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2732_c7_a696_cond;
     n16_low_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2732_c7_a696_return_output := n16_low_MUX_uxn_opcodes_h_l2732_c7_a696_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2721_c7_b200] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2721_c7_b200_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2721_c7_b200_cond;
     t16_high_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2721_c7_b200_return_output := t16_high_MUX_uxn_opcodes_h_l2721_c7_b200_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2728_c7_c368] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2728_c7_c368_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2728_c7_c368_cond;
     n16_high_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2728_c7_c368_return_output := n16_high_MUX_uxn_opcodes_h_l2728_c7_c368_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2761_c7_851b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_851b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_851b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_851b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_851b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_851b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_851b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_851b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_851b_return_output;

     -- Submodule level 3
     VAR_l16_high_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2728_c7_c368_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2732_c7_a696_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_f7cc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_851b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_f7cc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_851b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2757_c7_f7cc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2761_c7_851b_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2721_c7_b200_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2757_c7_f7cc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_f7cc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_f7cc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_f7cc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_f7cc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_f7cc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_f7cc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_f7cc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_f7cc_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2736_c7_94b1] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_cond;
     l16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output := l16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2708_c2_eac0] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_cond;
     t16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output := t16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2732_c7_a696] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2732_c7_a696_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2732_c7_a696_cond;
     l16_high_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2732_c7_a696_return_output := l16_high_MUX_uxn_opcodes_h_l2732_c7_a696_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2757_c7_f7cc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_f7cc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_f7cc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_f7cc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_f7cc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_f7cc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_f7cc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_f7cc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_f7cc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2736_c7_94b1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_94b1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_94b1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2721_c7_b200] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2721_c7_b200_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2721_c7_b200_cond;
     t16_low_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2721_c7_b200_return_output := t16_low_MUX_uxn_opcodes_h_l2721_c7_b200_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2757_c7_f7cc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2757_c7_f7cc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2757_c7_f7cc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2757_c7_f7cc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2757_c7_f7cc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2757_c7_f7cc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2757_c7_f7cc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2757_c7_f7cc_return_output := result_u8_value_MUX_uxn_opcodes_h_l2757_c7_f7cc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2732_c7_a696] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_a696_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_a696_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_a696_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_a696_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2724_c7_5b3c] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond;
     n16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output := n16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2728_c7_c368] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2728_c7_c368_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2728_c7_c368_cond;
     n16_low_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2728_c7_c368_return_output := n16_low_MUX_uxn_opcodes_h_l2728_c7_c368_return_output;

     -- Submodule level 4
     VAR_l16_high_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2732_c7_a696_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2728_c7_c368_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2753_c7_4f9f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2757_c7_f7cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2732_c7_a696_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c7_4f9f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2757_c7_f7cc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2753_c7_4f9f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2757_c7_f7cc_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2721_c7_b200_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2753_c7_4f9f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c7_4f9f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c7_4f9f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c7_4f9f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c7_4f9f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c7_4f9f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c7_4f9f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c7_4f9f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c7_4f9f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2753_c7_4f9f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2753_c7_4f9f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2753_c7_4f9f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2753_c7_4f9f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2753_c7_4f9f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2753_c7_4f9f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2753_c7_4f9f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2753_c7_4f9f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2753_c7_4f9f_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2724_c7_5b3c] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond;
     n16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output := n16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2721_c7_b200] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2721_c7_b200_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2721_c7_b200_cond;
     n16_high_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2721_c7_b200_return_output := n16_high_MUX_uxn_opcodes_h_l2721_c7_b200_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2728_c7_c368] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2728_c7_c368_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2728_c7_c368_cond;
     l16_high_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2728_c7_c368_return_output := l16_high_MUX_uxn_opcodes_h_l2728_c7_c368_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2708_c2_eac0] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_cond;
     t16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output := t16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2732_c7_a696] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2732_c7_a696_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2732_c7_a696_cond;
     l16_low_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2732_c7_a696_return_output := l16_low_MUX_uxn_opcodes_h_l2732_c7_a696_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2728_c7_c368] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_c368_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_c368_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_c368_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_c368_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2732_c7_a696] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_a696_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_a696_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_a696_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_a696_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2753_c7_4f9f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2753_c7_4f9f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2753_c7_4f9f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2753_c7_4f9f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2753_c7_4f9f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2753_c7_4f9f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2753_c7_4f9f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2753_c7_4f9f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2753_c7_4f9f_return_output;

     -- Submodule level 5
     VAR_l16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2728_c7_c368_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2732_c7_a696_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2721_c7_b200_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_835d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2753_c7_4f9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2728_c7_c368_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2732_c7_a696_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_835d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c7_4f9f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2747_c7_835d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2753_c7_4f9f_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2747_c7_835d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_835d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_835d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_835d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_835d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_835d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_835d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_835d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_835d_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2708_c2_eac0] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_cond;
     n16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output := n16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2724_c7_5b3c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2721_c7_b200] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2721_c7_b200_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2721_c7_b200_cond;
     n16_low_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2721_c7_b200_return_output := n16_low_MUX_uxn_opcodes_h_l2721_c7_b200_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2728_c7_c368] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2728_c7_c368_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2728_c7_c368_cond;
     l16_low_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2728_c7_c368_return_output := l16_low_MUX_uxn_opcodes_h_l2728_c7_c368_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2747_c7_835d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2747_c7_835d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2747_c7_835d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2747_c7_835d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2747_c7_835d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2747_c7_835d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2747_c7_835d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2747_c7_835d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2747_c7_835d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2728_c7_c368] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_c368_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_c368_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_c368_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_c368_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2724_c7_5b3c] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond;
     l16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output := l16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2747_c7_835d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_835d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_835d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_835d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_835d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_835d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_835d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_835d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_835d_return_output;

     -- Submodule level 6
     VAR_l16_high_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2728_c7_c368_return_output;
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2721_c7_b200_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2740_c7_0ae8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_835d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2728_c7_c368_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2740_c7_0ae8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_835d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2740_c7_0ae8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2747_c7_835d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2740_c7_0ae8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2740_c7_0ae8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2740_c7_0ae8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2740_c7_0ae8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2740_c7_0ae8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2740_c7_0ae8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2740_c7_0ae8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2724_c7_5b3c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2740_c7_0ae8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2740_c7_0ae8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2740_c7_0ae8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2740_c7_0ae8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2740_c7_0ae8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2740_c7_0ae8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2740_c7_0ae8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2740_c7_0ae8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2740_c7_0ae8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2740_c7_0ae8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2740_c7_0ae8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2740_c7_0ae8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2740_c7_0ae8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2740_c7_0ae8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2708_c2_eac0] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_cond;
     n16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output := n16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2721_c7_b200] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2721_c7_b200_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2721_c7_b200_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2721_c7_b200_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2721_c7_b200_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2724_c7_5b3c] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond;
     l16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output := l16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2721_c7_b200] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2721_c7_b200_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2721_c7_b200_cond;
     l16_high_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2721_c7_b200_return_output := l16_high_MUX_uxn_opcodes_h_l2721_c7_b200_return_output;

     -- Submodule level 7
     VAR_l16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2721_c7_b200_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output;
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2721_c7_b200_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2740_c7_0ae8_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2736_c7_94b1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2736_c7_94b1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2736_c7_94b1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2721_c7_b200] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2721_c7_b200_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2721_c7_b200_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2721_c7_b200_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2721_c7_b200_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2721_c7_b200] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2721_c7_b200_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2721_c7_b200_cond;
     l16_low_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2721_c7_b200_return_output := l16_low_MUX_uxn_opcodes_h_l2721_c7_b200_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2736_c7_94b1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_94b1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_94b1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2708_c2_eac0] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_cond;
     l16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output := l16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2708_c2_eac0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2708_c2_eac0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2708_c2_eac0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2736_c7_94b1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_94b1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_94b1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_94b1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_94b1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output;

     -- Submodule level 8
     REG_VAR_l16_high := VAR_l16_high_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2721_c7_b200_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2721_c7_b200_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2736_c7_94b1_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2708_c2_eac0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2708_c2_eac0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2708_c2_eac0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2732_c7_a696] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_a696_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_a696_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_a696_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_a696_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2732_c7_a696] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_a696_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_a696_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_a696_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_a696_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2708_c2_eac0] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_cond;
     l16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output := l16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2732_c7_a696] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2732_c7_a696_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2732_c7_a696_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2732_c7_a696_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2732_c7_a696_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2732_c7_a696_return_output := result_u8_value_MUX_uxn_opcodes_h_l2732_c7_a696_return_output;

     -- Submodule level 9
     REG_VAR_l16_low := VAR_l16_low_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2732_c7_a696_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2732_c7_a696_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2732_c7_a696_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2728_c7_c368] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_c368_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_c368_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_c368_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_c368_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2728_c7_c368] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2728_c7_c368_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2728_c7_c368_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2728_c7_c368_return_output := result_u8_value_MUX_uxn_opcodes_h_l2728_c7_c368_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2728_c7_c368] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_c368_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_c368_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_c368_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_c368_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_c368_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_c368_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2728_c7_c368_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2728_c7_c368_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2728_c7_c368_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2724_c7_5b3c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2724_c7_5b3c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2724_c7_5b3c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_5b3c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_5b3c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_5b3c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_5b3c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2721_c7_b200] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2721_c7_b200_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2721_c7_b200_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2721_c7_b200_return_output := result_u8_value_MUX_uxn_opcodes_h_l2721_c7_b200_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2721_c7_b200] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2721_c7_b200_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2721_c7_b200_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2721_c7_b200_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2721_c7_b200_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2721_c7_b200] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2721_c7_b200_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2721_c7_b200_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2721_c7_b200_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2721_c7_b200_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2721_c7_b200_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2721_c7_b200_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2721_c7_b200_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2721_c7_b200_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2721_c7_b200_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2708_c2_eac0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2708_c2_eac0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2708_c2_eac0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2708_c2_eac0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2708_c2_eac0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2708_c2_eac0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2708_c2_eac0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2708_c2_eac0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2708_c2_eac0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2708_c2_eac0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2708_c2_eac0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output := result_u8_value_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l2771_l2704_DUPLICATE_61ea LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l2771_l2704_DUPLICATE_61ea_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e848(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2708_c2_eac0_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l2771_l2704_DUPLICATE_61ea_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e848_uxn_opcodes_h_l2771_l2704_DUPLICATE_61ea_return_output;
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
