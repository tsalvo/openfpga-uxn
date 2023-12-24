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
-- BIN_OP_EQ[uxn_opcodes_h_l1476_c6_8cfa]
signal BIN_OP_EQ_uxn_opcodes_h_l1476_c6_8cfa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1476_c6_8cfa_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1476_c6_8cfa_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1476_c2_1704]
signal result_u8_value_MUX_uxn_opcodes_h_l1476_c2_1704_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1476_c2_1704_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1476_c2_1704]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_1704_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_1704_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1476_c2_1704]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_1704_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_1704_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1476_c2_1704]
signal result_u16_value_MUX_uxn_opcodes_h_l1476_c2_1704_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1476_c2_1704_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1476_c2_1704]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_1704_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_1704_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1476_c2_1704]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_1704_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_1704_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1476_c2_1704]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_1704_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_1704_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1476_c2_1704]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_1704_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_1704_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1476_c2_1704]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_1704_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_1704_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1476_c2_1704]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_1704_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_1704_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1476_c2_1704]
signal t8_MUX_uxn_opcodes_h_l1476_c2_1704_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1476_c2_1704_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1476_c2_1704]
signal tmp8_high_MUX_uxn_opcodes_h_l1476_c2_1704_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1476_c2_1704_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1476_c2_1704]
signal tmp8_low_MUX_uxn_opcodes_h_l1476_c2_1704_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1476_c2_1704_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1489_c11_0ef6]
signal BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0ef6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0ef6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0ef6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1489_c7_1e86]
signal result_u8_value_MUX_uxn_opcodes_h_l1489_c7_1e86_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1489_c7_1e86]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_1e86_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1489_c7_1e86]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_1e86_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1489_c7_1e86]
signal result_u16_value_MUX_uxn_opcodes_h_l1489_c7_1e86_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1489_c7_1e86]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_1e86_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1489_c7_1e86]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_1e86_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1489_c7_1e86]
signal t8_MUX_uxn_opcodes_h_l1489_c7_1e86_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1489_c7_1e86]
signal tmp8_high_MUX_uxn_opcodes_h_l1489_c7_1e86_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1489_c7_1e86]
signal tmp8_low_MUX_uxn_opcodes_h_l1489_c7_1e86_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1492_c11_72f2]
signal BIN_OP_EQ_uxn_opcodes_h_l1492_c11_72f2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1492_c11_72f2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1492_c11_72f2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1492_c7_833b]
signal result_u8_value_MUX_uxn_opcodes_h_l1492_c7_833b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1492_c7_833b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1492_c7_833b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_833b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_833b_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1492_c7_833b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_833b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_833b_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1492_c7_833b]
signal result_u16_value_MUX_uxn_opcodes_h_l1492_c7_833b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1492_c7_833b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1492_c7_833b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_833b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_833b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1492_c7_833b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_833b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_833b_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1492_c7_833b]
signal t8_MUX_uxn_opcodes_h_l1492_c7_833b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1492_c7_833b_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1492_c7_833b]
signal tmp8_high_MUX_uxn_opcodes_h_l1492_c7_833b_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1492_c7_833b_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1492_c7_833b]
signal tmp8_low_MUX_uxn_opcodes_h_l1492_c7_833b_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1492_c7_833b_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1494_c30_44a1]
signal sp_relative_shift_uxn_opcodes_h_l1494_c30_44a1_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1494_c30_44a1_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1494_c30_44a1_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1494_c30_44a1_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1497_c11_cf09]
signal BIN_OP_EQ_uxn_opcodes_h_l1497_c11_cf09_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1497_c11_cf09_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1497_c11_cf09_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1497_c7_0d30]
signal result_u8_value_MUX_uxn_opcodes_h_l1497_c7_0d30_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1497_c7_0d30]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_0d30_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1497_c7_0d30]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_0d30_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1497_c7_0d30]
signal result_u16_value_MUX_uxn_opcodes_h_l1497_c7_0d30_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1497_c7_0d30]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_0d30_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1497_c7_0d30]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_0d30_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1497_c7_0d30]
signal tmp8_high_MUX_uxn_opcodes_h_l1497_c7_0d30_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1497_c7_0d30]
signal tmp8_low_MUX_uxn_opcodes_h_l1497_c7_0d30_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1499_c33_62e8]
signal BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_62e8_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_62e8_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_62e8_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1501_c11_6233]
signal BIN_OP_EQ_uxn_opcodes_h_l1501_c11_6233_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1501_c11_6233_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1501_c11_6233_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1501_c7_376f]
signal result_u8_value_MUX_uxn_opcodes_h_l1501_c7_376f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1501_c7_376f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1501_c7_376f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1501_c7_376f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1501_c7_376f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_376f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_376f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_376f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_376f_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1501_c7_376f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_376f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_376f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_376f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_376f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1501_c7_376f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_376f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_376f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_376f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_376f_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1501_c7_376f]
signal tmp8_high_MUX_uxn_opcodes_h_l1501_c7_376f_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1501_c7_376f_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1501_c7_376f_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1501_c7_376f_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1501_c7_376f]
signal tmp8_low_MUX_uxn_opcodes_h_l1501_c7_376f_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1501_c7_376f_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1501_c7_376f_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1501_c7_376f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1507_c11_a381]
signal BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a381_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a381_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a381_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1507_c7_da2b]
signal result_u8_value_MUX_uxn_opcodes_h_l1507_c7_da2b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1507_c7_da2b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1507_c7_da2b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1507_c7_da2b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1507_c7_da2b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_da2b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_da2b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_da2b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_da2b_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1507_c7_da2b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_da2b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_da2b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_da2b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_da2b_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1507_c7_da2b]
signal tmp8_low_MUX_uxn_opcodes_h_l1507_c7_da2b_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1507_c7_da2b_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1507_c7_da2b_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1507_c7_da2b_return_output : unsigned(7 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_e482( ref_toks_0 : opcode_result_t;
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
      base.u8_value := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.u16_value := ref_toks_4;
      base.is_vram_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.is_ram_write := ref_toks_9;
      base.is_stack_write := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1476_c6_8cfa
BIN_OP_EQ_uxn_opcodes_h_l1476_c6_8cfa : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1476_c6_8cfa_left,
BIN_OP_EQ_uxn_opcodes_h_l1476_c6_8cfa_right,
BIN_OP_EQ_uxn_opcodes_h_l1476_c6_8cfa_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1476_c2_1704
result_u8_value_MUX_uxn_opcodes_h_l1476_c2_1704 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1476_c2_1704_cond,
result_u8_value_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1476_c2_1704_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_1704
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_1704 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_1704_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_1704_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_1704
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_1704 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_1704_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_1704_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1476_c2_1704
result_u16_value_MUX_uxn_opcodes_h_l1476_c2_1704 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1476_c2_1704_cond,
result_u16_value_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1476_c2_1704_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_1704
result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_1704 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_1704_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_1704_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_1704
result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_1704 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_1704_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_1704_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_1704
result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_1704 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_1704_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_1704_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_1704
result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_1704 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_1704_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_1704_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_1704
result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_1704 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_1704_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_1704_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_1704
result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_1704 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_1704_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_1704_return_output);

-- t8_MUX_uxn_opcodes_h_l1476_c2_1704
t8_MUX_uxn_opcodes_h_l1476_c2_1704 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1476_c2_1704_cond,
t8_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue,
t8_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse,
t8_MUX_uxn_opcodes_h_l1476_c2_1704_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1476_c2_1704
tmp8_high_MUX_uxn_opcodes_h_l1476_c2_1704 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1476_c2_1704_cond,
tmp8_high_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1476_c2_1704_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1476_c2_1704
tmp8_low_MUX_uxn_opcodes_h_l1476_c2_1704 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1476_c2_1704_cond,
tmp8_low_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1476_c2_1704_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0ef6
BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0ef6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0ef6_left,
BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0ef6_right,
BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0ef6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1489_c7_1e86
result_u8_value_MUX_uxn_opcodes_h_l1489_c7_1e86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1489_c7_1e86_cond,
result_u8_value_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_1e86
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_1e86 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_1e86_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_1e86
result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_1e86 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_1e86_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1489_c7_1e86
result_u16_value_MUX_uxn_opcodes_h_l1489_c7_1e86 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1489_c7_1e86_cond,
result_u16_value_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_1e86
result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_1e86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_1e86_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_1e86
result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_1e86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_1e86_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output);

