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
-- Submodules: 60
entity ldz2_0CLK_2ab048cc is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ldz2_0CLK_2ab048cc;
architecture arch of ldz2_0CLK_2ab048cc is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1477_c6_aaf8]
signal BIN_OP_EQ_uxn_opcodes_h_l1477_c6_aaf8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1477_c6_aaf8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1477_c6_aaf8_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1477_c2_a94d]
signal tmp8_high_MUX_uxn_opcodes_h_l1477_c2_a94d_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1477_c2_a94d]
signal tmp8_low_MUX_uxn_opcodes_h_l1477_c2_a94d_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1477_c2_a94d]
signal t8_MUX_uxn_opcodes_h_l1477_c2_a94d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1477_c2_a94d]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1477_c2_a94d]
signal result_u16_value_MUX_uxn_opcodes_h_l1477_c2_a94d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1477_c2_a94d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_a94d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1477_c2_a94d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_a94d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1477_c2_a94d]
signal result_u8_value_MUX_uxn_opcodes_h_l1477_c2_a94d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1477_c2_a94d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_a94d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1477_c2_a94d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_a94d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1477_c2_a94d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1477_c2_a94d]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_a94d_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1477_c2_a94d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_a94d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1490_c11_3f86]
signal BIN_OP_EQ_uxn_opcodes_h_l1490_c11_3f86_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1490_c11_3f86_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1490_c11_3f86_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1490_c7_a05b]
signal tmp8_high_MUX_uxn_opcodes_h_l1490_c7_a05b_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1490_c7_a05b]
signal tmp8_low_MUX_uxn_opcodes_h_l1490_c7_a05b_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1490_c7_a05b]
signal t8_MUX_uxn_opcodes_h_l1490_c7_a05b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1490_c7_a05b]
signal result_u16_value_MUX_uxn_opcodes_h_l1490_c7_a05b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1490_c7_a05b]
signal result_u8_value_MUX_uxn_opcodes_h_l1490_c7_a05b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1490_c7_a05b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_a05b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1490_c7_a05b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_a05b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1490_c7_a05b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_a05b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1490_c7_a05b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_a05b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1493_c11_8f9c]
signal BIN_OP_EQ_uxn_opcodes_h_l1493_c11_8f9c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1493_c11_8f9c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1493_c11_8f9c_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1493_c7_1bb4]
signal tmp8_high_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1493_c7_1bb4]
signal tmp8_low_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1493_c7_1bb4]
signal t8_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1493_c7_1bb4]
signal result_u16_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1493_c7_1bb4]
signal result_u8_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1493_c7_1bb4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1493_c7_1bb4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1493_c7_1bb4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1493_c7_1bb4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output : signed(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1495_c30_18d6]
signal sp_relative_shift_uxn_opcodes_h_l1495_c30_18d6_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1495_c30_18d6_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1495_c30_18d6_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1495_c30_18d6_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1498_c11_8a59]
signal BIN_OP_EQ_uxn_opcodes_h_l1498_c11_8a59_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1498_c11_8a59_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1498_c11_8a59_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1498_c7_022d]
signal tmp8_high_MUX_uxn_opcodes_h_l1498_c7_022d_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1498_c7_022d_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1498_c7_022d]
signal tmp8_low_MUX_uxn_opcodes_h_l1498_c7_022d_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1498_c7_022d_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1498_c7_022d]
signal result_u16_value_MUX_uxn_opcodes_h_l1498_c7_022d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1498_c7_022d_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1498_c7_022d]
signal result_u8_value_MUX_uxn_opcodes_h_l1498_c7_022d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1498_c7_022d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1498_c7_022d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_022d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_022d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1498_c7_022d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_022d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_022d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1498_c7_022d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_022d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_022d_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1498_c7_022d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_022d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_022d_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1500_c33_31a2]
signal BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_31a2_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_31a2_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_31a2_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1502_c11_b2af]
signal BIN_OP_EQ_uxn_opcodes_h_l1502_c11_b2af_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1502_c11_b2af_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1502_c11_b2af_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1502_c7_a52b]
signal tmp8_high_MUX_uxn_opcodes_h_l1502_c7_a52b_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1502_c7_a52b_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1502_c7_a52b_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1502_c7_a52b_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1502_c7_a52b]
signal tmp8_low_MUX_uxn_opcodes_h_l1502_c7_a52b_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1502_c7_a52b_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1502_c7_a52b_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1502_c7_a52b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1502_c7_a52b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_a52b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_a52b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_a52b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_a52b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1502_c7_a52b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_a52b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_a52b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_a52b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_a52b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1502_c7_a52b]
signal result_u8_value_MUX_uxn_opcodes_h_l1502_c7_a52b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1502_c7_a52b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1502_c7_a52b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1502_c7_a52b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1502_c7_a52b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_a52b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_a52b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_a52b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_a52b_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1508_c11_e998]
signal BIN_OP_EQ_uxn_opcodes_h_l1508_c11_e998_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1508_c11_e998_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1508_c11_e998_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1508_c7_5a06]
signal tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a06_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a06_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a06_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a06_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1508_c7_5a06]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a06_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a06_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a06_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a06_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1508_c7_5a06]
signal result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a06_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a06_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a06_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a06_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1508_c7_5a06]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a06_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a06_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a06_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a06_return_output : unsigned(3 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint9_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(8 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
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
-- BIN_OP_EQ_uxn_opcodes_h_l1477_c6_aaf8
BIN_OP_EQ_uxn_opcodes_h_l1477_c6_aaf8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1477_c6_aaf8_left,
BIN_OP_EQ_uxn_opcodes_h_l1477_c6_aaf8_right,
BIN_OP_EQ_uxn_opcodes_h_l1477_c6_aaf8_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1477_c2_a94d
tmp8_high_MUX_uxn_opcodes_h_l1477_c2_a94d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1477_c2_a94d_cond,
tmp8_high_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1477_c2_a94d
tmp8_low_MUX_uxn_opcodes_h_l1477_c2_a94d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1477_c2_a94d_cond,
tmp8_low_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output);

-- t8_MUX_uxn_opcodes_h_l1477_c2_a94d
t8_MUX_uxn_opcodes_h_l1477_c2_a94d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1477_c2_a94d_cond,
t8_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue,
t8_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse,
t8_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_a94d
result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_a94d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1477_c2_a94d
result_u16_value_MUX_uxn_opcodes_h_l1477_c2_a94d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1477_c2_a94d_cond,
result_u16_value_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_a94d
result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_a94d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_a94d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_a94d
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_a94d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_a94d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1477_c2_a94d
result_u8_value_MUX_uxn_opcodes_h_l1477_c2_a94d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1477_c2_a94d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_a94d
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_a94d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_a94d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_a94d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_a94d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_a94d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_a94d
result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_a94d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_a94d
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_a94d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_a94d_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_a94d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_a94d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_a94d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1490_c11_3f86
BIN_OP_EQ_uxn_opcodes_h_l1490_c11_3f86 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1490_c11_3f86_left,
BIN_OP_EQ_uxn_opcodes_h_l1490_c11_3f86_right,
BIN_OP_EQ_uxn_opcodes_h_l1490_c11_3f86_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1490_c7_a05b
tmp8_high_MUX_uxn_opcodes_h_l1490_c7_a05b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1490_c7_a05b_cond,
tmp8_high_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1490_c7_a05b
tmp8_low_MUX_uxn_opcodes_h_l1490_c7_a05b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1490_c7_a05b_cond,
tmp8_low_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output);

