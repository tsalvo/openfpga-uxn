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
-- Submodules: 64
entity sta2_0CLK_4674db74 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sta2_0CLK_4674db74;
architecture arch of sta2_0CLK_4674db74 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal n16_high : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16_low : unsigned(7 downto 0) := to_unsigned(0, 8);
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_n16_high : unsigned(7 downto 0);
signal REG_COMB_n16_low : unsigned(7 downto 0);
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2339_c6_83c9]
signal BIN_OP_EQ_uxn_opcodes_h_l2339_c6_83c9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2339_c6_83c9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2339_c6_83c9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2339_c2_0809]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_0809_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_0809_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2339_c2_0809]
signal result_u8_value_MUX_uxn_opcodes_h_l2339_c2_0809_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2339_c2_0809_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2339_c2_0809]
signal result_u16_value_MUX_uxn_opcodes_h_l2339_c2_0809_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2339_c2_0809_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2339_c2_0809]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_0809_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_0809_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2339_c2_0809]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_0809_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_0809_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2339_c2_0809]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_0809_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_0809_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2339_c2_0809]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_0809_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_0809_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2339_c2_0809]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_0809_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_0809_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2339_c2_0809]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_0809_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_0809_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2339_c2_0809]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_0809_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_0809_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2339_c2_0809]
signal t16_MUX_uxn_opcodes_h_l2339_c2_0809_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2339_c2_0809_return_output : unsigned(15 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2339_c2_0809]
signal n16_low_MUX_uxn_opcodes_h_l2339_c2_0809_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2339_c2_0809_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2339_c2_0809]
signal n16_high_MUX_uxn_opcodes_h_l2339_c2_0809_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2339_c2_0809_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2352_c11_808c]
signal BIN_OP_EQ_uxn_opcodes_h_l2352_c11_808c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2352_c11_808c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2352_c11_808c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2352_c7_196b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_196b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_196b_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2352_c7_196b]
signal result_u8_value_MUX_uxn_opcodes_h_l2352_c7_196b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2352_c7_196b_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2352_c7_196b]
signal result_u16_value_MUX_uxn_opcodes_h_l2352_c7_196b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2352_c7_196b_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2352_c7_196b]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_196b_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_196b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2352_c7_196b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_196b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_196b_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2352_c7_196b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_196b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_196b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2352_c7_196b]
signal t16_MUX_uxn_opcodes_h_l2352_c7_196b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2352_c7_196b_return_output : unsigned(15 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2352_c7_196b]
signal n16_low_MUX_uxn_opcodes_h_l2352_c7_196b_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2352_c7_196b_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2352_c7_196b]
signal n16_high_MUX_uxn_opcodes_h_l2352_c7_196b_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2352_c7_196b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2355_c11_f793]
signal BIN_OP_EQ_uxn_opcodes_h_l2355_c11_f793_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2355_c11_f793_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2355_c11_f793_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2355_c7_fc52]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_fc52_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2355_c7_fc52]
signal result_u8_value_MUX_uxn_opcodes_h_l2355_c7_fc52_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2355_c7_fc52]
signal result_u16_value_MUX_uxn_opcodes_h_l2355_c7_fc52_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2355_c7_fc52]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_fc52_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2355_c7_fc52]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_fc52_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2355_c7_fc52]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_fc52_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2355_c7_fc52]
signal t16_MUX_uxn_opcodes_h_l2355_c7_fc52_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output : unsigned(15 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2355_c7_fc52]
signal n16_low_MUX_uxn_opcodes_h_l2355_c7_fc52_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2355_c7_fc52]
signal n16_high_MUX_uxn_opcodes_h_l2355_c7_fc52_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2357_c3_95eb]
signal CONST_SL_8_uxn_opcodes_h_l2357_c3_95eb_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2357_c3_95eb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2360_c11_1cb7]
signal BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1cb7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1cb7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1cb7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2360_c7_75a6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_75a6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2360_c7_75a6]
signal result_u8_value_MUX_uxn_opcodes_h_l2360_c7_75a6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2360_c7_75a6]
signal result_u16_value_MUX_uxn_opcodes_h_l2360_c7_75a6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2360_c7_75a6]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_75a6_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2360_c7_75a6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_75a6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2360_c7_75a6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_75a6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2360_c7_75a6]
signal t16_MUX_uxn_opcodes_h_l2360_c7_75a6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output : unsigned(15 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2360_c7_75a6]
signal n16_low_MUX_uxn_opcodes_h_l2360_c7_75a6_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2360_c7_75a6]
signal n16_high_MUX_uxn_opcodes_h_l2360_c7_75a6_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2361_c3_c669]
signal BIN_OP_OR_uxn_opcodes_h_l2361_c3_c669_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2361_c3_c669_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2361_c3_c669_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2364_c11_252c]
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c11_252c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c11_252c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c11_252c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2364_c7_4525]
signal result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4525_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4525_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4525_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4525_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2364_c7_4525]
signal result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4525_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4525_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4525_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4525_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2364_c7_4525]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4525_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4525_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4525_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4525_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2364_c7_4525]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4525_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4525_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4525_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4525_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2364_c7_4525]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4525_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4525_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4525_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4525_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2364_c7_4525]
signal n16_low_MUX_uxn_opcodes_h_l2364_c7_4525_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2364_c7_4525_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2364_c7_4525_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2364_c7_4525_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2364_c7_4525]
signal n16_high_MUX_uxn_opcodes_h_l2364_c7_4525_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2364_c7_4525_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2364_c7_4525_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2364_c7_4525_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2366_c30_74e4]
signal sp_relative_shift_uxn_opcodes_h_l2366_c30_74e4_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2366_c30_74e4_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2366_c30_74e4_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2366_c30_74e4_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2371_c11_8eb4]
signal BIN_OP_EQ_uxn_opcodes_h_l2371_c11_8eb4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2371_c11_8eb4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2371_c11_8eb4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2371_c7_e526]
signal result_u8_value_MUX_uxn_opcodes_h_l2371_c7_e526_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2371_c7_e526_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2371_c7_e526_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2371_c7_e526_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2371_c7_e526]
signal result_u16_value_MUX_uxn_opcodes_h_l2371_c7_e526_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2371_c7_e526_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2371_c7_e526_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2371_c7_e526_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2371_c7_e526]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_e526_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_e526_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_e526_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_e526_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2371_c7_e526]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_e526_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_e526_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_e526_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_e526_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2371_c7_e526]
signal n16_low_MUX_uxn_opcodes_h_l2371_c7_e526_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2371_c7_e526_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2371_c7_e526_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2371_c7_e526_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2374_c22_1487]
signal BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_1487_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_1487_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_1487_return_output : unsigned(16 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
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
-- BIN_OP_EQ_uxn_opcodes_h_l2339_c6_83c9
BIN_OP_EQ_uxn_opcodes_h_l2339_c6_83c9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2339_c6_83c9_left,
BIN_OP_EQ_uxn_opcodes_h_l2339_c6_83c9_right,
BIN_OP_EQ_uxn_opcodes_h_l2339_c6_83c9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_0809
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_0809 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_0809_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_0809_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2339_c2_0809
result_u8_value_MUX_uxn_opcodes_h_l2339_c2_0809 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2339_c2_0809_cond,
result_u8_value_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2339_c2_0809_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2339_c2_0809
result_u16_value_MUX_uxn_opcodes_h_l2339_c2_0809 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2339_c2_0809_cond,
result_u16_value_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2339_c2_0809_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_0809
result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_0809 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_0809_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_0809_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_0809
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_0809 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_0809_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_0809_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_0809
result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_0809 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_0809_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_0809_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_0809
result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_0809 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_0809_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_0809_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_0809
result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_0809 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_0809_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_0809_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_0809
result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_0809 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_0809_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_0809_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_0809
result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_0809 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_0809_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_0809_return_output);

