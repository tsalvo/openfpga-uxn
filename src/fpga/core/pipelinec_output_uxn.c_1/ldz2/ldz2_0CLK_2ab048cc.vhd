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
-- BIN_OP_EQ[uxn_opcodes_h_l1477_c6_d1ba]
signal BIN_OP_EQ_uxn_opcodes_h_l1477_c6_d1ba_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1477_c6_d1ba_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1477_c6_d1ba_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1477_c2_47ac]
signal tmp8_low_MUX_uxn_opcodes_h_l1477_c2_47ac_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1477_c2_47ac]
signal result_u16_value_MUX_uxn_opcodes_h_l1477_c2_47ac_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1477_c2_47ac]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_47ac_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1477_c2_47ac]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1477_c2_47ac]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_47ac_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1477_c2_47ac]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_47ac_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1477_c2_47ac]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_47ac_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1477_c2_47ac]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_47ac_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1477_c2_47ac]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1477_c2_47ac]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_47ac_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1477_c2_47ac]
signal result_u8_value_MUX_uxn_opcodes_h_l1477_c2_47ac_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1477_c2_47ac]
signal tmp8_high_MUX_uxn_opcodes_h_l1477_c2_47ac_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1477_c2_47ac]
signal t8_MUX_uxn_opcodes_h_l1477_c2_47ac_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1490_c11_20e3]
signal BIN_OP_EQ_uxn_opcodes_h_l1490_c11_20e3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1490_c11_20e3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1490_c11_20e3_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1490_c7_6629]
signal tmp8_low_MUX_uxn_opcodes_h_l1490_c7_6629_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1490_c7_6629_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1490_c7_6629]
signal result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6629_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6629_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1490_c7_6629]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6629_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6629_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1490_c7_6629]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6629_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6629_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1490_c7_6629]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6629_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6629_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1490_c7_6629]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6629_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6629_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1490_c7_6629]
signal result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6629_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6629_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1490_c7_6629]
signal tmp8_high_MUX_uxn_opcodes_h_l1490_c7_6629_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1490_c7_6629_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1490_c7_6629]
signal t8_MUX_uxn_opcodes_h_l1490_c7_6629_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1490_c7_6629_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1493_c11_271b]
signal BIN_OP_EQ_uxn_opcodes_h_l1493_c11_271b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1493_c11_271b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1493_c11_271b_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1493_c7_54b1]
signal tmp8_low_MUX_uxn_opcodes_h_l1493_c7_54b1_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1493_c7_54b1]
signal result_u16_value_MUX_uxn_opcodes_h_l1493_c7_54b1_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1493_c7_54b1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_54b1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1493_c7_54b1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_54b1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1493_c7_54b1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_54b1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1493_c7_54b1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_54b1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1493_c7_54b1]
signal result_u8_value_MUX_uxn_opcodes_h_l1493_c7_54b1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1493_c7_54b1]
signal tmp8_high_MUX_uxn_opcodes_h_l1493_c7_54b1_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1493_c7_54b1]
signal t8_MUX_uxn_opcodes_h_l1493_c7_54b1_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1495_c30_4af5]
signal sp_relative_shift_uxn_opcodes_h_l1495_c30_4af5_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1495_c30_4af5_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1495_c30_4af5_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1495_c30_4af5_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1498_c11_2804]
signal BIN_OP_EQ_uxn_opcodes_h_l1498_c11_2804_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1498_c11_2804_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1498_c11_2804_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1498_c7_3d69]
signal tmp8_low_MUX_uxn_opcodes_h_l1498_c7_3d69_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1498_c7_3d69]
signal result_u16_value_MUX_uxn_opcodes_h_l1498_c7_3d69_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1498_c7_3d69]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_3d69_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1498_c7_3d69]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_3d69_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1498_c7_3d69]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_3d69_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1498_c7_3d69]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_3d69_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1498_c7_3d69]
signal result_u8_value_MUX_uxn_opcodes_h_l1498_c7_3d69_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1498_c7_3d69]
signal tmp8_high_MUX_uxn_opcodes_h_l1498_c7_3d69_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1500_c33_6047]
signal BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_6047_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_6047_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_6047_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1502_c11_f356]
signal BIN_OP_EQ_uxn_opcodes_h_l1502_c11_f356_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1502_c11_f356_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1502_c11_f356_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1502_c7_b209]
signal tmp8_low_MUX_uxn_opcodes_h_l1502_c7_b209_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1502_c7_b209_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1502_c7_b209_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1502_c7_b209_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1502_c7_b209]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_b209_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_b209_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_b209_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_b209_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1502_c7_b209]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_b209_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_b209_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_b209_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_b209_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1502_c7_b209]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_b209_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_b209_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_b209_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_b209_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1502_c7_b209]
signal result_u8_value_MUX_uxn_opcodes_h_l1502_c7_b209_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1502_c7_b209_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1502_c7_b209_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1502_c7_b209_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1502_c7_b209]
signal tmp8_high_MUX_uxn_opcodes_h_l1502_c7_b209_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1502_c7_b209_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1502_c7_b209_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1502_c7_b209_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1508_c11_797f]
signal BIN_OP_EQ_uxn_opcodes_h_l1508_c11_797f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1508_c11_797f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1508_c11_797f_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1508_c7_907d]
signal tmp8_low_MUX_uxn_opcodes_h_l1508_c7_907d_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1508_c7_907d_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1508_c7_907d_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1508_c7_907d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1508_c7_907d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_907d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_907d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_907d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_907d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1508_c7_907d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_907d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_907d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_907d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_907d_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1508_c7_907d]
signal result_u8_value_MUX_uxn_opcodes_h_l1508_c7_907d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1508_c7_907d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1508_c7_907d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1508_c7_907d_return_output : unsigned(7 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_a906( ref_toks_0 : opcode_result_t;
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
      base.u16_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_vram_write := ref_toks_8;
      base.is_pc_updated := ref_toks_9;
      base.u8_value := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1477_c6_d1ba
BIN_OP_EQ_uxn_opcodes_h_l1477_c6_d1ba : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1477_c6_d1ba_left,
BIN_OP_EQ_uxn_opcodes_h_l1477_c6_d1ba_right,
BIN_OP_EQ_uxn_opcodes_h_l1477_c6_d1ba_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1477_c2_47ac
tmp8_low_MUX_uxn_opcodes_h_l1477_c2_47ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1477_c2_47ac_cond,
tmp8_low_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1477_c2_47ac
result_u16_value_MUX_uxn_opcodes_h_l1477_c2_47ac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1477_c2_47ac_cond,
result_u16_value_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_47ac
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_47ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_47ac_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_47ac
result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_47ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_47ac
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_47ac : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_47ac_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_47ac
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_47ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_47ac_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_47ac
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_47ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_47ac_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_47ac
result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_47ac : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_47ac_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_47ac
result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_47ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_47ac
result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_47ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_47ac_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1477_c2_47ac
result_u8_value_MUX_uxn_opcodes_h_l1477_c2_47ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1477_c2_47ac_cond,
result_u8_value_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1477_c2_47ac
tmp8_high_MUX_uxn_opcodes_h_l1477_c2_47ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1477_c2_47ac_cond,
tmp8_high_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output);

-- t8_MUX_uxn_opcodes_h_l1477_c2_47ac
t8_MUX_uxn_opcodes_h_l1477_c2_47ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1477_c2_47ac_cond,
t8_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue,
t8_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse,
t8_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1490_c11_20e3
BIN_OP_EQ_uxn_opcodes_h_l1490_c11_20e3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1490_c11_20e3_left,
BIN_OP_EQ_uxn_opcodes_h_l1490_c11_20e3_right,
BIN_OP_EQ_uxn_opcodes_h_l1490_c11_20e3_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1490_c7_6629
tmp8_low_MUX_uxn_opcodes_h_l1490_c7_6629 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1490_c7_6629_cond,
tmp8_low_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1490_c7_6629_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6629
result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6629 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6629_cond,
result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6629_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6629
result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6629 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6629_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6629_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6629
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6629 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6629_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6629_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6629
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6629 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6629_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6629_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6629
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6629 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6629_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6629_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6629
result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6629 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6629_cond,
result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6629_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1490_c7_6629
tmp8_high_MUX_uxn_opcodes_h_l1490_c7_6629 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1490_c7_6629_cond,
tmp8_high_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1490_c7_6629_return_output);

