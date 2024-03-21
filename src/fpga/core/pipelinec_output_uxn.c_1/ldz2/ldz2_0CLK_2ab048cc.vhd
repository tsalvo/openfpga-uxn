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
-- BIN_OP_EQ[uxn_opcodes_h_l1477_c6_f14d]
signal BIN_OP_EQ_uxn_opcodes_h_l1477_c6_f14d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1477_c6_f14d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1477_c6_f14d_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1477_c2_fdf8]
signal tmp8_high_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1477_c2_fdf8]
signal t8_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1477_c2_fdf8]
signal tmp8_low_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1477_c2_fdf8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1477_c2_fdf8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1477_c2_fdf8]
signal result_u16_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1477_c2_fdf8]
signal result_u8_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1477_c2_fdf8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1477_c2_fdf8]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1477_c2_fdf8]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1477_c2_fdf8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1477_c2_fdf8]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1477_c2_fdf8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1490_c11_142e]
signal BIN_OP_EQ_uxn_opcodes_h_l1490_c11_142e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1490_c11_142e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1490_c11_142e_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1490_c7_7780]
signal tmp8_high_MUX_uxn_opcodes_h_l1490_c7_7780_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1490_c7_7780_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1490_c7_7780]
signal t8_MUX_uxn_opcodes_h_l1490_c7_7780_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1490_c7_7780_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1490_c7_7780]
signal tmp8_low_MUX_uxn_opcodes_h_l1490_c7_7780_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1490_c7_7780_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1490_c7_7780]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_7780_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_7780_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1490_c7_7780]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_7780_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_7780_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1490_c7_7780]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_7780_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_7780_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1490_c7_7780]
signal result_u16_value_MUX_uxn_opcodes_h_l1490_c7_7780_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1490_c7_7780_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1490_c7_7780]
signal result_u8_value_MUX_uxn_opcodes_h_l1490_c7_7780_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1490_c7_7780_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1490_c7_7780]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_7780_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_7780_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1493_c11_53bf]
signal BIN_OP_EQ_uxn_opcodes_h_l1493_c11_53bf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1493_c11_53bf_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1493_c11_53bf_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1493_c7_41b2]
signal tmp8_high_MUX_uxn_opcodes_h_l1493_c7_41b2_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1493_c7_41b2]
signal t8_MUX_uxn_opcodes_h_l1493_c7_41b2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1493_c7_41b2]
signal tmp8_low_MUX_uxn_opcodes_h_l1493_c7_41b2_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1493_c7_41b2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_41b2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1493_c7_41b2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_41b2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1493_c7_41b2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_41b2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1493_c7_41b2]
signal result_u16_value_MUX_uxn_opcodes_h_l1493_c7_41b2_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1493_c7_41b2]
signal result_u8_value_MUX_uxn_opcodes_h_l1493_c7_41b2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1493_c7_41b2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_41b2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1495_c30_dad9]
signal sp_relative_shift_uxn_opcodes_h_l1495_c30_dad9_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1495_c30_dad9_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1495_c30_dad9_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1495_c30_dad9_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1498_c11_cc1d]
signal BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cc1d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cc1d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cc1d_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1498_c7_f717]
signal tmp8_high_MUX_uxn_opcodes_h_l1498_c7_f717_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1498_c7_f717_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1498_c7_f717]
signal tmp8_low_MUX_uxn_opcodes_h_l1498_c7_f717_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1498_c7_f717_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1498_c7_f717]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_f717_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_f717_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1498_c7_f717]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_f717_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_f717_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1498_c7_f717]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_f717_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_f717_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1498_c7_f717]
signal result_u16_value_MUX_uxn_opcodes_h_l1498_c7_f717_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1498_c7_f717_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1498_c7_f717]
signal result_u8_value_MUX_uxn_opcodes_h_l1498_c7_f717_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1498_c7_f717_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1498_c7_f717]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_f717_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_f717_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1500_c33_8415]
signal BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_8415_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_8415_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_8415_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1502_c11_8d1d]
signal BIN_OP_EQ_uxn_opcodes_h_l1502_c11_8d1d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1502_c11_8d1d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1502_c11_8d1d_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1502_c7_42c7]
signal tmp8_high_MUX_uxn_opcodes_h_l1502_c7_42c7_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1502_c7_42c7_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1502_c7_42c7_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1502_c7_42c7_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1502_c7_42c7]
signal tmp8_low_MUX_uxn_opcodes_h_l1502_c7_42c7_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1502_c7_42c7_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1502_c7_42c7_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1502_c7_42c7_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1502_c7_42c7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_42c7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_42c7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_42c7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_42c7_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1502_c7_42c7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_42c7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_42c7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_42c7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_42c7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1502_c7_42c7]
signal result_u8_value_MUX_uxn_opcodes_h_l1502_c7_42c7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1502_c7_42c7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1502_c7_42c7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1502_c7_42c7_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1502_c7_42c7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_42c7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_42c7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_42c7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_42c7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1508_c11_03af]
signal BIN_OP_EQ_uxn_opcodes_h_l1508_c11_03af_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1508_c11_03af_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1508_c11_03af_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1508_c7_22c2]
signal tmp8_low_MUX_uxn_opcodes_h_l1508_c7_22c2_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1508_c7_22c2_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1508_c7_22c2_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1508_c7_22c2_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1508_c7_22c2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_22c2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_22c2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_22c2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_22c2_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1508_c7_22c2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_22c2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_22c2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_22c2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_22c2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1508_c7_22c2]
signal result_u8_value_MUX_uxn_opcodes_h_l1508_c7_22c2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1508_c7_22c2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1508_c7_22c2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1508_c7_22c2_return_output : unsigned(7 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_7557( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_vram_write := ref_toks_6;
      base.is_stack_index_flipped := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_ram_write := ref_toks_9;
      base.is_stack_write := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1477_c6_f14d
BIN_OP_EQ_uxn_opcodes_h_l1477_c6_f14d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1477_c6_f14d_left,
BIN_OP_EQ_uxn_opcodes_h_l1477_c6_f14d_right,
BIN_OP_EQ_uxn_opcodes_h_l1477_c6_f14d_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1477_c2_fdf8
tmp8_high_MUX_uxn_opcodes_h_l1477_c2_fdf8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond,
tmp8_high_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output);

-- t8_MUX_uxn_opcodes_h_l1477_c2_fdf8
t8_MUX_uxn_opcodes_h_l1477_c2_fdf8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond,
t8_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue,
t8_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse,
t8_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1477_c2_fdf8
tmp8_low_MUX_uxn_opcodes_h_l1477_c2_fdf8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond,
tmp8_low_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_fdf8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_fdf8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_fdf8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_fdf8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1477_c2_fdf8
result_u16_value_MUX_uxn_opcodes_h_l1477_c2_fdf8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond,
result_u16_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1477_c2_fdf8
result_u8_value_MUX_uxn_opcodes_h_l1477_c2_fdf8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_fdf8
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_fdf8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8
result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_fdf8
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_fdf8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_fdf8
result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_fdf8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8
result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_fdf8
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_fdf8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1490_c11_142e
BIN_OP_EQ_uxn_opcodes_h_l1490_c11_142e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1490_c11_142e_left,
BIN_OP_EQ_uxn_opcodes_h_l1490_c11_142e_right,
BIN_OP_EQ_uxn_opcodes_h_l1490_c11_142e_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1490_c7_7780
tmp8_high_MUX_uxn_opcodes_h_l1490_c7_7780 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1490_c7_7780_cond,
tmp8_high_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1490_c7_7780_return_output);

