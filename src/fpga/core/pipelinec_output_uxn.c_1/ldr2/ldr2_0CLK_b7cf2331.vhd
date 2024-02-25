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
-- BIN_OP_EQ[uxn_opcodes_h_l1638_c6_884f]
signal BIN_OP_EQ_uxn_opcodes_h_l1638_c6_884f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1638_c6_884f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1638_c6_884f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1638_c2_8ca6]
signal t8_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1638_c2_8ca6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1638_c2_8ca6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1638_c2_8ca6]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1638_c2_8ca6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1638_c2_8ca6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1638_c2_8ca6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1638_c2_8ca6]
signal result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1638_c2_8ca6]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1638_c2_8ca6]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1638_c2_8ca6]
signal result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1638_c2_8ca6]
signal tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1638_c2_8ca6]
signal tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1651_c11_f801]
signal BIN_OP_EQ_uxn_opcodes_h_l1651_c11_f801_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1651_c11_f801_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1651_c11_f801_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1651_c7_f8d0]
signal t8_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1651_c7_f8d0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1651_c7_f8d0]
signal result_u16_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1651_c7_f8d0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1651_c7_f8d0]
signal result_u8_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1651_c7_f8d0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1651_c7_f8d0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1651_c7_f8d0]
signal tmp8_low_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1651_c7_f8d0]
signal tmp8_high_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1652_c30_26b4]
signal sp_relative_shift_uxn_opcodes_h_l1652_c30_26b4_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1652_c30_26b4_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1652_c30_26b4_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1652_c30_26b4_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1654_c11_54aa]
signal BIN_OP_EQ_uxn_opcodes_h_l1654_c11_54aa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1654_c11_54aa_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1654_c11_54aa_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1654_c7_0c7b]
signal t8_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1654_c7_0c7b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1654_c7_0c7b]
signal result_u16_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1654_c7_0c7b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1654_c7_0c7b]
signal result_u8_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1654_c7_0c7b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1654_c7_0c7b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1654_c7_0c7b]
signal tmp8_low_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1654_c7_0c7b]
signal tmp8_high_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1657_c22_bd08]
signal BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_bd08_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_bd08_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_bd08_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1659_c11_b442]
signal BIN_OP_EQ_uxn_opcodes_h_l1659_c11_b442_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1659_c11_b442_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1659_c11_b442_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1659_c7_99ad]
signal result_u16_value_MUX_uxn_opcodes_h_l1659_c7_99ad_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1659_c7_99ad_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1659_c7_99ad_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1659_c7_99ad]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_99ad_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_99ad_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_99ad_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1659_c7_99ad]
signal result_u8_value_MUX_uxn_opcodes_h_l1659_c7_99ad_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1659_c7_99ad_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1659_c7_99ad_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1659_c7_99ad]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_99ad_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_99ad_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_99ad_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1659_c7_99ad]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_99ad_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_99ad_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_99ad_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1659_c7_99ad]
signal tmp8_low_MUX_uxn_opcodes_h_l1659_c7_99ad_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1659_c7_99ad_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1659_c7_99ad_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1659_c7_99ad]
signal tmp8_high_MUX_uxn_opcodes_h_l1659_c7_99ad_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1659_c7_99ad_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1659_c7_99ad_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1660_c22_b649]
signal BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_b649_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_b649_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_b649_return_output : signed(17 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1660_c22_b52f]
signal BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_b52f_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_b52f_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_b52f_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1662_c11_68b5]
signal BIN_OP_EQ_uxn_opcodes_h_l1662_c11_68b5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1662_c11_68b5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1662_c11_68b5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1662_c7_44c5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_44c5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_44c5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_44c5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_44c5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1662_c7_44c5]
signal result_u8_value_MUX_uxn_opcodes_h_l1662_c7_44c5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1662_c7_44c5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1662_c7_44c5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1662_c7_44c5_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1662_c7_44c5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_44c5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_44c5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_44c5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_44c5_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1662_c7_44c5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_44c5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_44c5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_44c5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_44c5_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1662_c7_44c5]
signal tmp8_low_MUX_uxn_opcodes_h_l1662_c7_44c5_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1662_c7_44c5_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1662_c7_44c5_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1662_c7_44c5_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1662_c7_44c5]
signal tmp8_high_MUX_uxn_opcodes_h_l1662_c7_44c5_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1662_c7_44c5_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1662_c7_44c5_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1662_c7_44c5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1668_c11_6862]
signal BIN_OP_EQ_uxn_opcodes_h_l1668_c11_6862_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1668_c11_6862_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1668_c11_6862_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1668_c7_4b22]
signal result_u8_value_MUX_uxn_opcodes_h_l1668_c7_4b22_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1668_c7_4b22_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1668_c7_4b22_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1668_c7_4b22_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1668_c7_4b22]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_4b22_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_4b22_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_4b22_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_4b22_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1668_c7_4b22]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_4b22_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_4b22_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_4b22_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_4b22_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1668_c7_4b22]
signal tmp8_low_MUX_uxn_opcodes_h_l1668_c7_4b22_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1668_c7_4b22_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1668_c7_4b22_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1668_c7_4b22_return_output : unsigned(7 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_d736( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.u16_value := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.is_vram_write := ref_toks_9;
      base.u8_value := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1638_c6_884f
BIN_OP_EQ_uxn_opcodes_h_l1638_c6_884f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1638_c6_884f_left,
BIN_OP_EQ_uxn_opcodes_h_l1638_c6_884f_right,
BIN_OP_EQ_uxn_opcodes_h_l1638_c6_884f_return_output);

-- t8_MUX_uxn_opcodes_h_l1638_c2_8ca6
t8_MUX_uxn_opcodes_h_l1638_c2_8ca6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond,
t8_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue,
t8_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse,
t8_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8ca6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8ca6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8ca6
result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8ca6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8ca6
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8ca6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8ca6
result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8ca6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8ca6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8ca6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8ca6
result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8ca6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8ca6
result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8ca6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond,
result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6
result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6
result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8ca6
result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8ca6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8ca6
tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8ca6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond,
tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8ca6
tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8ca6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond,
tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1651_c11_f801
BIN_OP_EQ_uxn_opcodes_h_l1651_c11_f801 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1651_c11_f801_left,
BIN_OP_EQ_uxn_opcodes_h_l1651_c11_f801_right,
BIN_OP_EQ_uxn_opcodes_h_l1651_c11_f801_return_output);

