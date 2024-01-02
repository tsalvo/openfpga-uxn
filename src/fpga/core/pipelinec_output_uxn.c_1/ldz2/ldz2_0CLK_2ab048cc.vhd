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
-- BIN_OP_EQ[uxn_opcodes_h_l1476_c6_81b9]
signal BIN_OP_EQ_uxn_opcodes_h_l1476_c6_81b9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1476_c6_81b9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1476_c6_81b9_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1476_c2_96b9]
signal t8_MUX_uxn_opcodes_h_l1476_c2_96b9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1476_c2_96b9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_96b9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1476_c2_96b9]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1476_c2_96b9]
signal result_u16_value_MUX_uxn_opcodes_h_l1476_c2_96b9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1476_c2_96b9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_96b9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1476_c2_96b9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_96b9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1476_c2_96b9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_96b9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1476_c2_96b9]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_96b9_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1476_c2_96b9]
signal result_u8_value_MUX_uxn_opcodes_h_l1476_c2_96b9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1476_c2_96b9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_96b9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1476_c2_96b9]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1476_c2_96b9]
signal tmp8_high_MUX_uxn_opcodes_h_l1476_c2_96b9_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1476_c2_96b9]
signal tmp8_low_MUX_uxn_opcodes_h_l1476_c2_96b9_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1489_c11_f88f]
signal BIN_OP_EQ_uxn_opcodes_h_l1489_c11_f88f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1489_c11_f88f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1489_c11_f88f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1489_c7_30ce]
signal t8_MUX_uxn_opcodes_h_l1489_c7_30ce_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1489_c7_30ce]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_30ce_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1489_c7_30ce]
signal result_u16_value_MUX_uxn_opcodes_h_l1489_c7_30ce_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1489_c7_30ce]
signal result_u8_value_MUX_uxn_opcodes_h_l1489_c7_30ce_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1489_c7_30ce]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_30ce_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1489_c7_30ce]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_30ce_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1489_c7_30ce]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_30ce_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output : unsigned(3 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1489_c7_30ce]
signal tmp8_high_MUX_uxn_opcodes_h_l1489_c7_30ce_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1489_c7_30ce]
signal tmp8_low_MUX_uxn_opcodes_h_l1489_c7_30ce_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1492_c11_dfde]
signal BIN_OP_EQ_uxn_opcodes_h_l1492_c11_dfde_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1492_c11_dfde_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1492_c11_dfde_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1492_c7_8098]
signal t8_MUX_uxn_opcodes_h_l1492_c7_8098_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1492_c7_8098_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1492_c7_8098]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_8098_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_8098_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1492_c7_8098]
signal result_u16_value_MUX_uxn_opcodes_h_l1492_c7_8098_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1492_c7_8098_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1492_c7_8098]
signal result_u8_value_MUX_uxn_opcodes_h_l1492_c7_8098_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1492_c7_8098_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1492_c7_8098]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_8098_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_8098_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1492_c7_8098]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_8098_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_8098_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1492_c7_8098]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_8098_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_8098_return_output : unsigned(3 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1492_c7_8098]
signal tmp8_high_MUX_uxn_opcodes_h_l1492_c7_8098_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1492_c7_8098_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1492_c7_8098]
signal tmp8_low_MUX_uxn_opcodes_h_l1492_c7_8098_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1492_c7_8098_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1494_c30_c4ff]
signal sp_relative_shift_uxn_opcodes_h_l1494_c30_c4ff_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1494_c30_c4ff_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1494_c30_c4ff_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1494_c30_c4ff_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1497_c11_56ca]
signal BIN_OP_EQ_uxn_opcodes_h_l1497_c11_56ca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1497_c11_56ca_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1497_c11_56ca_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1497_c7_31d0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_31d0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1497_c7_31d0]
signal result_u16_value_MUX_uxn_opcodes_h_l1497_c7_31d0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1497_c7_31d0]
signal result_u8_value_MUX_uxn_opcodes_h_l1497_c7_31d0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1497_c7_31d0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_31d0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1497_c7_31d0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_31d0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1497_c7_31d0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_31d0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output : unsigned(3 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1497_c7_31d0]
signal tmp8_high_MUX_uxn_opcodes_h_l1497_c7_31d0_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1497_c7_31d0]
signal tmp8_low_MUX_uxn_opcodes_h_l1497_c7_31d0_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1499_c33_36c8]
signal BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_36c8_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_36c8_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_36c8_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1501_c11_219a]
signal BIN_OP_EQ_uxn_opcodes_h_l1501_c11_219a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1501_c11_219a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1501_c11_219a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1501_c7_7119]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_7119_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_7119_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_7119_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_7119_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1501_c7_7119]
signal result_u8_value_MUX_uxn_opcodes_h_l1501_c7_7119_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1501_c7_7119_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1501_c7_7119_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1501_c7_7119_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1501_c7_7119]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_7119_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_7119_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_7119_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_7119_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1501_c7_7119]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_7119_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_7119_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_7119_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_7119_return_output : unsigned(3 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1501_c7_7119]
signal tmp8_high_MUX_uxn_opcodes_h_l1501_c7_7119_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1501_c7_7119_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1501_c7_7119_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1501_c7_7119_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1501_c7_7119]
signal tmp8_low_MUX_uxn_opcodes_h_l1501_c7_7119_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1501_c7_7119_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1501_c7_7119_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1501_c7_7119_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1507_c11_5c6b]
signal BIN_OP_EQ_uxn_opcodes_h_l1507_c11_5c6b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1507_c11_5c6b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1507_c11_5c6b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1507_c7_360d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_360d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_360d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_360d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_360d_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1507_c7_360d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_360d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_360d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_360d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_360d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1507_c7_360d]
signal result_u8_value_MUX_uxn_opcodes_h_l1507_c7_360d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1507_c7_360d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1507_c7_360d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1507_c7_360d_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1507_c7_360d]
signal tmp8_low_MUX_uxn_opcodes_h_l1507_c7_360d_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1507_c7_360d_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1507_c7_360d_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1507_c7_360d_return_output : unsigned(7 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_c942( ref_toks_0 : opcode_result_t;
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
      base.is_ram_write := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_stack_index_flipped := ref_toks_7;
      base.u8_value := ref_toks_8;
      base.is_pc_updated := ref_toks_9;
      base.is_vram_write := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1476_c6_81b9
BIN_OP_EQ_uxn_opcodes_h_l1476_c6_81b9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1476_c6_81b9_left,
BIN_OP_EQ_uxn_opcodes_h_l1476_c6_81b9_right,
BIN_OP_EQ_uxn_opcodes_h_l1476_c6_81b9_return_output);

-- t8_MUX_uxn_opcodes_h_l1476_c2_96b9
t8_MUX_uxn_opcodes_h_l1476_c2_96b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1476_c2_96b9_cond,
t8_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue,
t8_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse,
t8_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_96b9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_96b9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_96b9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_96b9
result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_96b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1476_c2_96b9
result_u16_value_MUX_uxn_opcodes_h_l1476_c2_96b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1476_c2_96b9_cond,
result_u16_value_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_96b9
result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_96b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_96b9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_96b9
result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_96b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_96b9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_96b9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_96b9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_96b9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_96b9
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_96b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_96b9_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1476_c2_96b9
result_u8_value_MUX_uxn_opcodes_h_l1476_c2_96b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1476_c2_96b9_cond,
result_u8_value_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_96b9
result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_96b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_96b9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_96b9
result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_96b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1476_c2_96b9
tmp8_high_MUX_uxn_opcodes_h_l1476_c2_96b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1476_c2_96b9_cond,
tmp8_high_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1476_c2_96b9
tmp8_low_MUX_uxn_opcodes_h_l1476_c2_96b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1476_c2_96b9_cond,
tmp8_low_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1489_c11_f88f
BIN_OP_EQ_uxn_opcodes_h_l1489_c11_f88f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1489_c11_f88f_left,
BIN_OP_EQ_uxn_opcodes_h_l1489_c11_f88f_right,
BIN_OP_EQ_uxn_opcodes_h_l1489_c11_f88f_return_output);

