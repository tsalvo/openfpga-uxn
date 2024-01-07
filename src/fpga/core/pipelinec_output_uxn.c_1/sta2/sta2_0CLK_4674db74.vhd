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
-- BIN_OP_EQ[uxn_opcodes_h_l2339_c6_2f51]
signal BIN_OP_EQ_uxn_opcodes_h_l2339_c6_2f51_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2339_c6_2f51_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2339_c6_2f51_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2339_c2_96b7]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_96b7_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2339_c2_96b7]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2339_c2_96b7]
signal result_u8_value_MUX_uxn_opcodes_h_l2339_c2_96b7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2339_c2_96b7]
signal result_u16_value_MUX_uxn_opcodes_h_l2339_c2_96b7_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2339_c2_96b7]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2339_c2_96b7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_96b7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2339_c2_96b7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_96b7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2339_c2_96b7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_96b7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2339_c2_96b7]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_96b7_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2339_c2_96b7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_96b7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2339_c2_96b7]
signal n16_high_MUX_uxn_opcodes_h_l2339_c2_96b7_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2339_c2_96b7]
signal n16_low_MUX_uxn_opcodes_h_l2339_c2_96b7_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2339_c2_96b7]
signal t16_MUX_uxn_opcodes_h_l2339_c2_96b7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2352_c11_9fdf]
signal BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9fdf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9fdf_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9fdf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2352_c7_d636]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_d636_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_d636_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2352_c7_d636]
signal result_u8_value_MUX_uxn_opcodes_h_l2352_c7_d636_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2352_c7_d636_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2352_c7_d636]
signal result_u16_value_MUX_uxn_opcodes_h_l2352_c7_d636_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2352_c7_d636_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2352_c7_d636]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_d636_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_d636_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2352_c7_d636]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_d636_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_d636_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2352_c7_d636]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_d636_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_d636_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2352_c7_d636]
signal n16_high_MUX_uxn_opcodes_h_l2352_c7_d636_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2352_c7_d636_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2352_c7_d636]
signal n16_low_MUX_uxn_opcodes_h_l2352_c7_d636_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2352_c7_d636_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2352_c7_d636]
signal t16_MUX_uxn_opcodes_h_l2352_c7_d636_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2352_c7_d636_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2355_c11_532b]
signal BIN_OP_EQ_uxn_opcodes_h_l2355_c11_532b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2355_c11_532b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2355_c11_532b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2355_c7_a90e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_a90e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2355_c7_a90e]
signal result_u8_value_MUX_uxn_opcodes_h_l2355_c7_a90e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2355_c7_a90e]
signal result_u16_value_MUX_uxn_opcodes_h_l2355_c7_a90e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2355_c7_a90e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_a90e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2355_c7_a90e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_a90e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2355_c7_a90e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_a90e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2355_c7_a90e]
signal n16_high_MUX_uxn_opcodes_h_l2355_c7_a90e_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2355_c7_a90e]
signal n16_low_MUX_uxn_opcodes_h_l2355_c7_a90e_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2355_c7_a90e]
signal t16_MUX_uxn_opcodes_h_l2355_c7_a90e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2357_c3_defd]
signal CONST_SL_8_uxn_opcodes_h_l2357_c3_defd_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2357_c3_defd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2360_c11_0aff]
signal BIN_OP_EQ_uxn_opcodes_h_l2360_c11_0aff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2360_c11_0aff_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2360_c11_0aff_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2360_c7_1e8c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2360_c7_1e8c]
signal result_u8_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2360_c7_1e8c]
signal result_u16_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2360_c7_1e8c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2360_c7_1e8c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2360_c7_1e8c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2360_c7_1e8c]
signal n16_high_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2360_c7_1e8c]
signal n16_low_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2360_c7_1e8c]
signal t16_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2361_c3_6734]
signal BIN_OP_OR_uxn_opcodes_h_l2361_c3_6734_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2361_c3_6734_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2361_c3_6734_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2364_c11_d997]
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c11_d997_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c11_d997_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c11_d997_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2364_c7_4964]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4964_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4964_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4964_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4964_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2364_c7_4964]
signal result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4964_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4964_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4964_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4964_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2364_c7_4964]
signal result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4964_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4964_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4964_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4964_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2364_c7_4964]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4964_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4964_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4964_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4964_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2364_c7_4964]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4964_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4964_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4964_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4964_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2364_c7_4964]
signal n16_high_MUX_uxn_opcodes_h_l2364_c7_4964_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2364_c7_4964_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2364_c7_4964_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2364_c7_4964_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2364_c7_4964]
signal n16_low_MUX_uxn_opcodes_h_l2364_c7_4964_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2364_c7_4964_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2364_c7_4964_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2364_c7_4964_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2366_c30_3c07]
signal sp_relative_shift_uxn_opcodes_h_l2366_c30_3c07_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2366_c30_3c07_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2366_c30_3c07_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2366_c30_3c07_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2371_c11_d59a]
signal BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d59a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d59a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d59a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2371_c7_64f5]
signal result_u8_value_MUX_uxn_opcodes_h_l2371_c7_64f5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2371_c7_64f5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2371_c7_64f5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2371_c7_64f5_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2371_c7_64f5]
signal result_u16_value_MUX_uxn_opcodes_h_l2371_c7_64f5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2371_c7_64f5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2371_c7_64f5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2371_c7_64f5_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2371_c7_64f5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_64f5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_64f5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_64f5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_64f5_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2371_c7_64f5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_64f5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_64f5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_64f5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_64f5_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2371_c7_64f5]
signal n16_low_MUX_uxn_opcodes_h_l2371_c7_64f5_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2371_c7_64f5_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2371_c7_64f5_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2371_c7_64f5_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2374_c22_7004]
signal BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_7004_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_7004_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_7004_return_output : unsigned(16 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_500b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_pc_updated := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.u16_value := ref_toks_4;
      base.is_ram_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_stack_write := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_stack_index_flipped := ref_toks_9;
      base.is_opc_done := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2339_c6_2f51
BIN_OP_EQ_uxn_opcodes_h_l2339_c6_2f51 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2339_c6_2f51_left,
BIN_OP_EQ_uxn_opcodes_h_l2339_c6_2f51_right,
BIN_OP_EQ_uxn_opcodes_h_l2339_c6_2f51_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_96b7
result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_96b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_96b7_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_96b7
result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_96b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2339_c2_96b7
result_u8_value_MUX_uxn_opcodes_h_l2339_c2_96b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2339_c2_96b7_cond,
result_u8_value_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2339_c2_96b7
result_u16_value_MUX_uxn_opcodes_h_l2339_c2_96b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2339_c2_96b7_cond,
result_u16_value_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_96b7
result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_96b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_96b7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_96b7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_96b7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_96b7
result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_96b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_96b7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_96b7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_96b7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_96b7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_96b7
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_96b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_96b7_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_96b7
result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_96b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_96b7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2339_c2_96b7
n16_high_MUX_uxn_opcodes_h_l2339_c2_96b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2339_c2_96b7_cond,
n16_high_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue,
n16_high_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse,
n16_high_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2339_c2_96b7
n16_low_MUX_uxn_opcodes_h_l2339_c2_96b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2339_c2_96b7_cond,
n16_low_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue,
n16_low_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse,
n16_low_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output);

