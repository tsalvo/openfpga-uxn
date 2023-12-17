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
-- BIN_OP_EQ[uxn_opcodes_h_l1499_c6_518d]
signal BIN_OP_EQ_uxn_opcodes_h_l1499_c6_518d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1499_c6_518d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1499_c6_518d_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1499_c2_64d9]
signal tmp8_low_MUX_uxn_opcodes_h_l1499_c2_64d9_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1499_c2_64d9]
signal t8_MUX_uxn_opcodes_h_l1499_c2_64d9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1499_c2_64d9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_64d9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1499_c2_64d9]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1499_c2_64d9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_64d9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1499_c2_64d9]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1499_c2_64d9]
signal result_u8_value_MUX_uxn_opcodes_h_l1499_c2_64d9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1499_c2_64d9]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_64d9_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1499_c2_64d9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_64d9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1499_c2_64d9]
signal result_u16_value_MUX_uxn_opcodes_h_l1499_c2_64d9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1499_c2_64d9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_64d9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1499_c2_64d9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_64d9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1499_c2_64d9]
signal tmp8_high_MUX_uxn_opcodes_h_l1499_c2_64d9_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1512_c11_2928]
signal BIN_OP_EQ_uxn_opcodes_h_l1512_c11_2928_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1512_c11_2928_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1512_c11_2928_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1512_c7_4b28]
signal tmp8_low_MUX_uxn_opcodes_h_l1512_c7_4b28_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1512_c7_4b28]
signal t8_MUX_uxn_opcodes_h_l1512_c7_4b28_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1512_c7_4b28]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_4b28_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1512_c7_4b28]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_4b28_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1512_c7_4b28]
signal result_u16_value_MUX_uxn_opcodes_h_l1512_c7_4b28_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1512_c7_4b28]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_4b28_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1512_c7_4b28]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_4b28_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1512_c7_4b28]
signal result_u8_value_MUX_uxn_opcodes_h_l1512_c7_4b28_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1512_c7_4b28]
signal tmp8_high_MUX_uxn_opcodes_h_l1512_c7_4b28_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1515_c11_ba88]
signal BIN_OP_EQ_uxn_opcodes_h_l1515_c11_ba88_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1515_c11_ba88_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1515_c11_ba88_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1515_c7_cab4]
signal tmp8_low_MUX_uxn_opcodes_h_l1515_c7_cab4_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1515_c7_cab4]
signal t8_MUX_uxn_opcodes_h_l1515_c7_cab4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1515_c7_cab4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_cab4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1515_c7_cab4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_cab4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1515_c7_cab4]
signal result_u16_value_MUX_uxn_opcodes_h_l1515_c7_cab4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1515_c7_cab4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_cab4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1515_c7_cab4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_cab4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1515_c7_cab4]
signal result_u8_value_MUX_uxn_opcodes_h_l1515_c7_cab4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1515_c7_cab4]
signal tmp8_high_MUX_uxn_opcodes_h_l1515_c7_cab4_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1517_c30_692c]
signal sp_relative_shift_uxn_opcodes_h_l1517_c30_692c_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1517_c30_692c_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1517_c30_692c_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1517_c30_692c_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1520_c11_07f2]
signal BIN_OP_EQ_uxn_opcodes_h_l1520_c11_07f2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1520_c11_07f2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1520_c11_07f2_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1520_c7_6903]
signal tmp8_low_MUX_uxn_opcodes_h_l1520_c7_6903_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1520_c7_6903_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1520_c7_6903]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_6903_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_6903_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1520_c7_6903]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_6903_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_6903_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1520_c7_6903]
signal result_u16_value_MUX_uxn_opcodes_h_l1520_c7_6903_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1520_c7_6903_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1520_c7_6903]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_6903_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_6903_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1520_c7_6903]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_6903_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_6903_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1520_c7_6903]
signal result_u8_value_MUX_uxn_opcodes_h_l1520_c7_6903_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1520_c7_6903_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1520_c7_6903]
signal tmp8_high_MUX_uxn_opcodes_h_l1520_c7_6903_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1520_c7_6903_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1522_c33_7895]
signal BIN_OP_PLUS_uxn_opcodes_h_l1522_c33_7895_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1522_c33_7895_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1522_c33_7895_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1524_c11_dfc8]
signal BIN_OP_EQ_uxn_opcodes_h_l1524_c11_dfc8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1524_c11_dfc8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1524_c11_dfc8_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1524_c7_59aa]
signal tmp8_low_MUX_uxn_opcodes_h_l1524_c7_59aa_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1524_c7_59aa_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1524_c7_59aa_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1524_c7_59aa_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1524_c7_59aa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_59aa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_59aa_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_59aa_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_59aa_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1524_c7_59aa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_59aa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_59aa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_59aa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_59aa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1524_c7_59aa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_59aa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_59aa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_59aa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_59aa_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1524_c7_59aa]
signal result_u8_value_MUX_uxn_opcodes_h_l1524_c7_59aa_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1524_c7_59aa_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1524_c7_59aa_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1524_c7_59aa_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1524_c7_59aa]
signal tmp8_high_MUX_uxn_opcodes_h_l1524_c7_59aa_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1524_c7_59aa_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1524_c7_59aa_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1524_c7_59aa_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1530_c11_3a46]
signal BIN_OP_EQ_uxn_opcodes_h_l1530_c11_3a46_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1530_c11_3a46_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1530_c11_3a46_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1530_c7_56ab]
signal tmp8_low_MUX_uxn_opcodes_h_l1530_c7_56ab_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1530_c7_56ab_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1530_c7_56ab_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1530_c7_56ab_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1530_c7_56ab]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_56ab_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_56ab_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_56ab_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_56ab_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1530_c7_56ab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_56ab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_56ab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_56ab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_56ab_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1530_c7_56ab]
signal result_u8_value_MUX_uxn_opcodes_h_l1530_c7_56ab_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1530_c7_56ab_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1530_c7_56ab_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1530_c7_56ab_return_output : unsigned(7 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
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
      base.is_stack_write := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.u16_value := ref_toks_8;
      base.is_pc_updated := ref_toks_9;
      base.is_opc_done := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1499_c6_518d
BIN_OP_EQ_uxn_opcodes_h_l1499_c6_518d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1499_c6_518d_left,
BIN_OP_EQ_uxn_opcodes_h_l1499_c6_518d_right,
BIN_OP_EQ_uxn_opcodes_h_l1499_c6_518d_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1499_c2_64d9
tmp8_low_MUX_uxn_opcodes_h_l1499_c2_64d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1499_c2_64d9_cond,
tmp8_low_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output);

