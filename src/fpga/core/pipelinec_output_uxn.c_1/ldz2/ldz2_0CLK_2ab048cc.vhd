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
-- BIN_OP_EQ[uxn_opcodes_h_l1476_c6_0571]
signal BIN_OP_EQ_uxn_opcodes_h_l1476_c6_0571_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1476_c6_0571_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1476_c6_0571_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1476_c2_7f06]
signal t8_MUX_uxn_opcodes_h_l1476_c2_7f06_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1476_c2_7f06]
signal tmp8_high_MUX_uxn_opcodes_h_l1476_c2_7f06_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1476_c2_7f06]
signal tmp8_low_MUX_uxn_opcodes_h_l1476_c2_7f06_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1476_c2_7f06]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_7f06_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1476_c2_7f06]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_7f06_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1476_c2_7f06]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_7f06_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1476_c2_7f06]
signal result_u8_value_MUX_uxn_opcodes_h_l1476_c2_7f06_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1476_c2_7f06]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_7f06_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1476_c2_7f06]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_7f06_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1476_c2_7f06]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1476_c2_7f06]
signal result_u16_value_MUX_uxn_opcodes_h_l1476_c2_7f06_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1476_c2_7f06]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1476_c2_7f06]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_7f06_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1489_c11_4241]
signal BIN_OP_EQ_uxn_opcodes_h_l1489_c11_4241_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1489_c11_4241_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1489_c11_4241_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1489_c7_9b49]
signal t8_MUX_uxn_opcodes_h_l1489_c7_9b49_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1489_c7_9b49]
signal tmp8_high_MUX_uxn_opcodes_h_l1489_c7_9b49_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1489_c7_9b49]
signal tmp8_low_MUX_uxn_opcodes_h_l1489_c7_9b49_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1489_c7_9b49]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_9b49_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1489_c7_9b49]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_9b49_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1489_c7_9b49]
signal result_u8_value_MUX_uxn_opcodes_h_l1489_c7_9b49_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1489_c7_9b49]
signal result_u16_value_MUX_uxn_opcodes_h_l1489_c7_9b49_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1489_c7_9b49]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_9b49_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1489_c7_9b49]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_9b49_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1492_c11_25ff]
signal BIN_OP_EQ_uxn_opcodes_h_l1492_c11_25ff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1492_c11_25ff_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1492_c11_25ff_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1492_c7_f6b8]
signal t8_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1492_c7_f6b8]
signal tmp8_high_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1492_c7_f6b8]
signal tmp8_low_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1492_c7_f6b8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1492_c7_f6b8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1492_c7_f6b8]
signal result_u8_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1492_c7_f6b8]
signal result_u16_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1492_c7_f6b8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1492_c7_f6b8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output : unsigned(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1494_c30_7b3f]
signal sp_relative_shift_uxn_opcodes_h_l1494_c30_7b3f_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1494_c30_7b3f_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1494_c30_7b3f_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1494_c30_7b3f_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1497_c11_0826]
signal BIN_OP_EQ_uxn_opcodes_h_l1497_c11_0826_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1497_c11_0826_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1497_c11_0826_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1497_c7_8ff8]
signal tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1497_c7_8ff8]
signal tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1497_c7_8ff8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1497_c7_8ff8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1497_c7_8ff8]
signal result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1497_c7_8ff8]
signal result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1497_c7_8ff8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1497_c7_8ff8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output : unsigned(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1499_c33_407a]
signal BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_407a_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_407a_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_407a_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1501_c11_f9a0]
signal BIN_OP_EQ_uxn_opcodes_h_l1501_c11_f9a0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1501_c11_f9a0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1501_c11_f9a0_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1501_c7_bb7e]
signal tmp8_high_MUX_uxn_opcodes_h_l1501_c7_bb7e_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1501_c7_bb7e_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1501_c7_bb7e_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1501_c7_bb7e_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1501_c7_bb7e]
signal tmp8_low_MUX_uxn_opcodes_h_l1501_c7_bb7e_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1501_c7_bb7e_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1501_c7_bb7e_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1501_c7_bb7e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1501_c7_bb7e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_bb7e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_bb7e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_bb7e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_bb7e_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1501_c7_bb7e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_bb7e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_bb7e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_bb7e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_bb7e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1501_c7_bb7e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_bb7e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_bb7e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_bb7e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_bb7e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1501_c7_bb7e]
signal result_u8_value_MUX_uxn_opcodes_h_l1501_c7_bb7e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1501_c7_bb7e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1501_c7_bb7e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1501_c7_bb7e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1507_c11_7c3f]
signal BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7c3f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7c3f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7c3f_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1507_c7_8f12]
signal tmp8_low_MUX_uxn_opcodes_h_l1507_c7_8f12_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1507_c7_8f12_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1507_c7_8f12_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1507_c7_8f12_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1507_c7_8f12]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_8f12_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_8f12_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_8f12_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_8f12_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1507_c7_8f12]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_8f12_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_8f12_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_8f12_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_8f12_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1507_c7_8f12]
signal result_u8_value_MUX_uxn_opcodes_h_l1507_c7_8f12_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1507_c7_8f12_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1507_c7_8f12_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1507_c7_8f12_return_output : unsigned(7 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_1899( ref_toks_0 : opcode_result_t;
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
      base.is_stack_index_flipped := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.u16_value := ref_toks_8;
      base.is_ram_write := ref_toks_9;
      base.stack_address_sp_offset := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1476_c6_0571
BIN_OP_EQ_uxn_opcodes_h_l1476_c6_0571 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1476_c6_0571_left,
BIN_OP_EQ_uxn_opcodes_h_l1476_c6_0571_right,
BIN_OP_EQ_uxn_opcodes_h_l1476_c6_0571_return_output);

-- t8_MUX_uxn_opcodes_h_l1476_c2_7f06
t8_MUX_uxn_opcodes_h_l1476_c2_7f06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1476_c2_7f06_cond,
t8_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue,
t8_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse,
t8_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1476_c2_7f06
tmp8_high_MUX_uxn_opcodes_h_l1476_c2_7f06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1476_c2_7f06_cond,
tmp8_high_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1476_c2_7f06
tmp8_low_MUX_uxn_opcodes_h_l1476_c2_7f06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1476_c2_7f06_cond,
tmp8_low_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_7f06
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_7f06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_7f06_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_7f06
result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_7f06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_7f06_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_7f06
result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_7f06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_7f06_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1476_c2_7f06
result_u8_value_MUX_uxn_opcodes_h_l1476_c2_7f06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1476_c2_7f06_cond,
result_u8_value_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_7f06
result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_7f06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_7f06_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_7f06
result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_7f06 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_7f06_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_7f06
result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_7f06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1476_c2_7f06
result_u16_value_MUX_uxn_opcodes_h_l1476_c2_7f06 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1476_c2_7f06_cond,
result_u16_value_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_7f06
result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_7f06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_7f06
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_7f06 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_7f06_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1489_c11_4241
BIN_OP_EQ_uxn_opcodes_h_l1489_c11_4241 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1489_c11_4241_left,
BIN_OP_EQ_uxn_opcodes_h_l1489_c11_4241_right,
BIN_OP_EQ_uxn_opcodes_h_l1489_c11_4241_return_output);