-- t8_MUX_uxn_opcodes_h_l1490_c7_6629
t8_MUX_uxn_opcodes_h_l1490_c7_6629 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1490_c7_6629_cond,
t8_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue,
t8_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse,
t8_MUX_uxn_opcodes_h_l1490_c7_6629_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1493_c11_271b
BIN_OP_EQ_uxn_opcodes_h_l1493_c11_271b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1493_c11_271b_left,
BIN_OP_EQ_uxn_opcodes_h_l1493_c11_271b_right,
BIN_OP_EQ_uxn_opcodes_h_l1493_c11_271b_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1493_c7_54b1
tmp8_low_MUX_uxn_opcodes_h_l1493_c7_54b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1493_c7_54b1_cond,
tmp8_low_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1493_c7_54b1
result_u16_value_MUX_uxn_opcodes_h_l1493_c7_54b1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1493_c7_54b1_cond,
result_u16_value_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_54b1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_54b1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_54b1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_54b1
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_54b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_54b1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_54b1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_54b1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_54b1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_54b1
result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_54b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_54b1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1493_c7_54b1
result_u8_value_MUX_uxn_opcodes_h_l1493_c7_54b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1493_c7_54b1_cond,
result_u8_value_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1493_c7_54b1
tmp8_high_MUX_uxn_opcodes_h_l1493_c7_54b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1493_c7_54b1_cond,
tmp8_high_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output);

