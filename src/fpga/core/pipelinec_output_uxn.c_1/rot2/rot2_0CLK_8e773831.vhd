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
-- BIN_OP_EQ[uxn_opcodes_h_l2710_c6_9ca8]
signal BIN_OP_EQ_uxn_opcodes_h_l2710_c6_9ca8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2710_c6_9ca8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2710_c6_9ca8_return_output : unsigned(0 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2710_c2_6f7c]
signal l16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2710_c2_6f7c]
signal t16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2710_c2_6f7c]
signal n16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2710_c2_6f7c]
signal n16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2710_c2_6f7c]
signal l16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2710_c2_6f7c]
signal t16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2710_c2_6f7c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2710_c2_6f7c]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2710_c2_6f7c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2710_c2_6f7c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2710_c2_6f7c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2710_c2_6f7c]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2710_c2_6f7c]
signal result_u8_value_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2710_c2_6f7c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2710_c2_6f7c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2723_c11_2cda]
signal BIN_OP_EQ_uxn_opcodes_h_l2723_c11_2cda_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2723_c11_2cda_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2723_c11_2cda_return_output : unsigned(0 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2723_c7_f04e]
signal l16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2723_c7_f04e]
signal t16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2723_c7_f04e]
signal n16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2723_c7_f04e]
signal n16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2723_c7_f04e]
signal l16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2723_c7_f04e]
signal t16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2723_c7_f04e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_f04e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2723_c7_f04e]
signal result_u8_value_MUX_uxn_opcodes_h_l2723_c7_f04e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2723_c7_f04e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_f04e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2723_c7_f04e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_f04e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2723_c7_f04e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_f04e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2726_c11_828a]
signal BIN_OP_EQ_uxn_opcodes_h_l2726_c11_828a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2726_c11_828a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2726_c11_828a_return_output : unsigned(0 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2726_c7_4cad]
signal l16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2726_c7_4cad]
signal t16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2726_c7_4cad]
signal n16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2726_c7_4cad]
signal n16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2726_c7_4cad]
signal l16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2726_c7_4cad]
signal t16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2726_c7_4cad]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_4cad_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2726_c7_4cad]
signal result_u8_value_MUX_uxn_opcodes_h_l2726_c7_4cad_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2726_c7_4cad]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_4cad_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2726_c7_4cad]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_4cad_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2726_c7_4cad]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_4cad_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2730_c11_234d]
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_234d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_234d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_234d_return_output : unsigned(0 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2730_c7_2107]
signal l16_high_MUX_uxn_opcodes_h_l2730_c7_2107_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2730_c7_2107_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2730_c7_2107]
signal t16_low_MUX_uxn_opcodes_h_l2730_c7_2107_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2730_c7_2107_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2730_c7_2107]
signal n16_low_MUX_uxn_opcodes_h_l2730_c7_2107_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2730_c7_2107_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2730_c7_2107]
signal n16_high_MUX_uxn_opcodes_h_l2730_c7_2107_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2730_c7_2107_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2730_c7_2107]
signal l16_low_MUX_uxn_opcodes_h_l2730_c7_2107_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2730_c7_2107_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2730_c7_2107]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_2107_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_2107_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2730_c7_2107]
signal result_u8_value_MUX_uxn_opcodes_h_l2730_c7_2107_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2730_c7_2107_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2730_c7_2107]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_2107_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_2107_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2730_c7_2107]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_2107_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_2107_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2730_c7_2107]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_2107_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_2107_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2734_c11_ce97]
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ce97_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ce97_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ce97_return_output : unsigned(0 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2734_c7_8dab]
signal l16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2734_c7_8dab]
signal n16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2734_c7_8dab]
signal n16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2734_c7_8dab]
signal l16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2734_c7_8dab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8dab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2734_c7_8dab]
signal result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8dab_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2734_c7_8dab]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8dab_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2734_c7_8dab]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8dab_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2734_c7_8dab]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8dab_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2738_c11_a3e9]
signal BIN_OP_EQ_uxn_opcodes_h_l2738_c11_a3e9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2738_c11_a3e9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2738_c11_a3e9_return_output : unsigned(0 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2738_c7_9239]
signal l16_high_MUX_uxn_opcodes_h_l2738_c7_9239_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2738_c7_9239_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2738_c7_9239]
signal n16_low_MUX_uxn_opcodes_h_l2738_c7_9239_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2738_c7_9239_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2738_c7_9239]
signal l16_low_MUX_uxn_opcodes_h_l2738_c7_9239_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2738_c7_9239_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2738_c7_9239]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_9239_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_9239_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2738_c7_9239]
signal result_u8_value_MUX_uxn_opcodes_h_l2738_c7_9239_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2738_c7_9239_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2738_c7_9239]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_9239_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_9239_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2738_c7_9239]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_9239_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_9239_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2738_c7_9239]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2738_c7_9239_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2738_c7_9239_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2742_c11_f155]
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_f155_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_f155_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_f155_return_output : unsigned(0 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2742_c7_5d17]
signal l16_high_MUX_uxn_opcodes_h_l2742_c7_5d17_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2742_c7_5d17_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2742_c7_5d17_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2742_c7_5d17]
signal l16_low_MUX_uxn_opcodes_h_l2742_c7_5d17_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2742_c7_5d17_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2742_c7_5d17_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2742_c7_5d17]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_5d17_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_5d17_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_5d17_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2742_c7_5d17]
signal result_u8_value_MUX_uxn_opcodes_h_l2742_c7_5d17_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2742_c7_5d17_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2742_c7_5d17_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2742_c7_5d17]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_5d17_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_5d17_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_5d17_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2742_c7_5d17]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_5d17_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_5d17_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_5d17_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2742_c7_5d17]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_5d17_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_5d17_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_5d17_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2744_c30_ab14]
signal sp_relative_shift_uxn_opcodes_h_l2744_c30_ab14_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2744_c30_ab14_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2744_c30_ab14_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2744_c30_ab14_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2749_c11_6288]
signal BIN_OP_EQ_uxn_opcodes_h_l2749_c11_6288_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2749_c11_6288_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2749_c11_6288_return_output : unsigned(0 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2749_c7_8337]
signal l16_low_MUX_uxn_opcodes_h_l2749_c7_8337_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2749_c7_8337_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2749_c7_8337_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2749_c7_8337_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2749_c7_8337]
signal result_u8_value_MUX_uxn_opcodes_h_l2749_c7_8337_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2749_c7_8337_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2749_c7_8337_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2749_c7_8337_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2749_c7_8337]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_8337_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_8337_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_8337_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_8337_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2749_c7_8337]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_8337_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_8337_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_8337_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_8337_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2749_c7_8337]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_8337_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_8337_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_8337_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_8337_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2755_c11_350a]
signal BIN_OP_EQ_uxn_opcodes_h_l2755_c11_350a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2755_c11_350a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2755_c11_350a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2755_c7_3d2d]
signal result_u8_value_MUX_uxn_opcodes_h_l2755_c7_3d2d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2755_c7_3d2d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2755_c7_3d2d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2755_c7_3d2d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2755_c7_3d2d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_3d2d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_3d2d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_3d2d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_3d2d_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2755_c7_3d2d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_3d2d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_3d2d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_3d2d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_3d2d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2759_c11_212a]
signal BIN_OP_EQ_uxn_opcodes_h_l2759_c11_212a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2759_c11_212a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2759_c11_212a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2759_c7_7345]
signal result_u8_value_MUX_uxn_opcodes_h_l2759_c7_7345_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2759_c7_7345_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2759_c7_7345_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2759_c7_7345_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2759_c7_7345]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_7345_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_7345_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_7345_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_7345_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2759_c7_7345]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_7345_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_7345_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_7345_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_7345_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2763_c11_88bd]
signal BIN_OP_EQ_uxn_opcodes_h_l2763_c11_88bd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2763_c11_88bd_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2763_c11_88bd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2763_c7_6edc]
signal result_u8_value_MUX_uxn_opcodes_h_l2763_c7_6edc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2763_c7_6edc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2763_c7_6edc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2763_c7_6edc_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2763_c7_6edc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_6edc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_6edc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_6edc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_6edc_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2763_c7_6edc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_6edc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_6edc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_6edc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_6edc_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2767_c11_d6f4]
signal BIN_OP_EQ_uxn_opcodes_h_l2767_c11_d6f4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2767_c11_d6f4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2767_c11_d6f4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2767_c7_dc34]
signal result_u8_value_MUX_uxn_opcodes_h_l2767_c7_dc34_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2767_c7_dc34_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2767_c7_dc34_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2767_c7_dc34_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2767_c7_dc34]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c7_dc34_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c7_dc34_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c7_dc34_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c7_dc34_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2767_c7_dc34]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2767_c7_dc34_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2767_c7_dc34_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2767_c7_dc34_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2767_c7_dc34_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2710_c6_9ca8
BIN_OP_EQ_uxn_opcodes_h_l2710_c6_9ca8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2710_c6_9ca8_left,
BIN_OP_EQ_uxn_opcodes_h_l2710_c6_9ca8_right,
BIN_OP_EQ_uxn_opcodes_h_l2710_c6_9ca8_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c
l16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond,
l16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue,
l16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse,
l16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c
t16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond,
t16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue,
t16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse,
t16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c
n16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond,
n16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue,
n16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse,
n16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c
n16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond,
n16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue,
n16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse,
n16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c
l16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond,
l16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue,
l16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse,
l16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c
t16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond,
t16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue,
t16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse,
t16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2710_c2_6f7c
result_is_opc_done_MUX_uxn_opcodes_h_l2710_c2_6f7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2710_c2_6f7c
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2710_c2_6f7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c
result_is_ram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2710_c2_6f7c
result_is_stack_write_MUX_uxn_opcodes_h_l2710_c2_6f7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c2_6f7c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c2_6f7c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c
result_is_vram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2710_c2_6f7c
result_u8_value_MUX_uxn_opcodes_h_l2710_c2_6f7c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c2_6f7c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c2_6f7c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2710_c2_6f7c
result_is_pc_updated_MUX_uxn_opcodes_h_l2710_c2_6f7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2723_c11_2cda
BIN_OP_EQ_uxn_opcodes_h_l2723_c11_2cda : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2723_c11_2cda_left,
BIN_OP_EQ_uxn_opcodes_h_l2723_c11_2cda_right,
BIN_OP_EQ_uxn_opcodes_h_l2723_c11_2cda_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2723_c7_f04e
l16_high_MUX_uxn_opcodes_h_l2723_c7_f04e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_cond,
l16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue,
l16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse,
l16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2723_c7_f04e
t16_low_MUX_uxn_opcodes_h_l2723_c7_f04e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_cond,
t16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue,
t16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse,
t16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2723_c7_f04e
n16_low_MUX_uxn_opcodes_h_l2723_c7_f04e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_cond,
n16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue,
n16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse,
n16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2723_c7_f04e
n16_high_MUX_uxn_opcodes_h_l2723_c7_f04e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_cond,
n16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue,
n16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse,
n16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2723_c7_f04e
l16_low_MUX_uxn_opcodes_h_l2723_c7_f04e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_cond,
l16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue,
l16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse,
l16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2723_c7_f04e
t16_high_MUX_uxn_opcodes_h_l2723_c7_f04e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_cond,
t16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue,
t16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse,
t16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_f04e
result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_f04e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_f04e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2723_c7_f04e
result_u8_value_MUX_uxn_opcodes_h_l2723_c7_f04e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2723_c7_f04e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_f04e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_f04e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_f04e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_f04e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_f04e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_f04e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_f04e
result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_f04e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_f04e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2726_c11_828a
BIN_OP_EQ_uxn_opcodes_h_l2726_c11_828a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2726_c11_828a_left,
BIN_OP_EQ_uxn_opcodes_h_l2726_c11_828a_right,
BIN_OP_EQ_uxn_opcodes_h_l2726_c11_828a_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2726_c7_4cad
l16_high_MUX_uxn_opcodes_h_l2726_c7_4cad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_cond,
l16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue,
l16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse,
l16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2726_c7_4cad
t16_low_MUX_uxn_opcodes_h_l2726_c7_4cad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_cond,
t16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue,
t16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse,
t16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2726_c7_4cad
n16_low_MUX_uxn_opcodes_h_l2726_c7_4cad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_cond,
n16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue,
n16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse,
n16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2726_c7_4cad
n16_high_MUX_uxn_opcodes_h_l2726_c7_4cad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_cond,
n16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue,
n16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse,
n16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2726_c7_4cad
l16_low_MUX_uxn_opcodes_h_l2726_c7_4cad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_cond,
l16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue,
l16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse,
l16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2726_c7_4cad
t16_high_MUX_uxn_opcodes_h_l2726_c7_4cad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_cond,
t16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue,
t16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse,
t16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_4cad
result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_4cad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_4cad_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2726_c7_4cad
result_u8_value_MUX_uxn_opcodes_h_l2726_c7_4cad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2726_c7_4cad_cond,
result_u8_value_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_4cad
result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_4cad : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_4cad_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_4cad
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_4cad : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_4cad_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_4cad
result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_4cad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_4cad_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2730_c11_234d
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_234d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_234d_left,
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_234d_right,
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_234d_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2730_c7_2107
l16_high_MUX_uxn_opcodes_h_l2730_c7_2107 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2730_c7_2107_cond,
l16_high_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue,
l16_high_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse,
l16_high_MUX_uxn_opcodes_h_l2730_c7_2107_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2730_c7_2107
t16_low_MUX_uxn_opcodes_h_l2730_c7_2107 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2730_c7_2107_cond,
t16_low_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue,
t16_low_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse,
t16_low_MUX_uxn_opcodes_h_l2730_c7_2107_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2730_c7_2107
n16_low_MUX_uxn_opcodes_h_l2730_c7_2107 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2730_c7_2107_cond,
n16_low_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue,
n16_low_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse,
n16_low_MUX_uxn_opcodes_h_l2730_c7_2107_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2730_c7_2107
n16_high_MUX_uxn_opcodes_h_l2730_c7_2107 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2730_c7_2107_cond,
n16_high_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue,
n16_high_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse,
n16_high_MUX_uxn_opcodes_h_l2730_c7_2107_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2730_c7_2107
l16_low_MUX_uxn_opcodes_h_l2730_c7_2107 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2730_c7_2107_cond,
l16_low_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue,
l16_low_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse,
l16_low_MUX_uxn_opcodes_h_l2730_c7_2107_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_2107
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_2107 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_2107_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_2107_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2730_c7_2107
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_2107 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_2107_cond,
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_2107_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_2107
result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_2107 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_2107_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_2107_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_2107
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_2107 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_2107_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_2107_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_2107
result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_2107 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_2107_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_2107_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ce97
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ce97 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ce97_left,
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ce97_right,
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ce97_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2734_c7_8dab
l16_high_MUX_uxn_opcodes_h_l2734_c7_8dab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_cond,
l16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue,
l16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse,
l16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2734_c7_8dab
n16_low_MUX_uxn_opcodes_h_l2734_c7_8dab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_cond,
n16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue,
n16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse,
n16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2734_c7_8dab
n16_high_MUX_uxn_opcodes_h_l2734_c7_8dab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_cond,
n16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue,
n16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse,
n16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2734_c7_8dab
l16_low_MUX_uxn_opcodes_h_l2734_c7_8dab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_cond,
l16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue,
l16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse,
l16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8dab
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8dab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8dab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8dab
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8dab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8dab_cond,
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8dab
result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8dab : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8dab_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8dab
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8dab : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8dab_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8dab
result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8dab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8dab_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2738_c11_a3e9
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_a3e9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_a3e9_left,
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_a3e9_right,
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_a3e9_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2738_c7_9239
l16_high_MUX_uxn_opcodes_h_l2738_c7_9239 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2738_c7_9239_cond,
l16_high_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue,
l16_high_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse,
l16_high_MUX_uxn_opcodes_h_l2738_c7_9239_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2738_c7_9239
n16_low_MUX_uxn_opcodes_h_l2738_c7_9239 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2738_c7_9239_cond,
n16_low_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue,
n16_low_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse,
n16_low_MUX_uxn_opcodes_h_l2738_c7_9239_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2738_c7_9239
l16_low_MUX_uxn_opcodes_h_l2738_c7_9239 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2738_c7_9239_cond,
l16_low_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue,
l16_low_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse,
l16_low_MUX_uxn_opcodes_h_l2738_c7_9239_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_9239
result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_9239 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_9239_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_9239_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2738_c7_9239
result_u8_value_MUX_uxn_opcodes_h_l2738_c7_9239 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2738_c7_9239_cond,
result_u8_value_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2738_c7_9239_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_9239
result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_9239 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_9239_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_9239_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_9239
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_9239 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_9239_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_9239_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2738_c7_9239
result_is_stack_write_MUX_uxn_opcodes_h_l2738_c7_9239 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2738_c7_9239_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2738_c7_9239_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2742_c11_f155
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_f155 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_f155_left,
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_f155_right,
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_f155_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2742_c7_5d17
l16_high_MUX_uxn_opcodes_h_l2742_c7_5d17 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2742_c7_5d17_cond,
l16_high_MUX_uxn_opcodes_h_l2742_c7_5d17_iftrue,
l16_high_MUX_uxn_opcodes_h_l2742_c7_5d17_iffalse,
l16_high_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2742_c7_5d17
l16_low_MUX_uxn_opcodes_h_l2742_c7_5d17 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2742_c7_5d17_cond,
l16_low_MUX_uxn_opcodes_h_l2742_c7_5d17_iftrue,
l16_low_MUX_uxn_opcodes_h_l2742_c7_5d17_iffalse,
l16_low_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_5d17
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_5d17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_5d17_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_5d17_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_5d17_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2742_c7_5d17
result_u8_value_MUX_uxn_opcodes_h_l2742_c7_5d17 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2742_c7_5d17_cond,
result_u8_value_MUX_uxn_opcodes_h_l2742_c7_5d17_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2742_c7_5d17_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_5d17
result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_5d17 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_5d17_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_5d17_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_5d17_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_5d17
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_5d17 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_5d17_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_5d17_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_5d17_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_5d17
result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_5d17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_5d17_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_5d17_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_5d17_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2744_c30_ab14
sp_relative_shift_uxn_opcodes_h_l2744_c30_ab14 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2744_c30_ab14_ins,
sp_relative_shift_uxn_opcodes_h_l2744_c30_ab14_x,
sp_relative_shift_uxn_opcodes_h_l2744_c30_ab14_y,
sp_relative_shift_uxn_opcodes_h_l2744_c30_ab14_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2749_c11_6288
BIN_OP_EQ_uxn_opcodes_h_l2749_c11_6288 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2749_c11_6288_left,
BIN_OP_EQ_uxn_opcodes_h_l2749_c11_6288_right,
BIN_OP_EQ_uxn_opcodes_h_l2749_c11_6288_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2749_c7_8337
l16_low_MUX_uxn_opcodes_h_l2749_c7_8337 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2749_c7_8337_cond,
l16_low_MUX_uxn_opcodes_h_l2749_c7_8337_iftrue,
l16_low_MUX_uxn_opcodes_h_l2749_c7_8337_iffalse,
l16_low_MUX_uxn_opcodes_h_l2749_c7_8337_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2749_c7_8337
result_u8_value_MUX_uxn_opcodes_h_l2749_c7_8337 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2749_c7_8337_cond,
result_u8_value_MUX_uxn_opcodes_h_l2749_c7_8337_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2749_c7_8337_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2749_c7_8337_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_8337
result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_8337 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_8337_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_8337_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_8337_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_8337_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_8337
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_8337 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_8337_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_8337_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_8337_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_8337_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_8337
result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_8337 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_8337_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_8337_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_8337_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_8337_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2755_c11_350a
BIN_OP_EQ_uxn_opcodes_h_l2755_c11_350a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2755_c11_350a_left,
BIN_OP_EQ_uxn_opcodes_h_l2755_c11_350a_right,
BIN_OP_EQ_uxn_opcodes_h_l2755_c11_350a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2755_c7_3d2d
result_u8_value_MUX_uxn_opcodes_h_l2755_c7_3d2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2755_c7_3d2d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2755_c7_3d2d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2755_c7_3d2d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2755_c7_3d2d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_3d2d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_3d2d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_3d2d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_3d2d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_3d2d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_3d2d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_3d2d
result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_3d2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_3d2d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_3d2d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_3d2d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_3d2d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2759_c11_212a
BIN_OP_EQ_uxn_opcodes_h_l2759_c11_212a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2759_c11_212a_left,
BIN_OP_EQ_uxn_opcodes_h_l2759_c11_212a_right,
BIN_OP_EQ_uxn_opcodes_h_l2759_c11_212a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2759_c7_7345
result_u8_value_MUX_uxn_opcodes_h_l2759_c7_7345 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2759_c7_7345_cond,
result_u8_value_MUX_uxn_opcodes_h_l2759_c7_7345_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2759_c7_7345_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2759_c7_7345_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_7345
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_7345 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_7345_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_7345_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_7345_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_7345_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_7345
result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_7345 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_7345_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_7345_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_7345_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_7345_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2763_c11_88bd
BIN_OP_EQ_uxn_opcodes_h_l2763_c11_88bd : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2763_c11_88bd_left,
BIN_OP_EQ_uxn_opcodes_h_l2763_c11_88bd_right,
BIN_OP_EQ_uxn_opcodes_h_l2763_c11_88bd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2763_c7_6edc
result_u8_value_MUX_uxn_opcodes_h_l2763_c7_6edc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2763_c7_6edc_cond,
result_u8_value_MUX_uxn_opcodes_h_l2763_c7_6edc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2763_c7_6edc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2763_c7_6edc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_6edc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_6edc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_6edc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_6edc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_6edc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_6edc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_6edc
result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_6edc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_6edc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_6edc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_6edc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_6edc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2767_c11_d6f4
BIN_OP_EQ_uxn_opcodes_h_l2767_c11_d6f4 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2767_c11_d6f4_left,
BIN_OP_EQ_uxn_opcodes_h_l2767_c11_d6f4_right,
BIN_OP_EQ_uxn_opcodes_h_l2767_c11_d6f4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2767_c7_dc34
result_u8_value_MUX_uxn_opcodes_h_l2767_c7_dc34 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2767_c7_dc34_cond,
result_u8_value_MUX_uxn_opcodes_h_l2767_c7_dc34_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2767_c7_dc34_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2767_c7_dc34_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c7_dc34
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c7_dc34 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c7_dc34_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c7_dc34_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c7_dc34_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c7_dc34_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2767_c7_dc34
result_is_opc_done_MUX_uxn_opcodes_h_l2767_c7_dc34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2767_c7_dc34_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2767_c7_dc34_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2767_c7_dc34_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2767_c7_dc34_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2710_c6_9ca8_return_output,
 l16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output,
 t16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output,
 n16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output,
 n16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output,
 l16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output,
 t16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2723_c11_2cda_return_output,
 l16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output,
 t16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output,
 n16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output,
 n16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output,
 l16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output,
 t16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2726_c11_828a_return_output,
 l16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output,
 t16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output,
 n16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output,
 n16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output,
 l16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output,
 t16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2730_c11_234d_return_output,
 l16_high_MUX_uxn_opcodes_h_l2730_c7_2107_return_output,
 t16_low_MUX_uxn_opcodes_h_l2730_c7_2107_return_output,
 n16_low_MUX_uxn_opcodes_h_l2730_c7_2107_return_output,
 n16_high_MUX_uxn_opcodes_h_l2730_c7_2107_return_output,
 l16_low_MUX_uxn_opcodes_h_l2730_c7_2107_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_2107_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2730_c7_2107_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_2107_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_2107_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_2107_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ce97_return_output,
 l16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output,
 n16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output,
 n16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output,
 l16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2738_c11_a3e9_return_output,
 l16_high_MUX_uxn_opcodes_h_l2738_c7_9239_return_output,
 n16_low_MUX_uxn_opcodes_h_l2738_c7_9239_return_output,
 l16_low_MUX_uxn_opcodes_h_l2738_c7_9239_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_9239_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2738_c7_9239_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_9239_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_9239_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2738_c7_9239_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2742_c11_f155_return_output,
 l16_high_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output,
 l16_low_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output,
 sp_relative_shift_uxn_opcodes_h_l2744_c30_ab14_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2749_c11_6288_return_output,
 l16_low_MUX_uxn_opcodes_h_l2749_c7_8337_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2749_c7_8337_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_8337_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_8337_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_8337_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2755_c11_350a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2755_c7_3d2d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_3d2d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_3d2d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2759_c11_212a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2759_c7_7345_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_7345_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_7345_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2763_c11_88bd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2763_c7_6edc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_6edc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_6edc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2767_c11_d6f4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2767_c7_dc34_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c7_dc34_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2767_c7_dc34_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c6_9ca8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c6_9ca8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c6_9ca8_return_output : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2710_c2_6f7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2710_c2_6f7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2715_c3_a8e6 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2710_c2_6f7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2720_c3_4d8b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2710_c2_6f7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_2cda_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_2cda_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_2cda_return_output : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_f04e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2723_c7_f04e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_f04e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2724_c3_4274 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_f04e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_f04e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_828a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_828a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_828a_return_output : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2730_c7_2107_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2730_c7_2107_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2730_c7_2107_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2730_c7_2107_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2730_c7_2107_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_2107_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_4cad_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_2107_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2726_c7_4cad_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_2107_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_4cad_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2728_c3_e38e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_2107_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_4cad_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_2107_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_4cad_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_234d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_234d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_234d_return_output : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2730_c7_2107_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2730_c7_2107_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2730_c7_2107_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2730_c7_2107_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2730_c7_2107_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_2107_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_2107_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_2107_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2732_c3_c80c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_2107_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_2107_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ce97_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ce97_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ce97_return_output : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2738_c7_9239_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2738_c7_9239_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2738_c7_9239_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_9239_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8dab_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_9239_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8dab_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_9239_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8dab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2736_c3_38b7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_9239_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8dab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2738_c7_9239_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8dab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_a3e9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_a3e9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_a3e9_return_output : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2738_c7_9239_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2738_c7_9239_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2738_c7_9239_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_9239_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_9239_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_9239_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2740_c3_a33f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_9239_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2738_c7_9239_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_f155_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_f155_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_f155_return_output : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2742_c7_5d17_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2742_c7_5d17_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2742_c7_5d17_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2742_c7_5d17_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2742_c7_5d17_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2749_c7_8337_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2742_c7_5d17_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_5d17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_5d17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_8337_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_5d17_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_5d17_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_5d17_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2749_c7_8337_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_5d17_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_5d17_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_5d17_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_8337_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_5d17_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_5d17_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2746_c3_0d06 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_5d17_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_8337_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_5d17_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_5d17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_5d17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_5d17_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2744_c30_ab14_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2744_c30_ab14_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2744_c30_ab14_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2744_c30_ab14_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_6288_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_6288_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_6288_return_output : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2749_c7_8337_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2749_c7_8337_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2749_c7_8337_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2749_c7_8337_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2749_c7_8337_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_3d2d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2749_c7_8337_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_8337_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2751_c3_e944 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_8337_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_8337_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_8337_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2752_c3_51a1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_8337_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_3d2d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_8337_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_8337_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_8337_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_3d2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_8337_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_350a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_350a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_350a_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_3d2d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_3d2d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2759_c7_7345_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_3d2d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_3d2d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2756_c3_56c6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_3d2d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_7345_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_3d2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_3d2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_3d2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_7345_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_3d2d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_212a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_212a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_212a_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2759_c7_7345_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2759_c7_7345_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_6edc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2759_c7_7345_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_7345_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2760_c3_324a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_7345_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_6edc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_7345_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_7345_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_7345_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_6edc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_7345_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_88bd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_88bd_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_88bd_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_6edc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_6edc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2767_c7_dc34_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_6edc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_6edc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2764_c3_8dbb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_6edc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c7_dc34_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_6edc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_6edc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_6edc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2767_c7_dc34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_6edc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_d6f4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_d6f4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_d6f4_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2767_c7_dc34_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2767_c7_dc34_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2767_c7_dc34_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c7_dc34_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2768_c3_195e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c7_dc34_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2767_c7_dc34_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c7_dc34_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2767_c7_dc34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2767_c7_dc34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2767_c7_dc34_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2726_l2723_l2710_l2738_l2767_l2734_l2730_DUPLICATE_e21a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2726_l2755_l2723_l2749_l2742_l2738_l2767_l2734_l2763_l2730_l2759_DUPLICATE_cbc4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2726_l2723_l2749_l2738_l2734_l2730_DUPLICATE_738f_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2726_l2723_l2742_l2738_l2734_l2730_DUPLICATE_76b5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l2773_l2706_DUPLICATE_b79c_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_234d_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c6_9ca8_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_6288_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2752_c3_51a1 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_8337_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2752_c3_51a1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_350a_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2724_c3_4274 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2724_c3_4274;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2764_c3_8dbb := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_6edc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2764_c3_8dbb;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2732_c3_c80c := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2732_c3_c80c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_828a_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_a3e9_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ce97_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_d6f4_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2768_c3_195e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c7_dc34_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2768_c3_195e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2746_c3_0d06 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_5d17_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2746_c3_0d06;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_f155_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2720_c3_4d8b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2720_c3_4d8b;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2715_c3_a8e6 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2715_c3_a8e6;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2767_c7_dc34_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2744_c30_ab14_x := signed(std_logic_vector(resize(to_unsigned(6, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_2cda_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_212a_right := to_unsigned(9, 4);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2751_c3_e944 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_8337_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2751_c3_e944;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2756_c3_56c6 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_3d2d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2756_c3_56c6;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2736_c3_38b7 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2736_c3_38b7;
     VAR_sp_relative_shift_uxn_opcodes_h_l2744_c30_ab14_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_88bd_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2760_c3_324a := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_7345_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2760_c3_324a;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_5d17_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2740_c3_a33f := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2740_c3_a33f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2728_c3_e38e := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2728_c3_e38e;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2744_c30_ab14_ins := VAR_ins;
     VAR_l16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2742_c7_5d17_iffalse := l16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_6edc_iftrue := l16_high;
     VAR_l16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2742_c7_5d17_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2749_c7_8337_iffalse := l16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2767_c7_dc34_iftrue := l16_low;
     VAR_n16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_3d2d_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2759_c7_7345_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c6_9ca8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_2cda_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_828a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_234d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ce97_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_a3e9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_f155_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_6288_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_350a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_212a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_88bd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_d6f4_left := VAR_phase;
     VAR_l16_high_MUX_uxn_opcodes_h_l2742_c7_5d17_iftrue := VAR_previous_stack_read;
     VAR_l16_low_MUX_uxn_opcodes_h_l2749_c7_8337_iftrue := VAR_previous_stack_read;
     VAR_n16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_5d17_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2749_c7_8337_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse := t16_low;
     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2710_c2_6f7c] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2710_c2_6f7c_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2726_l2723_l2742_l2738_l2734_l2730_DUPLICATE_76b5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2726_l2723_l2742_l2738_l2734_l2730_DUPLICATE_76b5_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2710_c6_9ca8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2710_c6_9ca8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c6_9ca8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2710_c6_9ca8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c6_9ca8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c6_9ca8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2710_c6_9ca8_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2726_l2723_l2749_l2738_l2734_l2730_DUPLICATE_738f LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2726_l2723_l2749_l2738_l2734_l2730_DUPLICATE_738f_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2742_c11_f155] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2742_c11_f155_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_f155_left;
     BIN_OP_EQ_uxn_opcodes_h_l2742_c11_f155_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_f155_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_f155_return_output := BIN_OP_EQ_uxn_opcodes_h_l2742_c11_f155_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2767_c7_dc34] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2767_c7_dc34_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2767_c11_d6f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2767_c11_d6f4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_d6f4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2767_c11_d6f4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_d6f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_d6f4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2767_c11_d6f4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2749_c11_6288] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2749_c11_6288_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_6288_left;
     BIN_OP_EQ_uxn_opcodes_h_l2749_c11_6288_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_6288_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_6288_return_output := BIN_OP_EQ_uxn_opcodes_h_l2749_c11_6288_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2744_c30_ab14] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2744_c30_ab14_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2744_c30_ab14_ins;
     sp_relative_shift_uxn_opcodes_h_l2744_c30_ab14_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2744_c30_ab14_x;
     sp_relative_shift_uxn_opcodes_h_l2744_c30_ab14_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2744_c30_ab14_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2744_c30_ab14_return_output := sp_relative_shift_uxn_opcodes_h_l2744_c30_ab14_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2710_c2_6f7c] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2710_c2_6f7c_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2755_c11_350a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2755_c11_350a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_350a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2755_c11_350a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_350a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_350a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2755_c11_350a_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2710_c2_6f7c] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2710_c2_6f7c_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2730_c11_234d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2730_c11_234d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_234d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2730_c11_234d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_234d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_234d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2730_c11_234d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2759_c11_212a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2759_c11_212a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_212a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2759_c11_212a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_212a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_212a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2759_c11_212a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2723_c11_2cda] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2723_c11_2cda_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_2cda_left;
     BIN_OP_EQ_uxn_opcodes_h_l2723_c11_2cda_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_2cda_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_2cda_return_output := BIN_OP_EQ_uxn_opcodes_h_l2723_c11_2cda_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2726_l2723_l2710_l2738_l2767_l2734_l2730_DUPLICATE_e21a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2726_l2723_l2710_l2738_l2767_l2734_l2730_DUPLICATE_e21a_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2738_c11_a3e9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2738_c11_a3e9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_a3e9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2738_c11_a3e9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_a3e9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_a3e9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2738_c11_a3e9_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2710_c2_6f7c] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2710_c2_6f7c_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2726_l2755_l2723_l2749_l2742_l2738_l2767_l2734_l2763_l2730_l2759_DUPLICATE_cbc4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2726_l2755_l2723_l2749_l2742_l2738_l2767_l2734_l2763_l2730_l2759_DUPLICATE_cbc4_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2726_c11_828a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2726_c11_828a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_828a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2726_c11_828a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_828a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_828a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2726_c11_828a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2763_c11_88bd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2763_c11_88bd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_88bd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2763_c11_88bd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_88bd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_88bd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2763_c11_88bd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2734_c11_ce97] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ce97_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ce97_left;
     BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ce97_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ce97_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ce97_return_output := BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ce97_return_output;

     -- Submodule level 1
     VAR_l16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c6_9ca8_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c6_9ca8_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c6_9ca8_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c6_9ca8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c6_9ca8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c6_9ca8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c6_9ca8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c6_9ca8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c6_9ca8_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c6_9ca8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c6_9ca8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c6_9ca8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c6_9ca8_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c6_9ca8_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c6_9ca8_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_2cda_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_2cda_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_2cda_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_2cda_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_f04e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_2cda_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_f04e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_2cda_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_f04e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_2cda_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_f04e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_2cda_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2723_c7_f04e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_2cda_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_2cda_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2723_c11_2cda_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_828a_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_828a_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_828a_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_828a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_4cad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_828a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_4cad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_828a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_4cad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_828a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_4cad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_828a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2726_c7_4cad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_828a_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_828a_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_828a_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2730_c7_2107_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_234d_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2730_c7_2107_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_234d_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2730_c7_2107_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_234d_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2730_c7_2107_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_234d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_2107_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_234d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_2107_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_234d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_2107_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_234d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_2107_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_234d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_2107_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_234d_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2730_c7_2107_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_234d_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ce97_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ce97_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ce97_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ce97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8dab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ce97_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8dab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ce97_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8dab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ce97_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8dab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ce97_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8dab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_ce97_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2738_c7_9239_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_a3e9_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2738_c7_9239_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_a3e9_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2738_c7_9239_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_a3e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_9239_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_a3e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2738_c7_9239_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_a3e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_9239_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_a3e9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_9239_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_a3e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_9239_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_a3e9_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2742_c7_5d17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_f155_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2742_c7_5d17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_f155_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_5d17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_f155_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_5d17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_f155_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_5d17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_f155_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_5d17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_f155_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_5d17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_f155_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2749_c7_8337_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_6288_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_8337_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_6288_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_8337_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_6288_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_8337_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_6288_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2749_c7_8337_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2749_c11_6288_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_3d2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_350a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_3d2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_350a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_3d2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_350a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_7345_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_212a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_7345_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_212a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2759_c7_7345_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_212a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_6edc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_88bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_6edc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_88bd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_6edc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2763_c11_88bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2767_c7_dc34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_d6f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c7_dc34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_d6f4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2767_c7_dc34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2767_c11_d6f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2726_l2723_l2749_l2738_l2734_l2730_DUPLICATE_738f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2726_l2723_l2749_l2738_l2734_l2730_DUPLICATE_738f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2726_l2723_l2749_l2738_l2734_l2730_DUPLICATE_738f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2726_l2723_l2749_l2738_l2734_l2730_DUPLICATE_738f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2726_l2723_l2749_l2738_l2734_l2730_DUPLICATE_738f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_8337_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2726_l2723_l2749_l2738_l2734_l2730_DUPLICATE_738f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2726_l2755_l2723_l2749_l2742_l2738_l2767_l2734_l2763_l2730_l2759_DUPLICATE_cbc4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2726_l2755_l2723_l2749_l2742_l2738_l2767_l2734_l2763_l2730_l2759_DUPLICATE_cbc4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2726_l2755_l2723_l2749_l2742_l2738_l2767_l2734_l2763_l2730_l2759_DUPLICATE_cbc4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2726_l2755_l2723_l2749_l2742_l2738_l2767_l2734_l2763_l2730_l2759_DUPLICATE_cbc4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2726_l2755_l2723_l2749_l2742_l2738_l2767_l2734_l2763_l2730_l2759_DUPLICATE_cbc4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_5d17_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2726_l2755_l2723_l2749_l2742_l2738_l2767_l2734_l2763_l2730_l2759_DUPLICATE_cbc4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_8337_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2726_l2755_l2723_l2749_l2742_l2738_l2767_l2734_l2763_l2730_l2759_DUPLICATE_cbc4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_3d2d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2726_l2755_l2723_l2749_l2742_l2738_l2767_l2734_l2763_l2730_l2759_DUPLICATE_cbc4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_7345_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2726_l2755_l2723_l2749_l2742_l2738_l2767_l2734_l2763_l2730_l2759_DUPLICATE_cbc4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_6edc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2726_l2755_l2723_l2749_l2742_l2738_l2767_l2734_l2763_l2730_l2759_DUPLICATE_cbc4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2767_c7_dc34_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2726_l2755_l2723_l2749_l2742_l2738_l2767_l2734_l2763_l2730_l2759_DUPLICATE_cbc4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2726_l2723_l2742_l2738_l2734_l2730_DUPLICATE_76b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2726_l2723_l2742_l2738_l2734_l2730_DUPLICATE_76b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2726_l2723_l2742_l2738_l2734_l2730_DUPLICATE_76b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2726_l2723_l2742_l2738_l2734_l2730_DUPLICATE_76b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2726_l2723_l2742_l2738_l2734_l2730_DUPLICATE_76b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_5d17_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2726_l2723_l2742_l2738_l2734_l2730_DUPLICATE_76b5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2726_l2723_l2710_l2738_l2767_l2734_l2730_DUPLICATE_e21a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2726_l2723_l2710_l2738_l2767_l2734_l2730_DUPLICATE_e21a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2726_l2723_l2710_l2738_l2767_l2734_l2730_DUPLICATE_e21a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2726_l2723_l2710_l2738_l2767_l2734_l2730_DUPLICATE_e21a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2726_l2723_l2710_l2738_l2767_l2734_l2730_DUPLICATE_e21a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2726_l2723_l2710_l2738_l2767_l2734_l2730_DUPLICATE_e21a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2767_c7_dc34_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2726_l2723_l2710_l2738_l2767_l2734_l2730_DUPLICATE_e21a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2710_c2_6f7c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2710_c2_6f7c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2710_c2_6f7c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2710_c2_6f7c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c7_dc34_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2767_c7_dc34_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_5d17_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2744_c30_ab14_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2767_c7_dc34] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2767_c7_dc34_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2767_c7_dc34_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2767_c7_dc34_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2767_c7_dc34_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2767_c7_dc34_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2767_c7_dc34_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2767_c7_dc34_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2767_c7_dc34_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2738_c7_9239] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2738_c7_9239_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2738_c7_9239_cond;
     n16_low_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2738_c7_9239_return_output := n16_low_MUX_uxn_opcodes_h_l2738_c7_9239_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2767_c7_dc34] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c7_dc34_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c7_dc34_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c7_dc34_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c7_dc34_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c7_dc34_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c7_dc34_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c7_dc34_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c7_dc34_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2730_c7_2107] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2730_c7_2107_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2730_c7_2107_cond;
     t16_low_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2730_c7_2107_return_output := t16_low_MUX_uxn_opcodes_h_l2730_c7_2107_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2710_c2_6f7c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2734_c7_8dab] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_cond;
     n16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output := n16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2767_c7_dc34] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2767_c7_dc34_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2767_c7_dc34_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2767_c7_dc34_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2767_c7_dc34_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2767_c7_dc34_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2767_c7_dc34_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2767_c7_dc34_return_output := result_u8_value_MUX_uxn_opcodes_h_l2767_c7_dc34_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2742_c7_5d17] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_5d17_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_5d17_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_5d17_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_5d17_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_5d17_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_5d17_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2710_c2_6f7c] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2726_c7_4cad] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_cond;
     t16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output := t16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2749_c7_8337] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2749_c7_8337_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2749_c7_8337_cond;
     l16_low_MUX_uxn_opcodes_h_l2749_c7_8337_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2749_c7_8337_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2749_c7_8337_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2749_c7_8337_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2749_c7_8337_return_output := l16_low_MUX_uxn_opcodes_h_l2749_c7_8337_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2742_c7_5d17] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2742_c7_5d17_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2742_c7_5d17_cond;
     l16_high_MUX_uxn_opcodes_h_l2742_c7_5d17_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2742_c7_5d17_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2742_c7_5d17_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2742_c7_5d17_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output := l16_high_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2710_c2_6f7c] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2710_c2_6f7c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2749_c7_8337] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_8337_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_8337_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_8337_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_8337_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_8337_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_8337_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_8337_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_8337_return_output;

     -- Submodule level 2
     VAR_l16_high_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2742_c7_5d17_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2749_c7_8337_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2738_c7_9239_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_6edc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2767_c7_dc34_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_5d17_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2749_c7_8337_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_6edc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2767_c7_dc34_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_6edc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2767_c7_dc34_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2730_c7_2107_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l2734_c7_8dab] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_cond;
     n16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output := n16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2723_c7_f04e] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_cond;
     t16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output := t16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2726_c7_4cad] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_cond;
     t16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output := t16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2738_c7_9239] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2738_c7_9239_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2738_c7_9239_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2738_c7_9239_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2738_c7_9239_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2742_c7_5d17] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2742_c7_5d17_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2742_c7_5d17_cond;
     l16_low_MUX_uxn_opcodes_h_l2742_c7_5d17_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2742_c7_5d17_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2742_c7_5d17_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2742_c7_5d17_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output := l16_low_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2742_c7_5d17] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_5d17_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_5d17_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_5d17_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_5d17_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_5d17_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_5d17_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2738_c7_9239] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2738_c7_9239_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2738_c7_9239_cond;
     l16_high_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2738_c7_9239_return_output := l16_high_MUX_uxn_opcodes_h_l2738_c7_9239_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2763_c7_6edc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2763_c7_6edc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_6edc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2763_c7_6edc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_6edc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2763_c7_6edc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_6edc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_6edc_return_output := result_u8_value_MUX_uxn_opcodes_h_l2763_c7_6edc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2763_c7_6edc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_6edc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_6edc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_6edc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_6edc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_6edc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_6edc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_6edc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_6edc_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2730_c7_2107] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2730_c7_2107_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2730_c7_2107_cond;
     n16_high_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2730_c7_2107_return_output := n16_high_MUX_uxn_opcodes_h_l2730_c7_2107_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2763_c7_6edc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_6edc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_6edc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_6edc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_6edc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_6edc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_6edc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_6edc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_6edc_return_output;

     -- Submodule level 3
     VAR_l16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2738_c7_9239_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2730_c7_2107_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_7345_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2763_c7_6edc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2738_c7_9239_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_7345_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2763_c7_6edc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2759_c7_7345_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2763_c7_6edc_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output;
     -- l16_high_MUX[uxn_opcodes_h_l2734_c7_8dab] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_cond;
     l16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output := l16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2738_c7_9239] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2738_c7_9239_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2738_c7_9239_cond;
     l16_low_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2738_c7_9239_return_output := l16_low_MUX_uxn_opcodes_h_l2738_c7_9239_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2730_c7_2107] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2730_c7_2107_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2730_c7_2107_cond;
     n16_low_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2730_c7_2107_return_output := n16_low_MUX_uxn_opcodes_h_l2730_c7_2107_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2723_c7_f04e] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_cond;
     t16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output := t16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2710_c2_6f7c] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond;
     t16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output := t16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2734_c7_8dab] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8dab_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8dab_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2726_c7_4cad] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_cond;
     n16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output := n16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2759_c7_7345] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_7345_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_7345_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_7345_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_7345_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_7345_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_7345_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_7345_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_7345_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2738_c7_9239] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_9239_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_9239_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_9239_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_9239_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2759_c7_7345] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2759_c7_7345_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2759_c7_7345_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2759_c7_7345_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2759_c7_7345_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2759_c7_7345_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2759_c7_7345_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2759_c7_7345_return_output := result_u8_value_MUX_uxn_opcodes_h_l2759_c7_7345_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2759_c7_7345] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_7345_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_7345_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_7345_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_7345_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_7345_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_7345_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_7345_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_7345_return_output;

     -- Submodule level 4
     VAR_l16_high_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2738_c7_9239_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2730_c7_2107_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_3d2d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_7345_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2738_c7_9239_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_3d2d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_7345_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_3d2d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2759_c7_7345_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l2726_c7_4cad] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_cond;
     n16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output := n16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2710_c2_6f7c] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond;
     t16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output := t16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2755_c7_3d2d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_3d2d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_3d2d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_3d2d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_3d2d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_3d2d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_3d2d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_3d2d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_3d2d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2755_c7_3d2d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_3d2d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_3d2d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_3d2d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_3d2d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_3d2d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_3d2d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_3d2d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_3d2d_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2730_c7_2107] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2730_c7_2107_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2730_c7_2107_cond;
     l16_high_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2730_c7_2107_return_output := l16_high_MUX_uxn_opcodes_h_l2730_c7_2107_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2734_c7_8dab] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_cond;
     l16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output := l16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2723_c7_f04e] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_cond;
     n16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output := n16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2730_c7_2107] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_2107_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_2107_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_2107_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_2107_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2734_c7_8dab] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8dab_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8dab_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2755_c7_3d2d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2755_c7_3d2d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_3d2d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2755_c7_3d2d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_3d2d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2755_c7_3d2d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_3d2d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_3d2d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2755_c7_3d2d_return_output;

     -- Submodule level 5
     VAR_l16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2730_c7_2107_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_8337_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_3d2d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_2107_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_8337_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_3d2d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2749_c7_8337_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_3d2d_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2749_c7_8337] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_8337_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_8337_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_8337_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_8337_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_8337_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_8337_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_8337_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_8337_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2710_c2_6f7c] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond;
     n16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output := n16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2730_c7_2107] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_2107_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_2107_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_2107_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_2107_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2730_c7_2107] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2730_c7_2107_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2730_c7_2107_cond;
     l16_low_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2730_c7_2107_return_output := l16_low_MUX_uxn_opcodes_h_l2730_c7_2107_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2749_c7_8337] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2749_c7_8337_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2749_c7_8337_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2749_c7_8337_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2749_c7_8337_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2749_c7_8337_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2749_c7_8337_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2749_c7_8337_return_output := result_u8_value_MUX_uxn_opcodes_h_l2749_c7_8337_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2726_c7_4cad] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_cond;
     l16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output := l16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2723_c7_f04e] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_cond;
     n16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output := n16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2726_c7_4cad] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_4cad_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_4cad_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2749_c7_8337] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_8337_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_8337_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_8337_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_8337_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_8337_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_8337_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_8337_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_8337_return_output;

     -- Submodule level 6
     VAR_l16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2730_c7_2107_return_output;
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_5d17_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2749_c7_8337_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_2107_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_5d17_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2749_c7_8337_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_5d17_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2749_c7_8337_return_output;
     -- l16_low_MUX[uxn_opcodes_h_l2726_c7_4cad] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_cond;
     l16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output := l16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2723_c7_f04e] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_cond;
     l16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output := l16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2742_c7_5d17] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_5d17_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_5d17_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_5d17_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_5d17_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_5d17_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_5d17_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2742_c7_5d17] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2742_c7_5d17_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_5d17_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2742_c7_5d17_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_5d17_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2742_c7_5d17_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_5d17_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output := result_u8_value_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2723_c7_f04e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_f04e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_f04e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2742_c7_5d17] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_5d17_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_5d17_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_5d17_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_5d17_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_5d17_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_5d17_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2710_c2_6f7c] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond;
     n16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output := n16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2726_c7_4cad] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_4cad_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_4cad_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output;

     -- Submodule level 7
     VAR_l16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output;
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_5d17_return_output;
     -- l16_high_MUX[uxn_opcodes_h_l2710_c2_6f7c] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond;
     l16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output := l16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2723_c7_f04e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_f04e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_f04e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2738_c7_9239] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_9239_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_9239_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_9239_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_9239_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2738_c7_9239] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2738_c7_9239_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_9239_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_9239_return_output := result_u8_value_MUX_uxn_opcodes_h_l2738_c7_9239_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2723_c7_f04e] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_cond;
     l16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output := l16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2710_c2_6f7c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2738_c7_9239] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_9239_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_9239_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_9239_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_9239_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_9239_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_9239_return_output;

     -- Submodule level 8
     REG_VAR_l16_high := VAR_l16_high_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_9239_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_9239_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_9239_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2734_c7_8dab] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8dab_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8dab_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2734_c7_8dab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8dab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8dab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2710_c2_6f7c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2734_c7_8dab] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8dab_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8dab_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8dab_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8dab_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output := result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2710_c2_6f7c] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond;
     l16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output := l16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output;

     -- Submodule level 9
     REG_VAR_l16_low := VAR_l16_low_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_8dab_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2730_c7_2107] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2730_c7_2107_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_2107_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_2107_return_output := result_u8_value_MUX_uxn_opcodes_h_l2730_c7_2107_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2730_c7_2107] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_2107_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_2107_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_2107_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_2107_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2730_c7_2107] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_2107_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_2107_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_2107_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_2107_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_2107_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_2107_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_2107_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_2107_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_2107_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2726_c7_4cad] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2726_c7_4cad_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2726_c7_4cad_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output := result_u8_value_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2726_c7_4cad] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_4cad_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_4cad_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2726_c7_4cad] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_4cad_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_4cad_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_4cad_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_4cad_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2726_c7_4cad_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2723_c7_f04e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_f04e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_f04e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2723_c7_f04e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_f04e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_f04e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2723_c7_f04e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2723_c7_f04e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2723_c7_f04e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2723_c7_f04e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2723_c7_f04e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2723_c7_f04e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2710_c2_6f7c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2710_c2_6f7c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2710_c2_6f7c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c2_6f7c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c2_6f7c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c2_6f7c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l2773_l2706_DUPLICATE_b79c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l2773_l2706_DUPLICATE_b79c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_84a2(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2710_c2_6f7c_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l2773_l2706_DUPLICATE_b79c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l2773_l2706_DUPLICATE_b79c_return_output;
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