-- t16_MUX_uxn_opcodes_h_l2339_c2_0809
t16_MUX_uxn_opcodes_h_l2339_c2_0809 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2339_c2_0809_cond,
t16_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue,
t16_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse,
t16_MUX_uxn_opcodes_h_l2339_c2_0809_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2339_c2_0809
n16_low_MUX_uxn_opcodes_h_l2339_c2_0809 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2339_c2_0809_cond,
n16_low_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue,
n16_low_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse,
n16_low_MUX_uxn_opcodes_h_l2339_c2_0809_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2339_c2_0809
n16_high_MUX_uxn_opcodes_h_l2339_c2_0809 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2339_c2_0809_cond,
n16_high_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue,
n16_high_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse,
n16_high_MUX_uxn_opcodes_h_l2339_c2_0809_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2352_c11_808c
BIN_OP_EQ_uxn_opcodes_h_l2352_c11_808c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2352_c11_808c_left,
BIN_OP_EQ_uxn_opcodes_h_l2352_c11_808c_right,
BIN_OP_EQ_uxn_opcodes_h_l2352_c11_808c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_196b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_196b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_196b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_196b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2352_c7_196b
result_u8_value_MUX_uxn_opcodes_h_l2352_c7_196b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2352_c7_196b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2352_c7_196b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2352_c7_196b
result_u16_value_MUX_uxn_opcodes_h_l2352_c7_196b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2352_c7_196b_cond,
result_u16_value_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2352_c7_196b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_196b
result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_196b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_196b_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_196b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_196b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_196b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_196b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_196b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_196b
result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_196b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_196b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_196b_return_output);