-- t8_MUX_uxn_opcodes_h_l1489_c7_1e86
t8_MUX_uxn_opcodes_h_l1489_c7_1e86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1489_c7_1e86_cond,
t8_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue,
t8_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse,
t8_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1489_c7_1e86
tmp8_high_MUX_uxn_opcodes_h_l1489_c7_1e86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1489_c7_1e86_cond,
tmp8_high_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1489_c7_1e86
tmp8_low_MUX_uxn_opcodes_h_l1489_c7_1e86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1489_c7_1e86_cond,
tmp8_low_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1492_c11_72f2
BIN_OP_EQ_uxn_opcodes_h_l1492_c11_72f2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1492_c11_72f2_left,
BIN_OP_EQ_uxn_opcodes_h_l1492_c11_72f2_right,
BIN_OP_EQ_uxn_opcodes_h_l1492_c11_72f2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1492_c7_833b
result_u8_value_MUX_uxn_opcodes_h_l1492_c7_833b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1492_c7_833b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1492_c7_833b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_833b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_833b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_833b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_833b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_833b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_833b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_833b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_833b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1492_c7_833b
result_u16_value_MUX_uxn_opcodes_h_l1492_c7_833b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1492_c7_833b_cond,
result_u16_value_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1492_c7_833b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_833b
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_833b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_833b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_833b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_833b
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_833b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_833b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_833b_return_output);