-- t16_MUX_uxn_opcodes_h_l2339_c2_96b7
t16_MUX_uxn_opcodes_h_l2339_c2_96b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2339_c2_96b7_cond,
t16_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue,
t16_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse,
t16_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9fdf
BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9fdf : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9fdf_left,
BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9fdf_right,
BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9fdf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_d636
result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_d636 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_d636_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_d636_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2352_c7_d636
result_u8_value_MUX_uxn_opcodes_h_l2352_c7_d636 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2352_c7_d636_cond,
result_u8_value_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2352_c7_d636_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2352_c7_d636
result_u16_value_MUX_uxn_opcodes_h_l2352_c7_d636 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2352_c7_d636_cond,
result_u16_value_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2352_c7_d636_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_d636
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_d636 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_d636_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_d636_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_d636
result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_d636 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_d636_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_d636_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_d636
result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_d636 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_d636_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_d636_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2352_c7_d636
n16_high_MUX_uxn_opcodes_h_l2352_c7_d636 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2352_c7_d636_cond,
n16_high_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue,
n16_high_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse,
n16_high_MUX_uxn_opcodes_h_l2352_c7_d636_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2352_c7_d636
n16_low_MUX_uxn_opcodes_h_l2352_c7_d636 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2352_c7_d636_cond,
n16_low_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue,
n16_low_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse,
n16_low_MUX_uxn_opcodes_h_l2352_c7_d636_return_output);