-- t8_MUX_uxn_opcodes_h_l1489_c7_30ce
t8_MUX_uxn_opcodes_h_l1489_c7_30ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1489_c7_30ce_cond,
t8_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue,
t8_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse,
t8_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_30ce
result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_30ce : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_30ce_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1489_c7_30ce
result_u16_value_MUX_uxn_opcodes_h_l1489_c7_30ce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1489_c7_30ce_cond,
result_u16_value_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1489_c7_30ce
result_u8_value_MUX_uxn_opcodes_h_l1489_c7_30ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1489_c7_30ce_cond,
result_u8_value_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_30ce
result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_30ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_30ce_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_30ce
result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_30ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_30ce_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_30ce
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_30ce : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_30ce_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1489_c7_30ce
tmp8_high_MUX_uxn_opcodes_h_l1489_c7_30ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1489_c7_30ce_cond,
tmp8_high_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1489_c7_30ce
tmp8_low_MUX_uxn_opcodes_h_l1489_c7_30ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1489_c7_30ce_cond,
tmp8_low_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1492_c11_dfde
BIN_OP_EQ_uxn_opcodes_h_l1492_c11_dfde : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1492_c11_dfde_left,
BIN_OP_EQ_uxn_opcodes_h_l1492_c11_dfde_right,
BIN_OP_EQ_uxn_opcodes_h_l1492_c11_dfde_return_output);