-- t8_MUX_uxn_opcodes_h_l1489_c7_9b49
t8_MUX_uxn_opcodes_h_l1489_c7_9b49 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1489_c7_9b49_cond,
t8_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue,
t8_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse,
t8_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1489_c7_9b49
tmp8_high_MUX_uxn_opcodes_h_l1489_c7_9b49 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1489_c7_9b49_cond,
tmp8_high_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1489_c7_9b49
tmp8_low_MUX_uxn_opcodes_h_l1489_c7_9b49 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1489_c7_9b49_cond,
tmp8_low_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_9b49
result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_9b49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_9b49_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_9b49
result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_9b49 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_9b49_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1489_c7_9b49
result_u8_value_MUX_uxn_opcodes_h_l1489_c7_9b49 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1489_c7_9b49_cond,
result_u8_value_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1489_c7_9b49
result_u16_value_MUX_uxn_opcodes_h_l1489_c7_9b49 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1489_c7_9b49_cond,
result_u16_value_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_9b49
result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_9b49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_9b49_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_9b49
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_9b49 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_9b49_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1492_c11_25ff
BIN_OP_EQ_uxn_opcodes_h_l1492_c11_25ff : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1492_c11_25ff_left,
BIN_OP_EQ_uxn_opcodes_h_l1492_c11_25ff_right,
BIN_OP_EQ_uxn_opcodes_h_l1492_c11_25ff_return_output);