-- t8_MUX_uxn_opcodes_h_l1492_c7_833b
t8_MUX_uxn_opcodes_h_l1492_c7_833b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1492_c7_833b_cond,
t8_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue,
t8_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse,
t8_MUX_uxn_opcodes_h_l1492_c7_833b_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1492_c7_833b
tmp8_high_MUX_uxn_opcodes_h_l1492_c7_833b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1492_c7_833b_cond,
tmp8_high_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1492_c7_833b_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1492_c7_833b
tmp8_low_MUX_uxn_opcodes_h_l1492_c7_833b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1492_c7_833b_cond,
tmp8_low_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1492_c7_833b_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1494_c30_44a1
sp_relative_shift_uxn_opcodes_h_l1494_c30_44a1 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1494_c30_44a1_ins,
sp_relative_shift_uxn_opcodes_h_l1494_c30_44a1_x,
sp_relative_shift_uxn_opcodes_h_l1494_c30_44a1_y,
sp_relative_shift_uxn_opcodes_h_l1494_c30_44a1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1497_c11_cf09
BIN_OP_EQ_uxn_opcodes_h_l1497_c11_cf09 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1497_c11_cf09_left,
BIN_OP_EQ_uxn_opcodes_h_l1497_c11_cf09_right,
BIN_OP_EQ_uxn_opcodes_h_l1497_c11_cf09_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1497_c7_0d30
result_u8_value_MUX_uxn_opcodes_h_l1497_c7_0d30 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1497_c7_0d30_cond,
result_u8_value_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_0d30
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_0d30 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_0d30_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_0d30
result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_0d30 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_0d30_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1497_c7_0d30
result_u16_value_MUX_uxn_opcodes_h_l1497_c7_0d30 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1497_c7_0d30_cond,
result_u16_value_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_0d30
result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_0d30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_0d30_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_0d30
result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_0d30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_0d30_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1497_c7_0d30
tmp8_high_MUX_uxn_opcodes_h_l1497_c7_0d30 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1497_c7_0d30_cond,
tmp8_high_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1497_c7_0d30
tmp8_low_MUX_uxn_opcodes_h_l1497_c7_0d30 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1497_c7_0d30_cond,
tmp8_low_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_62e8
BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_62e8 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_62e8_left,
BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_62e8_right,
BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_62e8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1501_c11_6233
BIN_OP_EQ_uxn_opcodes_h_l1501_c11_6233 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1501_c11_6233_left,
BIN_OP_EQ_uxn_opcodes_h_l1501_c11_6233_right,
BIN_OP_EQ_uxn_opcodes_h_l1501_c11_6233_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1501_c7_376f
result_u8_value_MUX_uxn_opcodes_h_l1501_c7_376f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1501_c7_376f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1501_c7_376f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1501_c7_376f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1501_c7_376f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_376f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_376f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_376f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_376f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_376f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_376f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_376f
result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_376f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_376f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_376f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_376f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_376f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_376f
result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_376f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_376f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_376f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_376f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_376f_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1501_c7_376f
tmp8_high_MUX_uxn_opcodes_h_l1501_c7_376f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1501_c7_376f_cond,
tmp8_high_MUX_uxn_opcodes_h_l1501_c7_376f_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1501_c7_376f_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1501_c7_376f_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1501_c7_376f
tmp8_low_MUX_uxn_opcodes_h_l1501_c7_376f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1501_c7_376f_cond,
tmp8_low_MUX_uxn_opcodes_h_l1501_c7_376f_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1501_c7_376f_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1501_c7_376f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a381
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a381 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a381_left,
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a381_right,
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a381_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1507_c7_da2b
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_da2b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_da2b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_da2b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_da2b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_da2b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_da2b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_da2b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_da2b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_da2b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_da2b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_da2b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_da2b
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_da2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_da2b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_da2b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_da2b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_da2b_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1507_c7_da2b
tmp8_low_MUX_uxn_opcodes_h_l1507_c7_da2b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1507_c7_da2b_cond,
tmp8_low_MUX_uxn_opcodes_h_l1507_c7_da2b_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1507_c7_da2b_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1507_c7_da2b_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1476_c6_8cfa_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1476_c2_1704_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_1704_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_1704_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1476_c2_1704_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_1704_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_1704_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_1704_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_1704_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_1704_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_1704_return_output,
 t8_MUX_uxn_opcodes_h_l1476_c2_1704_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1476_c2_1704_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1476_c2_1704_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0ef6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output,
 t8_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1492_c11_72f2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1492_c7_833b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_833b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_833b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1492_c7_833b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_833b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_833b_return_output,
 t8_MUX_uxn_opcodes_h_l1492_c7_833b_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1492_c7_833b_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1492_c7_833b_return_output,
 sp_relative_shift_uxn_opcodes_h_l1494_c30_44a1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1497_c11_cf09_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_62e8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1501_c11_6233_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1501_c7_376f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_376f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_376f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_376f_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1501_c7_376f_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1501_c7_376f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a381_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1507_c7_da2b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_da2b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_da2b_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1507_c7_da2b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_8cfa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_8cfa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_8cfa_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_1704_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_1704_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1476_c2_1704_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_1704_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_1704_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1486_c3_dc85 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_1704_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_1704_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_1704_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_1704_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1476_c2_1704_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_1704_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_1704_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1481_c3_eedb : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_1704_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_1704_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1476_c2_1704_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_1704_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_1704_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_1704_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_1704_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1476_c2_1704_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_1704_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_1704_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_1704_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_1704_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1476_c2_1704_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1476_c2_1704_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_1704_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_1704_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_1704_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_1704_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0ef6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0ef6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0ef6_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_833b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_1e86_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1490_c3_8883 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_833b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_1e86_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_833b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_1e86_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_833b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_1e86_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_833b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_1e86_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_833b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_1e86_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1492_c7_833b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1489_c7_1e86_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_833b_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_1e86_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_833b_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_1e86_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_72f2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_72f2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_72f2_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_833b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_833b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_833b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_833b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_833b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_833b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1492_c7_833b_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_833b_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_833b_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_44a1_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_44a1_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_44a1_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_44a1_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1495_c22_77cf_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_cf09_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_cf09_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_cf09_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_376f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_0d30_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_376f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_0d30_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1498_c3_8661 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_0d30_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_0d30_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_376f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_0d30_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_376f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_0d30_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_376f_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_0d30_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_376f_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_0d30_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_62e8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_62e8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_62e8_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1499_c22_0a90_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_6233_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_6233_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_6233_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_376f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_376f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_da2b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_376f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_376f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1504_c3_6a1d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_376f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_da2b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_376f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_376f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_376f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_da2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_376f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_376f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_376f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_376f_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_376f_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_376f_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_376f_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_376f_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_376f_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_da2b_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_376f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a381_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a381_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a381_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_da2b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_da2b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_da2b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_da2b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1509_c3_8e71 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_da2b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_da2b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_da2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_da2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_da2b_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_da2b_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_da2b_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_da2b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1507_l1497_l1492_l1489_l1476_DUPLICATE_b526_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1476_l1497_l1489_DUPLICATE_1b01_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1497_l1489_DUPLICATE_b5a8_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1507_l1501_l1497_l1492_l1489_DUPLICATE_56cc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1492_l1497_l1489_l1501_DUPLICATE_9ba9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1492_l1507_l1497_DUPLICATE_ff56_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e482_uxn_opcodes_h_l1514_l1472_DUPLICATE_3d05_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_8cfa_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1490_c3_8883 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1490_c3_8883;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_da2b_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_376f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_62e8_right := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1481_c3_eedb := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1481_c3_eedb;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1509_c3_8e71 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_da2b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1509_c3_8e71;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1504_c3_6a1d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_376f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1504_c3_6a1d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a381_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1486_c3_dc85 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1486_c3_dc85;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1498_c3_8661 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1498_c3_8661;
     VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_44a1_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0ef6_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_6233_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_72f2_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_cf09_right := to_unsigned(3, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_44a1_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_44a1_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_8cfa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0ef6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_72f2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_cf09_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_6233_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a381_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_376f_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_da2b_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_376f_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_da2b_iftrue := VAR_previous_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_62e8_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse := t8;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_376f_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_376f_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_da2b_iffalse := tmp8_low;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1507_l1501_l1497_l1492_l1489_DUPLICATE_56cc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1507_l1501_l1497_l1492_l1489_DUPLICATE_56cc_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l1494_c30_44a1] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1494_c30_44a1_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_44a1_ins;
     sp_relative_shift_uxn_opcodes_h_l1494_c30_44a1_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_44a1_x;
     sp_relative_shift_uxn_opcodes_h_l1494_c30_44a1_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_44a1_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_44a1_return_output := sp_relative_shift_uxn_opcodes_h_l1494_c30_44a1_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1492_l1507_l1497_DUPLICATE_ff56 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1492_l1507_l1497_DUPLICATE_ff56_return_output := result.stack_address_sp_offset;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1499_c33_62e8] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_62e8_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_62e8_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_62e8_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_62e8_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_62e8_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_62e8_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1476_l1497_l1489_DUPLICATE_1b01 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1476_l1497_l1489_DUPLICATE_1b01_return_output := result.u16_value;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1476_c2_1704] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1476_c2_1704_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1492_c11_72f2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1492_c11_72f2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_72f2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1492_c11_72f2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_72f2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_72f2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1492_c11_72f2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1501_c11_6233] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1501_c11_6233_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_6233_left;
     BIN_OP_EQ_uxn_opcodes_h_l1501_c11_6233_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_6233_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_6233_return_output := BIN_OP_EQ_uxn_opcodes_h_l1501_c11_6233_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1476_c6_8cfa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1476_c6_8cfa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_8cfa_left;
     BIN_OP_EQ_uxn_opcodes_h_l1476_c6_8cfa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_8cfa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_8cfa_return_output := BIN_OP_EQ_uxn_opcodes_h_l1476_c6_8cfa_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1495_c22_77cf] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1495_c22_77cf_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1476_c2_1704] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1476_c2_1704_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1507_c11_a381] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a381_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a381_left;
     BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a381_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a381_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a381_return_output := BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a381_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1476_c2_1704] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1476_c2_1704_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1497_c11_cf09] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1497_c11_cf09_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_cf09_left;
     BIN_OP_EQ_uxn_opcodes_h_l1497_c11_cf09_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_cf09_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_cf09_return_output := BIN_OP_EQ_uxn_opcodes_h_l1497_c11_cf09_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1507_l1497_l1492_l1489_l1476_DUPLICATE_b526 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1507_l1497_l1492_l1489_l1476_DUPLICATE_b526_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1489_c11_0ef6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0ef6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0ef6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0ef6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0ef6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0ef6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0ef6_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1497_l1489_DUPLICATE_b5a8 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1497_l1489_DUPLICATE_b5a8_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1492_l1497_l1489_l1501_DUPLICATE_9ba9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1492_l1497_l1489_l1501_DUPLICATE_9ba9_return_output := result.is_stack_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1476_c2_1704] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1476_c2_1704_return_output := result.is_stack_index_flipped;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_1704_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_8cfa_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_1704_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_8cfa_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_1704_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_8cfa_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_1704_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_8cfa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_1704_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_8cfa_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_1704_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_8cfa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_1704_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_8cfa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_1704_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_8cfa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_1704_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_8cfa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_1704_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_8cfa_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1476_c2_1704_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_8cfa_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_1704_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_8cfa_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_1704_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_8cfa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_1e86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0ef6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_1e86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0ef6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_1e86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0ef6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_1e86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0ef6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_1e86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0ef6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_1e86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0ef6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1489_c7_1e86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0ef6_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_1e86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0ef6_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_1e86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0ef6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_833b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_72f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_833b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_72f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_833b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_72f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_833b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_72f2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_833b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_72f2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_833b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_72f2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1492_c7_833b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_72f2_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_833b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_72f2_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_833b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_72f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_0d30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_cf09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_0d30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_cf09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_0d30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_cf09_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_0d30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_cf09_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_0d30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_cf09_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_0d30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_cf09_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_0d30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_cf09_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_0d30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_cf09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_376f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_6233_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_376f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_6233_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_376f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_6233_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_376f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_6233_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_376f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_6233_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_376f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_6233_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_da2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a381_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_da2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a381_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_da2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a381_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_da2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_a381_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1495_c22_77cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1497_l1489_DUPLICATE_b5a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1497_l1489_DUPLICATE_b5a8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1476_l1497_l1489_DUPLICATE_1b01_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1476_l1497_l1489_DUPLICATE_1b01_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1476_l1497_l1489_DUPLICATE_1b01_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1507_l1501_l1497_l1492_l1489_DUPLICATE_56cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1507_l1501_l1497_l1492_l1489_DUPLICATE_56cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1507_l1501_l1497_l1492_l1489_DUPLICATE_56cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_376f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1507_l1501_l1497_l1492_l1489_DUPLICATE_56cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_da2b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1507_l1501_l1497_l1492_l1489_DUPLICATE_56cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1492_l1497_l1489_l1501_DUPLICATE_9ba9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1492_l1497_l1489_l1501_DUPLICATE_9ba9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1492_l1497_l1489_l1501_DUPLICATE_9ba9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_376f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1492_l1497_l1489_l1501_DUPLICATE_9ba9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1492_l1507_l1497_DUPLICATE_ff56_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1492_l1507_l1497_DUPLICATE_ff56_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_da2b_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1492_l1507_l1497_DUPLICATE_ff56_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1507_l1497_l1492_l1489_l1476_DUPLICATE_b526_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1507_l1497_l1492_l1489_l1476_DUPLICATE_b526_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1507_l1497_l1492_l1489_l1476_DUPLICATE_b526_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1507_l1497_l1492_l1489_l1476_DUPLICATE_b526_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_da2b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1507_l1497_l1492_l1489_l1476_DUPLICATE_b526_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1476_c2_1704_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1476_c2_1704_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1476_c2_1704_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1476_c2_1704_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_44a1_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1476_c2_1704] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_1704_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_1704_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_1704_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_1704_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1507_c7_da2b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_da2b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_da2b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_da2b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_da2b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_da2b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_da2b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_da2b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_da2b_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1476_c2_1704] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_1704_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_1704_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_1704_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_1704_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1499_c22_0a90] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1499_c22_0a90_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_62e8_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1501_c7_376f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_376f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_376f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_376f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_376f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_376f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_376f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_376f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_376f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1507_c7_da2b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1507_c7_da2b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_da2b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1507_c7_da2b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_da2b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1507_c7_da2b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_da2b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_da2b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1507_c7_da2b_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1507_c7_da2b] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1507_c7_da2b_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_da2b_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1507_c7_da2b_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_da2b_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1507_c7_da2b_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_da2b_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_da2b_return_output := tmp8_low_MUX_uxn_opcodes_h_l1507_c7_da2b_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1476_c2_1704] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_1704_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_1704_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_1704_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_1704_return_output;

     -- t8_MUX[uxn_opcodes_h_l1492_c7_833b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1492_c7_833b_cond <= VAR_t8_MUX_uxn_opcodes_h_l1492_c7_833b_cond;
     t8_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue;
     t8_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1492_c7_833b_return_output := t8_MUX_uxn_opcodes_h_l1492_c7_833b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1476_c2_1704] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_1704_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_1704_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_1704_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_1704_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1497_c7_0d30] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_0d30_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_0d30_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1501_c7_376f] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1501_c7_376f_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_376f_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1501_c7_376f_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_376f_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1501_c7_376f_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_376f_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_376f_return_output := tmp8_high_MUX_uxn_opcodes_h_l1501_c7_376f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1507_c7_da2b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_da2b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_da2b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_da2b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_da2b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_da2b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_da2b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_da2b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_da2b_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1499_c22_0a90_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_376f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_da2b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_376f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_376f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_da2b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_376f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_da2b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1492_c7_833b_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_376f_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_376f_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_da2b_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1501_c7_376f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_376f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_376f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_376f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_376f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_376f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_376f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_376f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_376f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1501_c7_376f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1501_c7_376f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_376f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1501_c7_376f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_376f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1501_c7_376f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_376f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_376f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1501_c7_376f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1497_c7_0d30] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1497_c7_0d30_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_0d30_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output := result_u16_value_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1497_c7_0d30] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_0d30_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_0d30_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1501_c7_376f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_376f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_376f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_376f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_376f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_376f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_376f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_376f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_376f_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1501_c7_376f] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1501_c7_376f_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_376f_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1501_c7_376f_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_376f_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1501_c7_376f_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_376f_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_376f_return_output := tmp8_low_MUX_uxn_opcodes_h_l1501_c7_376f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1492_c7_833b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_833b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_833b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_833b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_833b_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1497_c7_0d30] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1497_c7_0d30_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_0d30_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output := tmp8_high_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output;

     -- t8_MUX[uxn_opcodes_h_l1489_c7_1e86] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1489_c7_1e86_cond <= VAR_t8_MUX_uxn_opcodes_h_l1489_c7_1e86_cond;
     t8_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue;
     t8_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output := t8_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_376f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_833b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_376f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_376f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_376f_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1492_c7_833b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_833b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_833b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_833b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_833b_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1492_c7_833b] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1492_c7_833b_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_833b_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_833b_return_output := tmp8_high_MUX_uxn_opcodes_h_l1492_c7_833b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1492_c7_833b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1492_c7_833b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_833b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_833b_return_output := result_u16_value_MUX_uxn_opcodes_h_l1492_c7_833b_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1497_c7_0d30] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1497_c7_0d30_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_0d30_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output := tmp8_low_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output;

     -- t8_MUX[uxn_opcodes_h_l1476_c2_1704] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1476_c2_1704_cond <= VAR_t8_MUX_uxn_opcodes_h_l1476_c2_1704_cond;
     t8_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue;
     t8_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1476_c2_1704_return_output := t8_MUX_uxn_opcodes_h_l1476_c2_1704_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1497_c7_0d30] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_0d30_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_0d30_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1497_c7_0d30] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_0d30_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_0d30_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1497_c7_0d30] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1497_c7_0d30_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_0d30_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_0d30_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_0d30_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output := result_u8_value_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1489_c7_1e86] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_1e86_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_1e86_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_833b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_833b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1476_c2_1704_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_833b_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_0d30_return_output;
     -- tmp8_high_MUX[uxn_opcodes_h_l1489_c7_1e86] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1489_c7_1e86_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_1e86_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output := tmp8_high_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1492_c7_833b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_833b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_833b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_833b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_833b_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1492_c7_833b] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1492_c7_833b_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_833b_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_833b_return_output := tmp8_low_MUX_uxn_opcodes_h_l1492_c7_833b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1476_c2_1704] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_1704_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_1704_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_1704_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_1704_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1492_c7_833b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1492_c7_833b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_833b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_833b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1492_c7_833b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1492_c7_833b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_833b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_833b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_833b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_833b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_833b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_833b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1489_c7_1e86] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_1e86_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_1e86_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1489_c7_1e86] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1489_c7_1e86_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_1e86_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output := result_u16_value_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_833b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_833b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_833b_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_833b_return_output;
     -- tmp8_low_MUX[uxn_opcodes_h_l1489_c7_1e86] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1489_c7_1e86_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_1e86_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output := tmp8_low_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1476_c2_1704] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_1704_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_1704_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_1704_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_1704_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1476_c2_1704] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1476_c2_1704_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_1704_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_1704_return_output := result_u16_value_MUX_uxn_opcodes_h_l1476_c2_1704_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1489_c7_1e86] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_1e86_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_1e86_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1489_c7_1e86] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1489_c7_1e86_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_1e86_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output := result_u8_value_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1489_c7_1e86] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_1e86_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_1e86_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_1e86_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_1e86_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1476_c2_1704] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1476_c2_1704_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_1704_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_1704_return_output := tmp8_high_MUX_uxn_opcodes_h_l1476_c2_1704_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_1704_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_1e86_return_output;
     -- tmp8_low_MUX[uxn_opcodes_h_l1476_c2_1704] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1476_c2_1704_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_1704_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_1704_return_output := tmp8_low_MUX_uxn_opcodes_h_l1476_c2_1704_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1476_c2_1704] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1476_c2_1704_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_1704_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_1704_return_output := result_u8_value_MUX_uxn_opcodes_h_l1476_c2_1704_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1476_c2_1704] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_1704_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_1704_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_1704_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_1704_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1476_c2_1704] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_1704_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_1704_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_1704_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_1704_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_1704_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_1704_return_output;

     -- Submodule level 7
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_1704_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e482_uxn_opcodes_h_l1514_l1472_DUPLICATE_3d05 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e482_uxn_opcodes_h_l1514_l1472_DUPLICATE_3d05_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e482(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_1704_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_1704_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_1704_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_1704_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_1704_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_1704_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_1704_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_1704_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_1704_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_1704_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e482_uxn_opcodes_h_l1514_l1472_DUPLICATE_3d05_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e482_uxn_opcodes_h_l1514_l1472_DUPLICATE_3d05_return_output;
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