-- t8_MUX_uxn_opcodes_h_l1492_c7_8098
t8_MUX_uxn_opcodes_h_l1492_c7_8098 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1492_c7_8098_cond,
t8_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue,
t8_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse,
t8_MUX_uxn_opcodes_h_l1492_c7_8098_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_8098
result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_8098 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_8098_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_8098_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1492_c7_8098
result_u16_value_MUX_uxn_opcodes_h_l1492_c7_8098 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1492_c7_8098_cond,
result_u16_value_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1492_c7_8098_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1492_c7_8098
result_u8_value_MUX_uxn_opcodes_h_l1492_c7_8098 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1492_c7_8098_cond,
result_u8_value_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1492_c7_8098_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_8098
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_8098 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_8098_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_8098_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_8098
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_8098 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_8098_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_8098_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_8098
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_8098 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_8098_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_8098_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1492_c7_8098
tmp8_high_MUX_uxn_opcodes_h_l1492_c7_8098 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1492_c7_8098_cond,
tmp8_high_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1492_c7_8098_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1492_c7_8098
tmp8_low_MUX_uxn_opcodes_h_l1492_c7_8098 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1492_c7_8098_cond,
tmp8_low_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1492_c7_8098_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1494_c30_c4ff
sp_relative_shift_uxn_opcodes_h_l1494_c30_c4ff : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1494_c30_c4ff_ins,
sp_relative_shift_uxn_opcodes_h_l1494_c30_c4ff_x,
sp_relative_shift_uxn_opcodes_h_l1494_c30_c4ff_y,
sp_relative_shift_uxn_opcodes_h_l1494_c30_c4ff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1497_c11_56ca
BIN_OP_EQ_uxn_opcodes_h_l1497_c11_56ca : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1497_c11_56ca_left,
BIN_OP_EQ_uxn_opcodes_h_l1497_c11_56ca_right,
BIN_OP_EQ_uxn_opcodes_h_l1497_c11_56ca_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_31d0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_31d0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_31d0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1497_c7_31d0
result_u16_value_MUX_uxn_opcodes_h_l1497_c7_31d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1497_c7_31d0_cond,
result_u16_value_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1497_c7_31d0
result_u8_value_MUX_uxn_opcodes_h_l1497_c7_31d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1497_c7_31d0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_31d0
result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_31d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_31d0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_31d0
result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_31d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_31d0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_31d0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_31d0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_31d0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1497_c7_31d0
tmp8_high_MUX_uxn_opcodes_h_l1497_c7_31d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1497_c7_31d0_cond,
tmp8_high_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1497_c7_31d0
tmp8_low_MUX_uxn_opcodes_h_l1497_c7_31d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1497_c7_31d0_cond,
tmp8_low_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_36c8
BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_36c8 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_36c8_left,
BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_36c8_right,
BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_36c8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1501_c11_219a
BIN_OP_EQ_uxn_opcodes_h_l1501_c11_219a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1501_c11_219a_left,
BIN_OP_EQ_uxn_opcodes_h_l1501_c11_219a_right,
BIN_OP_EQ_uxn_opcodes_h_l1501_c11_219a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_7119
result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_7119 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_7119_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_7119_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_7119_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_7119_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1501_c7_7119
result_u8_value_MUX_uxn_opcodes_h_l1501_c7_7119 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1501_c7_7119_cond,
result_u8_value_MUX_uxn_opcodes_h_l1501_c7_7119_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1501_c7_7119_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1501_c7_7119_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_7119
result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_7119 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_7119_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_7119_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_7119_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_7119_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_7119
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_7119 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_7119_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_7119_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_7119_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_7119_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1501_c7_7119
tmp8_high_MUX_uxn_opcodes_h_l1501_c7_7119 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1501_c7_7119_cond,
tmp8_high_MUX_uxn_opcodes_h_l1501_c7_7119_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1501_c7_7119_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1501_c7_7119_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1501_c7_7119
tmp8_low_MUX_uxn_opcodes_h_l1501_c7_7119 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1501_c7_7119_cond,
tmp8_low_MUX_uxn_opcodes_h_l1501_c7_7119_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1501_c7_7119_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1501_c7_7119_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1507_c11_5c6b
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_5c6b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_5c6b_left,
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_5c6b_right,
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_5c6b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_360d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_360d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_360d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_360d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_360d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_360d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_360d
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_360d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_360d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_360d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_360d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_360d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1507_c7_360d
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_360d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_360d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_360d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_360d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_360d_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1507_c7_360d
tmp8_low_MUX_uxn_opcodes_h_l1507_c7_360d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1507_c7_360d_cond,
tmp8_low_MUX_uxn_opcodes_h_l1507_c7_360d_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1507_c7_360d_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1507_c7_360d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1476_c6_81b9_return_output,
 t8_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1489_c11_f88f_return_output,
 t8_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1492_c11_dfde_return_output,
 t8_MUX_uxn_opcodes_h_l1492_c7_8098_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_8098_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1492_c7_8098_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1492_c7_8098_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_8098_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_8098_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_8098_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1492_c7_8098_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1492_c7_8098_return_output,
 sp_relative_shift_uxn_opcodes_h_l1494_c30_c4ff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1497_c11_56ca_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_36c8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1501_c11_219a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_7119_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1501_c7_7119_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_7119_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_7119_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1501_c7_7119_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1501_c7_7119_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1507_c11_5c6b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_360d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_360d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1507_c7_360d_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1507_c7_360d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_81b9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_81b9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_81b9_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1476_c2_96b9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1481_c3_6abe : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_96b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1476_c2_96b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_96b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_96b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_96b9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1486_c3_b1a9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_96b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1476_c2_96b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_96b9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_96b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1476_c2_96b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_96b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1476_c2_96b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_96b9_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_96b9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_f88f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_f88f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_f88f_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1492_c7_8098_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1489_c7_30ce_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_8098_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_30ce_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_8098_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_30ce_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_8098_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_30ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_8098_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_30ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_8098_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_30ce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1490_c3_442d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_8098_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_30ce_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_8098_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_30ce_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_8098_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_30ce_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_dfde_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_dfde_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_dfde_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1492_c7_8098_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_8098_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_8098_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_8098_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_8098_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_8098_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_8098_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_8098_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_8098_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_c4ff_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_c4ff_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_c4ff_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_c4ff_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1495_c22_6cde_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_56ca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_56ca_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_56ca_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1498_c3_1100 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_31d0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_31d0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_7119_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_31d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_7119_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_31d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_7119_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_31d0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_7119_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_31d0_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_7119_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_31d0_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_7119_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_31d0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_36c8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_36c8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_36c8_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1499_c22_87f1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_219a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_219a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_219a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_7119_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_7119_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_360d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_7119_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_7119_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_7119_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_360d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_7119_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_7119_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_7119_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_7119_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_7119_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1504_c3_f5af : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_7119_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_360d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_7119_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_7119_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_7119_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_7119_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_7119_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_7119_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_360d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_7119_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_5c6b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_5c6b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_5c6b_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_360d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1509_c3_cbbb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_360d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_360d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_360d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_360d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_360d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_360d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_360d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_360d_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_360d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_360d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_360d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1489_l1476_l1497_DUPLICATE_b975_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1492_l1489_l1476_l1507_l1497_DUPLICATE_9a31_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1489_l1497_DUPLICATE_aa69_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1489_l1501_l1492_l1497_DUPLICATE_a6b6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1492_l1489_l1507_l1501_l1497_DUPLICATE_8eb4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1492_l1507_l1497_DUPLICATE_385e_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l1514_l1472_DUPLICATE_2d1b_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_219a_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1504_c3_f5af := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_7119_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1504_c3_f5af;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1481_c3_6abe := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1481_c3_6abe;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1486_c3_b1a9 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1486_c3_b1a9;
     VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_c4ff_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_56ca_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_f88f_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_7119_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1498_c3_1100 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1498_c3_1100;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1509_c3_cbbb := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_360d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1509_c3_cbbb;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_5c6b_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_360d_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1490_c3_442d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1490_c3_442d;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_36c8_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_dfde_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_c4ff_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_81b9_right := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_c4ff_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_81b9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_f88f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_dfde_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_56ca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_219a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_5c6b_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_7119_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_360d_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_7119_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_360d_iftrue := VAR_previous_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_36c8_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse := t8;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_7119_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_7119_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_360d_iffalse := tmp8_low;
     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1489_l1476_l1497_DUPLICATE_b975 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1489_l1476_l1497_DUPLICATE_b975_return_output := result.u16_value;

     -- sp_relative_shift[uxn_opcodes_h_l1494_c30_c4ff] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1494_c30_c4ff_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_c4ff_ins;
     sp_relative_shift_uxn_opcodes_h_l1494_c30_c4ff_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_c4ff_x;
     sp_relative_shift_uxn_opcodes_h_l1494_c30_c4ff_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_c4ff_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_c4ff_return_output := sp_relative_shift_uxn_opcodes_h_l1494_c30_c4ff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1497_c11_56ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1497_c11_56ca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_56ca_left;
     BIN_OP_EQ_uxn_opcodes_h_l1497_c11_56ca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_56ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_56ca_return_output := BIN_OP_EQ_uxn_opcodes_h_l1497_c11_56ca_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1476_c2_96b9] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1476_c2_96b9_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1489_l1501_l1492_l1497_DUPLICATE_a6b6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1489_l1501_l1492_l1497_DUPLICATE_a6b6_return_output := result.is_stack_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1476_c2_96b9] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1476_c2_96b9_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1492_l1507_l1497_DUPLICATE_385e LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1492_l1507_l1497_DUPLICATE_385e_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1501_c11_219a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1501_c11_219a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_219a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1501_c11_219a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_219a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_219a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1501_c11_219a_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1489_l1497_DUPLICATE_aa69 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1489_l1497_DUPLICATE_aa69_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1492_c11_dfde] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1492_c11_dfde_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_dfde_left;
     BIN_OP_EQ_uxn_opcodes_h_l1492_c11_dfde_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_dfde_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_dfde_return_output := BIN_OP_EQ_uxn_opcodes_h_l1492_c11_dfde_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1476_c6_81b9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1476_c6_81b9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_81b9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1476_c6_81b9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_81b9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_81b9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1476_c6_81b9_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1499_c33_36c8] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_36c8_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_36c8_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_36c8_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_36c8_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_36c8_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_36c8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1489_c11_f88f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1489_c11_f88f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_f88f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1489_c11_f88f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_f88f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_f88f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1489_c11_f88f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1492_l1489_l1507_l1501_l1497_DUPLICATE_8eb4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1492_l1489_l1507_l1501_l1497_DUPLICATE_8eb4_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1492_l1489_l1476_l1507_l1497_DUPLICATE_9a31 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1492_l1489_l1476_l1507_l1497_DUPLICATE_9a31_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1507_c11_5c6b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1507_c11_5c6b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_5c6b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1507_c11_5c6b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_5c6b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_5c6b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1507_c11_5c6b_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1476_c2_96b9] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1476_c2_96b9_return_output := result.is_ram_write;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1495_c22_6cde] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1495_c22_6cde_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1476_c2_96b9] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1476_c2_96b9_return_output := result.is_stack_index_flipped;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_96b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_81b9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_96b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_81b9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_81b9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_96b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_81b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_96b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_81b9_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_81b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_96b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_81b9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_96b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_81b9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_96b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_81b9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_96b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_81b9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1476_c2_96b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_81b9_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_96b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_81b9_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_96b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c6_81b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_30ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_f88f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_30ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_f88f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_30ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_f88f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_30ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_f88f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_30ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_f88f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_30ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_f88f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1489_c7_30ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_f88f_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_30ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_f88f_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_30ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1489_c11_f88f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_8098_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_dfde_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_8098_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_dfde_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_8098_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_dfde_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_8098_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_dfde_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_8098_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_dfde_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_8098_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_dfde_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1492_c7_8098_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_dfde_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_8098_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_dfde_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_8098_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1492_c11_dfde_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_31d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_56ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_31d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_56ca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_31d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_56ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_31d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_56ca_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_31d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_56ca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_31d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_56ca_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_31d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_56ca_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_31d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1497_c11_56ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_7119_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_219a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_7119_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_219a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_7119_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_219a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_7119_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_219a_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_7119_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_219a_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_7119_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1501_c11_219a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_360d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_5c6b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_360d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_5c6b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_360d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_5c6b_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_360d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_5c6b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1495_c22_6cde_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1489_l1497_DUPLICATE_aa69_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1489_l1497_DUPLICATE_aa69_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1489_l1476_l1497_DUPLICATE_b975_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1489_l1476_l1497_DUPLICATE_b975_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1489_l1476_l1497_DUPLICATE_b975_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1492_l1489_l1507_l1501_l1497_DUPLICATE_8eb4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1492_l1489_l1507_l1501_l1497_DUPLICATE_8eb4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1492_l1489_l1507_l1501_l1497_DUPLICATE_8eb4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_7119_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1492_l1489_l1507_l1501_l1497_DUPLICATE_8eb4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_360d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1492_l1489_l1507_l1501_l1497_DUPLICATE_8eb4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1489_l1501_l1492_l1497_DUPLICATE_a6b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1489_l1501_l1492_l1497_DUPLICATE_a6b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1489_l1501_l1492_l1497_DUPLICATE_a6b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_7119_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1489_l1501_l1492_l1497_DUPLICATE_a6b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1492_l1507_l1497_DUPLICATE_385e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1492_l1507_l1497_DUPLICATE_385e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_360d_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1492_l1507_l1497_DUPLICATE_385e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1492_l1489_l1476_l1507_l1497_DUPLICATE_9a31_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1492_l1489_l1476_l1507_l1497_DUPLICATE_9a31_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1492_l1489_l1476_l1507_l1497_DUPLICATE_9a31_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1492_l1489_l1476_l1507_l1497_DUPLICATE_9a31_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_360d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1492_l1489_l1476_l1507_l1497_DUPLICATE_9a31_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1476_c2_96b9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1476_c2_96b9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1476_c2_96b9_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1476_c2_96b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1494_c30_c4ff_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1497_c7_31d0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_31d0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_31d0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1507_c7_360d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_360d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_360d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_360d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_360d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_360d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_360d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_360d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_360d_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1476_c2_96b9] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1499_c22_87f1] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1499_c22_87f1_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1499_c33_36c8_return_output);

     -- tmp8_low_MUX[uxn_opcodes_h_l1507_c7_360d] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1507_c7_360d_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_360d_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1507_c7_360d_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_360d_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1507_c7_360d_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_360d_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_360d_return_output := tmp8_low_MUX_uxn_opcodes_h_l1507_c7_360d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1476_c2_96b9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_96b9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_96b9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1507_c7_360d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1507_c7_360d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_360d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1507_c7_360d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_360d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1507_c7_360d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_360d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_360d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1507_c7_360d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1476_c2_96b9] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output;

     -- t8_MUX[uxn_opcodes_h_l1492_c7_8098] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1492_c7_8098_cond <= VAR_t8_MUX_uxn_opcodes_h_l1492_c7_8098_cond;
     t8_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue;
     t8_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1492_c7_8098_return_output := t8_MUX_uxn_opcodes_h_l1492_c7_8098_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1476_c2_96b9] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_96b9_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_96b9_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1501_c7_7119] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1501_c7_7119_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_7119_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1501_c7_7119_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_7119_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1501_c7_7119_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_7119_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_7119_return_output := tmp8_high_MUX_uxn_opcodes_h_l1501_c7_7119_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1501_c7_7119] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_7119_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_7119_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_7119_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_7119_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_7119_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_7119_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_7119_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_7119_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1507_c7_360d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_360d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_360d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_360d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_360d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_360d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_360d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_360d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_360d_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1499_c22_87f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_7119_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_360d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1501_c7_7119_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_7119_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1507_c7_360d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_7119_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_360d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1492_c7_8098_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1501_c7_7119_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_7119_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1507_c7_360d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1501_c7_7119] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_7119_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_7119_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_7119_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_7119_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_7119_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_7119_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_7119_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_7119_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1501_c7_7119] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1501_c7_7119_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_7119_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1501_c7_7119_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_7119_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1501_c7_7119_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_7119_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_7119_return_output := result_u8_value_MUX_uxn_opcodes_h_l1501_c7_7119_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1497_c7_31d0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_31d0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_31d0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1497_c7_31d0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1497_c7_31d0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_31d0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output := result_u16_value_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output;

     -- t8_MUX[uxn_opcodes_h_l1489_c7_30ce] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1489_c7_30ce_cond <= VAR_t8_MUX_uxn_opcodes_h_l1489_c7_30ce_cond;
     t8_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue;
     t8_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output := t8_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1501_c7_7119] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1501_c7_7119_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_7119_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1501_c7_7119_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_7119_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1501_c7_7119_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_7119_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_7119_return_output := tmp8_low_MUX_uxn_opcodes_h_l1501_c7_7119_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1497_c7_31d0] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1497_c7_31d0_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_31d0_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output := tmp8_high_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1501_c7_7119] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_7119_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_7119_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_7119_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_7119_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_7119_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_7119_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_7119_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_7119_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1492_c7_8098] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_8098_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_8098_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_8098_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_8098_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1501_c7_7119_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1492_c7_8098_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1501_c7_7119_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1501_c7_7119_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1501_c7_7119_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1492_c7_8098] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_8098_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_8098_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_8098_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_8098_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1497_c7_31d0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_31d0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_31d0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1497_c7_31d0] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1497_c7_31d0_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_31d0_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output := tmp8_low_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1497_c7_31d0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_31d0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_31d0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1492_c7_8098] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1492_c7_8098_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_8098_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_8098_return_output := result_u16_value_MUX_uxn_opcodes_h_l1492_c7_8098_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1492_c7_8098] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1492_c7_8098_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_8098_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_8098_return_output := tmp8_high_MUX_uxn_opcodes_h_l1492_c7_8098_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1489_c7_30ce] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_30ce_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_30ce_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output;

     -- t8_MUX[uxn_opcodes_h_l1476_c2_96b9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1476_c2_96b9_cond <= VAR_t8_MUX_uxn_opcodes_h_l1476_c2_96b9_cond;
     t8_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue;
     t8_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output := t8_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1497_c7_31d0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1497_c7_31d0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_31d0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_31d0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_31d0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1492_c7_8098_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1492_c7_8098_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1492_c7_8098_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1497_c7_31d0_return_output;
     -- tmp8_high_MUX[uxn_opcodes_h_l1489_c7_30ce] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1489_c7_30ce_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_30ce_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output := tmp8_high_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1476_c2_96b9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_96b9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_96b9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1492_c7_8098] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1492_c7_8098_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_8098_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_8098_return_output := result_u8_value_MUX_uxn_opcodes_h_l1492_c7_8098_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1492_c7_8098] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_8098_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_8098_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_8098_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_8098_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1489_c7_30ce] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1489_c7_30ce_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_30ce_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output := result_u16_value_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1492_c7_8098] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1492_c7_8098_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_8098_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_8098_return_output := tmp8_low_MUX_uxn_opcodes_h_l1492_c7_8098_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1489_c7_30ce] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_30ce_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_30ce_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1492_c7_8098] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_8098_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_8098_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_8098_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_8098_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_8098_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_8098_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1492_c7_8098_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1492_c7_8098_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1492_c7_8098_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1492_c7_8098_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1489_c7_30ce] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_30ce_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_30ce_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1476_c2_96b9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_96b9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_96b9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1476_c2_96b9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1476_c2_96b9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_96b9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output := result_u16_value_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1476_c2_96b9] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1476_c2_96b9_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_96b9_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output := tmp8_high_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1489_c7_30ce] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1489_c7_30ce_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_30ce_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output := result_u8_value_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1489_c7_30ce] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_30ce_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_30ce_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1489_c7_30ce] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1489_c7_30ce_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_30ce_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_30ce_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_30ce_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output := tmp8_low_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1489_c7_30ce_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1476_c2_96b9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_96b9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_96b9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1476_c2_96b9] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1476_c2_96b9_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_96b9_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output := tmp8_low_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1476_c2_96b9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1476_c2_96b9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_96b9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output := result_u8_value_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1476_c2_96b9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_96b9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_96b9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_96b9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_96b9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output;

     -- Submodule level 7
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l1514_l1472_DUPLICATE_2d1b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l1514_l1472_DUPLICATE_2d1b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c942(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1476_c2_96b9_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l1514_l1472_DUPLICATE_2d1b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c942_uxn_opcodes_h_l1514_l1472_DUPLICATE_2d1b_return_output;
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