-- t8_MUX_uxn_opcodes_h_l1651_c7_f8d0
t8_MUX_uxn_opcodes_h_l1651_c7_f8d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond,
t8_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue,
t8_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse,
t8_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_f8d0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_f8d0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1651_c7_f8d0
result_u16_value_MUX_uxn_opcodes_h_l1651_c7_f8d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond,
result_u16_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_f8d0
result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_f8d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1651_c7_f8d0
result_u8_value_MUX_uxn_opcodes_h_l1651_c7_f8d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_f8d0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_f8d0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_f8d0
result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_f8d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1651_c7_f8d0
tmp8_low_MUX_uxn_opcodes_h_l1651_c7_f8d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond,
tmp8_low_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1651_c7_f8d0
tmp8_high_MUX_uxn_opcodes_h_l1651_c7_f8d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond,
tmp8_high_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1652_c30_26b4
sp_relative_shift_uxn_opcodes_h_l1652_c30_26b4 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1652_c30_26b4_ins,
sp_relative_shift_uxn_opcodes_h_l1652_c30_26b4_x,
sp_relative_shift_uxn_opcodes_h_l1652_c30_26b4_y,
sp_relative_shift_uxn_opcodes_h_l1652_c30_26b4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1654_c11_54aa
BIN_OP_EQ_uxn_opcodes_h_l1654_c11_54aa : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1654_c11_54aa_left,
BIN_OP_EQ_uxn_opcodes_h_l1654_c11_54aa_right,
BIN_OP_EQ_uxn_opcodes_h_l1654_c11_54aa_return_output);

