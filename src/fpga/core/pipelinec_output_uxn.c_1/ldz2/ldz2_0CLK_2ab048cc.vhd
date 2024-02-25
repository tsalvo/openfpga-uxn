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
-- BIN_OP_EQ[uxn_opcodes_h_l1476_c6_bb14]
signal BIN_OP_EQ_uxn_opcodes_h_l1476_c6_bb14_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1476_c6_bb14_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1476_c6_bb14_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1476_c2_6313]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_6313_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_6313_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1476_c2_6313]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_6313_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_6313_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1476_c2_6313]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_6313_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_6313_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1476_c2_6313]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_6313_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_6313_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1476_c2_6313]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_6313_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_6313_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1476_c2_6313]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_6313_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_6313_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1476_c2_6313]
signal result_u16_value_MUX_uxn_opcodes_h_l1476_c2_6313_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1476_c2_6313_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1476_c2_6313]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_6313_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_6313_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1476_c2_6313]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_6313_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_6313_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1476_c2_6313]
signal result_u8_value_MUX_uxn_opcodes_h_l1476_c2_6313_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1476_c2_6313_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1476_c2_6313]
signal tmp8_low_MUX_uxn_opcodes_h_l1476_c2_6313_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1476_c2_6313_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1476_c2_6313]
signal tmp8_high_MUX_uxn_opcodes_h_l1476_c2_6313_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1476_c2_6313_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1476_c2_6313]
signal t8_MUX_uxn_opcodes_h_l1476_c2_6313_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1476_c2_6313_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1489_c11_0c4a]
signal BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0c4a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0c4a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0c4a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1489_c7_f97d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_f97d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1489_c7_f97d]
signal result_u16_value_MUX_uxn_opcodes_h_l1489_c7_f97d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1489_c7_f97d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_f97d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1489_c7_f97d]
signal result_u8_value_MUX_uxn_opcodes_h_l1489_c7_f97d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1489_c7_f97d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_f97d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1489_c7_f97d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_f97d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1489_c7_f97d]
signal tmp8_low_MUX_uxn_opcodes_h_l1489_c7_f97d_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1489_c7_f97d]
signal tmp8_high_MUX_uxn_opcodes_h_l1489_c7_f97d_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1489_c7_f97d]
signal t8_MUX_uxn_opcodes_h_l1489_c7_f97d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1492_c11_ec8e]
signal BIN_OP_EQ_uxn_opcodes_h_l1492_c11_ec8e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1492_c11_ec8e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1492_c11_ec8e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1492_c7_c53d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_c53d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1492_c7_c53d]
signal result_u16_value_MUX_uxn_opcodes_h_l1492_c7_c53d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1492_c7_c53d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_c53d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1492_c7_c53d]
signal result_u8_value_MUX_uxn_opcodes_h_l1492_c7_c53d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1492_c7_c53d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_c53d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1492_c7_c53d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_c53d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1492_c7_c53d]
signal tmp8_low_MUX_uxn_opcodes_h_l1492_c7_c53d_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1492_c7_c53d]
signal tmp8_high_MUX_uxn_opcodes_h_l1492_c7_c53d_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1492_c7_c53d]
signal t8_MUX_uxn_opcodes_h_l1492_c7_c53d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1494_c30_0b11]
signal sp_relative_shift_uxn_opcodes_h_l1494_c30_0b11_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1494_c30_0b11_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1494_c30_0b11_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1494_c30_0b11_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1497_c11_9af3]
signal BIN_OP_EQ_uxn_opcodes_h_l1497_c11_9af3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1497_c11_9af3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1497_c11_9af3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1497_c7_8ba0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1497_c7_8ba0]
signal result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1497_c7_8ba0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1497_c7_8ba0]
signal result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1497_c7_8ba0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1497_c7_8ba0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1497_c7_8ba0]
signal tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1497_c7_8ba0]
signal tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1499_c33_1ae3]
signal BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_1ae3_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_1ae3_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_1ae3_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1501_c11_5cfc]
signal BIN_OP_EQ_uxn_opcodes_h_l1501_c11_5cfc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1501_c11_5cfc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1501_c11_5cfc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1501_c7_64e7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_64e7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_64e7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_64e7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_64e7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1501_c7_64e7]
signal result_u8_value_MUX_uxn_opcodes_h_l1501_c7_64e7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1501_c7_64e7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1501_c7_64e7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1501_c7_64e7_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1501_c7_64e7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_64e7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_64e7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_64e7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_64e7_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1501_c7_64e7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_64e7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_64e7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_64e7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_64e7_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1501_c7_64e7]
signal tmp8_low_MUX_uxn_opcodes_h_l1501_c7_64e7_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1501_c7_64e7_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1501_c7_64e7_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1501_c7_64e7_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1501_c7_64e7]
signal tmp8_high_MUX_uxn_opcodes_h_l1501_c7_64e7_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1501_c7_64e7_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1501_c7_64e7_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1501_c7_64e7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1507_c11_e268]
signal BIN_OP_EQ_uxn_opcodes_h_l1507_c11_e268_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1507_c11_e268_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1507_c11_e268_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1507_c7_128f]
signal result_u8_value_MUX_uxn_opcodes_h_l1507_c7_128f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1507_c7_128f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1507_c7_128f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1507_c7_128f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1507_c7_128f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_128f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_128f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_128f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_128f_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1507_c7_128f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_128f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_128f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_128f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_128f_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1507_c7_128f]
signal tmp8_low_MUX_uxn_opcodes_h_l1507_c7_128f_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1507_c7_128f_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1507_c7_128f_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1507_c7_128f_return_output : unsigned(7 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1476_c6_bb14
BIN_OP_EQ_uxn_opcodes_h_l1476_c6_bb14 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1476_c6_bb14_left,
BIN_OP_EQ_uxn_opcodes_h_l1476_c6_bb14_right,
BIN_OP_EQ_uxn_opcodes_h_l1476_c6_bb14_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_6313
result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_6313 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_6313_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_6313_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_6313
result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_6313 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_6313_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_6313_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_6313
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_6313 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_6313_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_6313_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_6313
result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_6313 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_6313_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_6313_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_6313
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_6313 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_6313_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_6313_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_6313
result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_6313 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_6313_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_6313_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1476_c2_6313
result_u16_value_MUX_uxn_opcodes_h_l1476_c2_6313 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1476_c2_6313_cond,
result_u16_value_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1476_c2_6313_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_6313
result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_6313 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_6313_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_6313_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_6313
result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_6313 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_6313_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_6313_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1476_c2_6313
result_u8_value_MUX_uxn_opcodes_h_l1476_c2_6313 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1476_c2_6313_cond,
result_u8_value_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1476_c2_6313_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1476_c2_6313
tmp8_low_MUX_uxn_opcodes_h_l1476_c2_6313 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1476_c2_6313_cond,
tmp8_low_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1476_c2_6313_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1476_c2_6313
tmp8_high_MUX_uxn_opcodes_h_l1476_c2_6313 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1476_c2_6313_cond,
tmp8_high_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1476_c2_6313_return_output);