-- t8_MUX_uxn_opcodes_h_l1493_c7_54b1
t8_MUX_uxn_opcodes_h_l1493_c7_54b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1493_c7_54b1_cond,
t8_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue,
t8_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse,
t8_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1495_c30_4af5
sp_relative_shift_uxn_opcodes_h_l1495_c30_4af5 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1495_c30_4af5_ins,
sp_relative_shift_uxn_opcodes_h_l1495_c30_4af5_x,
sp_relative_shift_uxn_opcodes_h_l1495_c30_4af5_y,
sp_relative_shift_uxn_opcodes_h_l1495_c30_4af5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1498_c11_2804
BIN_OP_EQ_uxn_opcodes_h_l1498_c11_2804 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1498_c11_2804_left,
BIN_OP_EQ_uxn_opcodes_h_l1498_c11_2804_right,
BIN_OP_EQ_uxn_opcodes_h_l1498_c11_2804_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1498_c7_3d69
tmp8_low_MUX_uxn_opcodes_h_l1498_c7_3d69 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1498_c7_3d69_cond,
tmp8_low_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1498_c7_3d69
result_u16_value_MUX_uxn_opcodes_h_l1498_c7_3d69 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1498_c7_3d69_cond,
result_u16_value_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_3d69
result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_3d69 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_3d69_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_3d69
result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_3d69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_3d69_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_3d69
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_3d69 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_3d69_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_3d69
result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_3d69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_3d69_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1498_c7_3d69
result_u8_value_MUX_uxn_opcodes_h_l1498_c7_3d69 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1498_c7_3d69_cond,
result_u8_value_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1498_c7_3d69
tmp8_high_MUX_uxn_opcodes_h_l1498_c7_3d69 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1498_c7_3d69_cond,
tmp8_high_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_6047
BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_6047 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_6047_left,
BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_6047_right,
BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_6047_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1502_c11_f356
BIN_OP_EQ_uxn_opcodes_h_l1502_c11_f356 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1502_c11_f356_left,
BIN_OP_EQ_uxn_opcodes_h_l1502_c11_f356_right,
BIN_OP_EQ_uxn_opcodes_h_l1502_c11_f356_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1502_c7_b209
tmp8_low_MUX_uxn_opcodes_h_l1502_c7_b209 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1502_c7_b209_cond,
tmp8_low_MUX_uxn_opcodes_h_l1502_c7_b209_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1502_c7_b209_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1502_c7_b209_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_b209
result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_b209 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_b209_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_b209_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_b209_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_b209_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_b209
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_b209 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_b209_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_b209_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_b209_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_b209_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_b209
result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_b209 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_b209_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_b209_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_b209_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_b209_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1502_c7_b209
result_u8_value_MUX_uxn_opcodes_h_l1502_c7_b209 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1502_c7_b209_cond,
result_u8_value_MUX_uxn_opcodes_h_l1502_c7_b209_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1502_c7_b209_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1502_c7_b209_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1502_c7_b209
tmp8_high_MUX_uxn_opcodes_h_l1502_c7_b209 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1502_c7_b209_cond,
tmp8_high_MUX_uxn_opcodes_h_l1502_c7_b209_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1502_c7_b209_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1502_c7_b209_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1508_c11_797f
BIN_OP_EQ_uxn_opcodes_h_l1508_c11_797f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1508_c11_797f_left,
BIN_OP_EQ_uxn_opcodes_h_l1508_c11_797f_right,
BIN_OP_EQ_uxn_opcodes_h_l1508_c11_797f_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1508_c7_907d
tmp8_low_MUX_uxn_opcodes_h_l1508_c7_907d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1508_c7_907d_cond,
tmp8_low_MUX_uxn_opcodes_h_l1508_c7_907d_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1508_c7_907d_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1508_c7_907d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_907d
result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_907d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_907d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_907d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_907d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_907d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_907d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_907d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_907d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_907d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_907d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_907d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1508_c7_907d
result_u8_value_MUX_uxn_opcodes_h_l1508_c7_907d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1508_c7_907d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1508_c7_907d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1508_c7_907d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1508_c7_907d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1477_c6_d1ba_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output,
 t8_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1490_c11_20e3_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1490_c7_6629_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6629_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6629_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6629_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6629_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6629_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6629_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1490_c7_6629_return_output,
 t8_MUX_uxn_opcodes_h_l1490_c7_6629_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1493_c11_271b_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output,
 t8_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output,
 sp_relative_shift_uxn_opcodes_h_l1495_c30_4af5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1498_c11_2804_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_6047_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1502_c11_f356_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1502_c7_b209_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_b209_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_b209_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_b209_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1502_c7_b209_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1502_c7_b209_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1508_c11_797f_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1508_c7_907d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_907d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_907d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1508_c7_907d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_d1ba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_d1ba_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_d1ba_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_6629_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_47ac_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6629_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_47ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6629_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_47ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1477_c2_47ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1487_c3_14c2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6629_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_47ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6629_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_47ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1477_c2_47ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_47ac_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1482_c3_4e02 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6629_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_47ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1477_c2_47ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1477_c2_47ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_47ac_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6629_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_47ac_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_6629_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_47ac_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1490_c7_6629_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1477_c2_47ac_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_20e3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_20e3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_20e3_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_6629_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6629_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6629_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6629_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1491_c3_c029 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6629_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6629_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6629_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_6629_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1490_c7_6629_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_271b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_271b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_271b_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_54b1_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_54b1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_54b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_54b1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_54b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_54b1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_54b1_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_54b1_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1493_c7_54b1_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_4af5_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_4af5_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_4af5_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_4af5_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1496_c22_4499_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_2804_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_2804_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_2804_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_b209_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_3d69_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_3d69_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1499_c3_4452 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_3d69_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_b209_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_3d69_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_b209_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_3d69_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_b209_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_3d69_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_b209_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_3d69_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_b209_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_3d69_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_6047_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_6047_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_6047_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1500_c22_c23d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_f356_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_f356_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_f356_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_b209_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_b209_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_907d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_b209_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_b209_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_b209_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_907d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_b209_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_b209_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1505_c3_25ce : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_b209_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_907d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_b209_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_b209_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_b209_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_b209_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_b209_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_b209_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_907d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_b209_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_b209_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_b209_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_b209_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_797f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_797f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_797f_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_907d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_907d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_907d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_907d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_907d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_907d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_907d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1510_c3_a1e2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_907d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_907d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_907d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_907d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_907d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1477_l1498_l1490_DUPLICATE_12b7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1493_l1490_l1477_l1508_l1498_DUPLICATE_e9cf_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1498_l1490_DUPLICATE_5c23_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1493_l1490_l1508_l1502_l1498_DUPLICATE_044f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1502_l1493_l1498_l1490_DUPLICATE_6dad_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1493_l1508_l1498_DUPLICATE_5c51_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l1473_l1515_DUPLICATE_5959_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1491_c3_c029 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1491_c3_c029;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_907d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_2804_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_f356_right := to_unsigned(4, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_6047_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_797f_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1505_c3_25ce := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_b209_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1505_c3_25ce;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1487_c3_14c2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1487_c3_14c2;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_271b_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1482_c3_4e02 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1482_c3_4e02;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_d1ba_right := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_4af5_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1510_c3_a1e2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_907d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1510_c3_a1e2;
     VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_4af5_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_20e3_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1499_c3_4452 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1499_c3_4452;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_b209_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_4af5_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_d1ba_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_20e3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_271b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_2804_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_f356_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_797f_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_b209_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_907d_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_b209_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_907d_iftrue := VAR_previous_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_6047_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse := t8;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_b209_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_b209_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_907d_iffalse := tmp8_low;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1502_l1493_l1498_l1490_DUPLICATE_6dad LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1502_l1493_l1498_l1490_DUPLICATE_6dad_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1493_c11_271b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1493_c11_271b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_271b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1493_c11_271b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_271b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_271b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1493_c11_271b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1490_c11_20e3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1490_c11_20e3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_20e3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1490_c11_20e3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_20e3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_20e3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1490_c11_20e3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1493_l1490_l1508_l1502_l1498_DUPLICATE_044f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1493_l1490_l1508_l1502_l1498_DUPLICATE_044f_return_output := result.is_opc_done;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1500_c33_6047] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_6047_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_6047_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_6047_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_6047_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_6047_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_6047_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1493_l1508_l1498_DUPLICATE_5c51 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1493_l1508_l1498_DUPLICATE_5c51_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1477_c6_d1ba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1477_c6_d1ba_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_d1ba_left;
     BIN_OP_EQ_uxn_opcodes_h_l1477_c6_d1ba_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_d1ba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_d1ba_return_output := BIN_OP_EQ_uxn_opcodes_h_l1477_c6_d1ba_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1495_c30_4af5] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1495_c30_4af5_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_4af5_ins;
     sp_relative_shift_uxn_opcodes_h_l1495_c30_4af5_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_4af5_x;
     sp_relative_shift_uxn_opcodes_h_l1495_c30_4af5_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_4af5_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_4af5_return_output := sp_relative_shift_uxn_opcodes_h_l1495_c30_4af5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1502_c11_f356] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1502_c11_f356_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_f356_left;
     BIN_OP_EQ_uxn_opcodes_h_l1502_c11_f356_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_f356_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_f356_return_output := BIN_OP_EQ_uxn_opcodes_h_l1502_c11_f356_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1498_c11_2804] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1498_c11_2804_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_2804_left;
     BIN_OP_EQ_uxn_opcodes_h_l1498_c11_2804_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_2804_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_2804_return_output := BIN_OP_EQ_uxn_opcodes_h_l1498_c11_2804_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1508_c11_797f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1508_c11_797f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_797f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1508_c11_797f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_797f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_797f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1508_c11_797f_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1477_c2_47ac] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1477_c2_47ac_return_output := result.is_vram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1477_c2_47ac] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1477_c2_47ac_return_output := result.is_stack_index_flipped;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1477_c2_47ac] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1477_c2_47ac_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1477_l1498_l1490_DUPLICATE_12b7 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1477_l1498_l1490_DUPLICATE_12b7_return_output := result.u16_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1493_l1490_l1477_l1508_l1498_DUPLICATE_e9cf LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1493_l1490_l1477_l1508_l1498_DUPLICATE_e9cf_return_output := result.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1498_l1490_DUPLICATE_5c23 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1498_l1490_DUPLICATE_5c23_return_output := result.sp_relative_shift;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1496_c22_4499] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1496_c22_4499_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1477_c2_47ac] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1477_c2_47ac_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_47ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_d1ba_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_47ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_d1ba_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_d1ba_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_47ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_d1ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_47ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_d1ba_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_d1ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_47ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_d1ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_47ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_d1ba_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_47ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_d1ba_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_47ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_d1ba_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1477_c2_47ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_d1ba_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_47ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_d1ba_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_47ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_d1ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6629_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_20e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6629_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_20e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6629_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_20e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6629_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_20e3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6629_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_20e3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6629_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_20e3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1490_c7_6629_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_20e3_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_6629_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_20e3_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_6629_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_20e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_54b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_271b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_54b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_271b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_54b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_271b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_54b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_271b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_54b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_271b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_54b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_271b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1493_c7_54b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_271b_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_54b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_271b_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_54b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_271b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_3d69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_2804_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_3d69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_2804_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_3d69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_2804_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_3d69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_2804_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_3d69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_2804_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_3d69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_2804_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_3d69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_2804_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_3d69_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_2804_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_b209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_f356_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_b209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_f356_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_b209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_f356_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_b209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_f356_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_b209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_f356_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_b209_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_f356_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_907d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_797f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_907d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_797f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_907d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_797f_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_907d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_797f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1496_c22_4499_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1498_l1490_DUPLICATE_5c23_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1498_l1490_DUPLICATE_5c23_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1477_l1498_l1490_DUPLICATE_12b7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1477_l1498_l1490_DUPLICATE_12b7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1477_l1498_l1490_DUPLICATE_12b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1493_l1490_l1508_l1502_l1498_DUPLICATE_044f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1493_l1490_l1508_l1502_l1498_DUPLICATE_044f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1493_l1490_l1508_l1502_l1498_DUPLICATE_044f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_b209_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1493_l1490_l1508_l1502_l1498_DUPLICATE_044f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_907d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1493_l1490_l1508_l1502_l1498_DUPLICATE_044f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1502_l1493_l1498_l1490_DUPLICATE_6dad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1502_l1493_l1498_l1490_DUPLICATE_6dad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1502_l1493_l1498_l1490_DUPLICATE_6dad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_b209_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1502_l1493_l1498_l1490_DUPLICATE_6dad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1493_l1508_l1498_DUPLICATE_5c51_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1493_l1508_l1498_DUPLICATE_5c51_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_907d_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1493_l1508_l1498_DUPLICATE_5c51_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1493_l1490_l1477_l1508_l1498_DUPLICATE_e9cf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1493_l1490_l1477_l1508_l1498_DUPLICATE_e9cf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1493_l1490_l1477_l1508_l1498_DUPLICATE_e9cf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1493_l1490_l1477_l1508_l1498_DUPLICATE_e9cf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_907d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1493_l1490_l1477_l1508_l1498_DUPLICATE_e9cf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1477_c2_47ac_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1477_c2_47ac_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1477_c2_47ac_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1477_c2_47ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_4af5_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1502_c7_b209] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_b209_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_b209_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_b209_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_b209_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_b209_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_b209_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_b209_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_b209_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1498_c7_3d69] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_3d69_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_3d69_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output;

     -- t8_MUX[uxn_opcodes_h_l1493_c7_54b1] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1493_c7_54b1_cond <= VAR_t8_MUX_uxn_opcodes_h_l1493_c7_54b1_cond;
     t8_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue;
     t8_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output := t8_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1508_c7_907d] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1508_c7_907d_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_907d_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1508_c7_907d_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_907d_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1508_c7_907d_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_907d_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_907d_return_output := tmp8_low_MUX_uxn_opcodes_h_l1508_c7_907d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1508_c7_907d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1508_c7_907d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_907d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1508_c7_907d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_907d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1508_c7_907d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_907d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_907d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1508_c7_907d_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1500_c22_c23d] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1500_c22_c23d_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_6047_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1508_c7_907d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_907d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_907d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_907d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_907d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_907d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_907d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_907d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_907d_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1477_c2_47ac] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1508_c7_907d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_907d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_907d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_907d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_907d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_907d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_907d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_907d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_907d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1477_c2_47ac] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_47ac_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_47ac_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1477_c2_47ac] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_47ac_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_47ac_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1477_c2_47ac] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1502_c7_b209] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1502_c7_b209_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_b209_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1502_c7_b209_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_b209_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1502_c7_b209_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_b209_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_b209_return_output := tmp8_high_MUX_uxn_opcodes_h_l1502_c7_b209_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1500_c22_c23d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_b209_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_907d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_b209_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_b209_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_907d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_b209_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_907d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_b209_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_b209_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_907d_return_output;
     -- tmp8_low_MUX[uxn_opcodes_h_l1502_c7_b209] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1502_c7_b209_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_b209_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1502_c7_b209_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_b209_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1502_c7_b209_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_b209_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_b209_return_output := tmp8_low_MUX_uxn_opcodes_h_l1502_c7_b209_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1502_c7_b209] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_b209_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_b209_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_b209_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_b209_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_b209_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_b209_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_b209_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_b209_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1498_c7_3d69] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1498_c7_3d69_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_3d69_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output := result_u16_value_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1493_c7_54b1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_54b1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_54b1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output;

     -- t8_MUX[uxn_opcodes_h_l1490_c7_6629] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1490_c7_6629_cond <= VAR_t8_MUX_uxn_opcodes_h_l1490_c7_6629_cond;
     t8_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue;
     t8_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1490_c7_6629_return_output := t8_MUX_uxn_opcodes_h_l1490_c7_6629_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1502_c7_b209] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_b209_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_b209_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_b209_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_b209_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_b209_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_b209_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_b209_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_b209_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1498_c7_3d69] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_3d69_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_3d69_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1502_c7_b209] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1502_c7_b209_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_b209_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1502_c7_b209_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_b209_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1502_c7_b209_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_b209_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_b209_return_output := result_u8_value_MUX_uxn_opcodes_h_l1502_c7_b209_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1498_c7_3d69] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1498_c7_3d69_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_3d69_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output := tmp8_high_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_b209_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_b209_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_b209_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1490_c7_6629_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_b209_return_output;
     -- tmp8_high_MUX[uxn_opcodes_h_l1493_c7_54b1] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1493_c7_54b1_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_54b1_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output := tmp8_high_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1490_c7_6629] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6629_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6629_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6629_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6629_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1493_c7_54b1] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1493_c7_54b1_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_54b1_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output := result_u16_value_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1498_c7_3d69] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1498_c7_3d69_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_3d69_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output := tmp8_low_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1498_c7_3d69] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_3d69_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_3d69_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1498_c7_3d69] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_3d69_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_3d69_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output;

     -- t8_MUX[uxn_opcodes_h_l1477_c2_47ac] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1477_c2_47ac_cond <= VAR_t8_MUX_uxn_opcodes_h_l1477_c2_47ac_cond;
     t8_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue;
     t8_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output := t8_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1498_c7_3d69] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1498_c7_3d69_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_3d69_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_3d69_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_3d69_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output := result_u8_value_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1493_c7_54b1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_54b1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_54b1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_6629_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_3d69_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1493_c7_54b1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1493_c7_54b1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_54b1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output := result_u8_value_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1490_c7_6629] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1490_c7_6629_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_6629_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_6629_return_output := tmp8_high_MUX_uxn_opcodes_h_l1490_c7_6629_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1493_c7_54b1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_54b1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_54b1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1490_c7_6629] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6629_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6629_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6629_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6629_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1490_c7_6629] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6629_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6629_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6629_return_output := result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6629_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1477_c2_47ac] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_47ac_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_47ac_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1493_c7_54b1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_54b1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_54b1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1493_c7_54b1] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1493_c7_54b1_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_54b1_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_54b1_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_54b1_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output := tmp8_low_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_6629_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_6629_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_6629_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_54b1_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1490_c7_6629] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6629_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6629_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6629_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6629_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1490_c7_6629] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1490_c7_6629_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_6629_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_6629_return_output := tmp8_low_MUX_uxn_opcodes_h_l1490_c7_6629_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1477_c2_47ac] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1477_c2_47ac_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_47ac_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output := tmp8_high_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1477_c2_47ac] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1477_c2_47ac_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_47ac_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output := result_u16_value_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1490_c7_6629] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6629_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6629_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6629_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6629_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1490_c7_6629] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6629_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6629_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6629_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6629_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6629_return_output := result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6629_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1477_c2_47ac] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_47ac_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_47ac_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_6629_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_6629_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_6629_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_6629_return_output;
     -- tmp8_low_MUX[uxn_opcodes_h_l1477_c2_47ac] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1477_c2_47ac_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_47ac_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output := tmp8_low_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1477_c2_47ac] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_47ac_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_47ac_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1477_c2_47ac] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_47ac_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_47ac_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1477_c2_47ac] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1477_c2_47ac_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_47ac_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_47ac_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_47ac_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output := result_u8_value_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output;

     -- Submodule level 7
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l1473_l1515_DUPLICATE_5959 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l1473_l1515_DUPLICATE_5959_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a906(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_47ac_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l1473_l1515_DUPLICATE_5959_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l1473_l1515_DUPLICATE_5959_return_output;
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
