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
-- BIN_OP_EQ[uxn_opcodes_h_l1476_c6_2f99]
signal BIN_OP_EQ_uxn_opcodes_h_l1476_c6_2f99_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1476_c6_2f99_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1476_c6_2f99_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1476_c2_4395]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_4395_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_4395_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1476_c2_4395]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_4395_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_4395_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1476_c2_4395]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_4395_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_4395_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1476_c2_4395]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_4395_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_4395_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1476_c2_4395]
signal result_u8_value_MUX_uxn_opcodes_h_l1476_c2_4395_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1476_c2_4395_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1476_c2_4395]
signal result_u16_value_MUX_uxn_opcodes_h_l1476_c2_4395_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1476_c2_4395_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1476_c2_4395]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_4395_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_4395_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1476_c2_4395]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_4395_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_4395_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1476_c2_4395]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_4395_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_4395_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1476_c2_4395]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_4395_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_4395_return_output : unsigned(3 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1476_c2_4395]
signal tmp8_low_MUX_uxn_opcodes_h_l1476_c2_4395_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1476_c2_4395_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1476_c2_4395]
signal tmp8_high_MUX_uxn_opcodes_h_l1476_c2_4395_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1476_c2_4395_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1476_c2_4395]
signal t8_MUX_uxn_opcodes_h_l1476_c2_4395_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1476_c2_4395_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1489_c11_1dd0]
signal BIN_OP_EQ_uxn_opcodes_h_l1489_c11_1dd0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1489_c11_1dd0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1489_c11_1dd0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1489_c7_4c2d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1489_c7_4c2d]
signal result_u16_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1489_c7_4c2d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1489_c7_4c2d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1489_c7_4c2d]
signal result_u8_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1489_c7_4c2d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output : unsigned(3 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1489_c7_4c2d]
signal tmp8_low_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1489_c7_4c2d]
signal tmp8_high_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1489_c7_4c2d]
signal t8_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1492_c11_340c]
signal BIN_OP_EQ_uxn_opcodes_h_l1492_c11_340c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1492_c11_340c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1492_c11_340c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1492_c7_651b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_651b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_651b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1492_c7_651b]
signal result_u16_value_MUX_uxn_opcodes_h_l1492_c7_651b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1492_c7_651b_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1492_c7_651b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_651b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_651b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1492_c7_651b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_651b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_651b_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1492_c7_651b]
signal result_u8_value_MUX_uxn_opcodes_h_l1492_c7_651b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1492_c7_651b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1492_c7_651b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_651b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_651b_return_output : unsigned(3 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1492_c7_651b]
signal tmp8_low_MUX_uxn_opcodes_h_l1492_c7_651b_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1492_c7_651b_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1492_c7_651b]
signal tmp8_high_MUX_uxn_opcodes_h_l1492_c7_651b_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1492_c7_651b_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1492_c7_651b]
signal t8_MUX_uxn_opcodes_h_l1492_c7_651b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1492_c7_651b_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1494_c30_7f39]
signal sp_relative_shift_uxn_opcodes_h_l1494_c30_7f39_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1494_c30_7f39_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1494_c30_7f39_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1494_c30_7f39_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1497_c11_6605]
signal BIN_OP_EQ_uxn_opcodes_h_l1497_c11_6605_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1497_c11_6605_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1497_c11_6605_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1497_c7_ab67]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_ab67_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1497_c7_ab67]
signal result_u16_value_MUX_uxn_opcodes_h_l1497_c7_ab67_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1497_c7_ab67]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_ab67_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1497_c7_ab67]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_ab67_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1497_c7_ab67]
signal result_u8_value_MUX_uxn_opcodes_h_l1497_c7_ab67_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1497_c7_ab67]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_ab67_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output : unsigned(3 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1497_c7_ab67]
signal tmp8_low_MUX_uxn_opcodes_h_l1497_c7_ab67_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1497_c7_ab67]
signal tmp8_high_MUX_uxn_opcodes_h_l1497_c7_ab67_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1499_c33_1a29]
signal BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_1a29_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_1a29_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_1a29_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1501_c11_1194]
signal BIN_OP_EQ_uxn_opcodes_h_l1501_c11_1194_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1501_c11_1194_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1501_c11_1194_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1501_c7_c82b]
signal result_u8_value_MUX_uxn_opcodes_h_l1501_c7_c82b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1501_c7_c82b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1501_c7_c82b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1501_c7_c82b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1501_c7_c82b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_c82b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_c82b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_c82b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_c82b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1501_c7_c82b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_c82b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_c82b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_c82b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_c82b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1501_c7_c82b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_c82b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_c82b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_c82b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_c82b_return_output : unsigned(3 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1501_c7_c82b]
signal tmp8_low_MUX_uxn_opcodes_h_l1501_c7_c82b_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1501_c7_c82b_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1501_c7_c82b_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1501_c7_c82b_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1501_c7_c82b]
signal tmp8_high_MUX_uxn_opcodes_h_l1501_c7_c82b_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1501_c7_c82b_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1501_c7_c82b_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1501_c7_c82b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1507_c11_352f]
signal BIN_OP_EQ_uxn_opcodes_h_l1507_c11_352f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1507_c11_352f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1507_c11_352f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1507_c7_6dc2]
signal result_u8_value_MUX_uxn_opcodes_h_l1507_c7_6dc2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1507_c7_6dc2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1507_c7_6dc2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1507_c7_6dc2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1507_c7_6dc2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_6dc2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_6dc2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_6dc2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_6dc2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1507_c7_6dc2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_6dc2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_6dc2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_6dc2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_6dc2_return_output : unsigned(3 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1507_c7_6dc2]
signal tmp8_low_MUX_uxn_opcodes_h_l1507_c7_6dc2_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1507_c7_6dc2_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1507_c7_6dc2_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1507_c7_6dc2_return_output : unsigned(7 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_6145( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_ram_write := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.u16_value := ref_toks_6;
      base.is_stack_index_flipped := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.is_opc_done := ref_toks_9;
      base.stack_address_sp_offset := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1476_c6_2f99
BIN_OP_EQ_uxn_opcodes_h_l1476_c6_2f99 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1476_c6_2f99_left,
BIN_OP_EQ_uxn_opcodes_h_l1476_c6_2f99_right,
BIN_OP_EQ_uxn_opcodes_h_l1476_c6_2f99_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_4395
result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_4395 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_4395_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_4395_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_4395
result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_4395 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_4395_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_4395_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_4395
result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_4395 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_4395_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_4395_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_4395
result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_4395 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_4395_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_4395_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1476_c2_4395
result_u8_value_MUX_uxn_opcodes_h_l1476_c2_4395 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1476_c2_4395_cond,
result_u8_value_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1476_c2_4395_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1476_c2_4395
result_u16_value_MUX_uxn_opcodes_h_l1476_c2_4395 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1476_c2_4395_cond,
result_u16_value_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1476_c2_4395_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_4395
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_4395 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_4395_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_4395_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_4395
result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_4395 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_4395_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_4395_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_4395
result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_4395 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_4395_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_4395_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_4395
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_4395 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_4395_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_4395_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1476_c2_4395
tmp8_low_MUX_uxn_opcodes_h_l1476_c2_4395 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1476_c2_4395_cond,
tmp8_low_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1476_c2_4395_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1476_c2_4395
tmp8_high_MUX_uxn_opcodes_h_l1476_c2_4395 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1476_c2_4395_cond,
tmp8_high_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1476_c2_4395_return_output);

-- t8_MUX_uxn_opcodes_h_l1476_c2_4395
t8_MUX_uxn_opcodes_h_l1476_c2_4395 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1476_c2_4395_cond,
t8_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue,
t8_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse,
t8_MUX_uxn_opcodes_h_l1476_c2_4395_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1489_c11_1dd0
BIN_OP_EQ_uxn_opcodes_h_l1489_c11_1dd0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1489_c11_1dd0_left,
BIN_OP_EQ_uxn_opcodes_h_l1489_c11_1dd0_right,
BIN_OP_EQ_uxn_opcodes_h_l1489_c11_1dd0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_4c2d
result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_4c2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1489_c7_4c2d
result_u16_value_MUX_uxn_opcodes_h_l1489_c7_4c2d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond,
result_u16_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_4c2d
result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_4c2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_4c2d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_4c2d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1489_c7_4c2d
result_u8_value_MUX_uxn_opcodes_h_l1489_c7_4c2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_4c2d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_4c2d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1489_c7_4c2d
tmp8_low_MUX_uxn_opcodes_h_l1489_c7_4c2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond,
tmp8_low_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1489_c7_4c2d
tmp8_high_MUX_uxn_opcodes_h_l1489_c7_4c2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond,
tmp8_high_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output);

