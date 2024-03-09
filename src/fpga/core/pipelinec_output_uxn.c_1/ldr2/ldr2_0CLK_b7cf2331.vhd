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
-- Submodules: 61
entity ldr2_0CLK_b7cf2331 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ldr2_0CLK_b7cf2331;
architecture arch of ldr2_0CLK_b7cf2331 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8_high : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8_low : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp8_high : unsigned(7 downto 0);
signal REG_COMB_tmp8_low : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1639_c6_4c4a]
signal BIN_OP_EQ_uxn_opcodes_h_l1639_c6_4c4a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1639_c6_4c4a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1639_c6_4c4a_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1639_c2_b9a0]
signal tmp8_high_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1639_c2_b9a0]
signal tmp8_low_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1639_c2_b9a0]
signal t8_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1639_c2_b9a0]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1639_c2_b9a0]
signal result_u16_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1639_c2_b9a0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1639_c2_b9a0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1639_c2_b9a0]
signal result_u8_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1639_c2_b9a0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1639_c2_b9a0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1639_c2_b9a0]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1639_c2_b9a0]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1639_c2_b9a0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1652_c11_396e]
signal BIN_OP_EQ_uxn_opcodes_h_l1652_c11_396e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1652_c11_396e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1652_c11_396e_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1652_c7_c5c9]
signal tmp8_high_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1652_c7_c5c9]
signal tmp8_low_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1652_c7_c5c9]
signal t8_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1652_c7_c5c9]
signal result_u16_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1652_c7_c5c9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1652_c7_c5c9]
signal result_u8_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1652_c7_c5c9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1652_c7_c5c9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1652_c7_c5c9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output : signed(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1653_c30_edb8]
signal sp_relative_shift_uxn_opcodes_h_l1653_c30_edb8_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1653_c30_edb8_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1653_c30_edb8_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1653_c30_edb8_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1655_c11_2798]
signal BIN_OP_EQ_uxn_opcodes_h_l1655_c11_2798_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1655_c11_2798_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1655_c11_2798_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1655_c7_a4f2]
signal tmp8_high_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1655_c7_a4f2]
signal tmp8_low_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1655_c7_a4f2]
signal t8_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1655_c7_a4f2]
signal result_u16_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1655_c7_a4f2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1655_c7_a4f2]
signal result_u8_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1655_c7_a4f2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1655_c7_a4f2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1655_c7_a4f2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1658_c22_4b13]
signal BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_4b13_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_4b13_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_4b13_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1660_c11_ea2a]
signal BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ea2a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ea2a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ea2a_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1660_c7_0f24]
signal tmp8_high_MUX_uxn_opcodes_h_l1660_c7_0f24_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1660_c7_0f24_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1660_c7_0f24_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1660_c7_0f24]
signal tmp8_low_MUX_uxn_opcodes_h_l1660_c7_0f24_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1660_c7_0f24_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1660_c7_0f24_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1660_c7_0f24]
signal result_u16_value_MUX_uxn_opcodes_h_l1660_c7_0f24_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1660_c7_0f24_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1660_c7_0f24_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1660_c7_0f24]
signal result_u8_value_MUX_uxn_opcodes_h_l1660_c7_0f24_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1660_c7_0f24_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1660_c7_0f24_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1660_c7_0f24]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_0f24_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_0f24_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_0f24_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1660_c7_0f24]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_0f24_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_0f24_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_0f24_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1660_c7_0f24]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_0f24_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_0f24_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_0f24_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output : unsigned(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1661_c22_aa70]
signal BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_aa70_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_aa70_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_aa70_return_output : signed(17 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1661_c22_5b79]
signal BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_5b79_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_5b79_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_5b79_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1663_c11_3750]
signal BIN_OP_EQ_uxn_opcodes_h_l1663_c11_3750_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1663_c11_3750_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1663_c11_3750_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1663_c7_9627]
signal tmp8_high_MUX_uxn_opcodes_h_l1663_c7_9627_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1663_c7_9627_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1663_c7_9627_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1663_c7_9627_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1663_c7_9627]
signal tmp8_low_MUX_uxn_opcodes_h_l1663_c7_9627_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1663_c7_9627_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1663_c7_9627_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1663_c7_9627_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1663_c7_9627]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_9627_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_9627_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_9627_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_9627_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1663_c7_9627]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_9627_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_9627_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_9627_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_9627_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1663_c7_9627]
signal result_u8_value_MUX_uxn_opcodes_h_l1663_c7_9627_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1663_c7_9627_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1663_c7_9627_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1663_c7_9627_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1663_c7_9627]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_9627_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_9627_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_9627_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_9627_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1669_c11_1a09]
signal BIN_OP_EQ_uxn_opcodes_h_l1669_c11_1a09_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1669_c11_1a09_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1669_c11_1a09_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1669_c7_00a2]
signal tmp8_low_MUX_uxn_opcodes_h_l1669_c7_00a2_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1669_c7_00a2_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1669_c7_00a2_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1669_c7_00a2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1669_c7_00a2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_00a2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_00a2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_00a2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_00a2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1669_c7_00a2]
signal result_u8_value_MUX_uxn_opcodes_h_l1669_c7_00a2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1669_c7_00a2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1669_c7_00a2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1669_c7_00a2_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1669_c7_00a2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_00a2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_00a2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_00a2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_00a2_return_output : unsigned(3 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_d9be( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_vram_write := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.is_pc_updated := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.is_stack_index_flipped := ref_toks_9;
      base.sp_relative_shift := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1639_c6_4c4a
BIN_OP_EQ_uxn_opcodes_h_l1639_c6_4c4a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1639_c6_4c4a_left,
BIN_OP_EQ_uxn_opcodes_h_l1639_c6_4c4a_right,
BIN_OP_EQ_uxn_opcodes_h_l1639_c6_4c4a_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1639_c2_b9a0
tmp8_high_MUX_uxn_opcodes_h_l1639_c2_b9a0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond,
tmp8_high_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1639_c2_b9a0
tmp8_low_MUX_uxn_opcodes_h_l1639_c2_b9a0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond,
tmp8_low_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output);

-- t8_MUX_uxn_opcodes_h_l1639_c2_b9a0
t8_MUX_uxn_opcodes_h_l1639_c2_b9a0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond,
t8_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue,
t8_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse,
t8_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0
result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1639_c2_b9a0
result_u16_value_MUX_uxn_opcodes_h_l1639_c2_b9a0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond,
result_u16_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_b9a0
result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_b9a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_b9a0
result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_b9a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1639_c2_b9a0
result_u8_value_MUX_uxn_opcodes_h_l1639_c2_b9a0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_b9a0
result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_b9a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_b9a0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_b9a0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0
result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_b9a0
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_b9a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_b9a0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_b9a0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1652_c11_396e
BIN_OP_EQ_uxn_opcodes_h_l1652_c11_396e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1652_c11_396e_left,
BIN_OP_EQ_uxn_opcodes_h_l1652_c11_396e_right,
BIN_OP_EQ_uxn_opcodes_h_l1652_c11_396e_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1652_c7_c5c9
tmp8_high_MUX_uxn_opcodes_h_l1652_c7_c5c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond,
tmp8_high_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1652_c7_c5c9
tmp8_low_MUX_uxn_opcodes_h_l1652_c7_c5c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond,
tmp8_low_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output);