-- t8_MUX_uxn_opcodes_h_l1499_c2_64d9
t8_MUX_uxn_opcodes_h_l1499_c2_64d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1499_c2_64d9_cond,
t8_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue,
t8_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse,
t8_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_64d9
result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_64d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_64d9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_64d9
result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_64d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_64d9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_64d9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_64d9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_64d9
result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_64d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1499_c2_64d9
result_u8_value_MUX_uxn_opcodes_h_l1499_c2_64d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1499_c2_64d9_cond,
result_u8_value_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_64d9
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_64d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_64d9_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_64d9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_64d9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_64d9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1499_c2_64d9
result_u16_value_MUX_uxn_opcodes_h_l1499_c2_64d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1499_c2_64d9_cond,
result_u16_value_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_64d9
result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_64d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_64d9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_64d9
result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_64d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_64d9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1499_c2_64d9
tmp8_high_MUX_uxn_opcodes_h_l1499_c2_64d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1499_c2_64d9_cond,
tmp8_high_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1512_c11_2928
BIN_OP_EQ_uxn_opcodes_h_l1512_c11_2928 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1512_c11_2928_left,
BIN_OP_EQ_uxn_opcodes_h_l1512_c11_2928_right,
BIN_OP_EQ_uxn_opcodes_h_l1512_c11_2928_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1512_c7_4b28
tmp8_low_MUX_uxn_opcodes_h_l1512_c7_4b28 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1512_c7_4b28_cond,
tmp8_low_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output);