-- t8_MUX_uxn_opcodes_h_l1489_c7_4c2d
t8_MUX_uxn_opcodes_h_l1489_c7_4c2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond,
t8_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue,
t8_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse,
t8_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1492_c11_340c
BIN_OP_EQ_uxn_opcodes_h_l1492_c11_340c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1492_c11_340c_left,
BIN_OP_EQ_uxn_opcodes_h_l1492_c11_340c_right,
BIN_OP_EQ_uxn_opcodes_h_l1492_c11_340c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_651b
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_651b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_651b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_651b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1492_c7_651b
result_u16_value_MUX_uxn_opcodes_h_l1492_c7_651b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1492_c7_651b_cond,
result_u16_value_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1492_c7_651b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_651b
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_651b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_651b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_651b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_651b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_651b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_651b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_651b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1492_c7_651b
result_u8_value_MUX_uxn_opcodes_h_l1492_c7_651b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1492_c7_651b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1492_c7_651b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_651b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_651b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_651b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_651b_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1492_c7_651b
tmp8_low_MUX_uxn_opcodes_h_l1492_c7_651b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1492_c7_651b_cond,
tmp8_low_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1492_c7_651b_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1492_c7_651b
tmp8_high_MUX_uxn_opcodes_h_l1492_c7_651b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1492_c7_651b_cond,
tmp8_high_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1492_c7_651b_return_output);