-- t8_MUX_uxn_opcodes_h_l1490_c7_7780
t8_MUX_uxn_opcodes_h_l1490_c7_7780 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1490_c7_7780_cond,
t8_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue,
t8_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse,
t8_MUX_uxn_opcodes_h_l1490_c7_7780_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1490_c7_7780
tmp8_low_MUX_uxn_opcodes_h_l1490_c7_7780 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1490_c7_7780_cond,
tmp8_low_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1490_c7_7780_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_7780
result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_7780 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_7780_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_7780_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_7780
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_7780 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_7780_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_7780_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_7780
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_7780 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_7780_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_7780_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1490_c7_7780
result_u16_value_MUX_uxn_opcodes_h_l1490_c7_7780 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1490_c7_7780_cond,
result_u16_value_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1490_c7_7780_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1490_c7_7780
result_u8_value_MUX_uxn_opcodes_h_l1490_c7_7780 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1490_c7_7780_cond,
result_u8_value_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1490_c7_7780_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_7780
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_7780 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_7780_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_7780_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1493_c11_53bf
BIN_OP_EQ_uxn_opcodes_h_l1493_c11_53bf : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1493_c11_53bf_left,
BIN_OP_EQ_uxn_opcodes_h_l1493_c11_53bf_right,
BIN_OP_EQ_uxn_opcodes_h_l1493_c11_53bf_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1493_c7_41b2
tmp8_high_MUX_uxn_opcodes_h_l1493_c7_41b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1493_c7_41b2_cond,
tmp8_high_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output);