-- t8_MUX_uxn_opcodes_h_l1476_c2_6313
t8_MUX_uxn_opcodes_h_l1476_c2_6313 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1476_c2_6313_cond,
t8_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue,
t8_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse,
t8_MUX_uxn_opcodes_h_l1476_c2_6313_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0c4a
BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0c4a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0c4a_left,
BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0c4a_right,
BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0c4a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_f97d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_f97d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_f97d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1489_c7_f97d
result_u16_value_MUX_uxn_opcodes_h_l1489_c7_f97d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1489_c7_f97d_cond,
result_u16_value_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_f97d
result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_f97d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_f97d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1489_c7_f97d
result_u8_value_MUX_uxn_opcodes_h_l1489_c7_f97d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1489_c7_f97d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_f97d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_f97d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_f97d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_f97d
result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_f97d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_f97d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1489_c7_f97d
tmp8_low_MUX_uxn_opcodes_h_l1489_c7_f97d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1489_c7_f97d_cond,
tmp8_low_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1489_c7_f97d
tmp8_high_MUX_uxn_opcodes_h_l1489_c7_f97d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1489_c7_f97d_cond,
tmp8_high_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output);

-- t8_MUX_uxn_opcodes_h_l1489_c7_f97d
t8_MUX_uxn_opcodes_h_l1489_c7_f97d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1489_c7_f97d_cond,
t8_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue,
t8_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse,
t8_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1492_c11_ec8e
BIN_OP_EQ_uxn_opcodes_h_l1492_c11_ec8e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1492_c11_ec8e_left,
BIN_OP_EQ_uxn_opcodes_h_l1492_c11_ec8e_right,
BIN_OP_EQ_uxn_opcodes_h_l1492_c11_ec8e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_c53d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_c53d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_c53d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1492_c7_c53d
result_u16_value_MUX_uxn_opcodes_h_l1492_c7_c53d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1492_c7_c53d_cond,
result_u16_value_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_c53d
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_c53d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_c53d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1492_c7_c53d
result_u8_value_MUX_uxn_opcodes_h_l1492_c7_c53d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1492_c7_c53d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_c53d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_c53d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_c53d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_c53d
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_c53d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_c53d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1492_c7_c53d
tmp8_low_MUX_uxn_opcodes_h_l1492_c7_c53d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1492_c7_c53d_cond,
tmp8_low_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1492_c7_c53d
tmp8_high_MUX_uxn_opcodes_h_l1492_c7_c53d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1492_c7_c53d_cond,
tmp8_high_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output);