-- t8_MUX_uxn_opcodes_h_l1490_c7_a05b
t8_MUX_uxn_opcodes_h_l1490_c7_a05b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1490_c7_a05b_cond,
t8_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue,
t8_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse,
t8_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1490_c7_a05b
result_u16_value_MUX_uxn_opcodes_h_l1490_c7_a05b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1490_c7_a05b_cond,
result_u16_value_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1490_c7_a05b
result_u8_value_MUX_uxn_opcodes_h_l1490_c7_a05b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1490_c7_a05b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_a05b
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_a05b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_a05b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_a05b
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_a05b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_a05b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_a05b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_a05b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_a05b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_a05b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_a05b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_a05b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1493_c11_8f9c
BIN_OP_EQ_uxn_opcodes_h_l1493_c11_8f9c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1493_c11_8f9c_left,
BIN_OP_EQ_uxn_opcodes_h_l1493_c11_8f9c_right,
BIN_OP_EQ_uxn_opcodes_h_l1493_c11_8f9c_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1493_c7_1bb4
tmp8_high_MUX_uxn_opcodes_h_l1493_c7_1bb4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond,
tmp8_high_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1493_c7_1bb4
tmp8_low_MUX_uxn_opcodes_h_l1493_c7_1bb4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond,
tmp8_low_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output);