-- t8_MUX_uxn_opcodes_h_l1493_c7_41b2
t8_MUX_uxn_opcodes_h_l1493_c7_41b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1493_c7_41b2_cond,
t8_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue,
t8_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse,
t8_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1493_c7_41b2
tmp8_low_MUX_uxn_opcodes_h_l1493_c7_41b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1493_c7_41b2_cond,
tmp8_low_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_41b2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_41b2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_41b2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_41b2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_41b2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_41b2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_41b2
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_41b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_41b2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1493_c7_41b2
result_u16_value_MUX_uxn_opcodes_h_l1493_c7_41b2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1493_c7_41b2_cond,
result_u16_value_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1493_c7_41b2
result_u8_value_MUX_uxn_opcodes_h_l1493_c7_41b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1493_c7_41b2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_41b2
result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_41b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_41b2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1495_c30_dad9
sp_relative_shift_uxn_opcodes_h_l1495_c30_dad9 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1495_c30_dad9_ins,
sp_relative_shift_uxn_opcodes_h_l1495_c30_dad9_x,
sp_relative_shift_uxn_opcodes_h_l1495_c30_dad9_y,
sp_relative_shift_uxn_opcodes_h_l1495_c30_dad9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cc1d
BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cc1d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cc1d_left,
BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cc1d_right,
BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cc1d_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1498_c7_f717
tmp8_high_MUX_uxn_opcodes_h_l1498_c7_f717 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1498_c7_f717_cond,
tmp8_high_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1498_c7_f717_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1498_c7_f717
tmp8_low_MUX_uxn_opcodes_h_l1498_c7_f717 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1498_c7_f717_cond,
tmp8_low_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1498_c7_f717_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_f717
result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_f717 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_f717_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_f717_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_f717
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_f717 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_f717_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_f717_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_f717
result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_f717 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_f717_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_f717_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1498_c7_f717
result_u16_value_MUX_uxn_opcodes_h_l1498_c7_f717 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1498_c7_f717_cond,
result_u16_value_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1498_c7_f717_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1498_c7_f717
result_u8_value_MUX_uxn_opcodes_h_l1498_c7_f717 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1498_c7_f717_cond,
result_u8_value_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1498_c7_f717_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_f717
result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_f717 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_f717_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_f717_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_8415
BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_8415 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_8415_left,
BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_8415_right,
BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_8415_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1502_c11_8d1d
BIN_OP_EQ_uxn_opcodes_h_l1502_c11_8d1d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1502_c11_8d1d_left,
BIN_OP_EQ_uxn_opcodes_h_l1502_c11_8d1d_right,
BIN_OP_EQ_uxn_opcodes_h_l1502_c11_8d1d_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1502_c7_42c7
tmp8_high_MUX_uxn_opcodes_h_l1502_c7_42c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1502_c7_42c7_cond,
tmp8_high_MUX_uxn_opcodes_h_l1502_c7_42c7_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1502_c7_42c7_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1502_c7_42c7_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1502_c7_42c7
tmp8_low_MUX_uxn_opcodes_h_l1502_c7_42c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1502_c7_42c7_cond,
tmp8_low_MUX_uxn_opcodes_h_l1502_c7_42c7_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1502_c7_42c7_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1502_c7_42c7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_42c7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_42c7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_42c7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_42c7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_42c7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_42c7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_42c7
result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_42c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_42c7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_42c7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_42c7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_42c7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1502_c7_42c7
result_u8_value_MUX_uxn_opcodes_h_l1502_c7_42c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1502_c7_42c7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1502_c7_42c7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1502_c7_42c7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1502_c7_42c7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_42c7
result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_42c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_42c7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_42c7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_42c7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_42c7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1508_c11_03af
BIN_OP_EQ_uxn_opcodes_h_l1508_c11_03af : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1508_c11_03af_left,
BIN_OP_EQ_uxn_opcodes_h_l1508_c11_03af_right,
BIN_OP_EQ_uxn_opcodes_h_l1508_c11_03af_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1508_c7_22c2
tmp8_low_MUX_uxn_opcodes_h_l1508_c7_22c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1508_c7_22c2_cond,
tmp8_low_MUX_uxn_opcodes_h_l1508_c7_22c2_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1508_c7_22c2_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1508_c7_22c2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_22c2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_22c2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_22c2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_22c2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_22c2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_22c2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_22c2
result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_22c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_22c2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_22c2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_22c2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_22c2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1508_c7_22c2
result_u8_value_MUX_uxn_opcodes_h_l1508_c7_22c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1508_c7_22c2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1508_c7_22c2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1508_c7_22c2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1508_c7_22c2_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1477_c6_f14d_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output,
 t8_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1490_c11_142e_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1490_c7_7780_return_output,
 t8_MUX_uxn_opcodes_h_l1490_c7_7780_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1490_c7_7780_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_7780_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_7780_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_7780_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1490_c7_7780_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1490_c7_7780_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_7780_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1493_c11_53bf_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output,
 t8_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output,
 sp_relative_shift_uxn_opcodes_h_l1495_c30_dad9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cc1d_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1498_c7_f717_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1498_c7_f717_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_f717_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_f717_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_f717_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1498_c7_f717_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1498_c7_f717_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_f717_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_8415_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1502_c11_8d1d_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1502_c7_42c7_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1502_c7_42c7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_42c7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_42c7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1502_c7_42c7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_42c7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1508_c11_03af_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1508_c7_22c2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_22c2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_22c2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1508_c7_22c2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_f14d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_f14d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_f14d_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_7780_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1490_c7_7780_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_7780_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1482_c3_c721 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_7780_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1487_c3_3730 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_7780_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_7780_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_7780_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_7780_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1477_c2_fdf8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1477_c2_fdf8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1477_c2_fdf8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1477_c2_fdf8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_7780_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_142e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_142e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_142e_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_7780_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1490_c7_7780_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_7780_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_7780_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1491_c3_ffad : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_7780_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_7780_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_7780_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_7780_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_7780_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_53bf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_53bf_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_53bf_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_f717_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_41b2_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1493_c7_41b2_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_f717_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_41b2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_f717_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_41b2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_f717_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_41b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_f717_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_41b2_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_f717_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_41b2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_f717_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_41b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_f717_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_41b2_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_dad9_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_dad9_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_dad9_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_dad9_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1496_c22_f6be_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cc1d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cc1d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cc1d_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_42c7_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_f717_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_42c7_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_f717_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1499_c3_357c : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_f717_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_42c7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_f717_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_42c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_f717_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_f717_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_42c7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_f717_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_42c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_f717_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_8415_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_8415_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_8415_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1500_c22_40d7_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_8d1d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_8d1d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_8d1d_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_42c7_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_42c7_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_42c7_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_42c7_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_42c7_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_22c2_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_42c7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_42c7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1505_c3_468b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_42c7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_22c2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_42c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_42c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_42c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_22c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_42c7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_42c7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_42c7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_22c2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_42c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_42c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_42c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_42c7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_03af_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_03af_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_03af_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_22c2_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_22c2_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_22c2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_22c2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1510_c3_1002 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_22c2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_22c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_22c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_22c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_22c2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_22c2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_22c2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_22c2_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1477_l1498_l1490_DUPLICATE_3363_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1490_l1477_l1508_l1498_l1493_DUPLICATE_1d52_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1498_l1490_DUPLICATE_6fb5_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1490_l1508_l1502_l1498_l1493_DUPLICATE_069b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1498_l1490_l1502_l1493_DUPLICATE_f67f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1498_l1493_l1508_DUPLICATE_fee8_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l1515_l1473_DUPLICATE_4688_return_output : opcode_result_t;
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
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_03af_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_42c7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_8d1d_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_142e_right := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1499_c3_357c := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1499_c3_357c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_53bf_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_8415_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_f14d_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1482_c3_c721 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1482_c3_c721;
     VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_dad9_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cc1d_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_dad9_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1510_c3_1002 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_22c2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1510_c3_1002;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1505_c3_468b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_42c7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1505_c3_468b;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_22c2_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1487_c3_3730 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1487_c3_3730;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1491_c3_ffad := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1491_c3_ffad;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_dad9_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_f14d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_142e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_53bf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cc1d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_8d1d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_03af_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_42c7_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_22c2_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_42c7_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_22c2_iftrue := VAR_previous_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_8415_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse := t8;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_42c7_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_42c7_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_22c2_iffalse := tmp8_low;
     -- BIN_OP_EQ[uxn_opcodes_h_l1502_c11_8d1d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1502_c11_8d1d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_8d1d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1502_c11_8d1d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_8d1d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_8d1d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1502_c11_8d1d_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1496_c22_f6be] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1496_c22_f6be_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1508_c11_03af] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1508_c11_03af_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_03af_left;
     BIN_OP_EQ_uxn_opcodes_h_l1508_c11_03af_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_03af_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_03af_return_output := BIN_OP_EQ_uxn_opcodes_h_l1508_c11_03af_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1498_l1493_l1508_DUPLICATE_fee8 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1498_l1493_l1508_DUPLICATE_fee8_return_output := result.stack_address_sp_offset;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1477_c2_fdf8] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1477_c2_fdf8_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1477_l1498_l1490_DUPLICATE_3363 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1477_l1498_l1490_DUPLICATE_3363_return_output := result.u16_value;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1477_c2_fdf8] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1477_c2_fdf8_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1490_l1477_l1508_l1498_l1493_DUPLICATE_1d52 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1490_l1477_l1508_l1498_l1493_DUPLICATE_1d52_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1493_c11_53bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1493_c11_53bf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_53bf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1493_c11_53bf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_53bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_53bf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1493_c11_53bf_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1498_l1490_DUPLICATE_6fb5 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1498_l1490_DUPLICATE_6fb5_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l1495_c30_dad9] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1495_c30_dad9_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_dad9_ins;
     sp_relative_shift_uxn_opcodes_h_l1495_c30_dad9_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_dad9_x;
     sp_relative_shift_uxn_opcodes_h_l1495_c30_dad9_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_dad9_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_dad9_return_output := sp_relative_shift_uxn_opcodes_h_l1495_c30_dad9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1498_c11_cc1d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cc1d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cc1d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cc1d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cc1d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cc1d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cc1d_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1477_c2_fdf8] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1477_c2_fdf8_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1498_l1490_l1502_l1493_DUPLICATE_f67f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1498_l1490_l1502_l1493_DUPLICATE_f67f_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1490_l1508_l1502_l1498_l1493_DUPLICATE_069b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1490_l1508_l1502_l1498_l1493_DUPLICATE_069b_return_output := result.is_opc_done;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1477_c2_fdf8] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1477_c2_fdf8_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1477_c6_f14d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1477_c6_f14d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_f14d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1477_c6_f14d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_f14d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_f14d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1477_c6_f14d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1490_c11_142e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1490_c11_142e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_142e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1490_c11_142e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_142e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_142e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1490_c11_142e_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1500_c33_8415] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_8415_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_8415_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_8415_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_8415_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_8415_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_8415_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_f14d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_f14d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_f14d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_f14d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_f14d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_f14d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_f14d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_f14d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_f14d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_f14d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_f14d_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_f14d_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_f14d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_7780_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_142e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_7780_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_142e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_7780_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_142e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_7780_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_142e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_7780_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_142e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_7780_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_142e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1490_c7_7780_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_142e_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_7780_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_142e_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_7780_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_142e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_41b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_53bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_41b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_53bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_41b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_53bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_41b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_53bf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_41b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_53bf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_41b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_53bf_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1493_c7_41b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_53bf_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_41b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_53bf_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_41b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_53bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_f717_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cc1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_f717_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cc1d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_f717_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cc1d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_f717_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cc1d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_f717_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cc1d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_f717_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cc1d_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_f717_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cc1d_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_f717_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cc1d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_42c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_8d1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_42c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_8d1d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_42c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_8d1d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_42c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_8d1d_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_42c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_8d1d_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_42c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_8d1d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_22c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_03af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_22c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_03af_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_22c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_03af_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_22c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_03af_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1496_c22_f6be_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1498_l1490_DUPLICATE_6fb5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1498_l1490_DUPLICATE_6fb5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1477_l1498_l1490_DUPLICATE_3363_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1477_l1498_l1490_DUPLICATE_3363_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1477_l1498_l1490_DUPLICATE_3363_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1490_l1508_l1502_l1498_l1493_DUPLICATE_069b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1490_l1508_l1502_l1498_l1493_DUPLICATE_069b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1490_l1508_l1502_l1498_l1493_DUPLICATE_069b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_42c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1490_l1508_l1502_l1498_l1493_DUPLICATE_069b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_22c2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1490_l1508_l1502_l1498_l1493_DUPLICATE_069b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1498_l1490_l1502_l1493_DUPLICATE_f67f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1498_l1490_l1502_l1493_DUPLICATE_f67f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1498_l1490_l1502_l1493_DUPLICATE_f67f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_42c7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1498_l1490_l1502_l1493_DUPLICATE_f67f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1498_l1493_l1508_DUPLICATE_fee8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1498_l1493_l1508_DUPLICATE_fee8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_22c2_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1498_l1493_l1508_DUPLICATE_fee8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1490_l1477_l1508_l1498_l1493_DUPLICATE_1d52_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1490_l1477_l1508_l1498_l1493_DUPLICATE_1d52_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1490_l1477_l1508_l1498_l1493_DUPLICATE_1d52_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1490_l1477_l1508_l1498_l1493_DUPLICATE_1d52_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_22c2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1490_l1477_l1508_l1498_l1493_DUPLICATE_1d52_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1477_c2_fdf8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1477_c2_fdf8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1477_c2_fdf8_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1477_c2_fdf8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_dad9_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1502_c7_42c7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_42c7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_42c7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_42c7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_42c7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_42c7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_42c7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_42c7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_42c7_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1477_c2_fdf8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1498_c7_f717] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_f717_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_f717_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_f717_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_f717_return_output;

     -- t8_MUX[uxn_opcodes_h_l1493_c7_41b2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1493_c7_41b2_cond <= VAR_t8_MUX_uxn_opcodes_h_l1493_c7_41b2_cond;
     t8_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue;
     t8_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output := t8_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1477_c2_fdf8] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1500_c22_40d7] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1500_c22_40d7_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_8415_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1508_c7_22c2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_22c2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_22c2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_22c2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_22c2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_22c2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_22c2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_22c2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_22c2_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1502_c7_42c7] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1502_c7_42c7_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_42c7_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1502_c7_42c7_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_42c7_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1502_c7_42c7_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_42c7_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_42c7_return_output := tmp8_high_MUX_uxn_opcodes_h_l1502_c7_42c7_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1508_c7_22c2] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1508_c7_22c2_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_22c2_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1508_c7_22c2_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_22c2_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1508_c7_22c2_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_22c2_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_22c2_return_output := tmp8_low_MUX_uxn_opcodes_h_l1508_c7_22c2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1508_c7_22c2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_22c2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_22c2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_22c2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_22c2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_22c2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_22c2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_22c2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_22c2_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1477_c2_fdf8] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1477_c2_fdf8] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1508_c7_22c2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1508_c7_22c2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_22c2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1508_c7_22c2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_22c2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1508_c7_22c2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_22c2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_22c2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1508_c7_22c2_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1500_c22_40d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_42c7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_22c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_42c7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_f717_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_42c7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_22c2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_42c7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_22c2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_42c7_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_42c7_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_22c2_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1502_c7_42c7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1502_c7_42c7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_42c7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1502_c7_42c7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_42c7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1502_c7_42c7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_42c7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_42c7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1502_c7_42c7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1493_c7_41b2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_41b2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_41b2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output;

     -- t8_MUX[uxn_opcodes_h_l1490_c7_7780] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1490_c7_7780_cond <= VAR_t8_MUX_uxn_opcodes_h_l1490_c7_7780_cond;
     t8_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue;
     t8_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1490_c7_7780_return_output := t8_MUX_uxn_opcodes_h_l1490_c7_7780_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1498_c7_f717] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1498_c7_f717_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_f717_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_f717_return_output := result_u16_value_MUX_uxn_opcodes_h_l1498_c7_f717_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1502_c7_42c7] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1502_c7_42c7_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_42c7_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1502_c7_42c7_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_42c7_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1502_c7_42c7_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_42c7_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_42c7_return_output := tmp8_low_MUX_uxn_opcodes_h_l1502_c7_42c7_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1498_c7_f717] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1498_c7_f717_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_f717_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_f717_return_output := tmp8_high_MUX_uxn_opcodes_h_l1498_c7_f717_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1498_c7_f717] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_f717_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_f717_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_f717_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_f717_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1502_c7_42c7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_42c7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_42c7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_42c7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_42c7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_42c7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_42c7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_42c7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_42c7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1502_c7_42c7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_42c7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_42c7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_42c7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_42c7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_42c7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_42c7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_42c7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_42c7_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_42c7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_f717_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_42c7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_f717_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_42c7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1490_c7_7780_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_f717_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_42c7_return_output;
     -- t8_MUX[uxn_opcodes_h_l1477_c2_fdf8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond <= VAR_t8_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond;
     t8_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue;
     t8_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output := t8_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1498_c7_f717] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1498_c7_f717_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_f717_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_f717_return_output := tmp8_low_MUX_uxn_opcodes_h_l1498_c7_f717_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1490_c7_7780] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_7780_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_7780_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_7780_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_7780_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1493_c7_41b2] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1493_c7_41b2_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_41b2_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output := result_u16_value_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1493_c7_41b2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_41b2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_41b2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1493_c7_41b2] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1493_c7_41b2_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_41b2_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output := tmp8_high_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1498_c7_f717] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1498_c7_f717_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_f717_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_f717_return_output := result_u8_value_MUX_uxn_opcodes_h_l1498_c7_f717_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1498_c7_f717] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_f717_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_f717_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_f717_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_f717_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1498_c7_f717] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_f717_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_f717_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_f717_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_f717_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_f717_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_f717_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_f717_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_7780_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_f717_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_f717_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_f717_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1493_c7_41b2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_41b2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_41b2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1477_c2_fdf8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1490_c7_7780] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1490_c7_7780_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_7780_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_7780_return_output := result_u16_value_MUX_uxn_opcodes_h_l1490_c7_7780_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1493_c7_41b2] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1493_c7_41b2_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_41b2_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output := tmp8_low_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1490_c7_7780] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_7780_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_7780_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_7780_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_7780_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1493_c7_41b2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_41b2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_41b2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1493_c7_41b2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1493_c7_41b2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_41b2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_41b2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_41b2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1490_c7_7780] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1490_c7_7780_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_7780_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_7780_return_output := tmp8_high_MUX_uxn_opcodes_h_l1490_c7_7780_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_7780_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_7780_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_7780_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_41b2_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1477_c2_fdf8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1490_c7_7780] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1490_c7_7780_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_7780_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_7780_return_output := tmp8_low_MUX_uxn_opcodes_h_l1490_c7_7780_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1490_c7_7780] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_7780_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_7780_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_7780_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_7780_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1477_c2_fdf8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output := result_u16_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1490_c7_7780] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1490_c7_7780_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_7780_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_7780_return_output := result_u8_value_MUX_uxn_opcodes_h_l1490_c7_7780_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1477_c2_fdf8] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output := tmp8_high_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1490_c7_7780] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_7780_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_7780_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_7780_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_7780_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_7780_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_7780_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_7780_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_7780_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_7780_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_7780_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1477_c2_fdf8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1477_c2_fdf8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1477_c2_fdf8] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output := tmp8_low_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1477_c2_fdf8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_fdf8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_fdf8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_fdf8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output;

     -- Submodule level 7
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l1515_l1473_DUPLICATE_4688 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l1515_l1473_DUPLICATE_4688_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_7557(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_fdf8_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l1515_l1473_DUPLICATE_4688_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7557_uxn_opcodes_h_l1515_l1473_DUPLICATE_4688_return_output;
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