-- t8_MUX_uxn_opcodes_h_l1652_c7_c5c9
t8_MUX_uxn_opcodes_h_l1652_c7_c5c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond,
t8_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue,
t8_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse,
t8_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1652_c7_c5c9
result_u16_value_MUX_uxn_opcodes_h_l1652_c7_c5c9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond,
result_u16_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_c5c9
result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_c5c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1652_c7_c5c9
result_u8_value_MUX_uxn_opcodes_h_l1652_c7_c5c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond,
result_u8_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_c5c9
result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_c5c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_c5c9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_c5c9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_c5c9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_c5c9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1653_c30_edb8
sp_relative_shift_uxn_opcodes_h_l1653_c30_edb8 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1653_c30_edb8_ins,
sp_relative_shift_uxn_opcodes_h_l1653_c30_edb8_x,
sp_relative_shift_uxn_opcodes_h_l1653_c30_edb8_y,
sp_relative_shift_uxn_opcodes_h_l1653_c30_edb8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1655_c11_2798
BIN_OP_EQ_uxn_opcodes_h_l1655_c11_2798 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1655_c11_2798_left,
BIN_OP_EQ_uxn_opcodes_h_l1655_c11_2798_right,
BIN_OP_EQ_uxn_opcodes_h_l1655_c11_2798_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1655_c7_a4f2
tmp8_high_MUX_uxn_opcodes_h_l1655_c7_a4f2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond,
tmp8_high_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1655_c7_a4f2
tmp8_low_MUX_uxn_opcodes_h_l1655_c7_a4f2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond,
tmp8_low_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output);