-- t8_MUX_uxn_opcodes_h_l1493_c7_1bb4
t8_MUX_uxn_opcodes_h_l1493_c7_1bb4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond,
t8_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue,
t8_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse,
t8_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1493_c7_1bb4
result_u16_value_MUX_uxn_opcodes_h_l1493_c7_1bb4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond,
result_u16_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1493_c7_1bb4
result_u8_value_MUX_uxn_opcodes_h_l1493_c7_1bb4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_1bb4
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_1bb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_1bb4
result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_1bb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_1bb4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_1bb4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_1bb4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_1bb4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1495_c30_18d6
sp_relative_shift_uxn_opcodes_h_l1495_c30_18d6 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1495_c30_18d6_ins,
sp_relative_shift_uxn_opcodes_h_l1495_c30_18d6_x,
sp_relative_shift_uxn_opcodes_h_l1495_c30_18d6_y,
sp_relative_shift_uxn_opcodes_h_l1495_c30_18d6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1498_c11_8a59
BIN_OP_EQ_uxn_opcodes_h_l1498_c11_8a59 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1498_c11_8a59_left,
BIN_OP_EQ_uxn_opcodes_h_l1498_c11_8a59_right,
BIN_OP_EQ_uxn_opcodes_h_l1498_c11_8a59_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1498_c7_022d
tmp8_high_MUX_uxn_opcodes_h_l1498_c7_022d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1498_c7_022d_cond,
tmp8_high_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1498_c7_022d_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1498_c7_022d
tmp8_low_MUX_uxn_opcodes_h_l1498_c7_022d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1498_c7_022d_cond,
tmp8_low_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1498_c7_022d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1498_c7_022d
result_u16_value_MUX_uxn_opcodes_h_l1498_c7_022d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1498_c7_022d_cond,
result_u16_value_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1498_c7_022d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1498_c7_022d
result_u8_value_MUX_uxn_opcodes_h_l1498_c7_022d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1498_c7_022d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1498_c7_022d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_022d
result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_022d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_022d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_022d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_022d
result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_022d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_022d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_022d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_022d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_022d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_022d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_022d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_022d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_022d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_022d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_022d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_31a2
BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_31a2 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_31a2_left,
BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_31a2_right,
BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_31a2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1502_c11_b2af
BIN_OP_EQ_uxn_opcodes_h_l1502_c11_b2af : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1502_c11_b2af_left,
BIN_OP_EQ_uxn_opcodes_h_l1502_c11_b2af_right,
BIN_OP_EQ_uxn_opcodes_h_l1502_c11_b2af_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1502_c7_a52b
tmp8_high_MUX_uxn_opcodes_h_l1502_c7_a52b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1502_c7_a52b_cond,
tmp8_high_MUX_uxn_opcodes_h_l1502_c7_a52b_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1502_c7_a52b_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1502_c7_a52b_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1502_c7_a52b
tmp8_low_MUX_uxn_opcodes_h_l1502_c7_a52b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1502_c7_a52b_cond,
tmp8_low_MUX_uxn_opcodes_h_l1502_c7_a52b_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1502_c7_a52b_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1502_c7_a52b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_a52b
result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_a52b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_a52b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_a52b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_a52b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_a52b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_a52b
result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_a52b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_a52b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_a52b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_a52b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_a52b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1502_c7_a52b
result_u8_value_MUX_uxn_opcodes_h_l1502_c7_a52b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1502_c7_a52b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1502_c7_a52b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1502_c7_a52b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1502_c7_a52b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_a52b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_a52b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_a52b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_a52b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_a52b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_a52b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1508_c11_e998
BIN_OP_EQ_uxn_opcodes_h_l1508_c11_e998 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1508_c11_e998_left,
BIN_OP_EQ_uxn_opcodes_h_l1508_c11_e998_right,
BIN_OP_EQ_uxn_opcodes_h_l1508_c11_e998_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a06
tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a06_cond,
tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a06_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a06_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a06_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a06
result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a06_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a06_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a06_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a06_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a06
result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a06_cond,
result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a06_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a06_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a06_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a06
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a06 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a06_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a06_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a06_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a06_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t8,
 tmp8_high,
 tmp8_low,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1477_c6_aaf8_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output,
 t8_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1490_c11_3f86_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output,
 t8_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1493_c11_8f9c_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output,
 t8_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output,
 sp_relative_shift_uxn_opcodes_h_l1495_c30_18d6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1498_c11_8a59_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1498_c7_022d_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1498_c7_022d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1498_c7_022d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1498_c7_022d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_022d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_022d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_022d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_022d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_31a2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1502_c11_b2af_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1502_c7_a52b_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1502_c7_a52b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_a52b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_a52b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1502_c7_a52b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_a52b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1508_c11_e998_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a06_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a06_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a06_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a06_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_aaf8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_aaf8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_aaf8_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_a94d_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_a94d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1477_c2_a94d_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1477_c2_a94d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_a94d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1477_c2_a94d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_a94d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_a94d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_a94d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_a94d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1487_c3_9673 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_a94d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1477_c2_a94d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1477_c2_a94d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_a94d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1482_c3_9440 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_a94d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_3f86_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_3f86_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_3f86_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_a05b_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_a05b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1490_c7_a05b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_a05b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_a05b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_a05b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_a05b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1491_c3_9801 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_a05b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_a05b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_8f9c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_8f9c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_8f9c_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_022d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_022d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_022d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_022d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_022d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_022d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_022d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_022d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_18d6_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_18d6_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_18d6_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_18d6_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1496_c22_5fd7_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_8a59_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_8a59_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_8a59_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_a52b_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_022d_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_a52b_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_022d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_022d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_a52b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_022d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_a52b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_022d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_a52b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_022d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_a52b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_022d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1499_c3_7269 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_022d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_31a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_31a2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_31a2_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1500_c22_b05f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_b2af_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_b2af_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_b2af_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_a52b_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_a52b_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_a52b_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_a52b_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_a52b_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a06_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_a52b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_a52b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_a52b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_a52b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_a52b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_a52b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_a52b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_a52b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_a52b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a06_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_a52b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_a52b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1505_c3_5b5e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_a52b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a06_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_a52b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_e998_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_e998_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_e998_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a06_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a06_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a06_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a06_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a06_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a06_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a06_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a06_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1510_c3_fa2f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a06_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a06_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1477_l1498_l1490_DUPLICATE_c092_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1508_l1498_l1493_l1490_l1477_DUPLICATE_5a21_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1508_l1502_l1498_l1493_l1490_DUPLICATE_aee4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1502_l1493_l1498_l1490_DUPLICATE_fb6f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1498_l1490_DUPLICATE_d675_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1493_l1508_l1498_DUPLICATE_865c_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d9be_uxn_opcodes_h_l1473_l1515_DUPLICATE_d933_return_output : opcode_result_t;
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
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_3f86_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1510_c3_fa2f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a06_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1510_c3_fa2f;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1482_c3_9440 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1482_c3_9440;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1491_c3_9801 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1491_c3_9801;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_8f9c_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a06_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1487_c3_9673 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1487_c3_9673;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_31a2_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_a52b_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1499_c3_7269 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1499_c3_7269;
     VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_18d6_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_aaf8_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1505_c3_5b5e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_a52b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1505_c3_5b5e;
     VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_18d6_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_8a59_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_e998_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_b2af_right := to_unsigned(4, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue := to_unsigned(0, 1);

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
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_18d6_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_aaf8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_3f86_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_8f9c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_8a59_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_b2af_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_e998_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_a52b_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a06_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_a52b_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a06_iftrue := VAR_previous_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_31a2_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse := t8;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_a52b_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_a52b_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a06_iffalse := tmp8_low;
     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1477_c2_a94d] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1477_c2_a94d_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1498_c11_8a59] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1498_c11_8a59_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_8a59_left;
     BIN_OP_EQ_uxn_opcodes_h_l1498_c11_8a59_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_8a59_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_8a59_return_output := BIN_OP_EQ_uxn_opcodes_h_l1498_c11_8a59_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1498_l1490_DUPLICATE_d675 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1498_l1490_DUPLICATE_d675_return_output := result.sp_relative_shift;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1477_c2_a94d] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1477_c2_a94d_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1477_l1498_l1490_DUPLICATE_c092 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1477_l1498_l1490_DUPLICATE_c092_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1508_c11_e998] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1508_c11_e998_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_e998_left;
     BIN_OP_EQ_uxn_opcodes_h_l1508_c11_e998_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_e998_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_e998_return_output := BIN_OP_EQ_uxn_opcodes_h_l1508_c11_e998_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1508_l1502_l1498_l1493_l1490_DUPLICATE_aee4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1508_l1502_l1498_l1493_l1490_DUPLICATE_aee4_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1477_c6_aaf8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1477_c6_aaf8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_aaf8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1477_c6_aaf8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_aaf8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_aaf8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1477_c6_aaf8_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1496_c22_5fd7] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1496_c22_5fd7_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1502_l1493_l1498_l1490_DUPLICATE_fb6f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1502_l1493_l1498_l1490_DUPLICATE_fb6f_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1508_l1498_l1493_l1490_l1477_DUPLICATE_5a21 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1508_l1498_l1493_l1490_l1477_DUPLICATE_5a21_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1490_c11_3f86] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1490_c11_3f86_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_3f86_left;
     BIN_OP_EQ_uxn_opcodes_h_l1490_c11_3f86_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_3f86_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_3f86_return_output := BIN_OP_EQ_uxn_opcodes_h_l1490_c11_3f86_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1493_c11_8f9c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1493_c11_8f9c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_8f9c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1493_c11_8f9c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_8f9c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_8f9c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1493_c11_8f9c_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1495_c30_18d6] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1495_c30_18d6_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_18d6_ins;
     sp_relative_shift_uxn_opcodes_h_l1495_c30_18d6_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_18d6_x;
     sp_relative_shift_uxn_opcodes_h_l1495_c30_18d6_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_18d6_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_18d6_return_output := sp_relative_shift_uxn_opcodes_h_l1495_c30_18d6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1502_c11_b2af] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1502_c11_b2af_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_b2af_left;
     BIN_OP_EQ_uxn_opcodes_h_l1502_c11_b2af_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_b2af_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_b2af_return_output := BIN_OP_EQ_uxn_opcodes_h_l1502_c11_b2af_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1477_c2_a94d] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1477_c2_a94d_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1493_l1508_l1498_DUPLICATE_865c LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1493_l1508_l1498_DUPLICATE_865c_return_output := result.stack_address_sp_offset;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1500_c33_31a2] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_31a2_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_31a2_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_31a2_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_31a2_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_31a2_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_31a2_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1477_c2_a94d] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1477_c2_a94d_return_output := result.is_vram_write;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_a94d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_aaf8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_a94d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_aaf8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_aaf8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_a94d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_aaf8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_a94d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_aaf8_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_aaf8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_a94d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_aaf8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_a94d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_aaf8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_a94d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_aaf8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_a94d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_aaf8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1477_c2_a94d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_aaf8_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_a94d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_aaf8_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_a94d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_aaf8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_a05b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_3f86_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_a05b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_3f86_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_a05b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_3f86_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_a05b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_3f86_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_a05b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_3f86_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_a05b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_3f86_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1490_c7_a05b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_3f86_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_a05b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_3f86_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_a05b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_3f86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_8f9c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_8f9c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_8f9c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_8f9c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_8f9c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_8f9c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_8f9c_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_8f9c_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_8f9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_022d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_8a59_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_022d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_8a59_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_022d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_8a59_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_022d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_8a59_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_022d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_8a59_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_022d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_8a59_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_022d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_8a59_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_022d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_8a59_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_a52b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_b2af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_a52b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_b2af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_a52b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_b2af_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_a52b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_b2af_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_a52b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_b2af_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_a52b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_b2af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_e998_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_e998_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_e998_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_e998_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1496_c22_5fd7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1498_l1490_DUPLICATE_d675_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1498_l1490_DUPLICATE_d675_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1477_l1498_l1490_DUPLICATE_c092_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1477_l1498_l1490_DUPLICATE_c092_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1477_l1498_l1490_DUPLICATE_c092_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1508_l1502_l1498_l1493_l1490_DUPLICATE_aee4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1508_l1502_l1498_l1493_l1490_DUPLICATE_aee4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1508_l1502_l1498_l1493_l1490_DUPLICATE_aee4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_a52b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1508_l1502_l1498_l1493_l1490_DUPLICATE_aee4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a06_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1508_l1502_l1498_l1493_l1490_DUPLICATE_aee4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1502_l1493_l1498_l1490_DUPLICATE_fb6f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1502_l1493_l1498_l1490_DUPLICATE_fb6f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1502_l1493_l1498_l1490_DUPLICATE_fb6f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_a52b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1502_l1493_l1498_l1490_DUPLICATE_fb6f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1493_l1508_l1498_DUPLICATE_865c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1493_l1508_l1498_DUPLICATE_865c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a06_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1493_l1508_l1498_DUPLICATE_865c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1508_l1498_l1493_l1490_l1477_DUPLICATE_5a21_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1508_l1498_l1493_l1490_l1477_DUPLICATE_5a21_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1508_l1498_l1493_l1490_l1477_DUPLICATE_5a21_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1508_l1498_l1493_l1490_l1477_DUPLICATE_5a21_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a06_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1508_l1498_l1493_l1490_l1477_DUPLICATE_5a21_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1477_c2_a94d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1477_c2_a94d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1477_c2_a94d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1477_c2_a94d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_18d6_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1498_c7_022d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_022d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_022d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_022d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_022d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1477_c2_a94d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1477_c2_a94d] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_a94d_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_a94d_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1508_c7_5a06] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a06_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a06_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a06_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a06_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a06_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a06_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a06_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a06_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1508_c7_5a06] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a06_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a06_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a06_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a06_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a06_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a06_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a06_return_output := result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a06_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1502_c7_a52b] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1502_c7_a52b_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_a52b_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1502_c7_a52b_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_a52b_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1502_c7_a52b_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_a52b_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_a52b_return_output := tmp8_high_MUX_uxn_opcodes_h_l1502_c7_a52b_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1477_c2_a94d] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1500_c22_b05f] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1500_c22_b05f_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_31a2_return_output);

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1477_c2_a94d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_a94d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_a94d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1508_c7_5a06] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a06_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a06_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a06_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a06_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a06_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a06_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a06_return_output := tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a06_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1508_c7_5a06] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a06_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a06_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a06_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a06_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a06_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a06_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a06_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a06_return_output;

     -- t8_MUX[uxn_opcodes_h_l1493_c7_1bb4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond <= VAR_t8_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond;
     t8_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue;
     t8_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output := t8_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1502_c7_a52b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_a52b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_a52b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_a52b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_a52b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_a52b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_a52b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_a52b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_a52b_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1500_c22_b05f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_a52b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a06_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_a52b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_022d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_a52b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a06_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_a52b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a06_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_a52b_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_a52b_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a06_return_output;
     -- t8_MUX[uxn_opcodes_h_l1490_c7_a05b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1490_c7_a05b_cond <= VAR_t8_MUX_uxn_opcodes_h_l1490_c7_a05b_cond;
     t8_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue;
     t8_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output := t8_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1498_c7_022d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1498_c7_022d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_022d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_022d_return_output := result_u16_value_MUX_uxn_opcodes_h_l1498_c7_022d_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1502_c7_a52b] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1502_c7_a52b_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_a52b_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1502_c7_a52b_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_a52b_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1502_c7_a52b_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_a52b_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_a52b_return_output := tmp8_low_MUX_uxn_opcodes_h_l1502_c7_a52b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1498_c7_022d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_022d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_022d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_022d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_022d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1502_c7_a52b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_a52b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_a52b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_a52b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_a52b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_a52b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_a52b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_a52b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_a52b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1502_c7_a52b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1502_c7_a52b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_a52b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1502_c7_a52b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_a52b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1502_c7_a52b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_a52b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_a52b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1502_c7_a52b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1493_c7_1bb4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1498_c7_022d] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1498_c7_022d_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_022d_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_022d_return_output := tmp8_high_MUX_uxn_opcodes_h_l1498_c7_022d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1502_c7_a52b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_a52b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_a52b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_a52b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_a52b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_a52b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_a52b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_a52b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_a52b_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_a52b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_022d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_a52b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_022d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_a52b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_022d_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_a52b_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1498_c7_022d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_022d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_022d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_022d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_022d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1490_c7_a05b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_a05b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_a05b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1498_c7_022d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_022d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_022d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_022d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_022d_return_output;

     -- t8_MUX[uxn_opcodes_h_l1477_c2_a94d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1477_c2_a94d_cond <= VAR_t8_MUX_uxn_opcodes_h_l1477_c2_a94d_cond;
     t8_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue;
     t8_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output := t8_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1493_c7_1bb4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output := result_u16_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1498_c7_022d] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1498_c7_022d_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_022d_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_022d_return_output := tmp8_low_MUX_uxn_opcodes_h_l1498_c7_022d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1498_c7_022d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1498_c7_022d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_022d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_022d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_022d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_022d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1498_c7_022d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1493_c7_1bb4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1493_c7_1bb4] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output := tmp8_high_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_022d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_022d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_022d_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_022d_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1490_c7_a05b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1490_c7_a05b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_a05b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output := result_u16_value_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1490_c7_a05b] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1490_c7_a05b_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_a05b_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output := tmp8_high_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1493_c7_1bb4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1493_c7_1bb4] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output := tmp8_low_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1477_c2_a94d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_a94d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_a94d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1493_c7_1bb4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1493_c7_1bb4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1490_c7_a05b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_a05b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_a05b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_1bb4_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1477_c2_a94d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_a94d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_a94d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1490_c7_a05b] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1490_c7_a05b_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_a05b_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output := tmp8_low_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1490_c7_a05b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_a05b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_a05b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1490_c7_a05b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1490_c7_a05b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_a05b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1477_c2_a94d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1477_c2_a94d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_a94d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output := result_u16_value_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1477_c2_a94d] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1477_c2_a94d_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_a94d_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output := tmp8_high_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1490_c7_a05b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_a05b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_a05b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_a05b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_a05b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_a05b_return_output;
     -- tmp8_low_MUX[uxn_opcodes_h_l1477_c2_a94d] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1477_c2_a94d_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_a94d_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output := tmp8_low_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1477_c2_a94d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1477_c2_a94d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_a94d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1477_c2_a94d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_a94d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_a94d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1477_c2_a94d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_a94d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_a94d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_a94d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_a94d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output;

     -- Submodule level 7
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d9be_uxn_opcodes_h_l1473_l1515_DUPLICATE_d933 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d9be_uxn_opcodes_h_l1473_l1515_DUPLICATE_d933_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d9be(
     result,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_a94d_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d9be_uxn_opcodes_h_l1473_l1515_DUPLICATE_d933_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d9be_uxn_opcodes_h_l1473_l1515_DUPLICATE_d933_return_output;
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