-- t16_MUX_uxn_opcodes_h_l2352_c7_196b
t16_MUX_uxn_opcodes_h_l2352_c7_196b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2352_c7_196b_cond,
t16_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue,
t16_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse,
t16_MUX_uxn_opcodes_h_l2352_c7_196b_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2352_c7_196b
n16_low_MUX_uxn_opcodes_h_l2352_c7_196b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2352_c7_196b_cond,
n16_low_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue,
n16_low_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse,
n16_low_MUX_uxn_opcodes_h_l2352_c7_196b_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2352_c7_196b
n16_high_MUX_uxn_opcodes_h_l2352_c7_196b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2352_c7_196b_cond,
n16_high_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue,
n16_high_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse,
n16_high_MUX_uxn_opcodes_h_l2352_c7_196b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2355_c11_f793
BIN_OP_EQ_uxn_opcodes_h_l2355_c11_f793 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2355_c11_f793_left,
BIN_OP_EQ_uxn_opcodes_h_l2355_c11_f793_right,
BIN_OP_EQ_uxn_opcodes_h_l2355_c11_f793_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_fc52
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_fc52 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_fc52_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2355_c7_fc52
result_u8_value_MUX_uxn_opcodes_h_l2355_c7_fc52 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2355_c7_fc52_cond,
result_u8_value_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2355_c7_fc52
result_u16_value_MUX_uxn_opcodes_h_l2355_c7_fc52 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2355_c7_fc52_cond,
result_u16_value_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_fc52
result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_fc52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_fc52_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_fc52
result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_fc52 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_fc52_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_fc52
result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_fc52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_fc52_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output);

-- t16_MUX_uxn_opcodes_h_l2355_c7_fc52
t16_MUX_uxn_opcodes_h_l2355_c7_fc52 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2355_c7_fc52_cond,
t16_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue,
t16_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse,
t16_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2355_c7_fc52
n16_low_MUX_uxn_opcodes_h_l2355_c7_fc52 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2355_c7_fc52_cond,
n16_low_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue,
n16_low_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse,
n16_low_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2355_c7_fc52
n16_high_MUX_uxn_opcodes_h_l2355_c7_fc52 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2355_c7_fc52_cond,
n16_high_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue,
n16_high_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse,
n16_high_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2357_c3_95eb
CONST_SL_8_uxn_opcodes_h_l2357_c3_95eb : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2357_c3_95eb_x,
CONST_SL_8_uxn_opcodes_h_l2357_c3_95eb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1cb7
BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1cb7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1cb7_left,
BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1cb7_right,
BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1cb7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_75a6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_75a6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_75a6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2360_c7_75a6
result_u8_value_MUX_uxn_opcodes_h_l2360_c7_75a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2360_c7_75a6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2360_c7_75a6
result_u16_value_MUX_uxn_opcodes_h_l2360_c7_75a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2360_c7_75a6_cond,
result_u16_value_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_75a6
result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_75a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_75a6_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_75a6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_75a6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_75a6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_75a6
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_75a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_75a6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output);