-- t8_MUX_uxn_opcodes_h_l1654_c7_0c7b
t8_MUX_uxn_opcodes_h_l1654_c7_0c7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond,
t8_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue,
t8_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse,
t8_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_0c7b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_0c7b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1654_c7_0c7b
result_u16_value_MUX_uxn_opcodes_h_l1654_c7_0c7b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond,
result_u16_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_0c7b
result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_0c7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1654_c7_0c7b
result_u8_value_MUX_uxn_opcodes_h_l1654_c7_0c7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_0c7b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_0c7b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_0c7b
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_0c7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1654_c7_0c7b
tmp8_low_MUX_uxn_opcodes_h_l1654_c7_0c7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond,
tmp8_low_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1654_c7_0c7b
tmp8_high_MUX_uxn_opcodes_h_l1654_c7_0c7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond,
tmp8_high_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_bd08
BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_bd08 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_bd08_left,
BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_bd08_right,
BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_bd08_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1659_c11_b442
BIN_OP_EQ_uxn_opcodes_h_l1659_c11_b442 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1659_c11_b442_left,
BIN_OP_EQ_uxn_opcodes_h_l1659_c11_b442_right,
BIN_OP_EQ_uxn_opcodes_h_l1659_c11_b442_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1659_c7_99ad
result_u16_value_MUX_uxn_opcodes_h_l1659_c7_99ad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1659_c7_99ad_cond,
result_u16_value_MUX_uxn_opcodes_h_l1659_c7_99ad_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1659_c7_99ad_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_99ad
result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_99ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_99ad_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_99ad_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_99ad_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1659_c7_99ad
result_u8_value_MUX_uxn_opcodes_h_l1659_c7_99ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1659_c7_99ad_cond,
result_u8_value_MUX_uxn_opcodes_h_l1659_c7_99ad_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1659_c7_99ad_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_99ad
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_99ad : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_99ad_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_99ad_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_99ad_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_99ad
result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_99ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_99ad_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_99ad_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_99ad_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1659_c7_99ad
tmp8_low_MUX_uxn_opcodes_h_l1659_c7_99ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1659_c7_99ad_cond,
tmp8_low_MUX_uxn_opcodes_h_l1659_c7_99ad_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1659_c7_99ad_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1659_c7_99ad
tmp8_high_MUX_uxn_opcodes_h_l1659_c7_99ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1659_c7_99ad_cond,
tmp8_high_MUX_uxn_opcodes_h_l1659_c7_99ad_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1659_c7_99ad_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_b649
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_b649 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_b649_left,
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_b649_right,
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_b649_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_b52f
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_b52f : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_b52f_left,
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_b52f_right,
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_b52f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1662_c11_68b5
BIN_OP_EQ_uxn_opcodes_h_l1662_c11_68b5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1662_c11_68b5_left,
BIN_OP_EQ_uxn_opcodes_h_l1662_c11_68b5_right,
BIN_OP_EQ_uxn_opcodes_h_l1662_c11_68b5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_44c5
result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_44c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_44c5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_44c5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_44c5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_44c5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1662_c7_44c5
result_u8_value_MUX_uxn_opcodes_h_l1662_c7_44c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1662_c7_44c5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1662_c7_44c5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1662_c7_44c5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1662_c7_44c5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_44c5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_44c5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_44c5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_44c5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_44c5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_44c5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_44c5
result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_44c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_44c5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_44c5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_44c5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_44c5_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1662_c7_44c5
tmp8_low_MUX_uxn_opcodes_h_l1662_c7_44c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1662_c7_44c5_cond,
tmp8_low_MUX_uxn_opcodes_h_l1662_c7_44c5_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1662_c7_44c5_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1662_c7_44c5_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1662_c7_44c5
tmp8_high_MUX_uxn_opcodes_h_l1662_c7_44c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1662_c7_44c5_cond,
tmp8_high_MUX_uxn_opcodes_h_l1662_c7_44c5_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1662_c7_44c5_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1662_c7_44c5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1668_c11_6862
BIN_OP_EQ_uxn_opcodes_h_l1668_c11_6862 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1668_c11_6862_left,
BIN_OP_EQ_uxn_opcodes_h_l1668_c11_6862_right,
BIN_OP_EQ_uxn_opcodes_h_l1668_c11_6862_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1668_c7_4b22
result_u8_value_MUX_uxn_opcodes_h_l1668_c7_4b22 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1668_c7_4b22_cond,
result_u8_value_MUX_uxn_opcodes_h_l1668_c7_4b22_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1668_c7_4b22_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1668_c7_4b22_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_4b22
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_4b22 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_4b22_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_4b22_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_4b22_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_4b22_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_4b22
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_4b22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_4b22_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_4b22_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_4b22_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_4b22_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1668_c7_4b22
tmp8_low_MUX_uxn_opcodes_h_l1668_c7_4b22 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1668_c7_4b22_cond,
tmp8_low_MUX_uxn_opcodes_h_l1668_c7_4b22_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1668_c7_4b22_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1668_c7_4b22_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1638_c6_884f_return_output,
 t8_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1651_c11_f801_return_output,
 t8_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output,
 sp_relative_shift_uxn_opcodes_h_l1652_c30_26b4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1654_c11_54aa_return_output,
 t8_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_bd08_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1659_c11_b442_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_b649_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_b52f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1662_c11_68b5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_44c5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1662_c7_44c5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_44c5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_44c5_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1662_c7_44c5_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1662_c7_44c5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1668_c11_6862_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1668_c7_4b22_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_4b22_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_4b22_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1668_c7_4b22_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_884f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_884f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_884f_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1643_c3_c9dc : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1638_c2_8ca6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1638_c2_8ca6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1648_c3_7102 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1638_c2_8ca6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1638_c2_8ca6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_f801_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_f801_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_f801_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_26b4_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_26b4_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_26b4_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_26b4_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_54aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_54aa_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_54aa_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1656_c3_d37e : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1654_c7_0c7b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1657_c3_7f9d : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_bd08_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1657_c27_eade_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_bd08_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_bd08_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_b442_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_b442_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_b442_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_99ad_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1660_c3_0351 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_99ad_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_99ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_99ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_99ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_44c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_99ad_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_99ad_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_99ad_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_44c5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_99ad_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_99ad_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_99ad_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_44c5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_99ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_99ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_99ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_44c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_99ad_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_99ad_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_99ad_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_44c5_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_99ad_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_99ad_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_99ad_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_44c5_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_99ad_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_b649_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1660_c27_739d_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_b649_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_b649_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_b52f_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_b52f_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_b52f_return_output : signed(18 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_68b5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_68b5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_68b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_44c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_44c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_44c5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_44c5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_44c5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_4b22_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_44c5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_44c5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1665_c3_b1eb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_44c5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_4b22_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_44c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_44c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_44c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_4b22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_44c5_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_44c5_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_44c5_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_4b22_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_44c5_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_44c5_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_44c5_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_44c5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_6862_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_6862_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_6862_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_4b22_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_4b22_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_4b22_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_4b22_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1670_c3_46f2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_4b22_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_4b22_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_4b22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_4b22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_4b22_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_4b22_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_4b22_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_4b22_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1651_l1638_l1659_DUPLICATE_2334_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1654_l1651_l1638_l1668_l1659_DUPLICATE_c290_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1651_l1662_l1654_l1659_DUPLICATE_43bd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1651_l1654_l1668_l1659_DUPLICATE_576b_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1654_l1651_l1668_l1662_l1659_DUPLICATE_a08f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d736_uxn_opcodes_h_l1675_l1634_DUPLICATE_52f7_return_output : opcode_result_t;
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
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1643_c3_c9dc := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1643_c3_c9dc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_6862_right := to_unsigned(5, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1656_c3_d37e := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1656_c3_d37e;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_26b4_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_44c5_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_26b4_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_f801_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_884f_right := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_4b22_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_b442_right := to_unsigned(3, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1670_c3_46f2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_4b22_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1670_c3_46f2;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1665_c3_b1eb := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_44c5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1665_c3_b1eb;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_b52f_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_68b5_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_54aa_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1648_c3_7102 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1648_c3_7102;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_26b4_ins := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_bd08_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_b649_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_884f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_f801_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_54aa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_b442_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_68b5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_6862_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_44c5_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_4b22_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_44c5_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_4b22_iftrue := VAR_previous_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse := t8;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_99ad_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_44c5_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_99ad_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_44c5_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_4b22_iffalse := tmp8_low;
     -- BIN_OP_EQ[uxn_opcodes_h_l1638_c6_884f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1638_c6_884f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_884f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1638_c6_884f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_884f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_884f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1638_c6_884f_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1638_c2_8ca6] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1638_c2_8ca6_return_output := result.is_vram_write;

     -- sp_relative_shift[uxn_opcodes_h_l1652_c30_26b4] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1652_c30_26b4_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_26b4_ins;
     sp_relative_shift_uxn_opcodes_h_l1652_c30_26b4_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_26b4_x;
     sp_relative_shift_uxn_opcodes_h_l1652_c30_26b4_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_26b4_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_26b4_return_output := sp_relative_shift_uxn_opcodes_h_l1652_c30_26b4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1651_l1662_l1654_l1659_DUPLICATE_43bd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1651_l1662_l1654_l1659_DUPLICATE_43bd_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1654_l1651_l1638_l1668_l1659_DUPLICATE_c290 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1654_l1651_l1638_l1668_l1659_DUPLICATE_c290_return_output := result.u8_value;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1638_c2_8ca6] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1638_c2_8ca6_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1668_c11_6862] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1668_c11_6862_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_6862_left;
     BIN_OP_EQ_uxn_opcodes_h_l1668_c11_6862_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_6862_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_6862_return_output := BIN_OP_EQ_uxn_opcodes_h_l1668_c11_6862_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1659_c11_b442] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1659_c11_b442_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_b442_left;
     BIN_OP_EQ_uxn_opcodes_h_l1659_c11_b442_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_b442_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_b442_return_output := BIN_OP_EQ_uxn_opcodes_h_l1659_c11_b442_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1638_c2_8ca6] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1638_c2_8ca6_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1654_c11_54aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1654_c11_54aa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_54aa_left;
     BIN_OP_EQ_uxn_opcodes_h_l1654_c11_54aa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_54aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_54aa_return_output := BIN_OP_EQ_uxn_opcodes_h_l1654_c11_54aa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1651_c11_f801] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1651_c11_f801_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_f801_left;
     BIN_OP_EQ_uxn_opcodes_h_l1651_c11_f801_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_f801_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_f801_return_output := BIN_OP_EQ_uxn_opcodes_h_l1651_c11_f801_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1654_l1651_l1668_l1662_l1659_DUPLICATE_a08f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1654_l1651_l1668_l1662_l1659_DUPLICATE_a08f_return_output := result.is_opc_done;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1660_c27_739d] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1660_c27_739d_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1651_l1638_l1659_DUPLICATE_2334 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1651_l1638_l1659_DUPLICATE_2334_return_output := result.u16_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1651_l1654_l1668_l1659_DUPLICATE_576b LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1651_l1654_l1668_l1659_DUPLICATE_576b_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1662_c11_68b5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1662_c11_68b5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_68b5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1662_c11_68b5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_68b5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_68b5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1662_c11_68b5_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1638_c2_8ca6] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1638_c2_8ca6_return_output := result.is_pc_updated;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l1654_c7_0c7b] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1654_c7_0c7b_return_output := result.sp_relative_shift;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1657_c27_eade] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1657_c27_eade_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_884f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_884f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_884f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_884f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_884f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_884f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_884f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_884f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_884f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_884f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_884f_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_884f_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_884f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_f801_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_f801_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_f801_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_f801_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_f801_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_f801_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_f801_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_f801_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_f801_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_54aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_54aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_54aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_54aa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_54aa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_54aa_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_54aa_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_54aa_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_54aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_99ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_b442_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_99ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_b442_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_99ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_b442_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_99ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_b442_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_99ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_b442_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_99ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_b442_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_99ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_b442_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_44c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_68b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_44c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_68b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_44c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_68b5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_44c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_68b5_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_44c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_68b5_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_44c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_68b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_4b22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_6862_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_4b22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_6862_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_4b22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_6862_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_4b22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_6862_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_bd08_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1657_c27_eade_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_b649_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1660_c27_739d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1651_l1638_l1659_DUPLICATE_2334_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1651_l1638_l1659_DUPLICATE_2334_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_99ad_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1651_l1638_l1659_DUPLICATE_2334_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1654_l1651_l1668_l1662_l1659_DUPLICATE_a08f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1654_l1651_l1668_l1662_l1659_DUPLICATE_a08f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_99ad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1654_l1651_l1668_l1662_l1659_DUPLICATE_a08f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_44c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1654_l1651_l1668_l1662_l1659_DUPLICATE_a08f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_4b22_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1654_l1651_l1668_l1662_l1659_DUPLICATE_a08f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1651_l1662_l1654_l1659_DUPLICATE_43bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1651_l1662_l1654_l1659_DUPLICATE_43bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_99ad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1651_l1662_l1654_l1659_DUPLICATE_43bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_44c5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1651_l1662_l1654_l1659_DUPLICATE_43bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1651_l1654_l1668_l1659_DUPLICATE_576b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1651_l1654_l1668_l1659_DUPLICATE_576b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_99ad_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1651_l1654_l1668_l1659_DUPLICATE_576b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_4b22_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1651_l1654_l1668_l1659_DUPLICATE_576b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1654_l1651_l1638_l1668_l1659_DUPLICATE_c290_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1654_l1651_l1638_l1668_l1659_DUPLICATE_c290_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1654_l1651_l1638_l1668_l1659_DUPLICATE_c290_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_99ad_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1654_l1651_l1638_l1668_l1659_DUPLICATE_c290_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_4b22_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1654_l1651_l1638_l1668_l1659_DUPLICATE_c290_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1638_c2_8ca6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1638_c2_8ca6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1638_c2_8ca6_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1638_c2_8ca6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1654_c7_0c7b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_26b4_return_output;
     -- tmp8_high_MUX[uxn_opcodes_h_l1662_c7_44c5] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1662_c7_44c5_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_44c5_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1662_c7_44c5_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_44c5_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1662_c7_44c5_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_44c5_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_44c5_return_output := tmp8_high_MUX_uxn_opcodes_h_l1662_c7_44c5_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1638_c2_8ca6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1668_c7_4b22] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1668_c7_4b22_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_4b22_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1668_c7_4b22_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_4b22_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1668_c7_4b22_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_4b22_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_4b22_return_output := tmp8_low_MUX_uxn_opcodes_h_l1668_c7_4b22_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1638_c2_8ca6] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output;

     -- t8_MUX[uxn_opcodes_h_l1654_c7_0c7b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond <= VAR_t8_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond;
     t8_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue;
     t8_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output := t8_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1660_c22_b649] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_b649_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_b649_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_b649_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_b649_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_b649_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_b649_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1662_c7_44c5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_44c5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_44c5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_44c5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_44c5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_44c5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_44c5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_44c5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_44c5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1668_c7_4b22] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_4b22_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_4b22_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_4b22_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_4b22_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_4b22_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_4b22_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_4b22_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_4b22_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1668_c7_4b22] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_4b22_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_4b22_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_4b22_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_4b22_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_4b22_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_4b22_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_4b22_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_4b22_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1657_c22_bd08] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_bd08_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_bd08_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_bd08_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_bd08_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_bd08_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_bd08_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1638_c2_8ca6] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1668_c7_4b22] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1668_c7_4b22_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_4b22_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1668_c7_4b22_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_4b22_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1668_c7_4b22_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_4b22_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_4b22_return_output := result_u8_value_MUX_uxn_opcodes_h_l1668_c7_4b22_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1654_c7_0c7b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1638_c2_8ca6] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l1657_c3_7f9d := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_bd08_return_output)),16);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_b52f_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_b649_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_44c5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_4b22_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_99ad_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_44c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_44c5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_4b22_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_44c5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_4b22_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_99ad_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_44c5_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_44c5_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_4b22_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1657_c3_7f9d;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1662_c7_44c5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_44c5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_44c5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_44c5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_44c5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_44c5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_44c5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_44c5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_44c5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1659_c7_99ad] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_99ad_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_99ad_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_99ad_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_99ad_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_99ad_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_99ad_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1651_c7_f8d0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1662_c7_44c5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_44c5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_44c5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_44c5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_44c5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_44c5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_44c5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_44c5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_44c5_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1659_c7_99ad] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1659_c7_99ad_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_99ad_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1659_c7_99ad_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_99ad_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1659_c7_99ad_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_99ad_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output := tmp8_high_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output;

     -- t8_MUX[uxn_opcodes_h_l1651_c7_f8d0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond <= VAR_t8_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond;
     t8_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue;
     t8_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output := t8_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1662_c7_44c5] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1662_c7_44c5_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_44c5_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1662_c7_44c5_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_44c5_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1662_c7_44c5_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_44c5_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_44c5_return_output := tmp8_low_MUX_uxn_opcodes_h_l1662_c7_44c5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1662_c7_44c5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1662_c7_44c5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_44c5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1662_c7_44c5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_44c5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1662_c7_44c5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_44c5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_44c5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1662_c7_44c5_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1660_c22_b52f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_b52f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_b52f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_b52f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_b52f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_b52f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_b52f_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1660_c3_0351 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_b52f_return_output)),16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_99ad_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_44c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_99ad_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_44c5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_99ad_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_44c5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_99ad_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_44c5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_99ad_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1660_c3_0351;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1654_c7_0c7b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1638_c2_8ca6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1659_c7_99ad] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1659_c7_99ad_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_99ad_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1659_c7_99ad_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_99ad_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1659_c7_99ad_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_99ad_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output := result_u8_value_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1659_c7_99ad] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1659_c7_99ad_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_99ad_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1659_c7_99ad_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_99ad_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1659_c7_99ad_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_99ad_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output := result_u16_value_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1659_c7_99ad] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_99ad_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_99ad_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_99ad_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_99ad_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_99ad_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_99ad_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output;

     -- t8_MUX[uxn_opcodes_h_l1638_c2_8ca6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond <= VAR_t8_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond;
     t8_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue;
     t8_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output := t8_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1654_c7_0c7b] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output := tmp8_high_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1659_c7_99ad] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_99ad_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_99ad_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_99ad_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_99ad_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_99ad_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_99ad_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1659_c7_99ad] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1659_c7_99ad_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_99ad_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1659_c7_99ad_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_99ad_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1659_c7_99ad_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_99ad_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output := tmp8_low_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_99ad_return_output;
     -- tmp8_high_MUX[uxn_opcodes_h_l1651_c7_f8d0] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output := tmp8_high_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1651_c7_f8d0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1654_c7_0c7b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1654_c7_0c7b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1654_c7_0c7b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output := result_u16_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1654_c7_0c7b] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output := tmp8_low_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1654_c7_0c7b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_0c7b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_0c7b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_0c7b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_0c7b_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1651_c7_f8d0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output := result_u16_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1651_c7_f8d0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1651_c7_f8d0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1651_c7_f8d0] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output := tmp8_low_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1638_c2_8ca6] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output := tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1638_c2_8ca6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1651_c7_f8d0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_f8d0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_f8d0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_f8d0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_f8d0_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1638_c2_8ca6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1638_c2_8ca6] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output := tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1638_c2_8ca6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output := result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1638_c2_8ca6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1638_c2_8ca6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8ca6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8ca6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8ca6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output;

     -- Submodule level 7
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d736_uxn_opcodes_h_l1675_l1634_DUPLICATE_52f7 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d736_uxn_opcodes_h_l1675_l1634_DUPLICATE_52f7_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d736(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_8ca6_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d736_uxn_opcodes_h_l1675_l1634_DUPLICATE_52f7_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d736_uxn_opcodes_h_l1675_l1634_DUPLICATE_52f7_return_output;
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