-- t8_MUX_uxn_opcodes_h_l1492_c7_651b
t8_MUX_uxn_opcodes_h_l1492_c7_651b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1492_c7_651b_cond,
t8_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue,
t8_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse,
t8_MUX_uxn_opcodes_h_l1492_c7_651b_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1494_c30_7f39
sp_relative_shift_uxn_opcodes_h_l1494_c30_7f39 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1494_c30_7f39_ins,
sp_relative_shift_uxn_opcodes_h_l1494_c30_7f39_x,
sp_relative_shift_uxn_opcodes_h_l1494_c30_7f39_y,
sp_relative_shift_uxn_opcodes_h_l1494_c30_7f39_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1497_c11_6605
BIN_OP_EQ_uxn_opcodes_h_l1497_c11_6605 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1497_c11_6605_left,
BIN_OP_EQ_uxn_opcodes_h_l1497_c11_6605_right,
BIN_OP_EQ_uxn_opcodes_h_l1497_c11_6605_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_ab67
result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_ab67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_ab67_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1497_c7_ab67
result_u16_value_MUX_uxn_opcodes_h_l1497_c7_ab67 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1497_c7_ab67_cond,
result_u16_value_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_ab67
result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_ab67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_ab67_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_ab67
result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_ab67 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_ab67_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1497_c7_ab67
result_u8_value_MUX_uxn_opcodes_h_l1497_c7_ab67 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1497_c7_ab67_cond,
result_u8_value_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_ab67
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_ab67 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_ab67_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1497_c7_ab67
tmp8_low_MUX_uxn_opcodes_h_l1497_c7_ab67 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1497_c7_ab67_cond,
tmp8_low_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1497_c7_ab67
tmp8_high_MUX_uxn_opcodes_h_l1497_c7_ab67 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1497_c7_ab67_cond,
tmp8_high_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_1a29
BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_1a29 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_1a29_left,
BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_1a29_right,
BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_1a29_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1501_c11_1194
BIN_OP_EQ_uxn_opcodes_h_l1501_c11_1194 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1501_c11_1194_left,
BIN_OP_EQ_uxn_opcodes_h_l1501_c11_1194_right,
BIN_OP_EQ_uxn_opcodes_h_l1501_c11_1194_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1501_c7_c82b
result_u8_value_MUX_uxn_opcodes_h_l1501_c7_c82b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1501_c7_c82b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1501_c7_c82b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1501_c7_c82b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1501_c7_c82b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_c82b
result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_c82b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_c82b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_c82b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_c82b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_c82b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_c82b
result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_c82b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_c82b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_c82b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_c82b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_c82b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_c82b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_c82b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_c82b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_c82b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_c82b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_c82b_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1501_c7_c82b
tmp8_low_MUX_uxn_opcodes_h_l1501_c7_c82b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1501_c7_c82b_cond,
tmp8_low_MUX_uxn_opcodes_h_l1501_c7_c82b_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1501_c7_c82b_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1501_c7_c82b_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1501_c7_c82b
tmp8_high_MUX_uxn_opcodes_h_l1501_c7_c82b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1501_c7_c82b_cond,
tmp8_high_MUX_uxn_opcodes_h_l1501_c7_c82b_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1501_c7_c82b_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1501_c7_c82b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1507_c11_352f
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_352f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_352f_left,
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_352f_right,
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_352f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1507_c7_6dc2
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_6dc2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_6dc2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_6dc2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_6dc2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_6dc2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_6dc2
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_6dc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_6dc2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_6dc2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_6dc2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_6dc2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_6dc2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_6dc2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_6dc2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_6dc2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_6dc2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_6dc2_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1507_c7_6dc2
tmp8_low_MUX_uxn_opcodes_h_l1507_c7_6dc2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1507_c7_6dc2_cond,
tmp8_low_MUX_uxn_opcodes_h_l1507_c7_6dc2_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1507_c7_6dc2_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1507_c7_6dc2_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1476_c6_2f99_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_4395_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_4395_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_4395_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_4395_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1476_c2_4395_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1476_c2_4395_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_4395_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_4395_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_4395_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_4395_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1476_c2_4395_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1476_c2_4395_return_output,
 t8_MUX_uxn_opcodes_h_l1476_c2_4395_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1489_c11_1dd0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output,
 t8_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1492_c11_340c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_651b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1492_c7_651b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_651b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_651b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1492_c7_651b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_651b_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1492_c7_651b_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1492_c7_651b_return_output,
 t8_MUX_uxn_opcodes_h_l1492_c7_651b_return_output,
 sp_relative_shift_uxn_opcodes_h_l1494_c30_7f39_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1497_c11_6605_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_1a29_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1501_c11_1194_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1501_c7_c82b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_c82b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_c82b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_c82b_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1501_c7_c82b_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1501_c7_c82b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1507_c11_352f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1507_c7_6dc2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_6dc2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_6dc2_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1507_c7_6dc2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_2f99_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_2f99_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_2f99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1476_c2_4395_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_4395_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_4395_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_4395_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_4395_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1476_c2_4395_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_4395_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_4395_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1476_c2_4395_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_4395_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_4395_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_4395_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_4395_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_4395_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_4395_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1476_c2_4395_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_4395_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_4395_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1481_c3_45d2 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_4395_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_4395_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_4395_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_4395_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1486_c3_5fa6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_4395_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_4395_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_4395_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_4395_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_4395_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_4395_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1476_c2_4395_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1476_c2_4395_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_1dd0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_1dd0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_1dd0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_651b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_651b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_651b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_651b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_651b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1490_c3_68e3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_651b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_651b_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_651b_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1492_c7_651b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_340c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_340c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_340c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_651b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_651b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_651b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_651b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_651b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_651b_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_651b_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_651b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1492_c7_651b_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_7f39_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_7f39_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_7f39_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_7f39_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1495_c22_9051_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_6605_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_6605_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_6605_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_c82b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_ab67_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_ab67_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_c82b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_ab67_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1498_c3_1278 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_ab67_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_c82b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_ab67_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_c82b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_ab67_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_c82b_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_ab67_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_c82b_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_ab67_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_1a29_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_1a29_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_1a29_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1499_c22_97b1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_1194_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_1194_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_1194_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_c82b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_c82b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_6dc2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_c82b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_c82b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_c82b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_c82b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_c82b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_c82b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_6dc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_c82b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_c82b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1504_c3_56c2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_c82b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_6dc2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_c82b_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_c82b_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_c82b_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_6dc2_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_c82b_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_c82b_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_c82b_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_c82b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_352f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_352f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_352f_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_6dc2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_6dc2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_6dc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_6dc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_6dc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_6dc2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_6dc2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1509_c3_abcf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_6dc2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_6dc2_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_6dc2_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_6dc2_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_6dc2_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1492_l1489_l1476_l1507_l1497_DUPLICATE_134c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1476_l1497_l1489_DUPLICATE_2089_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1492_l1489_l1507_l1501_l1497_DUPLICATE_64e3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1492_l1497_l1489_l1501_DUPLICATE_e122_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1497_l1489_DUPLICATE_843b_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1492_l1507_l1497_DUPLICATE_5cb0_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6145_uxn_opcodes_h_l1514_l1472_DUPLICATE_bbda_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_7f39_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_c82b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_6605_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_7f39_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1486_c3_5fa6 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1486_c3_5fa6;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1490_c3_68e3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1490_c3_68e3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_340c_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_352f_right := to_unsigned(5, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1498_c3_1278 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1498_c3_1278;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_1dd0_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_1a29_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_6dc2_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_1194_right := to_unsigned(4, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1481_c3_45d2 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1481_c3_45d2;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1509_c3_abcf := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_6dc2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1509_c3_abcf;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_2f99_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1504_c3_56c2 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_c82b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1504_c3_56c2;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_7f39_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_2f99_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_1dd0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_340c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_6605_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_1194_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_352f_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_c82b_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_6dc2_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_c82b_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_6dc2_iftrue := VAR_previous_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_1a29_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse := t8;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_c82b_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_c82b_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_6dc2_iffalse := tmp8_low;
     -- BIN_OP_EQ[uxn_opcodes_h_l1507_c11_352f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1507_c11_352f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_352f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1507_c11_352f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_352f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_352f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1507_c11_352f_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1499_c33_1a29] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_1a29_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_1a29_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_1a29_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_1a29_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_1a29_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_1a29_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1476_l1497_l1489_DUPLICATE_2089 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1476_l1497_l1489_DUPLICATE_2089_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1501_c11_1194] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1501_c11_1194_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_1194_left;
     BIN_OP_EQ_uxn_opcodes_h_l1501_c11_1194_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_1194_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_1194_return_output := BIN_OP_EQ_uxn_opcodes_h_l1501_c11_1194_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1476_c6_2f99] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1476_c6_2f99_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_2f99_left;
     BIN_OP_EQ_uxn_opcodes_h_l1476_c6_2f99_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_2f99_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_2f99_return_output := BIN_OP_EQ_uxn_opcodes_h_l1476_c6_2f99_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1489_c11_1dd0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1489_c11_1dd0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_1dd0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1489_c11_1dd0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_1dd0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_1dd0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1489_c11_1dd0_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1494_c30_7f39] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1494_c30_7f39_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_7f39_ins;
     sp_relative_shift_uxn_opcodes_h_l1494_c30_7f39_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_7f39_x;
     sp_relative_shift_uxn_opcodes_h_l1494_c30_7f39_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_7f39_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_7f39_return_output := sp_relative_shift_uxn_opcodes_h_l1494_c30_7f39_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1497_l1489_DUPLICATE_843b LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1497_l1489_DUPLICATE_843b_return_output := result.sp_relative_shift;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1476_c2_4395] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1476_c2_4395_return_output := result.is_ram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1476_c2_4395] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1476_c2_4395_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1497_c11_6605] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1497_c11_6605_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_6605_left;
     BIN_OP_EQ_uxn_opcodes_h_l1497_c11_6605_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_6605_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_6605_return_output := BIN_OP_EQ_uxn_opcodes_h_l1497_c11_6605_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1476_c2_4395] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1476_c2_4395_return_output := result.is_vram_write;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1495_c22_9051] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1495_c22_9051_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1492_l1507_l1497_DUPLICATE_5cb0 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1492_l1507_l1497_DUPLICATE_5cb0_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1492_l1489_l1476_l1507_l1497_DUPLICATE_134c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1492_l1489_l1476_l1507_l1497_DUPLICATE_134c_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1492_l1489_l1507_l1501_l1497_DUPLICATE_64e3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1492_l1489_l1507_l1501_l1497_DUPLICATE_64e3_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1492_c11_340c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1492_c11_340c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_340c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1492_c11_340c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_340c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_340c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1492_c11_340c_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1476_c2_4395] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1476_c2_4395_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1492_l1497_l1489_l1501_DUPLICATE_e122 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1492_l1497_l1489_l1501_DUPLICATE_e122_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_4395_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_2f99_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_4395_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_2f99_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_4395_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_2f99_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_4395_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_2f99_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_4395_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_2f99_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_4395_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_2f99_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_4395_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_2f99_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_4395_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_2f99_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_4395_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_2f99_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_4395_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_2f99_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1476_c2_4395_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_2f99_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_4395_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_2f99_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_4395_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_2f99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_1dd0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_1dd0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_1dd0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_1dd0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_1dd0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_1dd0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_1dd0_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_1dd0_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_1dd0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_651b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_340c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_651b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_340c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_651b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_340c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_651b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_340c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_651b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_340c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_651b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_340c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1492_c7_651b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_340c_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_651b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_340c_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_651b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_340c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_ab67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_6605_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_ab67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_6605_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_ab67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_6605_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_ab67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_6605_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_ab67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_6605_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_ab67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_6605_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_ab67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_6605_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_ab67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_6605_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_c82b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_1194_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_c82b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_1194_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_c82b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_1194_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_c82b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_1194_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_c82b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_1194_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_c82b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_1194_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_6dc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_352f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_6dc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_352f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_6dc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_352f_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_6dc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_352f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1495_c22_9051_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1497_l1489_DUPLICATE_843b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1497_l1489_DUPLICATE_843b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1476_l1497_l1489_DUPLICATE_2089_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1476_l1497_l1489_DUPLICATE_2089_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1476_l1497_l1489_DUPLICATE_2089_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1492_l1489_l1507_l1501_l1497_DUPLICATE_64e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1492_l1489_l1507_l1501_l1497_DUPLICATE_64e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1492_l1489_l1507_l1501_l1497_DUPLICATE_64e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_c82b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1492_l1489_l1507_l1501_l1497_DUPLICATE_64e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_6dc2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1492_l1489_l1507_l1501_l1497_DUPLICATE_64e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1492_l1497_l1489_l1501_DUPLICATE_e122_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1492_l1497_l1489_l1501_DUPLICATE_e122_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1492_l1497_l1489_l1501_DUPLICATE_e122_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_c82b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1492_l1497_l1489_l1501_DUPLICATE_e122_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1492_l1507_l1497_DUPLICATE_5cb0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1492_l1507_l1497_DUPLICATE_5cb0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_6dc2_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1492_l1507_l1497_DUPLICATE_5cb0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1492_l1489_l1476_l1507_l1497_DUPLICATE_134c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1492_l1489_l1476_l1507_l1497_DUPLICATE_134c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1492_l1489_l1476_l1507_l1497_DUPLICATE_134c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1492_l1489_l1476_l1507_l1497_DUPLICATE_134c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_6dc2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1492_l1489_l1476_l1507_l1497_DUPLICATE_134c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1476_c2_4395_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1476_c2_4395_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1476_c2_4395_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1476_c2_4395_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_7f39_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1476_c2_4395] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_4395_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_4395_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_4395_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_4395_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1507_c7_6dc2] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1507_c7_6dc2_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_6dc2_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1507_c7_6dc2_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_6dc2_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1507_c7_6dc2_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_6dc2_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_6dc2_return_output := tmp8_low_MUX_uxn_opcodes_h_l1507_c7_6dc2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1507_c7_6dc2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1507_c7_6dc2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_6dc2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1507_c7_6dc2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_6dc2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1507_c7_6dc2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_6dc2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_6dc2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1507_c7_6dc2_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1501_c7_c82b] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1501_c7_c82b_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_c82b_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1501_c7_c82b_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_c82b_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1501_c7_c82b_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_c82b_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_c82b_return_output := tmp8_high_MUX_uxn_opcodes_h_l1501_c7_c82b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1497_c7_ab67] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_ab67_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_ab67_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1507_c7_6dc2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_6dc2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_6dc2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_6dc2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_6dc2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_6dc2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_6dc2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_6dc2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_6dc2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1476_c2_4395] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_4395_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_4395_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_4395_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_4395_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1476_c2_4395] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_4395_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_4395_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_4395_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_4395_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1507_c7_6dc2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_6dc2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_6dc2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_6dc2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_6dc2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_6dc2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_6dc2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_6dc2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_6dc2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1501_c7_c82b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_c82b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_c82b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_c82b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_c82b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_c82b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_c82b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_c82b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_c82b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1476_c2_4395] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_4395_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_4395_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_4395_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_4395_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1499_c22_97b1] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1499_c22_97b1_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_1a29_return_output);

     -- t8_MUX[uxn_opcodes_h_l1492_c7_651b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1492_c7_651b_cond <= VAR_t8_MUX_uxn_opcodes_h_l1492_c7_651b_cond;
     t8_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue;
     t8_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1492_c7_651b_return_output := t8_MUX_uxn_opcodes_h_l1492_c7_651b_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1499_c22_97b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_c82b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_6dc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_c82b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_c82b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_6dc2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_c82b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_6dc2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1492_c7_651b_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_c82b_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_c82b_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_6dc2_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1497_c7_ab67] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_ab67_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_ab67_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1501_c7_c82b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1501_c7_c82b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_c82b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1501_c7_c82b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_c82b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1501_c7_c82b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_c82b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_c82b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1501_c7_c82b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1492_c7_651b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_651b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_651b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_651b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_651b_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1497_c7_ab67] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1497_c7_ab67_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_ab67_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output := tmp8_high_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1501_c7_c82b] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1501_c7_c82b_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_c82b_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1501_c7_c82b_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_c82b_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1501_c7_c82b_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_c82b_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_c82b_return_output := tmp8_low_MUX_uxn_opcodes_h_l1501_c7_c82b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1497_c7_ab67] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1497_c7_ab67_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_ab67_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output := result_u16_value_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1501_c7_c82b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_c82b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_c82b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_c82b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_c82b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_c82b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_c82b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_c82b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_c82b_return_output;

     -- t8_MUX[uxn_opcodes_h_l1489_c7_4c2d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond <= VAR_t8_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond;
     t8_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue;
     t8_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output := t8_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1501_c7_c82b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_c82b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_c82b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_c82b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_c82b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_c82b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_c82b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_c82b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_c82b_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_c82b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_651b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_c82b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_c82b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_c82b_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1492_c7_651b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1492_c7_651b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_651b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_651b_return_output := result_u16_value_MUX_uxn_opcodes_h_l1492_c7_651b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1497_c7_ab67] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_ab67_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_ab67_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1497_c7_ab67] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1497_c7_ab67_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_ab67_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output := tmp8_low_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output;

     -- t8_MUX[uxn_opcodes_h_l1476_c2_4395] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1476_c2_4395_cond <= VAR_t8_MUX_uxn_opcodes_h_l1476_c2_4395_cond;
     t8_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue;
     t8_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1476_c2_4395_return_output := t8_MUX_uxn_opcodes_h_l1476_c2_4395_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1492_c7_651b] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1492_c7_651b_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_651b_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_651b_return_output := tmp8_high_MUX_uxn_opcodes_h_l1492_c7_651b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1497_c7_ab67] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1497_c7_ab67_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_ab67_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output := result_u8_value_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1497_c7_ab67] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_ab67_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_ab67_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_ab67_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_ab67_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1492_c7_651b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_651b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_651b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_651b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_651b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1489_c7_4c2d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_651b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_651b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1476_c2_4395_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_651b_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_ab67_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1489_c7_4c2d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output := result_u16_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1489_c7_4c2d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1492_c7_651b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_651b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_651b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_651b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_651b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1476_c2_4395] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_4395_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_4395_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_4395_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_4395_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1492_c7_651b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_651b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_651b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_651b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_651b_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1492_c7_651b] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1492_c7_651b_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_651b_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_651b_return_output := tmp8_low_MUX_uxn_opcodes_h_l1492_c7_651b_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1489_c7_4c2d] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output := tmp8_high_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1492_c7_651b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1492_c7_651b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_651b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_651b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_651b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_651b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1492_c7_651b_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_651b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_651b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_651b_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_651b_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1489_c7_4c2d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1476_c2_4395] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1476_c2_4395_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_4395_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_4395_return_output := tmp8_high_MUX_uxn_opcodes_h_l1476_c2_4395_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1476_c2_4395] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1476_c2_4395_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_4395_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_4395_return_output := result_u16_value_MUX_uxn_opcodes_h_l1476_c2_4395_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1489_c7_4c2d] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output := tmp8_low_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1476_c2_4395] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_4395_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_4395_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_4395_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_4395_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1489_c7_4c2d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1489_c7_4c2d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_4395_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_4c2d_return_output;
     -- tmp8_low_MUX[uxn_opcodes_h_l1476_c2_4395] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1476_c2_4395_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_4395_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_4395_return_output := tmp8_low_MUX_uxn_opcodes_h_l1476_c2_4395_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1476_c2_4395] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_4395_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_4395_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_4395_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_4395_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1476_c2_4395] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1476_c2_4395_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_4395_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_4395_return_output := result_u8_value_MUX_uxn_opcodes_h_l1476_c2_4395_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1476_c2_4395] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_4395_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_4395_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_4395_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_4395_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_4395_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_4395_return_output;

     -- Submodule level 7
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_4395_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6145_uxn_opcodes_h_l1514_l1472_DUPLICATE_bbda LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6145_uxn_opcodes_h_l1514_l1472_DUPLICATE_bbda_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6145(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_4395_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_4395_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_4395_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_4395_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_4395_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_4395_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_4395_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_4395_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_4395_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_4395_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6145_uxn_opcodes_h_l1514_l1472_DUPLICATE_bbda_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6145_uxn_opcodes_h_l1514_l1472_DUPLICATE_bbda_return_output;
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