-- t8_MUX_uxn_opcodes_h_l1512_c7_4b28
t8_MUX_uxn_opcodes_h_l1512_c7_4b28 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1512_c7_4b28_cond,
t8_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue,
t8_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse,
t8_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_4b28
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_4b28 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_4b28_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_4b28
result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_4b28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_4b28_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1512_c7_4b28
result_u16_value_MUX_uxn_opcodes_h_l1512_c7_4b28 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1512_c7_4b28_cond,
result_u16_value_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_4b28
result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_4b28 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_4b28_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_4b28
result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_4b28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_4b28_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1512_c7_4b28
result_u8_value_MUX_uxn_opcodes_h_l1512_c7_4b28 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1512_c7_4b28_cond,
result_u8_value_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1512_c7_4b28
tmp8_high_MUX_uxn_opcodes_h_l1512_c7_4b28 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1512_c7_4b28_cond,
tmp8_high_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1515_c11_ba88
BIN_OP_EQ_uxn_opcodes_h_l1515_c11_ba88 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1515_c11_ba88_left,
BIN_OP_EQ_uxn_opcodes_h_l1515_c11_ba88_right,
BIN_OP_EQ_uxn_opcodes_h_l1515_c11_ba88_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1515_c7_cab4
tmp8_low_MUX_uxn_opcodes_h_l1515_c7_cab4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1515_c7_cab4_cond,
tmp8_low_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output);