-- t16_MUX_uxn_opcodes_h_l2352_c7_d636
t16_MUX_uxn_opcodes_h_l2352_c7_d636 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2352_c7_d636_cond,
t16_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue,
t16_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse,
t16_MUX_uxn_opcodes_h_l2352_c7_d636_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2355_c11_532b
BIN_OP_EQ_uxn_opcodes_h_l2355_c11_532b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2355_c11_532b_left,
BIN_OP_EQ_uxn_opcodes_h_l2355_c11_532b_right,
BIN_OP_EQ_uxn_opcodes_h_l2355_c11_532b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_a90e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_a90e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_a90e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2355_c7_a90e
result_u8_value_MUX_uxn_opcodes_h_l2355_c7_a90e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2355_c7_a90e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2355_c7_a90e
result_u16_value_MUX_uxn_opcodes_h_l2355_c7_a90e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2355_c7_a90e_cond,
result_u16_value_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_a90e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_a90e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_a90e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_a90e
result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_a90e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_a90e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_a90e
result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_a90e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_a90e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2355_c7_a90e
n16_high_MUX_uxn_opcodes_h_l2355_c7_a90e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2355_c7_a90e_cond,
n16_high_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue,
n16_high_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse,
n16_high_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2355_c7_a90e
n16_low_MUX_uxn_opcodes_h_l2355_c7_a90e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2355_c7_a90e_cond,
n16_low_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue,
n16_low_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse,
n16_low_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output);

-- t16_MUX_uxn_opcodes_h_l2355_c7_a90e
t16_MUX_uxn_opcodes_h_l2355_c7_a90e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2355_c7_a90e_cond,
t16_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue,
t16_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse,
t16_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2357_c3_defd
CONST_SL_8_uxn_opcodes_h_l2357_c3_defd : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2357_c3_defd_x,
CONST_SL_8_uxn_opcodes_h_l2357_c3_defd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2360_c11_0aff
BIN_OP_EQ_uxn_opcodes_h_l2360_c11_0aff : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2360_c11_0aff_left,
BIN_OP_EQ_uxn_opcodes_h_l2360_c11_0aff_right,
BIN_OP_EQ_uxn_opcodes_h_l2360_c11_0aff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_1e8c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_1e8c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2360_c7_1e8c
result_u8_value_MUX_uxn_opcodes_h_l2360_c7_1e8c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2360_c7_1e8c
result_u16_value_MUX_uxn_opcodes_h_l2360_c7_1e8c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond,
result_u16_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_1e8c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_1e8c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_1e8c
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_1e8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_1e8c
result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_1e8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2360_c7_1e8c
n16_high_MUX_uxn_opcodes_h_l2360_c7_1e8c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond,
n16_high_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue,
n16_high_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse,
n16_high_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2360_c7_1e8c
n16_low_MUX_uxn_opcodes_h_l2360_c7_1e8c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond,
n16_low_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue,
n16_low_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse,
n16_low_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output);