-- t8_MUX_uxn_opcodes_h_l1492_c7_f6b8
t8_MUX_uxn_opcodes_h_l1492_c7_f6b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond,
t8_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue,
t8_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse,
t8_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1492_c7_f6b8
tmp8_high_MUX_uxn_opcodes_h_l1492_c7_f6b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond,
tmp8_high_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1492_c7_f6b8
tmp8_low_MUX_uxn_opcodes_h_l1492_c7_f6b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond,
tmp8_low_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_f6b8
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_f6b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_f6b8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_f6b8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1492_c7_f6b8
result_u8_value_MUX_uxn_opcodes_h_l1492_c7_f6b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1492_c7_f6b8
result_u16_value_MUX_uxn_opcodes_h_l1492_c7_f6b8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond,
result_u16_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_f6b8
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_f6b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_f6b8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_f6b8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1494_c30_7b3f
sp_relative_shift_uxn_opcodes_h_l1494_c30_7b3f : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1494_c30_7b3f_ins,
sp_relative_shift_uxn_opcodes_h_l1494_c30_7b3f_x,
sp_relative_shift_uxn_opcodes_h_l1494_c30_7b3f_y,
sp_relative_shift_uxn_opcodes_h_l1494_c30_7b3f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1497_c11_0826
BIN_OP_EQ_uxn_opcodes_h_l1497_c11_0826 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1497_c11_0826_left,
BIN_OP_EQ_uxn_opcodes_h_l1497_c11_0826_right,
BIN_OP_EQ_uxn_opcodes_h_l1497_c11_0826_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ff8
tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ff8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond,
tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ff8
tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ff8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond,
tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ff8
result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ff8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ff8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ff8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ff8
result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ff8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ff8
result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ff8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond,
result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ff8
result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ff8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ff8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ff8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_407a
BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_407a : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_407a_left,
BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_407a_right,
BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_407a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1501_c11_f9a0
BIN_OP_EQ_uxn_opcodes_h_l1501_c11_f9a0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1501_c11_f9a0_left,
BIN_OP_EQ_uxn_opcodes_h_l1501_c11_f9a0_right,
BIN_OP_EQ_uxn_opcodes_h_l1501_c11_f9a0_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1501_c7_bb7e
tmp8_high_MUX_uxn_opcodes_h_l1501_c7_bb7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1501_c7_bb7e_cond,
tmp8_high_MUX_uxn_opcodes_h_l1501_c7_bb7e_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1501_c7_bb7e_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1501_c7_bb7e_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1501_c7_bb7e
tmp8_low_MUX_uxn_opcodes_h_l1501_c7_bb7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1501_c7_bb7e_cond,
tmp8_low_MUX_uxn_opcodes_h_l1501_c7_bb7e_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1501_c7_bb7e_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1501_c7_bb7e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_bb7e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_bb7e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_bb7e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_bb7e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_bb7e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_bb7e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_bb7e
result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_bb7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_bb7e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_bb7e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_bb7e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_bb7e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_bb7e
result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_bb7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_bb7e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_bb7e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_bb7e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_bb7e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1501_c7_bb7e
result_u8_value_MUX_uxn_opcodes_h_l1501_c7_bb7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1501_c7_bb7e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1501_c7_bb7e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1501_c7_bb7e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1501_c7_bb7e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7c3f
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7c3f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7c3f_left,
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7c3f_right,
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7c3f_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1507_c7_8f12
tmp8_low_MUX_uxn_opcodes_h_l1507_c7_8f12 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1507_c7_8f12_cond,
tmp8_low_MUX_uxn_opcodes_h_l1507_c7_8f12_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1507_c7_8f12_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1507_c7_8f12_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_8f12
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_8f12 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_8f12_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_8f12_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_8f12_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_8f12_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_8f12
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_8f12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_8f12_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_8f12_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_8f12_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_8f12_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1507_c7_8f12
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_8f12 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_8f12_cond,
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_8f12_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_8f12_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_8f12_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1476_c6_0571_return_output,
 t8_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1489_c11_4241_return_output,
 t8_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1492_c11_25ff_return_output,
 t8_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output,
 sp_relative_shift_uxn_opcodes_h_l1494_c30_7b3f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1497_c11_0826_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_407a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1501_c11_f9a0_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1501_c7_bb7e_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1501_c7_bb7e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_bb7e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_bb7e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_bb7e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1501_c7_bb7e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7c3f_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1507_c7_8f12_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_8f12_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_8f12_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1507_c7_8f12_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_0571_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_0571_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_0571_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1476_c2_7f06_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_7f06_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_7f06_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1476_c2_7f06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_7f06_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1476_c2_7f06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_7f06_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_7f06_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_7f06_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_7f06_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1481_c3_9f8c : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_7f06_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1476_c2_7f06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_7f06_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1476_c2_7f06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1486_c3_5490 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_7f06_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_4241_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_4241_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_4241_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1489_c7_9b49_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_9b49_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_9b49_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_9b49_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_9b49_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_9b49_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_9b49_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_9b49_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1490_c3_8790 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_9b49_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_25ff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_25ff_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_25ff_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_7b3f_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_7b3f_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_7b3f_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_7b3f_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1495_c22_ade2_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_0826_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_0826_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_0826_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_bb7e_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_bb7e_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_bb7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1498_c3_ecd5 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_bb7e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_bb7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_bb7e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_407a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_407a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_407a_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1499_c22_38b8_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_f9a0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_f9a0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_f9a0_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_bb7e_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_bb7e_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_bb7e_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_bb7e_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_bb7e_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_8f12_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_bb7e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_bb7e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1504_c3_98a1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_bb7e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_8f12_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_bb7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_bb7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_bb7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_8f12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_bb7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_bb7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_bb7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_bb7e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_bb7e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_bb7e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_8f12_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_bb7e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7c3f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7c3f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7c3f_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_8f12_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_8f12_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_8f12_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_8f12_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1509_c3_3527 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_8f12_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_8f12_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_8f12_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_8f12_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_8f12_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_8f12_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_8f12_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_8f12_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1497_l1492_l1489_l1476_l1507_DUPLICATE_7c0e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1489_l1476_l1497_DUPLICATE_732a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1489_l1501_l1492_l1497_DUPLICATE_f9cf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1489_l1497_DUPLICATE_aa27_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1501_l1497_l1492_l1489_l1507_DUPLICATE_87b3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1492_l1507_l1497_DUPLICATE_4414_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1899_uxn_opcodes_h_l1514_l1472_DUPLICATE_d0a4_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_7b3f_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_7b3f_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_0571_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7c3f_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1490_c3_8790 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1490_c3_8790;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_bb7e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_4241_right := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_25ff_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_8f12_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1486_c3_5490 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1486_c3_5490;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1509_c3_3527 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_8f12_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1509_c3_3527;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1481_c3_9f8c := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1481_c3_9f8c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1504_c3_98a1 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_bb7e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1504_c3_98a1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_0826_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1498_c3_ecd5 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1498_c3_ecd5;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_407a_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_f9a0_right := to_unsigned(4, 3);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_7b3f_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_0571_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_4241_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_25ff_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_0826_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_f9a0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7c3f_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_bb7e_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_8f12_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_bb7e_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_8f12_iftrue := VAR_previous_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_407a_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse := t8;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_bb7e_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_bb7e_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_8f12_iffalse := tmp8_low;
     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1476_c2_7f06] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1476_c2_7f06_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1501_c11_f9a0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1501_c11_f9a0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_f9a0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1501_c11_f9a0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_f9a0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_f9a0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1501_c11_f9a0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1492_c11_25ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1492_c11_25ff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_25ff_left;
     BIN_OP_EQ_uxn_opcodes_h_l1492_c11_25ff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_25ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_25ff_return_output := BIN_OP_EQ_uxn_opcodes_h_l1492_c11_25ff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1476_c6_0571] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1476_c6_0571_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_0571_left;
     BIN_OP_EQ_uxn_opcodes_h_l1476_c6_0571_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_0571_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_0571_return_output := BIN_OP_EQ_uxn_opcodes_h_l1476_c6_0571_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1497_l1492_l1489_l1476_l1507_DUPLICATE_7c0e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1497_l1492_l1489_l1476_l1507_DUPLICATE_7c0e_return_output := result.u8_value;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1495_c22_ade2] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1495_c22_ade2_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- sp_relative_shift[uxn_opcodes_h_l1494_c30_7b3f] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1494_c30_7b3f_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_7b3f_ins;
     sp_relative_shift_uxn_opcodes_h_l1494_c30_7b3f_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_7b3f_x;
     sp_relative_shift_uxn_opcodes_h_l1494_c30_7b3f_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_7b3f_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_7b3f_return_output := sp_relative_shift_uxn_opcodes_h_l1494_c30_7b3f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1497_c11_0826] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1497_c11_0826_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_0826_left;
     BIN_OP_EQ_uxn_opcodes_h_l1497_c11_0826_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_0826_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_0826_return_output := BIN_OP_EQ_uxn_opcodes_h_l1497_c11_0826_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1489_c11_4241] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1489_c11_4241_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_4241_left;
     BIN_OP_EQ_uxn_opcodes_h_l1489_c11_4241_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_4241_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_4241_return_output := BIN_OP_EQ_uxn_opcodes_h_l1489_c11_4241_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1476_c2_7f06] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1476_c2_7f06_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1489_l1476_l1497_DUPLICATE_732a LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1489_l1476_l1497_DUPLICATE_732a_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1489_l1501_l1492_l1497_DUPLICATE_f9cf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1489_l1501_l1492_l1497_DUPLICATE_f9cf_return_output := result.is_stack_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1476_c2_7f06] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1476_c2_7f06_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1501_l1497_l1492_l1489_l1507_DUPLICATE_87b3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1501_l1497_l1492_l1489_l1507_DUPLICATE_87b3_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1492_l1507_l1497_DUPLICATE_4414 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1492_l1507_l1497_DUPLICATE_4414_return_output := result.stack_address_sp_offset;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1499_c33_407a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_407a_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_407a_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_407a_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_407a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_407a_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_407a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1507_c11_7c3f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7c3f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7c3f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7c3f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7c3f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7c3f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7c3f_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1489_l1497_DUPLICATE_aa27 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1489_l1497_DUPLICATE_aa27_return_output := result.sp_relative_shift;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1476_c2_7f06] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1476_c2_7f06_return_output := result.is_stack_index_flipped;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_7f06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_0571_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_7f06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_0571_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_0571_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_7f06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_0571_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_7f06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_0571_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_0571_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_7f06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_0571_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_7f06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_0571_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_7f06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_0571_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_7f06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_0571_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1476_c2_7f06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_0571_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_7f06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_0571_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_7f06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_0571_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_9b49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_4241_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_9b49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_4241_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_9b49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_4241_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_9b49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_4241_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_9b49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_4241_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_9b49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_4241_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1489_c7_9b49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_4241_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_9b49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_4241_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_9b49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_4241_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_25ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_25ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_25ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_25ff_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_25ff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_25ff_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_25ff_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_25ff_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_25ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_0826_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_0826_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_0826_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_0826_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_0826_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_0826_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_0826_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_0826_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_bb7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_f9a0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_bb7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_f9a0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_bb7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_f9a0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_bb7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_f9a0_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_bb7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_f9a0_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_bb7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_f9a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_8f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7c3f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_8f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7c3f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_8f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7c3f_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_8f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_7c3f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1495_c22_ade2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1489_l1497_DUPLICATE_aa27_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1489_l1497_DUPLICATE_aa27_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1489_l1476_l1497_DUPLICATE_732a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1489_l1476_l1497_DUPLICATE_732a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1489_l1476_l1497_DUPLICATE_732a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1501_l1497_l1492_l1489_l1507_DUPLICATE_87b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1501_l1497_l1492_l1489_l1507_DUPLICATE_87b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1501_l1497_l1492_l1489_l1507_DUPLICATE_87b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_bb7e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1501_l1497_l1492_l1489_l1507_DUPLICATE_87b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_8f12_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1501_l1497_l1492_l1489_l1507_DUPLICATE_87b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1489_l1501_l1492_l1497_DUPLICATE_f9cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1489_l1501_l1492_l1497_DUPLICATE_f9cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1489_l1501_l1492_l1497_DUPLICATE_f9cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_bb7e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1489_l1501_l1492_l1497_DUPLICATE_f9cf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1492_l1507_l1497_DUPLICATE_4414_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1492_l1507_l1497_DUPLICATE_4414_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_8f12_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1492_l1507_l1497_DUPLICATE_4414_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1497_l1492_l1489_l1476_l1507_DUPLICATE_7c0e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1497_l1492_l1489_l1476_l1507_DUPLICATE_7c0e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1497_l1492_l1489_l1476_l1507_DUPLICATE_7c0e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1497_l1492_l1489_l1476_l1507_DUPLICATE_7c0e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_8f12_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1497_l1492_l1489_l1476_l1507_DUPLICATE_7c0e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1476_c2_7f06_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1476_c2_7f06_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1476_c2_7f06_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1476_c2_7f06_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_7b3f_return_output;
     -- tmp8_high_MUX[uxn_opcodes_h_l1501_c7_bb7e] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1501_c7_bb7e_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_bb7e_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1501_c7_bb7e_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_bb7e_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1501_c7_bb7e_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_bb7e_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_bb7e_return_output := tmp8_high_MUX_uxn_opcodes_h_l1501_c7_bb7e_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1476_c2_7f06] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_7f06_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_7f06_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1507_c7_8f12] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_8f12_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_8f12_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_8f12_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_8f12_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_8f12_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_8f12_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_8f12_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_8f12_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1499_c22_38b8] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1499_c22_38b8_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_407a_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1497_c7_8ff8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1501_c7_bb7e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_bb7e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_bb7e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_bb7e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_bb7e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_bb7e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_bb7e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_bb7e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_bb7e_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1507_c7_8f12] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1507_c7_8f12_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_8f12_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1507_c7_8f12_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_8f12_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1507_c7_8f12_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_8f12_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_8f12_return_output := tmp8_low_MUX_uxn_opcodes_h_l1507_c7_8f12_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1476_c2_7f06] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output;

     -- t8_MUX[uxn_opcodes_h_l1492_c7_f6b8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond <= VAR_t8_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond;
     t8_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue;
     t8_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output := t8_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1507_c7_8f12] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_8f12_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_8f12_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_8f12_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_8f12_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_8f12_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_8f12_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_8f12_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_8f12_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1476_c2_7f06] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1476_c2_7f06] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_7f06_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_7f06_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1507_c7_8f12] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1507_c7_8f12_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_8f12_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1507_c7_8f12_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_8f12_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1507_c7_8f12_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_8f12_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_8f12_return_output := result_u8_value_MUX_uxn_opcodes_h_l1507_c7_8f12_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1499_c22_38b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_bb7e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_8f12_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_bb7e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_bb7e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_8f12_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_bb7e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_8f12_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_bb7e_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_bb7e_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_8f12_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1497_c7_8ff8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output := result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output;

     -- t8_MUX[uxn_opcodes_h_l1489_c7_9b49] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1489_c7_9b49_cond <= VAR_t8_MUX_uxn_opcodes_h_l1489_c7_9b49_cond;
     t8_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue;
     t8_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output := t8_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1497_c7_8ff8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1501_c7_bb7e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_bb7e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_bb7e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_bb7e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_bb7e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_bb7e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_bb7e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_bb7e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_bb7e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1501_c7_bb7e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1501_c7_bb7e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_bb7e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1501_c7_bb7e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_bb7e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1501_c7_bb7e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_bb7e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_bb7e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1501_c7_bb7e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1492_c7_f6b8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1501_c7_bb7e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_bb7e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_bb7e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_bb7e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_bb7e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_bb7e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_bb7e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_bb7e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_bb7e_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1497_c7_8ff8] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output := tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1501_c7_bb7e] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1501_c7_bb7e_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_bb7e_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1501_c7_bb7e_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_bb7e_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1501_c7_bb7e_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_bb7e_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_bb7e_return_output := tmp8_low_MUX_uxn_opcodes_h_l1501_c7_bb7e_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_bb7e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_bb7e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_bb7e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_bb7e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1497_c7_8ff8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1497_c7_8ff8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1492_c7_f6b8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1497_c7_8ff8] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output := tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1489_c7_9b49] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_9b49_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_9b49_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1492_c7_f6b8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output := result_u16_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1492_c7_f6b8] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output := tmp8_high_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output;

     -- t8_MUX[uxn_opcodes_h_l1476_c2_7f06] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1476_c2_7f06_cond <= VAR_t8_MUX_uxn_opcodes_h_l1476_c2_7f06_cond;
     t8_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue;
     t8_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output := t8_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1497_c7_8ff8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ff8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ff8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ff8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_8ff8_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1492_c7_f6b8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1489_c7_9b49] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1489_c7_9b49_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_9b49_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output := tmp8_high_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1489_c7_9b49] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_9b49_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_9b49_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1492_c7_f6b8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1489_c7_9b49] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1489_c7_9b49_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_9b49_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output := result_u16_value_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1492_c7_f6b8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1476_c2_7f06] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_7f06_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_7f06_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1492_c7_f6b8] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_f6b8_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_f6b8_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_f6b8_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output := tmp8_low_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_f6b8_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1476_c2_7f06] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_7f06_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_7f06_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1489_c7_9b49] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1489_c7_9b49_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_9b49_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output := result_u8_value_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1489_c7_9b49] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1489_c7_9b49_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_9b49_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output := tmp8_low_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1489_c7_9b49] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_9b49_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_9b49_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1489_c7_9b49] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_9b49_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_9b49_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_9b49_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_9b49_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1476_c2_7f06] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1476_c2_7f06_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_7f06_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output := result_u16_value_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1476_c2_7f06] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1476_c2_7f06_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_7f06_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output := tmp8_high_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_9b49_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1476_c2_7f06] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_7f06_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_7f06_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1476_c2_7f06] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1476_c2_7f06_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_7f06_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output := tmp8_low_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1476_c2_7f06] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1476_c2_7f06_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_7f06_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output := result_u8_value_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1476_c2_7f06] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_7f06_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_7f06_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_7f06_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_7f06_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output;

     -- Submodule level 7
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1899_uxn_opcodes_h_l1514_l1472_DUPLICATE_d0a4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1899_uxn_opcodes_h_l1514_l1472_DUPLICATE_d0a4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1899(
     result,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_7f06_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1899_uxn_opcodes_h_l1514_l1472_DUPLICATE_d0a4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1899_uxn_opcodes_h_l1514_l1472_DUPLICATE_d0a4_return_output;
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