-- t8_MUX_uxn_opcodes_h_l1515_c7_cab4
t8_MUX_uxn_opcodes_h_l1515_c7_cab4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1515_c7_cab4_cond,
t8_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue,
t8_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse,
t8_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_cab4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_cab4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_cab4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_cab4
result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_cab4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_cab4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1515_c7_cab4
result_u16_value_MUX_uxn_opcodes_h_l1515_c7_cab4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1515_c7_cab4_cond,
result_u16_value_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_cab4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_cab4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_cab4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_cab4
result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_cab4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_cab4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1515_c7_cab4
result_u8_value_MUX_uxn_opcodes_h_l1515_c7_cab4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1515_c7_cab4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1515_c7_cab4
tmp8_high_MUX_uxn_opcodes_h_l1515_c7_cab4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1515_c7_cab4_cond,
tmp8_high_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1517_c30_692c
sp_relative_shift_uxn_opcodes_h_l1517_c30_692c : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1517_c30_692c_ins,
sp_relative_shift_uxn_opcodes_h_l1517_c30_692c_x,
sp_relative_shift_uxn_opcodes_h_l1517_c30_692c_y,
sp_relative_shift_uxn_opcodes_h_l1517_c30_692c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1520_c11_07f2
BIN_OP_EQ_uxn_opcodes_h_l1520_c11_07f2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1520_c11_07f2_left,
BIN_OP_EQ_uxn_opcodes_h_l1520_c11_07f2_right,
BIN_OP_EQ_uxn_opcodes_h_l1520_c11_07f2_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1520_c7_6903
tmp8_low_MUX_uxn_opcodes_h_l1520_c7_6903 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1520_c7_6903_cond,
tmp8_low_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1520_c7_6903_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_6903
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_6903 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_6903_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_6903_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_6903
result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_6903 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_6903_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_6903_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1520_c7_6903
result_u16_value_MUX_uxn_opcodes_h_l1520_c7_6903 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1520_c7_6903_cond,
result_u16_value_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1520_c7_6903_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_6903
result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_6903 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_6903_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_6903_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_6903
result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_6903 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_6903_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_6903_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1520_c7_6903
result_u8_value_MUX_uxn_opcodes_h_l1520_c7_6903 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1520_c7_6903_cond,
result_u8_value_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1520_c7_6903_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1520_c7_6903
tmp8_high_MUX_uxn_opcodes_h_l1520_c7_6903 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1520_c7_6903_cond,
tmp8_high_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1520_c7_6903_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1522_c33_7895
BIN_OP_PLUS_uxn_opcodes_h_l1522_c33_7895 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1522_c33_7895_left,
BIN_OP_PLUS_uxn_opcodes_h_l1522_c33_7895_right,
BIN_OP_PLUS_uxn_opcodes_h_l1522_c33_7895_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1524_c11_dfc8
BIN_OP_EQ_uxn_opcodes_h_l1524_c11_dfc8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1524_c11_dfc8_left,
BIN_OP_EQ_uxn_opcodes_h_l1524_c11_dfc8_right,
BIN_OP_EQ_uxn_opcodes_h_l1524_c11_dfc8_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1524_c7_59aa
tmp8_low_MUX_uxn_opcodes_h_l1524_c7_59aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1524_c7_59aa_cond,
tmp8_low_MUX_uxn_opcodes_h_l1524_c7_59aa_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1524_c7_59aa_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1524_c7_59aa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_59aa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_59aa : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_59aa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_59aa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_59aa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_59aa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_59aa
result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_59aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_59aa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_59aa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_59aa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_59aa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_59aa
result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_59aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_59aa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_59aa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_59aa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_59aa_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1524_c7_59aa
result_u8_value_MUX_uxn_opcodes_h_l1524_c7_59aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1524_c7_59aa_cond,
result_u8_value_MUX_uxn_opcodes_h_l1524_c7_59aa_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1524_c7_59aa_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1524_c7_59aa_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1524_c7_59aa
tmp8_high_MUX_uxn_opcodes_h_l1524_c7_59aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1524_c7_59aa_cond,
tmp8_high_MUX_uxn_opcodes_h_l1524_c7_59aa_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1524_c7_59aa_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1524_c7_59aa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1530_c11_3a46
BIN_OP_EQ_uxn_opcodes_h_l1530_c11_3a46 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1530_c11_3a46_left,
BIN_OP_EQ_uxn_opcodes_h_l1530_c11_3a46_right,
BIN_OP_EQ_uxn_opcodes_h_l1530_c11_3a46_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1530_c7_56ab
tmp8_low_MUX_uxn_opcodes_h_l1530_c7_56ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1530_c7_56ab_cond,
tmp8_low_MUX_uxn_opcodes_h_l1530_c7_56ab_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1530_c7_56ab_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1530_c7_56ab_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_56ab
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_56ab : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_56ab_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_56ab_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_56ab_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_56ab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_56ab
result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_56ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_56ab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_56ab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_56ab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_56ab_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1530_c7_56ab
result_u8_value_MUX_uxn_opcodes_h_l1530_c7_56ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1530_c7_56ab_cond,
result_u8_value_MUX_uxn_opcodes_h_l1530_c7_56ab_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1530_c7_56ab_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1530_c7_56ab_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1499_c6_518d_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output,
 t8_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1512_c11_2928_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output,
 t8_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1515_c11_ba88_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output,
 t8_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output,
 sp_relative_shift_uxn_opcodes_h_l1517_c30_692c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1520_c11_07f2_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1520_c7_6903_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_6903_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_6903_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1520_c7_6903_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_6903_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_6903_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1520_c7_6903_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1520_c7_6903_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1522_c33_7895_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1524_c11_dfc8_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1524_c7_59aa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_59aa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_59aa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_59aa_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1524_c7_59aa_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1524_c7_59aa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1530_c11_3a46_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1530_c7_56ab_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_56ab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_56ab_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1530_c7_56ab_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c6_518d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c6_518d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c6_518d_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1499_c2_64d9_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1499_c2_64d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_64d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1499_c2_64d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1504_c3_9852 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_64d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1499_c2_64d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c2_64d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1499_c2_64d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_64d9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1509_c3_d1aa : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_64d9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c2_64d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1499_c2_64d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_64d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_64d9_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1499_c2_64d9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_2928_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_2928_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_2928_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1512_c7_4b28_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1512_c7_4b28_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1513_c3_956e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_4b28_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_4b28_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1512_c7_4b28_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_4b28_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_4b28_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1512_c7_4b28_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1512_c7_4b28_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_ba88_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_ba88_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_ba88_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1520_c7_6903_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1515_c7_cab4_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1515_c7_cab4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_6903_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_cab4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_6903_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_cab4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1520_c7_6903_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1515_c7_cab4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_6903_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_cab4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_6903_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_cab4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1520_c7_6903_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1515_c7_cab4_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1520_c7_6903_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1515_c7_cab4_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1517_c30_692c_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1517_c30_692c_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1517_c30_692c_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1517_c30_692c_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1518_c22_ea47_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_07f2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_07f2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_07f2_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_59aa_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1520_c7_6903_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_59aa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_6903_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_59aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_6903_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1520_c7_6903_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1521_c3_25e2 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_6903_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_59aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_6903_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_59aa_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1520_c7_6903_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1524_c7_59aa_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1520_c7_6903_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1522_c33_7895_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1522_c33_7895_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1522_c33_7895_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1522_c22_7a40_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_dfc8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_dfc8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_dfc8_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_59aa_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_59aa_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1530_c7_56ab_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_59aa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_59aa_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1527_c3_d0cf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_59aa_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_56ab_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_59aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_59aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_59aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_59aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_59aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_59aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_56ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_59aa_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_59aa_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_59aa_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1530_c7_56ab_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_59aa_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1524_c7_59aa_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1524_c7_59aa_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1524_c7_59aa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1530_c11_3a46_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1530_c11_3a46_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1530_c11_3a46_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1530_c7_56ab_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1530_c7_56ab_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1530_c7_56ab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_56ab_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1532_c3_8738 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_56ab_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_56ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_56ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_56ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_56ab_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1530_c7_56ab_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1530_c7_56ab_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1530_c7_56ab_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1520_l1515_l1512_l1499_l1530_DUPLICATE_3dc4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1520_l1512_l1499_DUPLICATE_d83b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1520_l1512_l1524_l1515_DUPLICATE_7fff_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1520_l1512_DUPLICATE_f5bd_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1520_l1515_l1512_l1530_l1524_DUPLICATE_325d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1520_l1515_l1530_DUPLICATE_1fb9_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4_uxn_opcodes_h_l1537_l1495_DUPLICATE_2928_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_dfc8_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1509_c3_d1aa := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1509_c3_d1aa;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1513_c3_956e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1513_c3_956e;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1522_c33_7895_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1521_c3_25e2 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1521_c3_25e2;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1504_c3_9852 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1504_c3_9852;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_07f2_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1530_c11_3a46_right := to_unsigned(5, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_59aa_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_56ab_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1517_c30_692c_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_2928_right := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1517_c30_692c_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1527_c3_d0cf := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_59aa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1527_c3_d0cf;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1532_c3_8738 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_56ab_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1532_c3_8738;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c6_518d_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_ba88_right := to_unsigned(2, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1517_c30_692c_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c6_518d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_2928_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_ba88_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_07f2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_dfc8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1530_c11_3a46_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_59aa_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1530_c7_56ab_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1524_c7_59aa_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1530_c7_56ab_iftrue := VAR_previous_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1522_c33_7895_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse := t8;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1524_c7_59aa_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_59aa_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1530_c7_56ab_iffalse := tmp8_low;
     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1520_l1515_l1530_DUPLICATE_1fb9 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1520_l1515_l1530_DUPLICATE_1fb9_return_output := result.stack_address_sp_offset;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1499_c2_64d9] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1499_c2_64d9_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1530_c11_3a46] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1530_c11_3a46_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1530_c11_3a46_left;
     BIN_OP_EQ_uxn_opcodes_h_l1530_c11_3a46_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1530_c11_3a46_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1530_c11_3a46_return_output := BIN_OP_EQ_uxn_opcodes_h_l1530_c11_3a46_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1524_c11_dfc8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1524_c11_dfc8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_dfc8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1524_c11_dfc8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_dfc8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_dfc8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1524_c11_dfc8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1499_c6_518d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1499_c6_518d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c6_518d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1499_c6_518d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c6_518d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c6_518d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1499_c6_518d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1512_c11_2928] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1512_c11_2928_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_2928_left;
     BIN_OP_EQ_uxn_opcodes_h_l1512_c11_2928_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_2928_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_2928_return_output := BIN_OP_EQ_uxn_opcodes_h_l1512_c11_2928_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1520_l1512_l1524_l1515_DUPLICATE_7fff LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1520_l1512_l1524_l1515_DUPLICATE_7fff_return_output := result.is_stack_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1522_c33_7895] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1522_c33_7895_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1522_c33_7895_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1522_c33_7895_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1522_c33_7895_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1522_c33_7895_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1522_c33_7895_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1518_c22_ea47] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1518_c22_ea47_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1515_c11_ba88] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1515_c11_ba88_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_ba88_left;
     BIN_OP_EQ_uxn_opcodes_h_l1515_c11_ba88_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_ba88_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_ba88_return_output := BIN_OP_EQ_uxn_opcodes_h_l1515_c11_ba88_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1520_l1515_l1512_l1530_l1524_DUPLICATE_325d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1520_l1515_l1512_l1530_l1524_DUPLICATE_325d_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l1517_c30_692c] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1517_c30_692c_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1517_c30_692c_ins;
     sp_relative_shift_uxn_opcodes_h_l1517_c30_692c_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1517_c30_692c_x;
     sp_relative_shift_uxn_opcodes_h_l1517_c30_692c_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1517_c30_692c_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1517_c30_692c_return_output := sp_relative_shift_uxn_opcodes_h_l1517_c30_692c_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1499_c2_64d9] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1499_c2_64d9_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1520_l1512_l1499_DUPLICATE_d83b LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1520_l1512_l1499_DUPLICATE_d83b_return_output := result.u16_value;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1499_c2_64d9] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1499_c2_64d9_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1520_c11_07f2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1520_c11_07f2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_07f2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1520_c11_07f2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_07f2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_07f2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1520_c11_07f2_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1499_c2_64d9] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1499_c2_64d9_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1520_l1515_l1512_l1499_l1530_DUPLICATE_3dc4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1520_l1515_l1512_l1499_l1530_DUPLICATE_3dc4_return_output := result.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1520_l1512_DUPLICATE_f5bd LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1520_l1512_DUPLICATE_f5bd_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_64d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c6_518d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_64d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c6_518d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c6_518d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_64d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c6_518d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_64d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c6_518d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c6_518d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_64d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c6_518d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_64d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c6_518d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c2_64d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c6_518d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c2_64d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c6_518d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1499_c2_64d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c6_518d_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1499_c2_64d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c6_518d_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1499_c2_64d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c6_518d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_4b28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_2928_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_4b28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_2928_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_4b28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_2928_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_4b28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_2928_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1512_c7_4b28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_2928_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1512_c7_4b28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_2928_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1512_c7_4b28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_2928_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1512_c7_4b28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_2928_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1512_c7_4b28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_2928_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_cab4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_ba88_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_cab4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_ba88_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_cab4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_ba88_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_cab4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_ba88_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1515_c7_cab4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_ba88_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1515_c7_cab4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_ba88_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1515_c7_cab4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_ba88_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1515_c7_cab4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_ba88_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1515_c7_cab4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_ba88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_6903_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_07f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_6903_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_07f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_6903_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_07f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_6903_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_07f2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1520_c7_6903_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_07f2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1520_c7_6903_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_07f2_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1520_c7_6903_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_07f2_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1520_c7_6903_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_07f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_59aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_dfc8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_59aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_dfc8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_59aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_dfc8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_59aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_dfc8_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1524_c7_59aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_dfc8_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_59aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_dfc8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_56ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1530_c11_3a46_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_56ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1530_c11_3a46_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1530_c7_56ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1530_c11_3a46_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1530_c7_56ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1530_c11_3a46_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1518_c22_ea47_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1520_l1512_DUPLICATE_f5bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1520_l1512_DUPLICATE_f5bd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1520_l1512_l1499_DUPLICATE_d83b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1520_l1512_l1499_DUPLICATE_d83b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1520_l1512_l1499_DUPLICATE_d83b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1520_l1515_l1512_l1530_l1524_DUPLICATE_325d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1520_l1515_l1512_l1530_l1524_DUPLICATE_325d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1520_l1515_l1512_l1530_l1524_DUPLICATE_325d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_59aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1520_l1515_l1512_l1530_l1524_DUPLICATE_325d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_56ab_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1520_l1515_l1512_l1530_l1524_DUPLICATE_325d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1520_l1512_l1524_l1515_DUPLICATE_7fff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1520_l1512_l1524_l1515_DUPLICATE_7fff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1520_l1512_l1524_l1515_DUPLICATE_7fff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_59aa_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1520_l1512_l1524_l1515_DUPLICATE_7fff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1520_l1515_l1530_DUPLICATE_1fb9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1520_l1515_l1530_DUPLICATE_1fb9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_56ab_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1520_l1515_l1530_DUPLICATE_1fb9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1520_l1515_l1512_l1499_l1530_DUPLICATE_3dc4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1520_l1515_l1512_l1499_l1530_DUPLICATE_3dc4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1520_l1515_l1512_l1499_l1530_DUPLICATE_3dc4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1520_l1515_l1512_l1499_l1530_DUPLICATE_3dc4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1530_c7_56ab_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1520_l1515_l1512_l1499_l1530_DUPLICATE_3dc4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1499_c2_64d9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1499_c2_64d9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1499_c2_64d9_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1499_c2_64d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1517_c30_692c_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l1499_c2_64d9] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1524_c7_59aa] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1524_c7_59aa_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1524_c7_59aa_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1524_c7_59aa_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1524_c7_59aa_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1524_c7_59aa_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1524_c7_59aa_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1524_c7_59aa_return_output := tmp8_high_MUX_uxn_opcodes_h_l1524_c7_59aa_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1499_c2_64d9] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output;

     -- t8_MUX[uxn_opcodes_h_l1515_c7_cab4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1515_c7_cab4_cond <= VAR_t8_MUX_uxn_opcodes_h_l1515_c7_cab4_cond;
     t8_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue;
     t8_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output := t8_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1530_c7_56ab] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1530_c7_56ab_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1530_c7_56ab_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1530_c7_56ab_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1530_c7_56ab_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1530_c7_56ab_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1530_c7_56ab_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1530_c7_56ab_return_output := tmp8_low_MUX_uxn_opcodes_h_l1530_c7_56ab_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1530_c7_56ab] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_56ab_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_56ab_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_56ab_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_56ab_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_56ab_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_56ab_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_56ab_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_56ab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1520_c7_6903] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_6903_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_6903_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_6903_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_6903_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1530_c7_56ab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_56ab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_56ab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_56ab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_56ab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_56ab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_56ab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_56ab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_56ab_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1499_c2_64d9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_64d9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_64d9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1530_c7_56ab] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1530_c7_56ab_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1530_c7_56ab_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1530_c7_56ab_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1530_c7_56ab_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1530_c7_56ab_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1530_c7_56ab_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1530_c7_56ab_return_output := result_u8_value_MUX_uxn_opcodes_h_l1530_c7_56ab_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1522_c22_7a40] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1522_c22_7a40_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1522_c33_7895_return_output);

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1499_c2_64d9] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_64d9_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_64d9_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1524_c7_59aa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_59aa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_59aa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_59aa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_59aa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_59aa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_59aa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_59aa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_59aa_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1522_c22_7a40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_59aa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_56ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_59aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_6903_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_59aa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_56ab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_59aa_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1530_c7_56ab_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1524_c7_59aa_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_59aa_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1530_c7_56ab_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1515_c7_cab4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_cab4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_cab4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1520_c7_6903] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1520_c7_6903_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1520_c7_6903_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1520_c7_6903_return_output := tmp8_high_MUX_uxn_opcodes_h_l1520_c7_6903_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1524_c7_59aa] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1524_c7_59aa_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_59aa_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1524_c7_59aa_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_59aa_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1524_c7_59aa_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_59aa_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_59aa_return_output := result_u8_value_MUX_uxn_opcodes_h_l1524_c7_59aa_return_output;

     -- t8_MUX[uxn_opcodes_h_l1512_c7_4b28] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1512_c7_4b28_cond <= VAR_t8_MUX_uxn_opcodes_h_l1512_c7_4b28_cond;
     t8_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue;
     t8_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output := t8_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1524_c7_59aa] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1524_c7_59aa_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_59aa_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1524_c7_59aa_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_59aa_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1524_c7_59aa_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_59aa_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_59aa_return_output := tmp8_low_MUX_uxn_opcodes_h_l1524_c7_59aa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1520_c7_6903] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_6903_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_6903_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_6903_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_6903_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1524_c7_59aa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_59aa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_59aa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_59aa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_59aa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_59aa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_59aa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_59aa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_59aa_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1520_c7_6903] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1520_c7_6903_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1520_c7_6903_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1520_c7_6903_return_output := result_u16_value_MUX_uxn_opcodes_h_l1520_c7_6903_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1524_c7_59aa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_59aa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_59aa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_59aa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_59aa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_59aa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_59aa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_59aa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_59aa_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_59aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_6903_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_59aa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1520_c7_6903_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_59aa_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1520_c7_6903_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_59aa_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1515_c7_cab4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1515_c7_cab4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1515_c7_cab4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output := result_u16_value_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1515_c7_cab4] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1515_c7_cab4_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1515_c7_cab4_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output := tmp8_high_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1515_c7_cab4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_cab4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_cab4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1520_c7_6903] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1520_c7_6903_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1520_c7_6903_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1520_c7_6903_return_output := tmp8_low_MUX_uxn_opcodes_h_l1520_c7_6903_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1520_c7_6903] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_6903_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_6903_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_6903_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_6903_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1520_c7_6903] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1520_c7_6903_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1520_c7_6903_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1520_c7_6903_return_output := result_u8_value_MUX_uxn_opcodes_h_l1520_c7_6903_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1512_c7_4b28] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_4b28_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_4b28_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output;

     -- t8_MUX[uxn_opcodes_h_l1499_c2_64d9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1499_c2_64d9_cond <= VAR_t8_MUX_uxn_opcodes_h_l1499_c2_64d9_cond;
     t8_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue;
     t8_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output := t8_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1520_c7_6903] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_6903_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_6903_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_6903_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_6903_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_6903_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_6903_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_6903_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_6903_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1520_c7_6903_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1520_c7_6903_return_output;
     -- tmp8_low_MUX[uxn_opcodes_h_l1515_c7_cab4] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1515_c7_cab4_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1515_c7_cab4_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output := tmp8_low_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1512_c7_4b28] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1512_c7_4b28_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1512_c7_4b28_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output := tmp8_high_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1515_c7_cab4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_cab4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_cab4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1515_c7_cab4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1515_c7_cab4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1515_c7_cab4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1512_c7_4b28] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_4b28_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_4b28_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1499_c2_64d9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_64d9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_64d9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1512_c7_4b28] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1512_c7_4b28_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1512_c7_4b28_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output := result_u16_value_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1515_c7_cab4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_cab4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_cab4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_cab4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_cab4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1515_c7_cab4_return_output;
     -- tmp8_low_MUX[uxn_opcodes_h_l1512_c7_4b28] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1512_c7_4b28_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1512_c7_4b28_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output := tmp8_low_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1499_c2_64d9] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1499_c2_64d9_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1499_c2_64d9_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output := tmp8_high_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1499_c2_64d9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1499_c2_64d9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c2_64d9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output := result_u16_value_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1512_c7_4b28] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1512_c7_4b28_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1512_c7_4b28_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output := result_u8_value_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1512_c7_4b28] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_4b28_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_4b28_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1512_c7_4b28] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_4b28_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_4b28_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_4b28_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_4b28_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1499_c2_64d9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_64d9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_64d9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1512_c7_4b28_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1499_c2_64d9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_64d9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_64d9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1499_c2_64d9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_64d9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_64d9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1499_c2_64d9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1499_c2_64d9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c2_64d9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output := result_u8_value_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1499_c2_64d9] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1499_c2_64d9_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1499_c2_64d9_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1499_c2_64d9_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1499_c2_64d9_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output := tmp8_low_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output;

     -- Submodule level 7
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4_uxn_opcodes_h_l1537_l1495_DUPLICATE_2928 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4_uxn_opcodes_h_l1537_l1495_DUPLICATE_2928_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_64d9_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4_uxn_opcodes_h_l1537_l1495_DUPLICATE_2928_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4_uxn_opcodes_h_l1537_l1495_DUPLICATE_2928_return_output;
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
