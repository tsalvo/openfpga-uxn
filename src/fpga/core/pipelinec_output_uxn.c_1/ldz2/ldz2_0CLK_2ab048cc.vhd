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
-- BIN_OP_EQ[uxn_opcodes_h_l1477_c6_1c3a]
signal BIN_OP_EQ_uxn_opcodes_h_l1477_c6_1c3a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1477_c6_1c3a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1477_c6_1c3a_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1477_c2_db02]
signal tmp8_high_MUX_uxn_opcodes_h_l1477_c2_db02_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1477_c2_db02_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1477_c2_db02]
signal result_u8_value_MUX_uxn_opcodes_h_l1477_c2_db02_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1477_c2_db02_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1477_c2_db02]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_db02_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_db02_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1477_c2_db02]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_db02_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_db02_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1477_c2_db02]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_db02_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_db02_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1477_c2_db02]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_db02_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_db02_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1477_c2_db02]
signal result_u16_value_MUX_uxn_opcodes_h_l1477_c2_db02_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1477_c2_db02_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1477_c2_db02]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_db02_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_db02_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1477_c2_db02]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_db02_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_db02_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1477_c2_db02]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_db02_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_db02_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1477_c2_db02]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_db02_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_db02_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1477_c2_db02]
signal t8_MUX_uxn_opcodes_h_l1477_c2_db02_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1477_c2_db02_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1477_c2_db02]
signal tmp8_low_MUX_uxn_opcodes_h_l1477_c2_db02_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1477_c2_db02_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1490_c11_7a3d]
signal BIN_OP_EQ_uxn_opcodes_h_l1490_c11_7a3d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1490_c11_7a3d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1490_c11_7a3d_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1490_c7_aaa7]
signal tmp8_high_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1490_c7_aaa7]
signal result_u8_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1490_c7_aaa7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1490_c7_aaa7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1490_c7_aaa7]
signal result_u16_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1490_c7_aaa7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1490_c7_aaa7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1490_c7_aaa7]
signal t8_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1490_c7_aaa7]
signal tmp8_low_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1493_c11_0488]
signal BIN_OP_EQ_uxn_opcodes_h_l1493_c11_0488_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1493_c11_0488_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1493_c11_0488_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1493_c7_9a35]
signal tmp8_high_MUX_uxn_opcodes_h_l1493_c7_9a35_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1493_c7_9a35]
signal result_u8_value_MUX_uxn_opcodes_h_l1493_c7_9a35_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1493_c7_9a35]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_9a35_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1493_c7_9a35]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_9a35_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1493_c7_9a35]
signal result_u16_value_MUX_uxn_opcodes_h_l1493_c7_9a35_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1493_c7_9a35]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_9a35_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1493_c7_9a35]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_9a35_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1493_c7_9a35]
signal t8_MUX_uxn_opcodes_h_l1493_c7_9a35_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1493_c7_9a35]
signal tmp8_low_MUX_uxn_opcodes_h_l1493_c7_9a35_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1495_c30_274a]
signal sp_relative_shift_uxn_opcodes_h_l1495_c30_274a_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1495_c30_274a_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1495_c30_274a_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1495_c30_274a_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1498_c11_cf19]
signal BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cf19_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cf19_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cf19_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1498_c7_40d3]
signal tmp8_high_MUX_uxn_opcodes_h_l1498_c7_40d3_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1498_c7_40d3]
signal result_u8_value_MUX_uxn_opcodes_h_l1498_c7_40d3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1498_c7_40d3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_40d3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1498_c7_40d3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_40d3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1498_c7_40d3]
signal result_u16_value_MUX_uxn_opcodes_h_l1498_c7_40d3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1498_c7_40d3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_40d3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1498_c7_40d3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_40d3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1498_c7_40d3]
signal tmp8_low_MUX_uxn_opcodes_h_l1498_c7_40d3_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1500_c33_252c]
signal BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_252c_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_252c_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_252c_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1502_c11_311e]
signal BIN_OP_EQ_uxn_opcodes_h_l1502_c11_311e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1502_c11_311e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1502_c11_311e_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1502_c7_5b50]
signal tmp8_high_MUX_uxn_opcodes_h_l1502_c7_5b50_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1502_c7_5b50_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1502_c7_5b50_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1502_c7_5b50_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1502_c7_5b50]
signal result_u8_value_MUX_uxn_opcodes_h_l1502_c7_5b50_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1502_c7_5b50_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1502_c7_5b50_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1502_c7_5b50_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1502_c7_5b50]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_5b50_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_5b50_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_5b50_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_5b50_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1502_c7_5b50]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_5b50_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_5b50_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_5b50_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_5b50_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1502_c7_5b50]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_5b50_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_5b50_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_5b50_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_5b50_return_output : unsigned(3 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1502_c7_5b50]
signal tmp8_low_MUX_uxn_opcodes_h_l1502_c7_5b50_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1502_c7_5b50_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1502_c7_5b50_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1502_c7_5b50_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1508_c11_31e3]
signal BIN_OP_EQ_uxn_opcodes_h_l1508_c11_31e3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1508_c11_31e3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1508_c11_31e3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1508_c7_5a31]
signal result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a31_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a31_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a31_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a31_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1508_c7_5a31]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a31_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a31_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a31_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a31_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1508_c7_5a31]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a31_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a31_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a31_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a31_return_output : unsigned(3 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1508_c7_5a31]
signal tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a31_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a31_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a31_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a31_return_output : unsigned(7 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_18d4( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : signed;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.u16_value := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.sp_relative_shift := ref_toks_9;
      base.is_opc_done := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1477_c6_1c3a
BIN_OP_EQ_uxn_opcodes_h_l1477_c6_1c3a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1477_c6_1c3a_left,
BIN_OP_EQ_uxn_opcodes_h_l1477_c6_1c3a_right,
BIN_OP_EQ_uxn_opcodes_h_l1477_c6_1c3a_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1477_c2_db02
tmp8_high_MUX_uxn_opcodes_h_l1477_c2_db02 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1477_c2_db02_cond,
tmp8_high_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1477_c2_db02_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1477_c2_db02
result_u8_value_MUX_uxn_opcodes_h_l1477_c2_db02 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1477_c2_db02_cond,
result_u8_value_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1477_c2_db02_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_db02
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_db02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_db02_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_db02_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_db02
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_db02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_db02_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_db02_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_db02
result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_db02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_db02_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_db02_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_db02
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_db02 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_db02_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_db02_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1477_c2_db02
result_u16_value_MUX_uxn_opcodes_h_l1477_c2_db02 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1477_c2_db02_cond,
result_u16_value_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1477_c2_db02_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_db02
result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_db02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_db02_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_db02_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_db02
result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_db02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_db02_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_db02_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_db02
result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_db02 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_db02_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_db02_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_db02
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_db02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_db02_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_db02_return_output);

-- t8_MUX_uxn_opcodes_h_l1477_c2_db02
t8_MUX_uxn_opcodes_h_l1477_c2_db02 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1477_c2_db02_cond,
t8_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue,
t8_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse,
t8_MUX_uxn_opcodes_h_l1477_c2_db02_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1477_c2_db02
tmp8_low_MUX_uxn_opcodes_h_l1477_c2_db02 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1477_c2_db02_cond,
tmp8_low_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1477_c2_db02_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1490_c11_7a3d
BIN_OP_EQ_uxn_opcodes_h_l1490_c11_7a3d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1490_c11_7a3d_left,
BIN_OP_EQ_uxn_opcodes_h_l1490_c11_7a3d_right,
BIN_OP_EQ_uxn_opcodes_h_l1490_c11_7a3d_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1490_c7_aaa7
tmp8_high_MUX_uxn_opcodes_h_l1490_c7_aaa7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond,
tmp8_high_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1490_c7_aaa7
result_u8_value_MUX_uxn_opcodes_h_l1490_c7_aaa7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_aaa7
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_aaa7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_aaa7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_aaa7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1490_c7_aaa7
result_u16_value_MUX_uxn_opcodes_h_l1490_c7_aaa7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond,
result_u16_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_aaa7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_aaa7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_aaa7
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_aaa7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output);