-- t8_MUX_uxn_opcodes_h_l1492_c7_c53d
t8_MUX_uxn_opcodes_h_l1492_c7_c53d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1492_c7_c53d_cond,
t8_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue,
t8_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse,
t8_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1494_c30_0b11
sp_relative_shift_uxn_opcodes_h_l1494_c30_0b11 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1494_c30_0b11_ins,
sp_relative_shift_uxn_opcodes_h_l1494_c30_0b11_x,
sp_relative_shift_uxn_opcodes_h_l1494_c30_0b11_y,
sp_relative_shift_uxn_opcodes_h_l1494_c30_0b11_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1497_c11_9af3
BIN_OP_EQ_uxn_opcodes_h_l1497_c11_9af3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1497_c11_9af3_left,
BIN_OP_EQ_uxn_opcodes_h_l1497_c11_9af3_right,
BIN_OP_EQ_uxn_opcodes_h_l1497_c11_9af3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ba0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ba0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ba0
result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ba0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond,
result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ba0
result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ba0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ba0
result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ba0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ba0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ba0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ba0
result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ba0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ba0
tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ba0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond,
tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ba0
tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ba0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond,
tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_1ae3
BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_1ae3 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_1ae3_left,
BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_1ae3_right,
BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_1ae3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1501_c11_5cfc
BIN_OP_EQ_uxn_opcodes_h_l1501_c11_5cfc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1501_c11_5cfc_left,
BIN_OP_EQ_uxn_opcodes_h_l1501_c11_5cfc_right,
BIN_OP_EQ_uxn_opcodes_h_l1501_c11_5cfc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_64e7
result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_64e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_64e7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_64e7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_64e7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_64e7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1501_c7_64e7
result_u8_value_MUX_uxn_opcodes_h_l1501_c7_64e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1501_c7_64e7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1501_c7_64e7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1501_c7_64e7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1501_c7_64e7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_64e7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_64e7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_64e7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_64e7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_64e7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_64e7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_64e7
result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_64e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_64e7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_64e7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_64e7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_64e7_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1501_c7_64e7
tmp8_low_MUX_uxn_opcodes_h_l1501_c7_64e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1501_c7_64e7_cond,
tmp8_low_MUX_uxn_opcodes_h_l1501_c7_64e7_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1501_c7_64e7_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1501_c7_64e7_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1501_c7_64e7
tmp8_high_MUX_uxn_opcodes_h_l1501_c7_64e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1501_c7_64e7_cond,
tmp8_high_MUX_uxn_opcodes_h_l1501_c7_64e7_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1501_c7_64e7_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1501_c7_64e7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1507_c11_e268
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_e268 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_e268_left,
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_e268_right,
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_e268_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1507_c7_128f
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_128f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_128f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_128f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_128f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_128f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_128f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_128f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_128f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_128f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_128f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_128f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_128f
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_128f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_128f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_128f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_128f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_128f_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1507_c7_128f
tmp8_low_MUX_uxn_opcodes_h_l1507_c7_128f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1507_c7_128f_cond,
tmp8_low_MUX_uxn_opcodes_h_l1507_c7_128f_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1507_c7_128f_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1507_c7_128f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1476_c6_bb14_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_6313_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_6313_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_6313_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_6313_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_6313_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_6313_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1476_c2_6313_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_6313_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_6313_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1476_c2_6313_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1476_c2_6313_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1476_c2_6313_return_output,
 t8_MUX_uxn_opcodes_h_l1476_c2_6313_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0c4a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output,
 t8_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1492_c11_ec8e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output,
 t8_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output,
 sp_relative_shift_uxn_opcodes_h_l1494_c30_0b11_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1497_c11_9af3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_1ae3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1501_c11_5cfc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_64e7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1501_c7_64e7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_64e7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_64e7_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1501_c7_64e7_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1501_c7_64e7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1507_c11_e268_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1507_c7_128f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_128f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_128f_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1507_c7_128f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_bb14_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_bb14_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_bb14_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1481_c3_d316 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_6313_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_6313_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1476_c2_6313_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_6313_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_6313_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1476_c2_6313_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_6313_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_6313_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_6313_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_6313_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1486_c3_628c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_6313_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_6313_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_6313_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_6313_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_6313_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_6313_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1476_c2_6313_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_6313_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_6313_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1476_c2_6313_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_6313_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_6313_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_6313_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_6313_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_6313_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_6313_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_6313_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_6313_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1476_c2_6313_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1476_c2_6313_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0c4a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0c4a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0c4a_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_f97d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_f97d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_f97d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_f97d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1490_c3_1a86 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_f97d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_f97d_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_f97d_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_f97d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1489_c7_f97d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_ec8e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_ec8e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_ec8e_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_c53d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_c53d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_c53d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_c53d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_c53d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_c53d_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_c53d_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_c53d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1492_c7_c53d_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_0b11_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_0b11_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_0b11_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_0b11_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1495_c22_7812_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_9af3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_9af3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_9af3_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1498_c3_2d2b : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_64e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_64e7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_64e7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_64e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_64e7_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_64e7_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_1ae3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_1ae3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_1ae3_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1499_c22_9628_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_5cfc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_5cfc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_5cfc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_64e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_64e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_64e7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_64e7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_64e7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_128f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_64e7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_64e7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1504_c3_ca74 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_64e7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_128f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_64e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_64e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_64e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_128f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_64e7_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_64e7_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_64e7_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_128f_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_64e7_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_64e7_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_64e7_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_64e7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_e268_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_e268_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_e268_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_128f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_128f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_128f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_128f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1509_c3_62bd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_128f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_128f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_128f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_128f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_128f_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_128f_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_128f_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_128f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1476_l1497_l1489_DUPLICATE_bd0f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1476_l1507_l1497_l1492_l1489_DUPLICATE_5806_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1497_l1489_DUPLICATE_8084_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1492_l1497_l1489_l1501_DUPLICATE_d4d1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1507_l1501_l1497_l1492_l1489_DUPLICATE_8d97_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1492_l1507_l1497_DUPLICATE_eaef_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d736_uxn_opcodes_h_l1514_l1472_DUPLICATE_e43f_return_output : opcode_result_t;
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
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_64e7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0c4a_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1504_c3_ca74 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_64e7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1504_c3_ca74;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_1ae3_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1486_c3_628c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1486_c3_628c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_e268_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1509_c3_62bd := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_128f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1509_c3_62bd;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_bb14_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_128f_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1490_c3_1a86 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1490_c3_1a86;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1481_c3_d316 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1481_c3_d316;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_5cfc_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_9af3_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_0b11_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1498_c3_2d2b := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1498_c3_2d2b;
     VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_0b11_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_ec8e_right := to_unsigned(2, 2);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_0b11_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_bb14_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0c4a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_ec8e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_9af3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_5cfc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_e268_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_64e7_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_128f_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_64e7_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_128f_iftrue := VAR_previous_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_1ae3_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse := t8;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_64e7_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_64e7_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_128f_iffalse := tmp8_low;
     -- BIN_OP_EQ[uxn_opcodes_h_l1501_c11_5cfc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1501_c11_5cfc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_5cfc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1501_c11_5cfc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_5cfc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_5cfc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1501_c11_5cfc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1489_c11_0c4a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0c4a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0c4a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0c4a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0c4a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0c4a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0c4a_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1476_c2_6313] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1476_c2_6313_return_output := result.is_vram_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1476_c2_6313] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1476_c2_6313_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1507_l1501_l1497_l1492_l1489_DUPLICATE_8d97 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1507_l1501_l1497_l1492_l1489_DUPLICATE_8d97_return_output := result.is_opc_done;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1499_c33_1ae3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_1ae3_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_1ae3_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_1ae3_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_1ae3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_1ae3_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_1ae3_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1492_l1507_l1497_DUPLICATE_eaef LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1492_l1507_l1497_DUPLICATE_eaef_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1476_l1507_l1497_l1492_l1489_DUPLICATE_5806 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1476_l1507_l1497_l1492_l1489_DUPLICATE_5806_return_output := result.u8_value;

     -- sp_relative_shift[uxn_opcodes_h_l1494_c30_0b11] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1494_c30_0b11_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_0b11_ins;
     sp_relative_shift_uxn_opcodes_h_l1494_c30_0b11_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_0b11_x;
     sp_relative_shift_uxn_opcodes_h_l1494_c30_0b11_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_0b11_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_0b11_return_output := sp_relative_shift_uxn_opcodes_h_l1494_c30_0b11_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1492_c11_ec8e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1492_c11_ec8e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_ec8e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1492_c11_ec8e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_ec8e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_ec8e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1492_c11_ec8e_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1497_l1489_DUPLICATE_8084 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1497_l1489_DUPLICATE_8084_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1476_c6_bb14] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1476_c6_bb14_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_bb14_left;
     BIN_OP_EQ_uxn_opcodes_h_l1476_c6_bb14_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_bb14_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_bb14_return_output := BIN_OP_EQ_uxn_opcodes_h_l1476_c6_bb14_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1476_c2_6313] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1476_c2_6313_return_output := result.is_pc_updated;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1476_c2_6313] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1476_c2_6313_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1507_c11_e268] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1507_c11_e268_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_e268_left;
     BIN_OP_EQ_uxn_opcodes_h_l1507_c11_e268_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_e268_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_e268_return_output := BIN_OP_EQ_uxn_opcodes_h_l1507_c11_e268_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1495_c22_7812] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1495_c22_7812_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1476_l1497_l1489_DUPLICATE_bd0f LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1476_l1497_l1489_DUPLICATE_bd0f_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1492_l1497_l1489_l1501_DUPLICATE_d4d1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1492_l1497_l1489_l1501_DUPLICATE_d4d1_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1497_c11_9af3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1497_c11_9af3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_9af3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1497_c11_9af3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_9af3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_9af3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1497_c11_9af3_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_6313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_bb14_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_6313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_bb14_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_6313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_bb14_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_6313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_bb14_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_6313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_bb14_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_6313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_bb14_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_6313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_bb14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_6313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_bb14_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_6313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_bb14_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_6313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_bb14_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1476_c2_6313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_bb14_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_6313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_bb14_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_6313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_bb14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_f97d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0c4a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_f97d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0c4a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_f97d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0c4a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_f97d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0c4a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_f97d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0c4a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_f97d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0c4a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1489_c7_f97d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0c4a_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_f97d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0c4a_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_f97d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_0c4a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_c53d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_ec8e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_c53d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_ec8e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_c53d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_ec8e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_c53d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_ec8e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_c53d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_ec8e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_c53d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_ec8e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1492_c7_c53d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_ec8e_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_c53d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_ec8e_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_c53d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_ec8e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_9af3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_9af3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_9af3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_9af3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_9af3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_9af3_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_9af3_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_9af3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_64e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_5cfc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_64e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_5cfc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_64e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_5cfc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_64e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_5cfc_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_64e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_5cfc_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_64e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_5cfc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_128f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_e268_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_128f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_e268_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_128f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_e268_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_128f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_e268_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1495_c22_7812_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1497_l1489_DUPLICATE_8084_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1497_l1489_DUPLICATE_8084_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1476_l1497_l1489_DUPLICATE_bd0f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1476_l1497_l1489_DUPLICATE_bd0f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1476_l1497_l1489_DUPLICATE_bd0f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1507_l1501_l1497_l1492_l1489_DUPLICATE_8d97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1507_l1501_l1497_l1492_l1489_DUPLICATE_8d97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1507_l1501_l1497_l1492_l1489_DUPLICATE_8d97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_64e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1507_l1501_l1497_l1492_l1489_DUPLICATE_8d97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_128f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1507_l1501_l1497_l1492_l1489_DUPLICATE_8d97_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1492_l1497_l1489_l1501_DUPLICATE_d4d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1492_l1497_l1489_l1501_DUPLICATE_d4d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1492_l1497_l1489_l1501_DUPLICATE_d4d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_64e7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1492_l1497_l1489_l1501_DUPLICATE_d4d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1492_l1507_l1497_DUPLICATE_eaef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1492_l1507_l1497_DUPLICATE_eaef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_128f_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1492_l1507_l1497_DUPLICATE_eaef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1476_l1507_l1497_l1492_l1489_DUPLICATE_5806_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1476_l1507_l1497_l1492_l1489_DUPLICATE_5806_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1476_l1507_l1497_l1492_l1489_DUPLICATE_5806_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1476_l1507_l1497_l1492_l1489_DUPLICATE_5806_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_128f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1476_l1507_l1497_l1492_l1489_DUPLICATE_5806_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1476_c2_6313_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1476_c2_6313_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1476_c2_6313_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1476_c2_6313_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_0b11_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1507_c7_128f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1507_c7_128f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_128f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1507_c7_128f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_128f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1507_c7_128f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_128f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_128f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1507_c7_128f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1476_c2_6313] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_6313_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_6313_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_6313_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_6313_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1476_c2_6313] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_6313_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_6313_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_6313_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_6313_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1507_c7_128f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_128f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_128f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_128f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_128f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_128f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_128f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_128f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_128f_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1501_c7_64e7] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1501_c7_64e7_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_64e7_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1501_c7_64e7_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_64e7_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1501_c7_64e7_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_64e7_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_64e7_return_output := tmp8_high_MUX_uxn_opcodes_h_l1501_c7_64e7_return_output;

     -- t8_MUX[uxn_opcodes_h_l1492_c7_c53d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1492_c7_c53d_cond <= VAR_t8_MUX_uxn_opcodes_h_l1492_c7_c53d_cond;
     t8_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue;
     t8_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output := t8_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1501_c7_64e7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_64e7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_64e7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_64e7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_64e7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_64e7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_64e7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_64e7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_64e7_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1507_c7_128f] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1507_c7_128f_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_128f_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1507_c7_128f_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_128f_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1507_c7_128f_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_128f_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_128f_return_output := tmp8_low_MUX_uxn_opcodes_h_l1507_c7_128f_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1476_c2_6313] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_6313_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_6313_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_6313_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_6313_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1476_c2_6313] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_6313_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_6313_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_6313_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_6313_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1497_c7_8ba0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1499_c22_9628] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1499_c22_9628_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_1ae3_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1507_c7_128f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_128f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_128f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_128f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_128f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_128f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_128f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_128f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_128f_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1499_c22_9628_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_64e7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_128f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_64e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_64e7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_128f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_64e7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_128f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_64e7_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_64e7_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_128f_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1501_c7_64e7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1501_c7_64e7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_64e7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1501_c7_64e7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_64e7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1501_c7_64e7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_64e7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_64e7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1501_c7_64e7_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1497_c7_8ba0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output := result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1501_c7_64e7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_64e7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_64e7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_64e7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_64e7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_64e7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_64e7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_64e7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_64e7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1492_c7_c53d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_c53d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_c53d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1497_c7_8ba0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1501_c7_64e7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_64e7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_64e7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_64e7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_64e7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_64e7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_64e7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_64e7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_64e7_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1501_c7_64e7] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1501_c7_64e7_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_64e7_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1501_c7_64e7_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_64e7_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1501_c7_64e7_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_64e7_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_64e7_return_output := tmp8_low_MUX_uxn_opcodes_h_l1501_c7_64e7_return_output;

     -- t8_MUX[uxn_opcodes_h_l1489_c7_f97d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1489_c7_f97d_cond <= VAR_t8_MUX_uxn_opcodes_h_l1489_c7_f97d_cond;
     t8_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue;
     t8_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output := t8_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1497_c7_8ba0] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output := tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_64e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_64e7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_64e7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_64e7_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1497_c7_8ba0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1497_c7_8ba0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output;

     -- t8_MUX[uxn_opcodes_h_l1476_c2_6313] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1476_c2_6313_cond <= VAR_t8_MUX_uxn_opcodes_h_l1476_c2_6313_cond;
     t8_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue;
     t8_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1476_c2_6313_return_output := t8_MUX_uxn_opcodes_h_l1476_c2_6313_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1497_c7_8ba0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1492_c7_c53d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_c53d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_c53d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1497_c7_8ba0] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ba0_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ba0_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ba0_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output := tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1489_c7_f97d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_f97d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_f97d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1492_c7_c53d] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1492_c7_c53d_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_c53d_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output := tmp8_high_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1492_c7_c53d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1492_c7_c53d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_c53d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output := result_u16_value_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1476_c2_6313_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ba0_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1476_c2_6313] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_6313_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_6313_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_6313_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_6313_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1492_c7_c53d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_c53d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_c53d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1492_c7_c53d] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1492_c7_c53d_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_c53d_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output := tmp8_low_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1489_c7_f97d] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1489_c7_f97d_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_f97d_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output := tmp8_high_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1492_c7_c53d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_c53d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_c53d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1492_c7_c53d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1492_c7_c53d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_c53d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_c53d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_c53d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1489_c7_f97d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1489_c7_f97d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_f97d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output := result_u16_value_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1489_c7_f97d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_f97d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_f97d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_c53d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1489_c7_f97d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_f97d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_f97d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1476_c2_6313] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_6313_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_6313_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_6313_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_6313_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1489_c7_f97d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_f97d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_f97d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1489_c7_f97d] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1489_c7_f97d_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_f97d_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output := tmp8_low_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1489_c7_f97d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1489_c7_f97d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_f97d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_f97d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_f97d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1476_c2_6313] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1476_c2_6313_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_6313_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_6313_return_output := result_u16_value_MUX_uxn_opcodes_h_l1476_c2_6313_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1476_c2_6313] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1476_c2_6313_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_6313_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_6313_return_output := tmp8_high_MUX_uxn_opcodes_h_l1476_c2_6313_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_6313_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_f97d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1476_c2_6313] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1476_c2_6313_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_6313_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_6313_return_output := result_u8_value_MUX_uxn_opcodes_h_l1476_c2_6313_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1476_c2_6313] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_6313_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_6313_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_6313_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_6313_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1476_c2_6313] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1476_c2_6313_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_6313_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_6313_return_output := tmp8_low_MUX_uxn_opcodes_h_l1476_c2_6313_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1476_c2_6313] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_6313_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_6313_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_6313_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_6313_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_6313_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_6313_return_output;

     -- Submodule level 7
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_6313_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d736_uxn_opcodes_h_l1514_l1472_DUPLICATE_e43f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d736_uxn_opcodes_h_l1514_l1472_DUPLICATE_e43f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d736(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_6313_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_6313_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_6313_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_6313_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_6313_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_6313_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_6313_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_6313_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_6313_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_6313_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d736_uxn_opcodes_h_l1514_l1472_DUPLICATE_e43f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d736_uxn_opcodes_h_l1514_l1472_DUPLICATE_e43f_return_output;
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