-- t8_MUX_uxn_opcodes_h_l1655_c7_a4f2
t8_MUX_uxn_opcodes_h_l1655_c7_a4f2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond,
t8_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue,
t8_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse,
t8_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1655_c7_a4f2
result_u16_value_MUX_uxn_opcodes_h_l1655_c7_a4f2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond,
result_u16_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_a4f2
result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_a4f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1655_c7_a4f2
result_u8_value_MUX_uxn_opcodes_h_l1655_c7_a4f2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_a4f2
result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_a4f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_a4f2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_a4f2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_a4f2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_a4f2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_4b13
BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_4b13 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_4b13_left,
BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_4b13_right,
BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_4b13_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ea2a
BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ea2a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ea2a_left,
BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ea2a_right,
BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ea2a_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1660_c7_0f24
tmp8_high_MUX_uxn_opcodes_h_l1660_c7_0f24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1660_c7_0f24_cond,
tmp8_high_MUX_uxn_opcodes_h_l1660_c7_0f24_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1660_c7_0f24_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1660_c7_0f24
tmp8_low_MUX_uxn_opcodes_h_l1660_c7_0f24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1660_c7_0f24_cond,
tmp8_low_MUX_uxn_opcodes_h_l1660_c7_0f24_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1660_c7_0f24_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1660_c7_0f24
result_u16_value_MUX_uxn_opcodes_h_l1660_c7_0f24 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1660_c7_0f24_cond,
result_u16_value_MUX_uxn_opcodes_h_l1660_c7_0f24_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1660_c7_0f24_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1660_c7_0f24
result_u8_value_MUX_uxn_opcodes_h_l1660_c7_0f24 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1660_c7_0f24_cond,
result_u8_value_MUX_uxn_opcodes_h_l1660_c7_0f24_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1660_c7_0f24_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_0f24
result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_0f24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_0f24_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_0f24_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_0f24_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_0f24
result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_0f24 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_0f24_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_0f24_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_0f24_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_0f24
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_0f24 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_0f24_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_0f24_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_0f24_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_aa70
BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_aa70 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_aa70_left,
BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_aa70_right,
BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_aa70_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_5b79
BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_5b79 : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_5b79_left,
BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_5b79_right,
BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_5b79_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1663_c11_3750
BIN_OP_EQ_uxn_opcodes_h_l1663_c11_3750 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1663_c11_3750_left,
BIN_OP_EQ_uxn_opcodes_h_l1663_c11_3750_right,
BIN_OP_EQ_uxn_opcodes_h_l1663_c11_3750_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1663_c7_9627
tmp8_high_MUX_uxn_opcodes_h_l1663_c7_9627 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1663_c7_9627_cond,
tmp8_high_MUX_uxn_opcodes_h_l1663_c7_9627_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1663_c7_9627_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1663_c7_9627_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1663_c7_9627
tmp8_low_MUX_uxn_opcodes_h_l1663_c7_9627 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1663_c7_9627_cond,
tmp8_low_MUX_uxn_opcodes_h_l1663_c7_9627_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1663_c7_9627_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1663_c7_9627_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_9627
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_9627 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_9627_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_9627_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_9627_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_9627_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_9627
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_9627 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_9627_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_9627_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_9627_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_9627_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1663_c7_9627
result_u8_value_MUX_uxn_opcodes_h_l1663_c7_9627 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1663_c7_9627_cond,
result_u8_value_MUX_uxn_opcodes_h_l1663_c7_9627_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1663_c7_9627_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1663_c7_9627_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_9627
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_9627 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_9627_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_9627_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_9627_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_9627_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1669_c11_1a09
BIN_OP_EQ_uxn_opcodes_h_l1669_c11_1a09 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1669_c11_1a09_left,
BIN_OP_EQ_uxn_opcodes_h_l1669_c11_1a09_right,
BIN_OP_EQ_uxn_opcodes_h_l1669_c11_1a09_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1669_c7_00a2
tmp8_low_MUX_uxn_opcodes_h_l1669_c7_00a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1669_c7_00a2_cond,
tmp8_low_MUX_uxn_opcodes_h_l1669_c7_00a2_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1669_c7_00a2_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1669_c7_00a2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_00a2
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_00a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_00a2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_00a2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_00a2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_00a2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1669_c7_00a2
result_u8_value_MUX_uxn_opcodes_h_l1669_c7_00a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1669_c7_00a2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1669_c7_00a2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1669_c7_00a2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1669_c7_00a2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_00a2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_00a2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_00a2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_00a2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_00a2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_00a2_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t8,
 tmp8_high,
 tmp8_low,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1639_c6_4c4a_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output,
 t8_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1652_c11_396e_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output,
 t8_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output,
 sp_relative_shift_uxn_opcodes_h_l1653_c30_edb8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1655_c11_2798_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output,
 t8_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_4b13_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ea2a_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_aa70_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_5b79_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1663_c11_3750_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1663_c7_9627_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1663_c7_9627_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_9627_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_9627_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1663_c7_9627_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_9627_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1669_c11_1a09_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1669_c7_00a2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_00a2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1669_c7_00a2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_00a2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_4c4a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_4c4a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_4c4a_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1639_c2_b9a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1639_c2_b9a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1649_c3_d1c1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1639_c2_b9a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1639_c2_b9a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1644_c3_ddc7 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_396e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_396e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_396e_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_edb8_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_edb8_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_edb8_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_edb8_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_2798_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_2798_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_2798_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1658_c3_555c : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1657_c3_5fb2 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1655_c7_a4f2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_4b13_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1658_c27_900d_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_4b13_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_4b13_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ea2a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ea2a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ea2a_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_0f24_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_0f24_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_9627_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_0f24_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_0f24_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_0f24_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_9627_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_0f24_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_0f24_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1661_c3_5cc2 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_0f24_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_0f24_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_0f24_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_0f24_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_9627_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_0f24_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_0f24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_0f24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_9627_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_0f24_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_0f24_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_0f24_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_9627_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_0f24_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_0f24_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_0f24_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_9627_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_0f24_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_aa70_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1661_c27_15fe_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_aa70_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_aa70_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_5b79_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_5b79_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_5b79_return_output : signed(18 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_3750_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_3750_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_3750_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_9627_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_9627_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_9627_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_9627_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_9627_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_00a2_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_9627_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_9627_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_9627_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_00a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_9627_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_9627_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_9627_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_9627_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_9627_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_9627_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_00a2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_9627_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_9627_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1666_c3_9774 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_9627_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_00a2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_9627_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_1a09_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_1a09_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_1a09_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_00a2_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_00a2_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_00a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_00a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_00a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_00a2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_00a2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_00a2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_00a2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_00a2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1671_c3_f1d1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_00a2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_00a2_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1660_l1652_l1639_DUPLICATE_7c08_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1652_l1639_l1669_l1660_l1655_DUPLICATE_4607_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1652_l1669_l1663_l1660_l1655_DUPLICATE_0fcd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1660_l1652_l1663_l1655_DUPLICATE_83eb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1660_l1652_l1655_l1669_DUPLICATE_25b7_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d9be_uxn_opcodes_h_l1676_l1635_DUPLICATE_3f84_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp8_high : unsigned(7 downto 0);
variable REG_VAR_tmp8_low : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_tmp8_high := tmp8_high;
  REG_VAR_tmp8_low := tmp8_low;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1649_c3_d1c1 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1649_c3_d1c1;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1671_c3_f1d1 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_00a2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1671_c3_f1d1;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1666_c3_9774 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_9627_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1666_c3_9774;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_396e_right := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_5b79_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1657_c3_5fb2 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1657_c3_5fb2;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_1a09_right := to_unsigned(5, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_edb8_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_2798_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_3750_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_00a2_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_9627_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1644_c3_ddc7 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1644_c3_ddc7;
     VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_edb8_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_4c4a_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ea2a_right := to_unsigned(3, 2);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_edb8_ins := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_4b13_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_aa70_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_4c4a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_396e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_2798_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ea2a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_3750_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_1a09_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_9627_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_00a2_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_9627_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_00a2_iftrue := VAR_previous_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse := t8;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_0f24_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_9627_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_0f24_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_9627_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_00a2_iffalse := tmp8_low;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1652_l1639_l1669_l1660_l1655_DUPLICATE_4607 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1652_l1639_l1669_l1660_l1655_DUPLICATE_4607_return_output := result.u8_value;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1639_c2_b9a0] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1639_c2_b9a0_return_output := result.is_pc_updated;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1639_c2_b9a0] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1639_c2_b9a0_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1660_c11_ea2a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ea2a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ea2a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ea2a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ea2a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ea2a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ea2a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1660_l1652_l1663_l1655_DUPLICATE_83eb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1660_l1652_l1663_l1655_DUPLICATE_83eb_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1660_l1652_l1639_DUPLICATE_7c08 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1660_l1652_l1639_DUPLICATE_7c08_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1652_c11_396e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1652_c11_396e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_396e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1652_c11_396e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_396e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_396e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1652_c11_396e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1652_l1669_l1663_l1660_l1655_DUPLICATE_0fcd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1652_l1669_l1663_l1660_l1655_DUPLICATE_0fcd_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1660_l1652_l1655_l1669_DUPLICATE_25b7 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1660_l1652_l1655_l1669_DUPLICATE_25b7_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1655_c11_2798] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1655_c11_2798_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_2798_left;
     BIN_OP_EQ_uxn_opcodes_h_l1655_c11_2798_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_2798_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_2798_return_output := BIN_OP_EQ_uxn_opcodes_h_l1655_c11_2798_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1639_c6_4c4a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1639_c6_4c4a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_4c4a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1639_c6_4c4a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_4c4a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_4c4a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1639_c6_4c4a_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1661_c27_15fe] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1661_c27_15fe_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- sp_relative_shift[uxn_opcodes_h_l1653_c30_edb8] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1653_c30_edb8_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_edb8_ins;
     sp_relative_shift_uxn_opcodes_h_l1653_c30_edb8_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_edb8_x;
     sp_relative_shift_uxn_opcodes_h_l1653_c30_edb8_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_edb8_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_edb8_return_output := sp_relative_shift_uxn_opcodes_h_l1653_c30_edb8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1669_c11_1a09] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1669_c11_1a09_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_1a09_left;
     BIN_OP_EQ_uxn_opcodes_h_l1669_c11_1a09_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_1a09_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_1a09_return_output := BIN_OP_EQ_uxn_opcodes_h_l1669_c11_1a09_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1663_c11_3750] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1663_c11_3750_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_3750_left;
     BIN_OP_EQ_uxn_opcodes_h_l1663_c11_3750_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_3750_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_3750_return_output := BIN_OP_EQ_uxn_opcodes_h_l1663_c11_3750_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1658_c27_900d] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1658_c27_900d_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l1655_c7_a4f2] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1655_c7_a4f2_return_output := result.sp_relative_shift;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1639_c2_b9a0] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1639_c2_b9a0_return_output := result.is_stack_index_flipped;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1639_c2_b9a0] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1639_c2_b9a0_return_output := result.is_vram_write;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_4c4a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_4c4a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_4c4a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_4c4a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_4c4a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_4c4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_4c4a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_4c4a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_4c4a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_4c4a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_4c4a_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_4c4a_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_4c4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_396e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_396e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_396e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_396e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_396e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_396e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_396e_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_396e_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_396e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_2798_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_2798_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_2798_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_2798_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_2798_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_2798_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_2798_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_2798_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_2798_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_0f24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ea2a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_0f24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ea2a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_0f24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ea2a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_0f24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ea2a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_0f24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ea2a_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_0f24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ea2a_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_0f24_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_ea2a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_9627_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_3750_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_9627_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_3750_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_9627_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_3750_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_9627_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_3750_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_9627_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_3750_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_9627_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_3750_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_00a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_1a09_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_00a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_1a09_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_00a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_1a09_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_00a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_1a09_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_4b13_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1658_c27_900d_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_aa70_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1661_c27_15fe_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1660_l1652_l1639_DUPLICATE_7c08_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1660_l1652_l1639_DUPLICATE_7c08_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_0f24_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1660_l1652_l1639_DUPLICATE_7c08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1652_l1669_l1663_l1660_l1655_DUPLICATE_0fcd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1652_l1669_l1663_l1660_l1655_DUPLICATE_0fcd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_0f24_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1652_l1669_l1663_l1660_l1655_DUPLICATE_0fcd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_9627_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1652_l1669_l1663_l1660_l1655_DUPLICATE_0fcd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_00a2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1652_l1669_l1663_l1660_l1655_DUPLICATE_0fcd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1660_l1652_l1663_l1655_DUPLICATE_83eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1660_l1652_l1663_l1655_DUPLICATE_83eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_0f24_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1660_l1652_l1663_l1655_DUPLICATE_83eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_9627_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1660_l1652_l1663_l1655_DUPLICATE_83eb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1660_l1652_l1655_l1669_DUPLICATE_25b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1660_l1652_l1655_l1669_DUPLICATE_25b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_0f24_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1660_l1652_l1655_l1669_DUPLICATE_25b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_00a2_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1660_l1652_l1655_l1669_DUPLICATE_25b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1652_l1639_l1669_l1660_l1655_DUPLICATE_4607_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1652_l1639_l1669_l1660_l1655_DUPLICATE_4607_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1652_l1639_l1669_l1660_l1655_DUPLICATE_4607_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_0f24_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1652_l1639_l1669_l1660_l1655_DUPLICATE_4607_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_00a2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1652_l1639_l1669_l1660_l1655_DUPLICATE_4607_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1639_c2_b9a0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1639_c2_b9a0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1639_c2_b9a0_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1639_c2_b9a0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1655_c7_a4f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_edb8_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l1661_c22_aa70] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_aa70_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_aa70_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_aa70_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_aa70_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_aa70_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_aa70_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1639_c2_b9a0] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1639_c2_b9a0] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1658_c22_4b13] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_4b13_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_4b13_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_4b13_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_4b13_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_4b13_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_4b13_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1663_c7_9627] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1663_c7_9627_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_9627_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1663_c7_9627_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_9627_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1663_c7_9627_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_9627_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_9627_return_output := tmp8_high_MUX_uxn_opcodes_h_l1663_c7_9627_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1669_c7_00a2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_00a2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_00a2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_00a2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_00a2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_00a2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_00a2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_00a2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_00a2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1669_c7_00a2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1669_c7_00a2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_00a2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1669_c7_00a2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_00a2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1669_c7_00a2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_00a2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_00a2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1669_c7_00a2_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1669_c7_00a2] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1669_c7_00a2_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_00a2_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1669_c7_00a2_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_00a2_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1669_c7_00a2_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_00a2_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_00a2_return_output := tmp8_low_MUX_uxn_opcodes_h_l1669_c7_00a2_return_output;

     -- t8_MUX[uxn_opcodes_h_l1655_c7_a4f2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond <= VAR_t8_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond;
     t8_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue;
     t8_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output := t8_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1655_c7_a4f2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1639_c2_b9a0] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1639_c2_b9a0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1669_c7_00a2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_00a2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_00a2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_00a2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_00a2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_00a2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_00a2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_00a2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_00a2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1663_c7_9627] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_9627_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_9627_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_9627_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_9627_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_9627_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_9627_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_9627_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_9627_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l1658_c3_555c := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_4b13_return_output)),16);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_5b79_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_aa70_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_9627_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_00a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_0f24_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_9627_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_9627_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_00a2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_9627_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_00a2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_0f24_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_9627_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_9627_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_00a2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1658_c3_555c;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1660_c7_0f24] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_0f24_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_0f24_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_0f24_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_0f24_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_0f24_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_0f24_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1663_c7_9627] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_9627_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_9627_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_9627_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_9627_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_9627_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_9627_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_9627_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_9627_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1663_c7_9627] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_9627_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_9627_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_9627_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_9627_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_9627_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_9627_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_9627_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_9627_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1652_c7_c5c9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1663_c7_9627] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1663_c7_9627_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_9627_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1663_c7_9627_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_9627_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1663_c7_9627_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_9627_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_9627_return_output := tmp8_low_MUX_uxn_opcodes_h_l1663_c7_9627_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1660_c7_0f24] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1660_c7_0f24_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_0f24_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1660_c7_0f24_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_0f24_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1660_c7_0f24_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_0f24_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output := tmp8_high_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1661_c22_5b79] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_5b79_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_5b79_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_5b79_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_5b79_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_5b79_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_5b79_return_output;

     -- t8_MUX[uxn_opcodes_h_l1652_c7_c5c9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond <= VAR_t8_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond;
     t8_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue;
     t8_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output := t8_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1663_c7_9627] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1663_c7_9627_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_9627_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1663_c7_9627_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_9627_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1663_c7_9627_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_9627_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_9627_return_output := result_u8_value_MUX_uxn_opcodes_h_l1663_c7_9627_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1661_c3_5cc2 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_5b79_return_output)),16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_0f24_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_9627_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_0f24_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_9627_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_0f24_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_9627_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_0f24_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_9627_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_0f24_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1661_c3_5cc2;
     -- tmp8_high_MUX[uxn_opcodes_h_l1655_c7_a4f2] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output := tmp8_high_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1660_c7_0f24] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1660_c7_0f24_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_0f24_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1660_c7_0f24_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_0f24_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1660_c7_0f24_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_0f24_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output := result_u16_value_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1660_c7_0f24] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_0f24_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_0f24_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_0f24_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_0f24_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_0f24_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_0f24_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1660_c7_0f24] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1660_c7_0f24_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_0f24_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1660_c7_0f24_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_0f24_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1660_c7_0f24_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_0f24_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output := result_u8_value_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1660_c7_0f24] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_0f24_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_0f24_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_0f24_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_0f24_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_0f24_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_0f24_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1655_c7_a4f2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1639_c2_b9a0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1660_c7_0f24] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1660_c7_0f24_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_0f24_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1660_c7_0f24_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_0f24_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1660_c7_0f24_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_0f24_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output := tmp8_low_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output;

     -- t8_MUX[uxn_opcodes_h_l1639_c2_b9a0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond <= VAR_t8_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond;
     t8_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue;
     t8_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output := t8_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_0f24_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1655_c7_a4f2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1652_c7_c5c9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1655_c7_a4f2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1655_c7_a4f2] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output := tmp8_low_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1655_c7_a4f2] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output := result_u16_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1652_c7_c5c9] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output := tmp8_high_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1655_c7_a4f2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_a4f2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_a4f2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_a4f2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_a4f2_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1652_c7_c5c9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output := result_u16_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1652_c7_c5c9] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output := tmp8_low_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1639_c2_b9a0] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output := tmp8_high_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1639_c2_b9a0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1652_c7_c5c9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output := result_u8_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1652_c7_c5c9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1652_c7_c5c9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_c5c9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_c5c9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_c5c9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_c5c9_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1639_c2_b9a0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1639_c2_b9a0] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output := tmp8_low_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1639_c2_b9a0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1639_c2_b9a0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output := result_u16_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1639_c2_b9a0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_b9a0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_b9a0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_b9a0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output;

     -- Submodule level 7
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d9be_uxn_opcodes_h_l1676_l1635_DUPLICATE_3f84 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d9be_uxn_opcodes_h_l1676_l1635_DUPLICATE_3f84_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d9be(
     result,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_b9a0_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d9be_uxn_opcodes_h_l1676_l1635_DUPLICATE_3f84_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d9be_uxn_opcodes_h_l1676_l1635_DUPLICATE_3f84_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_tmp8_high <= REG_VAR_tmp8_high;
REG_COMB_tmp8_low <= REG_VAR_tmp8_low;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     tmp8_high <= REG_COMB_tmp8_high;
     tmp8_low <= REG_COMB_tmp8_low;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