-- t8_MUX_uxn_opcodes_h_l1490_c7_aaa7
t8_MUX_uxn_opcodes_h_l1490_c7_aaa7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond,
t8_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue,
t8_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse,
t8_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1490_c7_aaa7
tmp8_low_MUX_uxn_opcodes_h_l1490_c7_aaa7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond,
tmp8_low_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1493_c11_0488
BIN_OP_EQ_uxn_opcodes_h_l1493_c11_0488 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1493_c11_0488_left,
BIN_OP_EQ_uxn_opcodes_h_l1493_c11_0488_right,
BIN_OP_EQ_uxn_opcodes_h_l1493_c11_0488_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1493_c7_9a35
tmp8_high_MUX_uxn_opcodes_h_l1493_c7_9a35 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1493_c7_9a35_cond,
tmp8_high_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1493_c7_9a35
result_u8_value_MUX_uxn_opcodes_h_l1493_c7_9a35 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1493_c7_9a35_cond,
result_u8_value_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_9a35
result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_9a35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_9a35_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_9a35
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_9a35 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_9a35_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1493_c7_9a35
result_u16_value_MUX_uxn_opcodes_h_l1493_c7_9a35 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1493_c7_9a35_cond,
result_u16_value_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_9a35
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_9a35 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_9a35_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_9a35
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_9a35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_9a35_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output);