-- t16_MUX_uxn_opcodes_h_l2360_c7_75a6
t16_MUX_uxn_opcodes_h_l2360_c7_75a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2360_c7_75a6_cond,
t16_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue,
t16_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse,
t16_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2360_c7_75a6
n16_low_MUX_uxn_opcodes_h_l2360_c7_75a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2360_c7_75a6_cond,
n16_low_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue,
n16_low_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse,
n16_low_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2360_c7_75a6
n16_high_MUX_uxn_opcodes_h_l2360_c7_75a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2360_c7_75a6_cond,
n16_high_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue,
n16_high_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse,
n16_high_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2361_c3_c669
BIN_OP_OR_uxn_opcodes_h_l2361_c3_c669 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2361_c3_c669_left,
BIN_OP_OR_uxn_opcodes_h_l2361_c3_c669_right,
BIN_OP_OR_uxn_opcodes_h_l2361_c3_c669_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2364_c11_252c
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_252c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_252c_left,
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_252c_right,
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_252c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4525
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4525 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4525_cond,
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4525_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4525_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4525_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4525
result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4525 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4525_cond,
result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4525_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4525_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4525_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4525
result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4525 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4525_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4525_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4525_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4525_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4525
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4525 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4525_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4525_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4525_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4525_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4525
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4525 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4525_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4525_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4525_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4525_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2364_c7_4525
n16_low_MUX_uxn_opcodes_h_l2364_c7_4525 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2364_c7_4525_cond,
n16_low_MUX_uxn_opcodes_h_l2364_c7_4525_iftrue,
n16_low_MUX_uxn_opcodes_h_l2364_c7_4525_iffalse,
n16_low_MUX_uxn_opcodes_h_l2364_c7_4525_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2364_c7_4525
n16_high_MUX_uxn_opcodes_h_l2364_c7_4525 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2364_c7_4525_cond,
n16_high_MUX_uxn_opcodes_h_l2364_c7_4525_iftrue,
n16_high_MUX_uxn_opcodes_h_l2364_c7_4525_iffalse,
n16_high_MUX_uxn_opcodes_h_l2364_c7_4525_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2366_c30_74e4
sp_relative_shift_uxn_opcodes_h_l2366_c30_74e4 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2366_c30_74e4_ins,
sp_relative_shift_uxn_opcodes_h_l2366_c30_74e4_x,
sp_relative_shift_uxn_opcodes_h_l2366_c30_74e4_y,
sp_relative_shift_uxn_opcodes_h_l2366_c30_74e4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2371_c11_8eb4
BIN_OP_EQ_uxn_opcodes_h_l2371_c11_8eb4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2371_c11_8eb4_left,
BIN_OP_EQ_uxn_opcodes_h_l2371_c11_8eb4_right,
BIN_OP_EQ_uxn_opcodes_h_l2371_c11_8eb4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2371_c7_e526
result_u8_value_MUX_uxn_opcodes_h_l2371_c7_e526 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2371_c7_e526_cond,
result_u8_value_MUX_uxn_opcodes_h_l2371_c7_e526_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2371_c7_e526_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2371_c7_e526_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2371_c7_e526
result_u16_value_MUX_uxn_opcodes_h_l2371_c7_e526 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2371_c7_e526_cond,
result_u16_value_MUX_uxn_opcodes_h_l2371_c7_e526_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2371_c7_e526_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2371_c7_e526_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_e526
result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_e526 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_e526_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_e526_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_e526_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_e526_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_e526
result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_e526 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_e526_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_e526_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_e526_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_e526_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2371_c7_e526
n16_low_MUX_uxn_opcodes_h_l2371_c7_e526 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2371_c7_e526_cond,
n16_low_MUX_uxn_opcodes_h_l2371_c7_e526_iftrue,
n16_low_MUX_uxn_opcodes_h_l2371_c7_e526_iffalse,
n16_low_MUX_uxn_opcodes_h_l2371_c7_e526_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_1487
BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_1487 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_1487_left,
BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_1487_right,
BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_1487_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 n16_high,
 n16_low,
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2339_c6_83c9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_0809_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2339_c2_0809_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2339_c2_0809_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_0809_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_0809_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_0809_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_0809_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_0809_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_0809_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_0809_return_output,
 t16_MUX_uxn_opcodes_h_l2339_c2_0809_return_output,
 n16_low_MUX_uxn_opcodes_h_l2339_c2_0809_return_output,
 n16_high_MUX_uxn_opcodes_h_l2339_c2_0809_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2352_c11_808c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_196b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2352_c7_196b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2352_c7_196b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_196b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_196b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_196b_return_output,
 t16_MUX_uxn_opcodes_h_l2352_c7_196b_return_output,
 n16_low_MUX_uxn_opcodes_h_l2352_c7_196b_return_output,
 n16_high_MUX_uxn_opcodes_h_l2352_c7_196b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2355_c11_f793_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output,
 t16_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output,
 n16_low_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output,
 n16_high_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output,
 CONST_SL_8_uxn_opcodes_h_l2357_c3_95eb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1cb7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output,
 t16_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output,
 n16_low_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output,
 n16_high_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2361_c3_c669_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2364_c11_252c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4525_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4525_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4525_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4525_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4525_return_output,
 n16_low_MUX_uxn_opcodes_h_l2364_c7_4525_return_output,
 n16_high_MUX_uxn_opcodes_h_l2364_c7_4525_return_output,
 sp_relative_shift_uxn_opcodes_h_l2366_c30_74e4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2371_c11_8eb4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2371_c7_e526_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2371_c7_e526_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_e526_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_e526_return_output,
 n16_low_MUX_uxn_opcodes_h_l2371_c7_e526_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_1487_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_83c9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_83c9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_83c9_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2349_c3_6fc7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_196b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_0809_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_0809_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_196b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_0809_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_0809_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_196b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_0809_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_0809_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_196b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_0809_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_0809_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2339_c2_0809_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_0809_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_0809_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2339_c2_0809_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_0809_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_0809_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2344_c3_fdaa : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_196b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_0809_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_0809_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2339_c2_0809_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_0809_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_0809_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2339_c2_0809_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_0809_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_0809_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_196b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_0809_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_0809_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2352_c7_196b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2339_c2_0809_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2339_c2_0809_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_196b_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_0809_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_0809_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_196b_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_0809_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_0809_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_808c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_808c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_808c_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2353_c3_b585 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_196b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_196b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_196b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_196b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_196b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_196b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2352_c7_196b_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_196b_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_196b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_f793_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_f793_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_f793_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2358_c3_6369 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_fc52_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_fc52_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_fc52_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_fc52_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_fc52_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_fc52_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2355_c7_fc52_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_fc52_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_fc52_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2357_c3_95eb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2357_c3_95eb_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1cb7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1cb7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1cb7_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2362_c3_1074 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2360_c7_75a6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_75a6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4525_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_75a6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4525_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_75a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4525_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_75a6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4525_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_75a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4525_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_75a6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2360_c7_75a6_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_4525_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_75a6_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_4525_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_75a6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_c669_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_c669_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_c669_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_252c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_252c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_252c_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4525_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4525_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_e526_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4525_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4525_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4525_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_e526_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4525_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4525_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4525_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4525_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4525_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4525_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_e526_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4525_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4525_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4525_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_e526_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4525_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_4525_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_4525_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_e526_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_4525_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_4525_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_4525_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_4525_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_74e4_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_74e4_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_74e4_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_74e4_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_8eb4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_8eb4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_8eb4_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_e526_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_e526_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_e526_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_e526_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l2374_c3_d1ff : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_e526_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_e526_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_e526_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2373_c3_cb0e : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_e526_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_e526_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_e526_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_e526_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_e526_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_e526_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_e526_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_e526_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_1487_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_1487_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_1487_return_output : unsigned(16 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2352_l2339_l2371_l2360_l2355_DUPLICATE_066c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2352_l2339_l2371_l2360_l2355_DUPLICATE_4f4e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2360_l2352_l2364_l2355_DUPLICATE_a0c7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2371_l2360_l2352_l2355_DUPLICATE_dbbc_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2352_l2371_l2364_l2360_l2355_DUPLICATE_ee1a_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2361_l2356_DUPLICATE_3a82_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e393_uxn_opcodes_h_l2379_l2334_DUPLICATE_7892_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_n16_high : unsigned(7 downto 0);
variable REG_VAR_n16_low : unsigned(7 downto 0);
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_n16_high := n16_high;
  REG_VAR_n16_low := n16_low;
  REG_VAR_t16 := t16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2344_c3_fdaa := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2344_c3_fdaa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_83c9_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2358_c3_6369 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2358_c3_6369;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2353_c3_b585 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2353_c3_b585;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4525_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_1487_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1cb7_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2362_c3_1074 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2362_c3_1074;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_252c_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_e526_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2349_c3_6fc7 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2349_c3_6fc7;
     VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_74e4_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_8eb4_right := to_unsigned(5, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_74e4_y := to_signed(-4, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_808c_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_f793_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2373_c3_cb0e := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_e526_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2373_c3_cb0e;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_74e4_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_4525_iffalse := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_4525_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_e526_iffalse := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_83c9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_808c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_f793_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1cb7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_252c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_8eb4_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_4525_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_e526_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4525_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_e526_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_c669_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_1487_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4525_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse := t16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2361_l2356_DUPLICATE_3a82 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2361_l2356_DUPLICATE_3a82_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2360_c11_1cb7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1cb7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1cb7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1cb7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1cb7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1cb7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1cb7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2371_c11_8eb4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2371_c11_8eb4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_8eb4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2371_c11_8eb4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_8eb4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_8eb4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2371_c11_8eb4_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2339_c2_0809] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2339_c2_0809_return_output := result.is_stack_index_flipped;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2339_c2_0809] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2339_c2_0809_return_output := result.is_pc_updated;

     -- sp_relative_shift[uxn_opcodes_h_l2366_c30_74e4] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2366_c30_74e4_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_74e4_ins;
     sp_relative_shift_uxn_opcodes_h_l2366_c30_74e4_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_74e4_x;
     sp_relative_shift_uxn_opcodes_h_l2366_c30_74e4_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_74e4_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_74e4_return_output := sp_relative_shift_uxn_opcodes_h_l2366_c30_74e4_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2360_c7_75a6] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2360_c7_75a6_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2352_l2371_l2364_l2360_l2355_DUPLICATE_ee1a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2352_l2371_l2364_l2360_l2355_DUPLICATE_ee1a_return_output := result.is_opc_done;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l2339_c2_0809] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2339_c2_0809_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2364_c11_252c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2364_c11_252c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_252c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2364_c11_252c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_252c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_252c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2364_c11_252c_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2352_l2339_l2371_l2360_l2355_DUPLICATE_4f4e LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2352_l2339_l2371_l2360_l2355_DUPLICATE_4f4e_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2360_l2352_l2364_l2355_DUPLICATE_a0c7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2360_l2352_l2364_l2355_DUPLICATE_a0c7_return_output := result.is_ram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2371_l2360_l2352_l2355_DUPLICATE_dbbc LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2371_l2360_l2352_l2355_DUPLICATE_dbbc_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2339_c6_83c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2339_c6_83c9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_83c9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2339_c6_83c9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_83c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_83c9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2339_c6_83c9_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2352_l2339_l2371_l2360_l2355_DUPLICATE_066c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2352_l2339_l2371_l2360_l2355_DUPLICATE_066c_return_output := result.u8_value;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2339_c2_0809] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2339_c2_0809_return_output := result.is_vram_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2374_c22_1487] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_1487_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_1487_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_1487_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_1487_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_1487_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_1487_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2352_c11_808c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2352_c11_808c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_808c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2352_c11_808c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_808c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_808c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2352_c11_808c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2355_c11_f793] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2355_c11_f793_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_f793_left;
     BIN_OP_EQ_uxn_opcodes_h_l2355_c11_f793_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_f793_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_f793_return_output := BIN_OP_EQ_uxn_opcodes_h_l2355_c11_f793_return_output;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_0809_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_83c9_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_0809_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_83c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_0809_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_83c9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_0809_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_83c9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_0809_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_83c9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_0809_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_83c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_0809_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_83c9_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_0809_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_83c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_0809_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_83c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_0809_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_83c9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_0809_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_83c9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_0809_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_83c9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2339_c2_0809_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_83c9_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_196b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_808c_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_196b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_808c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_196b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_808c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_196b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_808c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_196b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_808c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_196b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_808c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_196b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_808c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_196b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_808c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2352_c7_196b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_808c_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_fc52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_f793_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_fc52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_f793_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_fc52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_f793_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_fc52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_f793_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_fc52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_f793_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_fc52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_f793_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_fc52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_f793_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_fc52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_f793_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2355_c7_fc52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_f793_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_75a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1cb7_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_75a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1cb7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_75a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1cb7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_75a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1cb7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_75a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1cb7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_75a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1cb7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_75a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1cb7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_75a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1cb7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2360_c7_75a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_1cb7_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_4525_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_252c_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_4525_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_252c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4525_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_252c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4525_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_252c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4525_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_252c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4525_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_252c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4525_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_252c_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_e526_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_8eb4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_e526_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_8eb4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_e526_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_8eb4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_e526_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_8eb4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_e526_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_8eb4_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l2374_c3_d1ff := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_1487_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_c669_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2361_l2356_DUPLICATE_3a82_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2357_c3_95eb_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2361_l2356_DUPLICATE_3a82_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2371_l2360_l2352_l2355_DUPLICATE_dbbc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2371_l2360_l2352_l2355_DUPLICATE_dbbc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2371_l2360_l2352_l2355_DUPLICATE_dbbc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_e526_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2371_l2360_l2352_l2355_DUPLICATE_dbbc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2352_l2339_l2371_l2360_l2355_DUPLICATE_4f4e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2352_l2339_l2371_l2360_l2355_DUPLICATE_4f4e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2352_l2339_l2371_l2360_l2355_DUPLICATE_4f4e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2352_l2339_l2371_l2360_l2355_DUPLICATE_4f4e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_e526_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2352_l2339_l2371_l2360_l2355_DUPLICATE_4f4e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2352_l2371_l2364_l2360_l2355_DUPLICATE_ee1a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2352_l2371_l2364_l2360_l2355_DUPLICATE_ee1a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2352_l2371_l2364_l2360_l2355_DUPLICATE_ee1a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4525_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2352_l2371_l2364_l2360_l2355_DUPLICATE_ee1a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_e526_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2352_l2371_l2364_l2360_l2355_DUPLICATE_ee1a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2360_l2352_l2364_l2355_DUPLICATE_a0c7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2360_l2352_l2364_l2355_DUPLICATE_a0c7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2360_l2352_l2364_l2355_DUPLICATE_a0c7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4525_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2360_l2352_l2364_l2355_DUPLICATE_a0c7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2352_l2339_l2371_l2360_l2355_DUPLICATE_066c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2352_l2339_l2371_l2360_l2355_DUPLICATE_066c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2352_l2339_l2371_l2360_l2355_DUPLICATE_066c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2352_l2339_l2371_l2360_l2355_DUPLICATE_066c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_e526_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2352_l2339_l2371_l2360_l2355_DUPLICATE_066c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2339_c2_0809_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2339_c2_0809_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2339_c2_0809_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2339_c2_0809_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2360_c7_75a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4525_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_74e4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_e526_iftrue := VAR_result_u16_value_uxn_opcodes_h_l2374_c3_d1ff;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2339_c2_0809] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_0809_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_0809_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_0809_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_0809_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2339_c2_0809] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_0809_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_0809_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_0809_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_0809_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2364_c7_4525] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4525_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4525_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4525_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4525_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4525_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4525_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4525_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4525_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2339_c2_0809] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_0809_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_0809_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_0809_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_0809_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2371_c7_e526] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_e526_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_e526_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_e526_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_e526_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_e526_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_e526_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_e526_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_e526_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2357_c3_95eb] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2357_c3_95eb_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2357_c3_95eb_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2357_c3_95eb_return_output := CONST_SL_8_uxn_opcodes_h_l2357_c3_95eb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2360_c7_75a6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_75a6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_75a6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2364_c7_4525] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2364_c7_4525_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_4525_cond;
     n16_high_MUX_uxn_opcodes_h_l2364_c7_4525_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_4525_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2364_c7_4525_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_4525_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_4525_return_output := n16_high_MUX_uxn_opcodes_h_l2364_c7_4525_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2339_c2_0809] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_0809_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_0809_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_0809_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_0809_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2371_c7_e526] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2371_c7_e526_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_e526_cond;
     n16_low_MUX_uxn_opcodes_h_l2371_c7_e526_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_e526_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2371_c7_e526_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_e526_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_e526_return_output := n16_low_MUX_uxn_opcodes_h_l2371_c7_e526_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2371_c7_e526] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2371_c7_e526_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_e526_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2371_c7_e526_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_e526_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2371_c7_e526_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_e526_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_e526_return_output := result_u16_value_MUX_uxn_opcodes_h_l2371_c7_e526_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2361_c3_c669] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2361_c3_c669_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_c669_left;
     BIN_OP_OR_uxn_opcodes_h_l2361_c3_c669_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_c669_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_c669_return_output := BIN_OP_OR_uxn_opcodes_h_l2361_c3_c669_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2371_c7_e526] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2371_c7_e526_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_e526_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2371_c7_e526_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_e526_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2371_c7_e526_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_e526_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_e526_return_output := result_u8_value_MUX_uxn_opcodes_h_l2371_c7_e526_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2371_c7_e526] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_e526_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_e526_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_e526_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_e526_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_e526_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_e526_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_e526_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_e526_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_c669_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2357_c3_95eb_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_4525_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_4525_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_e526_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4525_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_e526_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4525_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4525_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_e526_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4525_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_e526_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4525_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_e526_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l2364_c7_4525] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2364_c7_4525_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_4525_cond;
     n16_low_MUX_uxn_opcodes_h_l2364_c7_4525_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_4525_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2364_c7_4525_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_4525_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_4525_return_output := n16_low_MUX_uxn_opcodes_h_l2364_c7_4525_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2355_c7_fc52] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_fc52_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_fc52_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2364_c7_4525] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4525_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4525_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4525_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4525_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4525_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4525_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4525_return_output := result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4525_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2364_c7_4525] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4525_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4525_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4525_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4525_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4525_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4525_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4525_return_output := result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4525_return_output;

     -- t16_MUX[uxn_opcodes_h_l2360_c7_75a6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2360_c7_75a6_cond <= VAR_t16_MUX_uxn_opcodes_h_l2360_c7_75a6_cond;
     t16_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue;
     t16_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output := t16_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2360_c7_75a6] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_75a6_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_75a6_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2364_c7_4525] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4525_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4525_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4525_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4525_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4525_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4525_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4525_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4525_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2364_c7_4525] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4525_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4525_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4525_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4525_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4525_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4525_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4525_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4525_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2360_c7_75a6] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2360_c7_75a6_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_75a6_cond;
     n16_high_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output := n16_high_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_4525_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4525_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4525_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4525_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4525_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output;
     -- t16_MUX[uxn_opcodes_h_l2355_c7_fc52] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2355_c7_fc52_cond <= VAR_t16_MUX_uxn_opcodes_h_l2355_c7_fc52_cond;
     t16_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue;
     t16_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output := t16_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2355_c7_fc52] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2355_c7_fc52_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_fc52_cond;
     n16_high_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output := n16_high_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2360_c7_75a6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_75a6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_75a6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2352_c7_196b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_196b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_196b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_196b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_196b_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2360_c7_75a6] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2360_c7_75a6_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_75a6_cond;
     n16_low_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output := n16_low_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2360_c7_75a6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2360_c7_75a6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_75a6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2360_c7_75a6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_75a6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_75a6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2360_c7_75a6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2360_c7_75a6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_75a6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_75a6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_75a6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output := result_u16_value_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2355_c7_fc52] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_fc52_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_fc52_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_196b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_75a6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2339_c2_0809] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_0809_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_0809_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_0809_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_0809_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2355_c7_fc52] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2355_c7_fc52_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_fc52_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output := result_u8_value_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2352_c7_196b] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_196b_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_196b_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_196b_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_196b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2355_c7_fc52] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_fc52_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_fc52_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2355_c7_fc52] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_fc52_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_fc52_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output;

     -- t16_MUX[uxn_opcodes_h_l2352_c7_196b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2352_c7_196b_cond <= VAR_t16_MUX_uxn_opcodes_h_l2352_c7_196b_cond;
     t16_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue;
     t16_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2352_c7_196b_return_output := t16_MUX_uxn_opcodes_h_l2352_c7_196b_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2355_c7_fc52] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2355_c7_fc52_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_fc52_cond;
     n16_low_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output := n16_low_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2352_c7_196b] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2352_c7_196b_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_196b_cond;
     n16_high_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_196b_return_output := n16_high_MUX_uxn_opcodes_h_l2352_c7_196b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2355_c7_fc52] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2355_c7_fc52_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_fc52_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_fc52_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_fc52_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output := result_u16_value_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output;

     -- Submodule level 5
     VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_196b_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_196b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_fc52_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2352_c7_196b_return_output;
     -- n16_high_MUX[uxn_opcodes_h_l2339_c2_0809] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2339_c2_0809_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_0809_cond;
     n16_high_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_0809_return_output := n16_high_MUX_uxn_opcodes_h_l2339_c2_0809_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2352_c7_196b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2352_c7_196b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_196b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_196b_return_output := result_u16_value_MUX_uxn_opcodes_h_l2352_c7_196b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2339_c2_0809] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_0809_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_0809_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_0809_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_0809_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2352_c7_196b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_196b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_196b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_196b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_196b_return_output;

     -- t16_MUX[uxn_opcodes_h_l2339_c2_0809] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2339_c2_0809_cond <= VAR_t16_MUX_uxn_opcodes_h_l2339_c2_0809_cond;
     t16_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue;
     t16_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2339_c2_0809_return_output := t16_MUX_uxn_opcodes_h_l2339_c2_0809_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2352_c7_196b] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2352_c7_196b_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_196b_cond;
     n16_low_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_196b_return_output := n16_low_MUX_uxn_opcodes_h_l2352_c7_196b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2352_c7_196b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2352_c7_196b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_196b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_196b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2352_c7_196b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2352_c7_196b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_196b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_196b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_196b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_196b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_196b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_196b_return_output;

     -- Submodule level 6
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_0809_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_196b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_196b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_196b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_196b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_196b_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2339_c2_0809_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l2339_c2_0809] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2339_c2_0809_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_0809_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_0809_return_output := result_u16_value_MUX_uxn_opcodes_h_l2339_c2_0809_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2339_c2_0809] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2339_c2_0809_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_0809_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_0809_return_output := result_u8_value_MUX_uxn_opcodes_h_l2339_c2_0809_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2339_c2_0809] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2339_c2_0809_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_0809_cond;
     n16_low_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_0809_return_output := n16_low_MUX_uxn_opcodes_h_l2339_c2_0809_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2339_c2_0809] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_0809_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_0809_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_0809_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_0809_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2339_c2_0809] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_0809_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_0809_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_0809_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_0809_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_0809_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_0809_return_output;

     -- Submodule level 7
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_0809_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e393_uxn_opcodes_h_l2379_l2334_DUPLICATE_7892 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e393_uxn_opcodes_h_l2379_l2334_DUPLICATE_7892_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e393(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_0809_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_0809_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_0809_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_0809_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_0809_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_0809_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_0809_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_0809_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_0809_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_0809_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e393_uxn_opcodes_h_l2379_l2334_DUPLICATE_7892_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e393_uxn_opcodes_h_l2379_l2334_DUPLICATE_7892_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_n16_high <= REG_VAR_n16_high;
REG_COMB_n16_low <= REG_VAR_n16_low;
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     n16_high <= REG_COMB_n16_high;
     n16_low <= REG_COMB_n16_low;
     t16 <= REG_COMB_t16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