-- t16_MUX_uxn_opcodes_h_l2360_c7_1e8c
t16_MUX_uxn_opcodes_h_l2360_c7_1e8c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond,
t16_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue,
t16_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse,
t16_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2361_c3_6734
BIN_OP_OR_uxn_opcodes_h_l2361_c3_6734 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2361_c3_6734_left,
BIN_OP_OR_uxn_opcodes_h_l2361_c3_6734_right,
BIN_OP_OR_uxn_opcodes_h_l2361_c3_6734_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2364_c11_d997
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_d997 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_d997_left,
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_d997_right,
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_d997_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4964
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4964 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4964_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4964_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4964_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4964_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4964
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4964 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4964_cond,
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4964_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4964_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4964_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4964
result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4964 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4964_cond,
result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4964_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4964_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4964_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4964
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4964 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4964_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4964_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4964_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4964_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4964
result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4964 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4964_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4964_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4964_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4964_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2364_c7_4964
n16_high_MUX_uxn_opcodes_h_l2364_c7_4964 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2364_c7_4964_cond,
n16_high_MUX_uxn_opcodes_h_l2364_c7_4964_iftrue,
n16_high_MUX_uxn_opcodes_h_l2364_c7_4964_iffalse,
n16_high_MUX_uxn_opcodes_h_l2364_c7_4964_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2364_c7_4964
n16_low_MUX_uxn_opcodes_h_l2364_c7_4964 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2364_c7_4964_cond,
n16_low_MUX_uxn_opcodes_h_l2364_c7_4964_iftrue,
n16_low_MUX_uxn_opcodes_h_l2364_c7_4964_iffalse,
n16_low_MUX_uxn_opcodes_h_l2364_c7_4964_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2366_c30_3c07
sp_relative_shift_uxn_opcodes_h_l2366_c30_3c07 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2366_c30_3c07_ins,
sp_relative_shift_uxn_opcodes_h_l2366_c30_3c07_x,
sp_relative_shift_uxn_opcodes_h_l2366_c30_3c07_y,
sp_relative_shift_uxn_opcodes_h_l2366_c30_3c07_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d59a
BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d59a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d59a_left,
BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d59a_right,
BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d59a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2371_c7_64f5
result_u8_value_MUX_uxn_opcodes_h_l2371_c7_64f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2371_c7_64f5_cond,
result_u8_value_MUX_uxn_opcodes_h_l2371_c7_64f5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2371_c7_64f5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2371_c7_64f5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2371_c7_64f5
result_u16_value_MUX_uxn_opcodes_h_l2371_c7_64f5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2371_c7_64f5_cond,
result_u16_value_MUX_uxn_opcodes_h_l2371_c7_64f5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2371_c7_64f5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2371_c7_64f5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_64f5
result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_64f5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_64f5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_64f5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_64f5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_64f5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_64f5
result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_64f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_64f5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_64f5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_64f5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_64f5_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2371_c7_64f5
n16_low_MUX_uxn_opcodes_h_l2371_c7_64f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2371_c7_64f5_cond,
n16_low_MUX_uxn_opcodes_h_l2371_c7_64f5_iftrue,
n16_low_MUX_uxn_opcodes_h_l2371_c7_64f5_iffalse,
n16_low_MUX_uxn_opcodes_h_l2371_c7_64f5_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_7004
BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_7004 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_7004_left,
BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_7004_right,
BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_7004_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2339_c6_2f51_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output,
 n16_high_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output,
 n16_low_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output,
 t16_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9fdf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_d636_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2352_c7_d636_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2352_c7_d636_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_d636_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_d636_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_d636_return_output,
 n16_high_MUX_uxn_opcodes_h_l2352_c7_d636_return_output,
 n16_low_MUX_uxn_opcodes_h_l2352_c7_d636_return_output,
 t16_MUX_uxn_opcodes_h_l2352_c7_d636_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2355_c11_532b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output,
 n16_high_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output,
 n16_low_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output,
 t16_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output,
 CONST_SL_8_uxn_opcodes_h_l2357_c3_defd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2360_c11_0aff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output,
 n16_high_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output,
 n16_low_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output,
 t16_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2361_c3_6734_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2364_c11_d997_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4964_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4964_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4964_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4964_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4964_return_output,
 n16_high_MUX_uxn_opcodes_h_l2364_c7_4964_return_output,
 n16_low_MUX_uxn_opcodes_h_l2364_c7_4964_return_output,
 sp_relative_shift_uxn_opcodes_h_l2366_c30_3c07_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d59a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2371_c7_64f5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2371_c7_64f5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_64f5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_64f5_return_output,
 n16_low_MUX_uxn_opcodes_h_l2371_c7_64f5_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_7004_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_2f51_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_2f51_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_2f51_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2339_c2_96b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_96b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2339_c2_96b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_d636_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_96b7_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_d636_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_96b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_d636_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2344_c3_b072 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_d636_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_96b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2339_c2_96b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_96b7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2349_c3_bc1f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_d636_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_96b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2339_c2_96b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_96b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_d636_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_96b7_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_d636_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_96b7_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_d636_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_96b7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2352_c7_d636_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2339_c2_96b7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9fdf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9fdf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9fdf_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_d636_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_d636_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_d636_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2353_c3_a727 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_d636_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_d636_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_d636_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_d636_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_d636_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2352_c7_d636_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_532b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_532b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_532b_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_a90e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_a90e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_a90e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2358_c3_8815 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_a90e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_a90e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_a90e_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_a90e_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_a90e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2355_c7_a90e_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2357_c3_defd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2357_c3_defd_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_0aff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_0aff_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_0aff_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4964_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4964_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4964_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2362_c3_ded6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2360_c7_1e8c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4964_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4964_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_4964_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_4964_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_6734_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_6734_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_6734_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_d997_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_d997_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_d997_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4964_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4964_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_64f5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4964_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4964_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4964_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_64f5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4964_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4964_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4964_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_64f5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4964_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4964_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4964_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_64f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4964_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4964_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4964_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4964_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_4964_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_4964_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_4964_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_4964_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_4964_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_64f5_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_4964_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_3c07_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_3c07_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_3c07_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_3c07_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d59a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d59a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d59a_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_64f5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_64f5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_64f5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_64f5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l2374_c3_fa0b : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_64f5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_64f5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_64f5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2373_c3_c5c2 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_64f5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_64f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_64f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_64f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_64f5_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_64f5_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_64f5_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_64f5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_7004_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_7004_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_7004_return_output : unsigned(16 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2339_l2371_DUPLICATE_f5ed_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2339_l2371_DUPLICATE_01a6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2371_l2360_l2352_l2355_DUPLICATE_c2a6_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2371_l2364_DUPLICATE_6fe2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2360_l2352_l2364_l2355_DUPLICATE_4a80_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2356_l2361_DUPLICATE_48f8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l2379_l2334_DUPLICATE_06ca_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_2f51_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_532b_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_d997_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2362_c3_ded6 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2362_c3_ded6;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2373_c3_c5c2 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_64f5_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2373_c3_c5c2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d59a_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2358_c3_8815 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2358_c3_8815;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9fdf_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_3c07_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_7004_right := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_64f5_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2349_c3_bc1f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2349_c3_bc1f;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_0aff_right := to_unsigned(3, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4964_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_3c07_y := to_signed(-4, 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2344_c3_b072 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2344_c3_b072;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2353_c3_a727 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2353_c3_a727;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_3c07_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_4964_iffalse := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_4964_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_64f5_iffalse := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_2f51_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9fdf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_532b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_0aff_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_d997_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d59a_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_4964_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_64f5_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4964_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_64f5_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_6734_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_7004_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4964_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse := t16;
     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2339_c2_96b7] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2339_c2_96b7_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2371_c11_d59a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d59a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d59a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d59a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d59a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d59a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d59a_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2339_l2371_DUPLICATE_f5ed LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2339_l2371_DUPLICATE_f5ed_return_output := result.u8_value;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2339_l2371_DUPLICATE_01a6 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2339_l2371_DUPLICATE_01a6_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2352_c11_9fdf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9fdf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9fdf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9fdf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9fdf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9fdf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9fdf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2339_c6_2f51] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2339_c6_2f51_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_2f51_left;
     BIN_OP_EQ_uxn_opcodes_h_l2339_c6_2f51_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_2f51_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_2f51_return_output := BIN_OP_EQ_uxn_opcodes_h_l2339_c6_2f51_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2355_c11_532b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2355_c11_532b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_532b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2355_c11_532b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_532b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_532b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2355_c11_532b_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2339_c2_96b7] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2339_c2_96b7_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2371_l2360_l2352_l2355_DUPLICATE_c2a6 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2371_l2360_l2352_l2355_DUPLICATE_c2a6_return_output := result.sp_relative_shift;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2339_c2_96b7] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2339_c2_96b7_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2360_l2352_l2364_l2355_DUPLICATE_4a80 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2360_l2352_l2364_l2355_DUPLICATE_4a80_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2364_c11_d997] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2364_c11_d997_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_d997_left;
     BIN_OP_EQ_uxn_opcodes_h_l2364_c11_d997_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_d997_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_d997_return_output := BIN_OP_EQ_uxn_opcodes_h_l2364_c11_d997_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2360_c11_0aff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2360_c11_0aff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_0aff_left;
     BIN_OP_EQ_uxn_opcodes_h_l2360_c11_0aff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_0aff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_0aff_return_output := BIN_OP_EQ_uxn_opcodes_h_l2360_c11_0aff_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2374_c22_7004] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_7004_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_7004_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_7004_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_7004_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_7004_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_7004_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2371_l2364_DUPLICATE_6fe2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2371_l2364_DUPLICATE_6fe2_return_output := result.is_opc_done;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2360_c7_1e8c] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2360_c7_1e8c_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l2366_c30_3c07] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2366_c30_3c07_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_3c07_ins;
     sp_relative_shift_uxn_opcodes_h_l2366_c30_3c07_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_3c07_x;
     sp_relative_shift_uxn_opcodes_h_l2366_c30_3c07_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_3c07_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_3c07_return_output := sp_relative_shift_uxn_opcodes_h_l2366_c30_3c07_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l2339_c2_96b7] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2339_c2_96b7_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2356_l2361_DUPLICATE_48f8 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2356_l2361_DUPLICATE_48f8_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_96b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_2f51_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_96b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_2f51_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_96b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_2f51_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_96b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_2f51_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_2f51_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_96b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_2f51_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_96b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_2f51_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_2f51_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_96b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_2f51_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_96b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_2f51_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_96b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_2f51_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_96b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_2f51_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2339_c2_96b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2339_c6_2f51_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_d636_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9fdf_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_d636_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9fdf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_d636_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9fdf_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_d636_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9fdf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_d636_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9fdf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_d636_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9fdf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_d636_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9fdf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_d636_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9fdf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2352_c7_d636_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2352_c11_9fdf_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_a90e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_532b_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_a90e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_532b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_a90e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_532b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_a90e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_532b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_a90e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_532b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_a90e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_532b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_a90e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_532b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_a90e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_532b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2355_c7_a90e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2355_c11_532b_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_0aff_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_0aff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_0aff_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_0aff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_0aff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_0aff_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_0aff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_0aff_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2360_c11_0aff_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_4964_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_d997_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_4964_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_d997_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4964_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_d997_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4964_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_d997_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4964_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_d997_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4964_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_d997_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4964_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_d997_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_64f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d59a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_64f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d59a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_64f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d59a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_64f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d59a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_64f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2371_c11_d59a_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l2374_c3_fa0b := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2374_c22_7004_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_6734_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2356_l2361_DUPLICATE_48f8_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2357_c3_defd_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2356_l2361_DUPLICATE_48f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2371_l2360_l2352_l2355_DUPLICATE_c2a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2371_l2360_l2352_l2355_DUPLICATE_c2a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2371_l2360_l2352_l2355_DUPLICATE_c2a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_64f5_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2371_l2360_l2352_l2355_DUPLICATE_c2a6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2339_l2371_DUPLICATE_01a6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2339_l2371_DUPLICATE_01a6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2339_l2371_DUPLICATE_01a6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2339_l2371_DUPLICATE_01a6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_64f5_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2339_l2371_DUPLICATE_01a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2371_l2364_DUPLICATE_6fe2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2371_l2364_DUPLICATE_6fe2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2371_l2364_DUPLICATE_6fe2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4964_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2371_l2364_DUPLICATE_6fe2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_64f5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2371_l2364_DUPLICATE_6fe2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2360_l2352_l2364_l2355_DUPLICATE_4a80_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2360_l2352_l2364_l2355_DUPLICATE_4a80_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2360_l2352_l2364_l2355_DUPLICATE_4a80_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4964_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2360_l2352_l2364_l2355_DUPLICATE_4a80_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2339_l2371_DUPLICATE_f5ed_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2339_l2371_DUPLICATE_f5ed_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2339_l2371_DUPLICATE_f5ed_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2339_l2371_DUPLICATE_f5ed_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_64f5_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2360_l2355_l2352_l2339_l2371_DUPLICATE_f5ed_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2339_c2_96b7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2339_c2_96b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2339_c2_96b7_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2339_c2_96b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2360_c7_1e8c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4964_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2366_c30_3c07_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_64f5_iftrue := VAR_result_u16_value_uxn_opcodes_h_l2374_c3_fa0b;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2339_c2_96b7] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_96b7_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_96b7_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2371_c7_64f5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2371_c7_64f5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_64f5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2371_c7_64f5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_64f5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2371_c7_64f5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_64f5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_64f5_return_output := result_u8_value_MUX_uxn_opcodes_h_l2371_c7_64f5_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2357_c3_defd] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2357_c3_defd_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2357_c3_defd_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2357_c3_defd_return_output := CONST_SL_8_uxn_opcodes_h_l2357_c3_defd_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2371_c7_64f5] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2371_c7_64f5_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_64f5_cond;
     n16_low_MUX_uxn_opcodes_h_l2371_c7_64f5_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_64f5_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2371_c7_64f5_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_64f5_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_64f5_return_output := n16_low_MUX_uxn_opcodes_h_l2371_c7_64f5_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2364_c7_4964] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4964_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4964_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4964_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4964_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4964_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4964_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4964_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4964_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2371_c7_64f5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_64f5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_64f5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_64f5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_64f5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_64f5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_64f5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_64f5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_64f5_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2339_c2_96b7] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_96b7_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_96b7_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2364_c7_4964] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2364_c7_4964_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_4964_cond;
     n16_high_MUX_uxn_opcodes_h_l2364_c7_4964_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_4964_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2364_c7_4964_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_4964_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_4964_return_output := n16_high_MUX_uxn_opcodes_h_l2364_c7_4964_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2371_c7_64f5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_64f5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_64f5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_64f5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_64f5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_64f5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_64f5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_64f5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_64f5_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2371_c7_64f5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2371_c7_64f5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_64f5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2371_c7_64f5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_64f5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2371_c7_64f5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_64f5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_64f5_return_output := result_u16_value_MUX_uxn_opcodes_h_l2371_c7_64f5_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2339_c2_96b7] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2360_c7_1e8c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2361_c3_6734] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2361_c3_6734_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_6734_left;
     BIN_OP_OR_uxn_opcodes_h_l2361_c3_6734_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_6734_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_6734_return_output := BIN_OP_OR_uxn_opcodes_h_l2361_c3_6734_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2339_c2_96b7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_96b7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_96b7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2361_c3_6734_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2357_c3_defd_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2364_c7_4964_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_4964_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2371_c7_64f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4964_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2371_c7_64f5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2364_c7_4964_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4964_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2371_c7_64f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4964_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2371_c7_64f5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4964_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2371_c7_64f5_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l2364_c7_4964] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4964_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4964_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4964_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4964_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4964_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4964_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4964_return_output := result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4964_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2360_c7_1e8c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output;

     -- t16_MUX[uxn_opcodes_h_l2360_c7_1e8c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond <= VAR_t16_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond;
     t16_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue;
     t16_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output := t16_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2360_c7_1e8c] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond;
     n16_high_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output := n16_high_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2364_c7_4964] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4964_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4964_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4964_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4964_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4964_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4964_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4964_return_output := result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4964_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2364_c7_4964] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2364_c7_4964_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_4964_cond;
     n16_low_MUX_uxn_opcodes_h_l2364_c7_4964_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_4964_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2364_c7_4964_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_4964_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_4964_return_output := n16_low_MUX_uxn_opcodes_h_l2364_c7_4964_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2364_c7_4964] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4964_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4964_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4964_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4964_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4964_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4964_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4964_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4964_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2364_c7_4964] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4964_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4964_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4964_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4964_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4964_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4964_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4964_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4964_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2355_c7_a90e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_a90e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_a90e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2364_c7_4964_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_4964_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_4964_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2364_c7_4964_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_4964_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output;
     -- n16_high_MUX[uxn_opcodes_h_l2355_c7_a90e] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2355_c7_a90e_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_a90e_cond;
     n16_high_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output := n16_high_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2360_c7_1e8c] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond;
     n16_low_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output := n16_low_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2355_c7_a90e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_a90e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_a90e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2352_c7_d636] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_d636_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_d636_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_d636_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_d636_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2360_c7_1e8c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output := result_u16_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2360_c7_1e8c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2360_c7_1e8c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2360_c7_1e8c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_1e8c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_1e8c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_1e8c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output;

     -- t16_MUX[uxn_opcodes_h_l2355_c7_a90e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2355_c7_a90e_cond <= VAR_t16_MUX_uxn_opcodes_h_l2355_c7_a90e_cond;
     t16_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue;
     t16_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output := t16_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2352_c7_d636_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2360_c7_1e8c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2339_c2_96b7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_96b7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_96b7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2352_c7_d636] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_d636_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_d636_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_d636_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_d636_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2355_c7_a90e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2355_c7_a90e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_a90e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2355_c7_a90e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_a90e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_a90e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output;

     -- t16_MUX[uxn_opcodes_h_l2352_c7_d636] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2352_c7_d636_cond <= VAR_t16_MUX_uxn_opcodes_h_l2352_c7_d636_cond;
     t16_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue;
     t16_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2352_c7_d636_return_output := t16_MUX_uxn_opcodes_h_l2352_c7_d636_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2355_c7_a90e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_a90e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_a90e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2355_c7_a90e] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2355_c7_a90e_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_a90e_cond;
     n16_low_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output := n16_low_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2355_c7_a90e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2355_c7_a90e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_a90e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_a90e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_a90e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output := result_u16_value_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2352_c7_d636] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2352_c7_d636_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_d636_cond;
     n16_high_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_d636_return_output := n16_high_MUX_uxn_opcodes_h_l2352_c7_d636_return_output;

     -- Submodule level 5
     VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2352_c7_d636_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2352_c7_d636_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2355_c7_a90e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2352_c7_d636_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2339_c2_96b7] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2352_c7_d636] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_d636_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_d636_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_d636_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_d636_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2352_c7_d636] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_d636_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_d636_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_d636_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_d636_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2352_c7_d636] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2352_c7_d636_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_d636_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_d636_return_output := result_u8_value_MUX_uxn_opcodes_h_l2352_c7_d636_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2339_c2_96b7] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2339_c2_96b7_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_96b7_cond;
     n16_high_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output := n16_high_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output;

     -- t16_MUX[uxn_opcodes_h_l2339_c2_96b7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2339_c2_96b7_cond <= VAR_t16_MUX_uxn_opcodes_h_l2339_c2_96b7_cond;
     t16_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue;
     t16_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output := t16_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2352_c7_d636] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2352_c7_d636_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_d636_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_d636_return_output := result_u16_value_MUX_uxn_opcodes_h_l2352_c7_d636_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2352_c7_d636] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2352_c7_d636_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_d636_cond;
     n16_low_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_d636_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_d636_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_d636_return_output := n16_low_MUX_uxn_opcodes_h_l2352_c7_d636_return_output;

     -- Submodule level 6
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2352_c7_d636_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2352_c7_d636_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2352_c7_d636_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2352_c7_d636_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2352_c7_d636_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2339_c2_96b7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_96b7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_96b7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2339_c2_96b7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2339_c2_96b7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_96b7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output := result_u8_value_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2339_c2_96b7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_96b7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_96b7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2339_c2_96b7] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2339_c2_96b7_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_96b7_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output := result_u16_value_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2339_c2_96b7] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2339_c2_96b7_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_96b7_cond;
     n16_low_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_96b7_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_96b7_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output := n16_low_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output;

     -- Submodule level 7
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l2379_l2334_DUPLICATE_06ca LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l2379_l2334_DUPLICATE_06ca_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_500b(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2339_c2_96b7_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l2379_l2334_DUPLICATE_06ca_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l2379_l2334_DUPLICATE_06ca_return_output;
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