-- t8_MUX_uxn_opcodes_h_l1493_c7_9a35
t8_MUX_uxn_opcodes_h_l1493_c7_9a35 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1493_c7_9a35_cond,
t8_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue,
t8_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse,
t8_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1493_c7_9a35
tmp8_low_MUX_uxn_opcodes_h_l1493_c7_9a35 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1493_c7_9a35_cond,
tmp8_low_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1495_c30_274a
sp_relative_shift_uxn_opcodes_h_l1495_c30_274a : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1495_c30_274a_ins,
sp_relative_shift_uxn_opcodes_h_l1495_c30_274a_x,
sp_relative_shift_uxn_opcodes_h_l1495_c30_274a_y,
sp_relative_shift_uxn_opcodes_h_l1495_c30_274a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cf19
BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cf19 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cf19_left,
BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cf19_right,
BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cf19_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1498_c7_40d3
tmp8_high_MUX_uxn_opcodes_h_l1498_c7_40d3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1498_c7_40d3_cond,
tmp8_high_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1498_c7_40d3
result_u8_value_MUX_uxn_opcodes_h_l1498_c7_40d3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1498_c7_40d3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_40d3
result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_40d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_40d3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_40d3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_40d3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_40d3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1498_c7_40d3
result_u16_value_MUX_uxn_opcodes_h_l1498_c7_40d3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1498_c7_40d3_cond,
result_u16_value_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_40d3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_40d3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_40d3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_40d3
result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_40d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_40d3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1498_c7_40d3
tmp8_low_MUX_uxn_opcodes_h_l1498_c7_40d3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1498_c7_40d3_cond,
tmp8_low_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_252c
BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_252c : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_252c_left,
BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_252c_right,
BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_252c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1502_c11_311e
BIN_OP_EQ_uxn_opcodes_h_l1502_c11_311e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1502_c11_311e_left,
BIN_OP_EQ_uxn_opcodes_h_l1502_c11_311e_right,
BIN_OP_EQ_uxn_opcodes_h_l1502_c11_311e_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1502_c7_5b50
tmp8_high_MUX_uxn_opcodes_h_l1502_c7_5b50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1502_c7_5b50_cond,
tmp8_high_MUX_uxn_opcodes_h_l1502_c7_5b50_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1502_c7_5b50_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1502_c7_5b50_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1502_c7_5b50
result_u8_value_MUX_uxn_opcodes_h_l1502_c7_5b50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1502_c7_5b50_cond,
result_u8_value_MUX_uxn_opcodes_h_l1502_c7_5b50_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1502_c7_5b50_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1502_c7_5b50_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_5b50
result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_5b50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_5b50_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_5b50_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_5b50_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_5b50_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_5b50
result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_5b50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_5b50_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_5b50_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_5b50_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_5b50_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_5b50
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_5b50 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_5b50_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_5b50_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_5b50_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_5b50_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1502_c7_5b50
tmp8_low_MUX_uxn_opcodes_h_l1502_c7_5b50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1502_c7_5b50_cond,
tmp8_low_MUX_uxn_opcodes_h_l1502_c7_5b50_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1502_c7_5b50_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1502_c7_5b50_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1508_c11_31e3
BIN_OP_EQ_uxn_opcodes_h_l1508_c11_31e3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1508_c11_31e3_left,
BIN_OP_EQ_uxn_opcodes_h_l1508_c11_31e3_right,
BIN_OP_EQ_uxn_opcodes_h_l1508_c11_31e3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a31
result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a31_cond,
result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a31_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a31_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a31_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a31
result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a31_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a31_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a31_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a31_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a31
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a31 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a31_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a31_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a31_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a31_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a31
tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a31_cond,
tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a31_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a31_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a31_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1477_c6_1c3a_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1477_c2_db02_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1477_c2_db02_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_db02_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_db02_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_db02_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_db02_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1477_c2_db02_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_db02_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_db02_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_db02_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_db02_return_output,
 t8_MUX_uxn_opcodes_h_l1477_c2_db02_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1477_c2_db02_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1490_c11_7a3d_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output,
 t8_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1493_c11_0488_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output,
 t8_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output,
 sp_relative_shift_uxn_opcodes_h_l1495_c30_274a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cf19_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_252c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1502_c11_311e_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1502_c7_5b50_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1502_c7_5b50_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_5b50_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_5b50_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_5b50_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1502_c7_5b50_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1508_c11_31e3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a31_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a31_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a31_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a31_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_1c3a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_1c3a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_1c3a_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_db02_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_db02_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_db02_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_db02_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_db02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_db02_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1477_c2_db02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_db02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_db02_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1477_c2_db02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_db02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_db02_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1487_c3_ebe3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_db02_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_db02_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_db02_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_db02_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1477_c2_db02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_db02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_db02_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1477_c2_db02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_db02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_db02_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1482_c3_7990 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_db02_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_db02_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_db02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_db02_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1477_c2_db02_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1477_c2_db02_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_db02_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_db02_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_7a3d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_7a3d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_7a3d_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1491_c3_ddd8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_0488_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_0488_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_0488_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_9a35_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_9a35_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_9a35_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_9a35_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_9a35_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_9a35_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_9a35_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1493_c7_9a35_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_9a35_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_274a_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_274a_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_274a_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_274a_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1496_c22_8c4a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cf19_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cf19_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cf19_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_5b50_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_40d3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_5b50_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_40d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_5b50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_40d3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_5b50_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_40d3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_40d3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1499_c3_2146 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_40d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_5b50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_40d3_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_5b50_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_40d3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_252c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_252c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_252c_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1500_c22_417b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_311e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_311e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_311e_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_5b50_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_5b50_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_5b50_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_5b50_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_5b50_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a31_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_5b50_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_5b50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_5b50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_5b50_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_5b50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_5b50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_5b50_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_5b50_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1505_c3_e6b3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_5b50_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a31_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_5b50_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_5b50_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_5b50_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a31_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_5b50_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_31e3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_31e3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_31e3_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a31_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a31_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a31_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a31_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a31_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1510_c3_e9d0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a31_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a31_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a31_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a31_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a31_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1498_l1493_l1490_l1477_l1508_DUPLICATE_b4bd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1477_l1498_l1490_DUPLICATE_6c31_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1493_l1498_l1490_l1502_DUPLICATE_638b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1498_l1490_DUPLICATE_93da_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1498_l1493_l1490_l1508_l1502_DUPLICATE_52f7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1493_l1508_l1498_DUPLICATE_f05d_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_18d4_uxn_opcodes_h_l1515_l1473_DUPLICATE_971d_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_5b50_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_0488_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1482_c3_7990 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1482_c3_7990;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_31e3_right := to_unsigned(5, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1505_c3_e6b3 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_5b50_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1505_c3_e6b3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_1c3a_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_311e_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_7a3d_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1491_c3_ddd8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1491_c3_ddd8;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a31_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_274a_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_274a_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1487_c3_ebe3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1487_c3_ebe3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1510_c3_e9d0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a31_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1510_c3_e9d0;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1499_c3_2146 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1499_c3_2146;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_252c_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cf19_right := to_unsigned(3, 2);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_274a_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_1c3a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_7a3d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_0488_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cf19_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_311e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_31e3_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_5b50_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a31_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_5b50_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a31_iftrue := VAR_previous_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_252c_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse := t8;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_5b50_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_5b50_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a31_iffalse := tmp8_low;
     -- sp_relative_shift[uxn_opcodes_h_l1495_c30_274a] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1495_c30_274a_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_274a_ins;
     sp_relative_shift_uxn_opcodes_h_l1495_c30_274a_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_274a_x;
     sp_relative_shift_uxn_opcodes_h_l1495_c30_274a_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_274a_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_274a_return_output := sp_relative_shift_uxn_opcodes_h_l1495_c30_274a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1498_c11_cf19] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cf19_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cf19_left;
     BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cf19_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cf19_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cf19_return_output := BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cf19_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1477_l1498_l1490_DUPLICATE_6c31 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1477_l1498_l1490_DUPLICATE_6c31_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1508_c11_31e3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1508_c11_31e3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_31e3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1508_c11_31e3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_31e3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_31e3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1508_c11_31e3_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1493_l1508_l1498_DUPLICATE_f05d LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1493_l1508_l1498_DUPLICATE_f05d_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1493_l1498_l1490_l1502_DUPLICATE_638b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1493_l1498_l1490_l1502_DUPLICATE_638b_return_output := result.is_stack_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1498_l1490_DUPLICATE_93da LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1498_l1490_DUPLICATE_93da_return_output := result.sp_relative_shift;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1500_c33_252c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_252c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_252c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_252c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_252c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_252c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_252c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1498_l1493_l1490_l1508_l1502_DUPLICATE_52f7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1498_l1493_l1490_l1508_l1502_DUPLICATE_52f7_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1477_c6_1c3a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1477_c6_1c3a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_1c3a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1477_c6_1c3a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_1c3a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_1c3a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1477_c6_1c3a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1493_c11_0488] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1493_c11_0488_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_0488_left;
     BIN_OP_EQ_uxn_opcodes_h_l1493_c11_0488_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_0488_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_0488_return_output := BIN_OP_EQ_uxn_opcodes_h_l1493_c11_0488_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1490_c11_7a3d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1490_c11_7a3d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_7a3d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1490_c11_7a3d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_7a3d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_7a3d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1490_c11_7a3d_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1477_c2_db02] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1477_c2_db02_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1498_l1493_l1490_l1477_l1508_DUPLICATE_b4bd LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1498_l1493_l1490_l1477_l1508_DUPLICATE_b4bd_return_output := result.u8_value;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1496_c22_8c4a] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1496_c22_8c4a_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1477_c2_db02] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1477_c2_db02_return_output := result.is_ram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1477_c2_db02] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1477_c2_db02_return_output := result.is_stack_index_flipped;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1477_c2_db02] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1477_c2_db02_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1502_c11_311e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1502_c11_311e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_311e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1502_c11_311e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_311e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_311e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1502_c11_311e_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_db02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_1c3a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_db02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_1c3a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_db02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_1c3a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_db02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_1c3a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_db02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_1c3a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_db02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_1c3a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_db02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_1c3a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_db02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_1c3a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_db02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_1c3a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_db02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_1c3a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1477_c2_db02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_1c3a_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_db02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_1c3a_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_db02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c6_1c3a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_7a3d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_7a3d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_7a3d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_7a3d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_7a3d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_7a3d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_7a3d_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_7a3d_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_7a3d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_9a35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_0488_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_9a35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_0488_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_9a35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_0488_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_9a35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_0488_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_9a35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_0488_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_9a35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_0488_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1493_c7_9a35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_0488_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_9a35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_0488_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_9a35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c11_0488_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_40d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cf19_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_40d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cf19_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_40d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cf19_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_40d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cf19_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_40d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cf19_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_40d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cf19_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_40d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cf19_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_40d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1498_c11_cf19_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_5b50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_311e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_5b50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_311e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_5b50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_311e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_5b50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_311e_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_5b50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_311e_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_5b50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1502_c11_311e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_31e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_31e3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_31e3_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1508_c11_31e3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1496_c22_8c4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1498_l1490_DUPLICATE_93da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1498_l1490_DUPLICATE_93da_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1477_l1498_l1490_DUPLICATE_6c31_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1477_l1498_l1490_DUPLICATE_6c31_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1477_l1498_l1490_DUPLICATE_6c31_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1498_l1493_l1490_l1508_l1502_DUPLICATE_52f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1498_l1493_l1490_l1508_l1502_DUPLICATE_52f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1498_l1493_l1490_l1508_l1502_DUPLICATE_52f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_5b50_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1498_l1493_l1490_l1508_l1502_DUPLICATE_52f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a31_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1498_l1493_l1490_l1508_l1502_DUPLICATE_52f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1493_l1498_l1490_l1502_DUPLICATE_638b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1493_l1498_l1490_l1502_DUPLICATE_638b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1493_l1498_l1490_l1502_DUPLICATE_638b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_5b50_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1493_l1498_l1490_l1502_DUPLICATE_638b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1493_l1508_l1498_DUPLICATE_f05d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1493_l1508_l1498_DUPLICATE_f05d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a31_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1493_l1508_l1498_DUPLICATE_f05d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1498_l1493_l1490_l1477_l1508_DUPLICATE_b4bd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1498_l1493_l1490_l1477_l1508_DUPLICATE_b4bd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1498_l1493_l1490_l1477_l1508_DUPLICATE_b4bd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1498_l1493_l1490_l1477_l1508_DUPLICATE_b4bd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a31_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1498_l1493_l1490_l1477_l1508_DUPLICATE_b4bd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1477_c2_db02_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1477_c2_db02_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1477_c2_db02_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1477_c2_db02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1495_c30_274a_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1477_c2_db02] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_db02_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_db02_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_db02_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_db02_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1477_c2_db02] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_db02_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_db02_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_db02_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_db02_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1477_c2_db02] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_db02_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_db02_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_db02_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_db02_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1500_c22_417b] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1500_c22_417b_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1500_c33_252c_return_output);

     -- tmp8_low_MUX[uxn_opcodes_h_l1508_c7_5a31] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a31_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a31_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a31_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a31_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a31_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a31_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a31_return_output := tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a31_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1508_c7_5a31] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a31_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a31_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a31_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a31_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a31_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a31_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a31_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a31_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1477_c2_db02] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_db02_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_db02_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_db02_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_db02_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1502_c7_5b50] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1502_c7_5b50_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_5b50_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1502_c7_5b50_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_5b50_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1502_c7_5b50_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_5b50_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_5b50_return_output := tmp8_high_MUX_uxn_opcodes_h_l1502_c7_5b50_return_output;

     -- t8_MUX[uxn_opcodes_h_l1493_c7_9a35] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1493_c7_9a35_cond <= VAR_t8_MUX_uxn_opcodes_h_l1493_c7_9a35_cond;
     t8_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue;
     t8_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output := t8_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1502_c7_5b50] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_5b50_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_5b50_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_5b50_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_5b50_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_5b50_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_5b50_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_5b50_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_5b50_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1498_c7_40d3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_40d3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_40d3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1508_c7_5a31] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a31_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a31_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a31_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a31_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a31_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a31_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a31_return_output := result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a31_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1508_c7_5a31] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a31_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a31_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a31_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a31_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a31_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a31_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a31_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a31_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1500_c22_417b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_5b50_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1508_c7_5a31_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1502_c7_5b50_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_5b50_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1508_c7_5a31_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_5b50_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1508_c7_5a31_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1502_c7_5b50_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_5b50_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1508_c7_5a31_return_output;
     -- t8_MUX[uxn_opcodes_h_l1490_c7_aaa7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond <= VAR_t8_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond;
     t8_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue;
     t8_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output := t8_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1502_c7_5b50] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1502_c7_5b50_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_5b50_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1502_c7_5b50_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_5b50_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1502_c7_5b50_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_5b50_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_5b50_return_output := result_u8_value_MUX_uxn_opcodes_h_l1502_c7_5b50_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1498_c7_40d3] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1498_c7_40d3_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_40d3_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output := tmp8_high_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1502_c7_5b50] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1502_c7_5b50_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_5b50_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1502_c7_5b50_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_5b50_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1502_c7_5b50_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_5b50_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_5b50_return_output := tmp8_low_MUX_uxn_opcodes_h_l1502_c7_5b50_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1502_c7_5b50] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_5b50_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_5b50_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_5b50_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_5b50_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_5b50_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_5b50_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_5b50_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_5b50_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1498_c7_40d3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_40d3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_40d3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1493_c7_9a35] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_9a35_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_9a35_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1498_c7_40d3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1498_c7_40d3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_40d3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output := result_u16_value_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1502_c7_5b50] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_5b50_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_5b50_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_5b50_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_5b50_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_5b50_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_5b50_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_5b50_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_5b50_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1502_c7_5b50_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1502_c7_5b50_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1502_c7_5b50_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1502_c7_5b50_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1493_c7_9a35] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1493_c7_9a35_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_9a35_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output := result_u16_value_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1498_c7_40d3] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1498_c7_40d3_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_40d3_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output := tmp8_low_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1498_c7_40d3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_40d3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_40d3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1498_c7_40d3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_40d3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_40d3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1493_c7_9a35] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_9a35_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_9a35_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1498_c7_40d3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1498_c7_40d3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_40d3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_40d3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_40d3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output;

     -- t8_MUX[uxn_opcodes_h_l1477_c2_db02] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1477_c2_db02_cond <= VAR_t8_MUX_uxn_opcodes_h_l1477_c2_db02_cond;
     t8_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue;
     t8_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1477_c2_db02_return_output := t8_MUX_uxn_opcodes_h_l1477_c2_db02_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1493_c7_9a35] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1493_c7_9a35_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_9a35_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output := tmp8_high_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1490_c7_aaa7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1477_c2_db02_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1498_c7_40d3_return_output;
     -- tmp8_high_MUX[uxn_opcodes_h_l1490_c7_aaa7] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output := tmp8_high_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1490_c7_aaa7] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output := result_u16_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1477_c2_db02] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_db02_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_db02_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_db02_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_db02_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1490_c7_aaa7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1493_c7_9a35] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1493_c7_9a35_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_9a35_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output := tmp8_low_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1493_c7_9a35] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1493_c7_9a35_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_9a35_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output := result_u8_value_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1493_c7_9a35] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_9a35_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_9a35_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1493_c7_9a35] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_9a35_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_9a35_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_9a35_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_9a35_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c7_9a35_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1490_c7_aaa7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1490_c7_aaa7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1490_c7_aaa7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1477_c2_db02] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1477_c2_db02_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_db02_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_db02_return_output := result_u16_value_MUX_uxn_opcodes_h_l1477_c2_db02_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1490_c7_aaa7] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_aaa7_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_aaa7_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_aaa7_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output := tmp8_low_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1477_c2_db02] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1477_c2_db02_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_db02_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_db02_return_output := tmp8_high_MUX_uxn_opcodes_h_l1477_c2_db02_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1477_c2_db02] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_db02_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_db02_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_db02_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_db02_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1477_c2_db02_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1490_c7_aaa7_return_output;
     -- tmp8_low_MUX[uxn_opcodes_h_l1477_c2_db02] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1477_c2_db02_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_db02_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_db02_return_output := tmp8_low_MUX_uxn_opcodes_h_l1477_c2_db02_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1477_c2_db02] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_db02_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_db02_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_db02_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_db02_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1477_c2_db02] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_db02_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_db02_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_db02_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_db02_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1477_c2_db02] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1477_c2_db02_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_db02_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_db02_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_db02_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_db02_return_output := result_u8_value_MUX_uxn_opcodes_h_l1477_c2_db02_return_output;

     -- Submodule level 7
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1477_c2_db02_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_18d4_uxn_opcodes_h_l1515_l1473_DUPLICATE_971d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_18d4_uxn_opcodes_h_l1515_l1473_DUPLICATE_971d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_18d4(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c2_db02_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c2_db02_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1477_c2_db02_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1477_c2_db02_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c2_db02_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1477_c2_db02_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1477_c2_db02_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1477_c2_db02_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1477_c2_db02_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c2_db02_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_18d4_uxn_opcodes_h_l1515_l1473_DUPLICATE_971d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_18d4_uxn_opcodes_h_l1515_l1473_DUPLICATE_971d_return_output;
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
