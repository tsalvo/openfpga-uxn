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
-- Submodules: 53
entity stz2_0CLK_75b4bee3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end stz2_0CLK_75b4bee3;
architecture arch of stz2_0CLK_75b4bee3 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16_low : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16_high : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n16_low : unsigned(7 downto 0);
signal REG_COMB_n16_high : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1557_c6_e715]
signal BIN_OP_EQ_uxn_opcodes_h_l1557_c6_e715_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1557_c6_e715_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1557_c6_e715_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1557_c2_5902]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_5902_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_5902_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1557_c2_5902]
signal result_u8_value_MUX_uxn_opcodes_h_l1557_c2_5902_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1557_c2_5902_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1557_c2_5902]
signal result_u16_value_MUX_uxn_opcodes_h_l1557_c2_5902_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1557_c2_5902_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1557_c2_5902]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_5902_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_5902_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1557_c2_5902]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_5902_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_5902_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1557_c2_5902]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_5902_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_5902_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1557_c2_5902]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_5902_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_5902_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1557_c2_5902]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_5902_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_5902_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1557_c2_5902]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_5902_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_5902_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1557_c2_5902]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_5902_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_5902_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1557_c2_5902]
signal t8_MUX_uxn_opcodes_h_l1557_c2_5902_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1557_c2_5902_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1557_c2_5902]
signal n16_low_MUX_uxn_opcodes_h_l1557_c2_5902_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1557_c2_5902_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1557_c2_5902]
signal n16_high_MUX_uxn_opcodes_h_l1557_c2_5902_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1557_c2_5902_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1570_c11_f2bd]
signal BIN_OP_EQ_uxn_opcodes_h_l1570_c11_f2bd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1570_c11_f2bd_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1570_c11_f2bd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1570_c7_51ab]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_51ab_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1570_c7_51ab]
signal result_u8_value_MUX_uxn_opcodes_h_l1570_c7_51ab_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1570_c7_51ab]
signal result_u16_value_MUX_uxn_opcodes_h_l1570_c7_51ab_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1570_c7_51ab]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_51ab_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1570_c7_51ab]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_51ab_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1570_c7_51ab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_51ab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1570_c7_51ab]
signal t8_MUX_uxn_opcodes_h_l1570_c7_51ab_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1570_c7_51ab]
signal n16_low_MUX_uxn_opcodes_h_l1570_c7_51ab_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1570_c7_51ab]
signal n16_high_MUX_uxn_opcodes_h_l1570_c7_51ab_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1573_c11_5d3b]
signal BIN_OP_EQ_uxn_opcodes_h_l1573_c11_5d3b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1573_c11_5d3b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1573_c11_5d3b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1573_c7_9202]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_9202_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_9202_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1573_c7_9202]
signal result_u8_value_MUX_uxn_opcodes_h_l1573_c7_9202_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1573_c7_9202_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1573_c7_9202]
signal result_u16_value_MUX_uxn_opcodes_h_l1573_c7_9202_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1573_c7_9202_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1573_c7_9202]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_9202_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_9202_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1573_c7_9202]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_9202_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_9202_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1573_c7_9202]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_9202_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_9202_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1573_c7_9202]
signal t8_MUX_uxn_opcodes_h_l1573_c7_9202_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1573_c7_9202_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1573_c7_9202]
signal n16_low_MUX_uxn_opcodes_h_l1573_c7_9202_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1573_c7_9202_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1573_c7_9202]
signal n16_high_MUX_uxn_opcodes_h_l1573_c7_9202_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1573_c7_9202_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1577_c11_1781]
signal BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1781_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1781_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1781_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1577_c7_2d6c]
signal result_u8_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1577_c7_2d6c]
signal result_u16_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1577_c7_2d6c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_2d6c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_2d6c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_2d6c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1577_c7_2d6c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_2d6c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_2d6c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_2d6c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1577_c7_2d6c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_2d6c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_2d6c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_2d6c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1577_c7_2d6c]
signal n16_low_MUX_uxn_opcodes_h_l1577_c7_2d6c_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1577_c7_2d6c_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1577_c7_2d6c_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l1577_c7_2d6c]
signal n16_high_MUX_uxn_opcodes_h_l1577_c7_2d6c_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1577_c7_2d6c_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1577_c7_2d6c_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1579_c30_54b3]
signal sp_relative_shift_uxn_opcodes_h_l1579_c30_54b3_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1579_c30_54b3_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1579_c30_54b3_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1579_c30_54b3_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1584_c11_d77e]
signal BIN_OP_EQ_uxn_opcodes_h_l1584_c11_d77e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1584_c11_d77e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1584_c11_d77e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1584_c7_01ac]
signal result_u8_value_MUX_uxn_opcodes_h_l1584_c7_01ac_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1584_c7_01ac_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1584_c7_01ac_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1584_c7_01ac_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1584_c7_01ac]
signal result_u16_value_MUX_uxn_opcodes_h_l1584_c7_01ac_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1584_c7_01ac_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1584_c7_01ac_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1584_c7_01ac_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1584_c7_01ac]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_01ac_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_01ac_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_01ac_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_01ac_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1584_c7_01ac]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_01ac_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_01ac_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_01ac_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_01ac_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l1584_c7_01ac]
signal n16_low_MUX_uxn_opcodes_h_l1584_c7_01ac_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1584_c7_01ac_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1584_c7_01ac_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l1584_c7_01ac_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1587_c33_caf9]
signal BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_caf9_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_caf9_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_caf9_return_output : unsigned(8 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_e393( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_vram_write := ref_toks_8;
      base.is_pc_updated := ref_toks_9;
      base.is_opc_done := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1557_c6_e715
BIN_OP_EQ_uxn_opcodes_h_l1557_c6_e715 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1557_c6_e715_left,
BIN_OP_EQ_uxn_opcodes_h_l1557_c6_e715_right,
BIN_OP_EQ_uxn_opcodes_h_l1557_c6_e715_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_5902
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_5902 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_5902_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_5902_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1557_c2_5902
result_u8_value_MUX_uxn_opcodes_h_l1557_c2_5902 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1557_c2_5902_cond,
result_u8_value_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1557_c2_5902_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1557_c2_5902
result_u16_value_MUX_uxn_opcodes_h_l1557_c2_5902 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1557_c2_5902_cond,
result_u16_value_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1557_c2_5902_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_5902
result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_5902 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_5902_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_5902_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_5902
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_5902 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_5902_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_5902_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_5902
result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_5902 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_5902_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_5902_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_5902
result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_5902 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_5902_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_5902_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_5902
result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_5902 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_5902_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_5902_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_5902
result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_5902 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_5902_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_5902_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_5902
result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_5902 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_5902_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_5902_return_output);

-- t8_MUX_uxn_opcodes_h_l1557_c2_5902
t8_MUX_uxn_opcodes_h_l1557_c2_5902 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1557_c2_5902_cond,
t8_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue,
t8_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse,
t8_MUX_uxn_opcodes_h_l1557_c2_5902_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1557_c2_5902
n16_low_MUX_uxn_opcodes_h_l1557_c2_5902 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1557_c2_5902_cond,
n16_low_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue,
n16_low_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse,
n16_low_MUX_uxn_opcodes_h_l1557_c2_5902_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1557_c2_5902
n16_high_MUX_uxn_opcodes_h_l1557_c2_5902 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1557_c2_5902_cond,
n16_high_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue,
n16_high_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse,
n16_high_MUX_uxn_opcodes_h_l1557_c2_5902_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1570_c11_f2bd
BIN_OP_EQ_uxn_opcodes_h_l1570_c11_f2bd : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1570_c11_f2bd_left,
BIN_OP_EQ_uxn_opcodes_h_l1570_c11_f2bd_right,
BIN_OP_EQ_uxn_opcodes_h_l1570_c11_f2bd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_51ab
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_51ab : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_51ab_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1570_c7_51ab
result_u8_value_MUX_uxn_opcodes_h_l1570_c7_51ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1570_c7_51ab_cond,
result_u8_value_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1570_c7_51ab
result_u16_value_MUX_uxn_opcodes_h_l1570_c7_51ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1570_c7_51ab_cond,
result_u16_value_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_51ab
result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_51ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_51ab_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_51ab
result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_51ab : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_51ab_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_51ab
result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_51ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_51ab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output);

-- t8_MUX_uxn_opcodes_h_l1570_c7_51ab
t8_MUX_uxn_opcodes_h_l1570_c7_51ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1570_c7_51ab_cond,
t8_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue,
t8_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse,
t8_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1570_c7_51ab
n16_low_MUX_uxn_opcodes_h_l1570_c7_51ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1570_c7_51ab_cond,
n16_low_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue,
n16_low_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse,
n16_low_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1570_c7_51ab
n16_high_MUX_uxn_opcodes_h_l1570_c7_51ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1570_c7_51ab_cond,
n16_high_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue,
n16_high_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse,
n16_high_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1573_c11_5d3b
BIN_OP_EQ_uxn_opcodes_h_l1573_c11_5d3b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1573_c11_5d3b_left,
BIN_OP_EQ_uxn_opcodes_h_l1573_c11_5d3b_right,
BIN_OP_EQ_uxn_opcodes_h_l1573_c11_5d3b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_9202
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_9202 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_9202_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_9202_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1573_c7_9202
result_u8_value_MUX_uxn_opcodes_h_l1573_c7_9202 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1573_c7_9202_cond,
result_u8_value_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1573_c7_9202_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1573_c7_9202
result_u16_value_MUX_uxn_opcodes_h_l1573_c7_9202 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1573_c7_9202_cond,
result_u16_value_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1573_c7_9202_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_9202
result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_9202 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_9202_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_9202_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_9202
result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_9202 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_9202_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_9202_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_9202
result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_9202 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_9202_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_9202_return_output);

-- t8_MUX_uxn_opcodes_h_l1573_c7_9202
t8_MUX_uxn_opcodes_h_l1573_c7_9202 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1573_c7_9202_cond,
t8_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue,
t8_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse,
t8_MUX_uxn_opcodes_h_l1573_c7_9202_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1573_c7_9202
n16_low_MUX_uxn_opcodes_h_l1573_c7_9202 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1573_c7_9202_cond,
n16_low_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue,
n16_low_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse,
n16_low_MUX_uxn_opcodes_h_l1573_c7_9202_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1573_c7_9202
n16_high_MUX_uxn_opcodes_h_l1573_c7_9202 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1573_c7_9202_cond,
n16_high_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue,
n16_high_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse,
n16_high_MUX_uxn_opcodes_h_l1573_c7_9202_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1781
BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1781 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1781_left,
BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1781_right,
BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1781_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1577_c7_2d6c
result_u8_value_MUX_uxn_opcodes_h_l1577_c7_2d6c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1577_c7_2d6c
result_u16_value_MUX_uxn_opcodes_h_l1577_c7_2d6c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_cond,
result_u16_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_2d6c
result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_2d6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_2d6c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_2d6c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_2d6c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_2d6c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_2d6c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_2d6c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_2d6c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_2d6c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_2d6c
result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_2d6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_2d6c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_2d6c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_2d6c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1577_c7_2d6c
n16_low_MUX_uxn_opcodes_h_l1577_c7_2d6c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1577_c7_2d6c_cond,
n16_low_MUX_uxn_opcodes_h_l1577_c7_2d6c_iftrue,
n16_low_MUX_uxn_opcodes_h_l1577_c7_2d6c_iffalse,
n16_low_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output);

-- n16_high_MUX_uxn_opcodes_h_l1577_c7_2d6c
n16_high_MUX_uxn_opcodes_h_l1577_c7_2d6c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l1577_c7_2d6c_cond,
n16_high_MUX_uxn_opcodes_h_l1577_c7_2d6c_iftrue,
n16_high_MUX_uxn_opcodes_h_l1577_c7_2d6c_iffalse,
n16_high_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1579_c30_54b3
sp_relative_shift_uxn_opcodes_h_l1579_c30_54b3 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1579_c30_54b3_ins,
sp_relative_shift_uxn_opcodes_h_l1579_c30_54b3_x,
sp_relative_shift_uxn_opcodes_h_l1579_c30_54b3_y,
sp_relative_shift_uxn_opcodes_h_l1579_c30_54b3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1584_c11_d77e
BIN_OP_EQ_uxn_opcodes_h_l1584_c11_d77e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1584_c11_d77e_left,
BIN_OP_EQ_uxn_opcodes_h_l1584_c11_d77e_right,
BIN_OP_EQ_uxn_opcodes_h_l1584_c11_d77e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1584_c7_01ac
result_u8_value_MUX_uxn_opcodes_h_l1584_c7_01ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1584_c7_01ac_cond,
result_u8_value_MUX_uxn_opcodes_h_l1584_c7_01ac_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1584_c7_01ac_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1584_c7_01ac_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1584_c7_01ac
result_u16_value_MUX_uxn_opcodes_h_l1584_c7_01ac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1584_c7_01ac_cond,
result_u16_value_MUX_uxn_opcodes_h_l1584_c7_01ac_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1584_c7_01ac_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1584_c7_01ac_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_01ac
result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_01ac : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_01ac_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_01ac_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_01ac_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_01ac_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_01ac
result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_01ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_01ac_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_01ac_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_01ac_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_01ac_return_output);

-- n16_low_MUX_uxn_opcodes_h_l1584_c7_01ac
n16_low_MUX_uxn_opcodes_h_l1584_c7_01ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l1584_c7_01ac_cond,
n16_low_MUX_uxn_opcodes_h_l1584_c7_01ac_iftrue,
n16_low_MUX_uxn_opcodes_h_l1584_c7_01ac_iffalse,
n16_low_MUX_uxn_opcodes_h_l1584_c7_01ac_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_caf9
BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_caf9 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_caf9_left,
BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_caf9_right,
BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_caf9_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n16_low,
 n16_high,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1557_c6_e715_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_5902_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1557_c2_5902_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1557_c2_5902_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_5902_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_5902_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_5902_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_5902_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_5902_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_5902_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_5902_return_output,
 t8_MUX_uxn_opcodes_h_l1557_c2_5902_return_output,
 n16_low_MUX_uxn_opcodes_h_l1557_c2_5902_return_output,
 n16_high_MUX_uxn_opcodes_h_l1557_c2_5902_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1570_c11_f2bd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output,
 t8_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output,
 n16_low_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output,
 n16_high_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1573_c11_5d3b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_9202_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1573_c7_9202_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1573_c7_9202_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_9202_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_9202_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_9202_return_output,
 t8_MUX_uxn_opcodes_h_l1573_c7_9202_return_output,
 n16_low_MUX_uxn_opcodes_h_l1573_c7_9202_return_output,
 n16_high_MUX_uxn_opcodes_h_l1573_c7_9202_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1781_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output,
 n16_low_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output,
 n16_high_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output,
 sp_relative_shift_uxn_opcodes_h_l1579_c30_54b3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1584_c11_d77e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1584_c7_01ac_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1584_c7_01ac_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_01ac_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_01ac_return_output,
 n16_low_MUX_uxn_opcodes_h_l1584_c7_01ac_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_caf9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_e715_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_e715_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_e715_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1567_c3_75af : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_5902_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_5902_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_5902_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_5902_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_5902_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_5902_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_5902_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_5902_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1557_c2_5902_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_5902_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_5902_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1557_c2_5902_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_5902_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_5902_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1562_c3_6fa5 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_5902_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_5902_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1557_c2_5902_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_5902_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_5902_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1557_c2_5902_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_5902_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_5902_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_5902_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_5902_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1557_c2_5902_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1557_c2_5902_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_5902_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_5902_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_5902_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_5902_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_f2bd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_f2bd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_f2bd_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1571_c3_ff2b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_9202_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_51ab_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_9202_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_51ab_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_9202_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_51ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_9202_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_51ab_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_9202_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_51ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_9202_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_51ab_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1573_c7_9202_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1570_c7_51ab_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_9202_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_51ab_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_9202_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_51ab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_5d3b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_5d3b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_5d3b_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1575_c3_53e1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1573_c7_9202_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_9202_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_9202_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_9202_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_9202_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_9202_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_9202_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1573_c7_9202_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_9202_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_9202_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1781_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1781_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1781_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_01ac_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_01ac_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_2d6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_2d6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_2d6c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_2d6c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_2d6c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_01ac_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_2d6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_2d6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_2d6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_01ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_2d6c_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_2d6c_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_2d6c_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_01ac_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_2d6c_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_2d6c_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_2d6c_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_2d6c_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_54b3_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_54b3_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_54b3_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_54b3_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1581_c22_4aaf_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_d77e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_d77e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_d77e_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_01ac_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_01ac_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_01ac_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_01ac_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_01ac_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_01ac_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_01ac_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1586_c3_6c4a : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_01ac_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_01ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_01ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_01ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_01ac_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_01ac_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_01ac_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_01ac_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_caf9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_caf9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_caf9_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1587_c22_1501_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1573_l1557_l1570_l1584_DUPLICATE_5d81_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1573_l1557_l1570_l1584_DUPLICATE_3ccf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1573_l1577_l1570_DUPLICATE_cce9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1573_l1570_l1584_DUPLICATE_8563_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1573_l1577_l1570_l1584_DUPLICATE_9aa3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e393_uxn_opcodes_h_l1592_l1552_DUPLICATE_71ab_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n16_low : unsigned(7 downto 0);
variable REG_VAR_n16_high : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n16_low := n16_low;
  REG_VAR_n16_high := n16_high;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_caf9_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_54b3_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_5d3b_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1781_right := to_unsigned(3, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_f2bd_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1562_c3_6fa5 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1562_c3_6fa5;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_2d6c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1567_c3_75af := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1567_c3_75af;
     VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_54b3_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_d77e_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_e715_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1575_c3_53e1 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1575_c3_53e1;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1571_c3_ff2b := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1571_c3_ff2b;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1586_c3_6c4a := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_01ac_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1586_c3_6c4a;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_01ac_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue := to_unsigned(0, 1);

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

     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_54b3_ins := VAR_ins;
     VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_2d6c_iffalse := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_2d6c_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_01ac_iffalse := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_e715_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_f2bd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_5d3b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1781_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_d77e_left := VAR_phase;
     VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_2d6c_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_01ac_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_01ac_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_caf9_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1557_c6_e715] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1557_c6_e715_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_e715_left;
     BIN_OP_EQ_uxn_opcodes_h_l1557_c6_e715_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_e715_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_e715_return_output := BIN_OP_EQ_uxn_opcodes_h_l1557_c6_e715_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1584_c11_d77e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1584_c11_d77e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_d77e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1584_c11_d77e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_d77e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_d77e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1584_c11_d77e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1573_c11_5d3b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1573_c11_5d3b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_5d3b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1573_c11_5d3b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_5d3b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_5d3b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1573_c11_5d3b_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1573_c7_9202] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1573_c7_9202_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1573_l1557_l1570_l1584_DUPLICATE_3ccf LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1573_l1557_l1570_l1584_DUPLICATE_3ccf_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1573_l1577_l1570_l1584_DUPLICATE_9aa3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1573_l1577_l1570_l1584_DUPLICATE_9aa3_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1573_l1557_l1570_l1584_DUPLICATE_5d81 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1573_l1557_l1570_l1584_DUPLICATE_5d81_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1577_c11_1781] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1781_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1781_left;
     BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1781_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1781_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1781_return_output := BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1781_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1557_c2_5902] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1557_c2_5902_return_output := result.is_stack_index_flipped;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1581_c22_4aaf] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1581_c22_4aaf_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- BIN_OP_PLUS[uxn_opcodes_h_l1587_c33_caf9] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_caf9_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_caf9_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_caf9_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_caf9_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_caf9_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_caf9_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1573_l1570_l1584_DUPLICATE_8563 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1573_l1570_l1584_DUPLICATE_8563_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1570_c11_f2bd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1570_c11_f2bd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_f2bd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1570_c11_f2bd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_f2bd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_f2bd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1570_c11_f2bd_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l1557_c2_5902] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1557_c2_5902_return_output := result.is_stack_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1557_c2_5902] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1557_c2_5902_return_output := result.is_vram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1557_c2_5902] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1557_c2_5902_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1573_l1577_l1570_DUPLICATE_cce9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1573_l1577_l1570_DUPLICATE_cce9_return_output := result.is_ram_write;

     -- sp_relative_shift[uxn_opcodes_h_l1579_c30_54b3] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1579_c30_54b3_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_54b3_ins;
     sp_relative_shift_uxn_opcodes_h_l1579_c30_54b3_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_54b3_x;
     sp_relative_shift_uxn_opcodes_h_l1579_c30_54b3_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_54b3_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_54b3_return_output := sp_relative_shift_uxn_opcodes_h_l1579_c30_54b3_return_output;

     -- Submodule level 1
     VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_5902_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_e715_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_5902_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_e715_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_5902_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_e715_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_5902_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_e715_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_5902_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_e715_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_5902_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_e715_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_5902_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_e715_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_5902_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_e715_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_5902_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_e715_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_5902_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_e715_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_5902_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_e715_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_5902_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_e715_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1557_c2_5902_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c6_e715_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_51ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_f2bd_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_51ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_f2bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_51ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_f2bd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_51ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_f2bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_51ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_f2bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_51ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_f2bd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_51ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_f2bd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_51ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_f2bd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1570_c7_51ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1570_c11_f2bd_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_9202_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_5d3b_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_9202_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_5d3b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_9202_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_5d3b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_9202_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_5d3b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_9202_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_5d3b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_9202_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_5d3b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_9202_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_5d3b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_9202_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_5d3b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1573_c7_9202_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1573_c11_5d3b_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_2d6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1781_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_2d6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1781_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_2d6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1781_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_2d6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1781_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_2d6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1781_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1781_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1577_c11_1781_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_01ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_d77e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_01ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_d77e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_01ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_d77e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_01ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_d77e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_01ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1584_c11_d77e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1581_c22_4aaf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1573_l1570_l1584_DUPLICATE_8563_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1573_l1570_l1584_DUPLICATE_8563_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_01ac_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1573_l1570_l1584_DUPLICATE_8563_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1573_l1557_l1570_l1584_DUPLICATE_3ccf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1573_l1557_l1570_l1584_DUPLICATE_3ccf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1573_l1557_l1570_l1584_DUPLICATE_3ccf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_01ac_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1573_l1557_l1570_l1584_DUPLICATE_3ccf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1573_l1577_l1570_l1584_DUPLICATE_9aa3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1573_l1577_l1570_l1584_DUPLICATE_9aa3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_2d6c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1573_l1577_l1570_l1584_DUPLICATE_9aa3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_01ac_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1573_l1577_l1570_l1584_DUPLICATE_9aa3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1573_l1577_l1570_DUPLICATE_cce9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1573_l1577_l1570_DUPLICATE_cce9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_2d6c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1573_l1577_l1570_DUPLICATE_cce9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1573_l1557_l1570_l1584_DUPLICATE_5d81_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1573_l1557_l1570_l1584_DUPLICATE_5d81_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1573_l1557_l1570_l1584_DUPLICATE_5d81_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_01ac_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1573_l1557_l1570_l1584_DUPLICATE_5d81_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1557_c2_5902_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1557_c2_5902_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1557_c2_5902_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1557_c2_5902_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1573_c7_9202_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_2d6c_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1579_c30_54b3_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1573_c7_9202] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_9202_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_9202_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_9202_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_9202_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1577_c7_2d6c] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1577_c7_2d6c_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_2d6c_cond;
     n16_high_MUX_uxn_opcodes_h_l1577_c7_2d6c_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_2d6c_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1577_c7_2d6c_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_2d6c_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output := n16_high_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1577_c7_2d6c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_2d6c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_2d6c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_2d6c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_2d6c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_2d6c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_2d6c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1584_c7_01ac] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1584_c7_01ac_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_01ac_cond;
     n16_low_MUX_uxn_opcodes_h_l1584_c7_01ac_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_01ac_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1584_c7_01ac_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_01ac_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_01ac_return_output := n16_low_MUX_uxn_opcodes_h_l1584_c7_01ac_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1584_c7_01ac] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_01ac_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_01ac_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_01ac_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_01ac_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_01ac_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_01ac_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_01ac_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_01ac_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1584_c7_01ac] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_01ac_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_01ac_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_01ac_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_01ac_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_01ac_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_01ac_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_01ac_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_01ac_return_output;

     -- t8_MUX[uxn_opcodes_h_l1573_c7_9202] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1573_c7_9202_cond <= VAR_t8_MUX_uxn_opcodes_h_l1573_c7_9202_cond;
     t8_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue;
     t8_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1573_c7_9202_return_output := t8_MUX_uxn_opcodes_h_l1573_c7_9202_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1587_c22_1501] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1587_c22_1501_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1587_c33_caf9_return_output);

     -- result_u8_value_MUX[uxn_opcodes_h_l1584_c7_01ac] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1584_c7_01ac_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_01ac_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1584_c7_01ac_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_01ac_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1584_c7_01ac_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_01ac_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_01ac_return_output := result_u8_value_MUX_uxn_opcodes_h_l1584_c7_01ac_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1557_c2_5902] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_5902_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_5902_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_5902_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_5902_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1557_c2_5902] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_5902_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_5902_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_5902_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_5902_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1557_c2_5902] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_5902_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_5902_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_5902_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_5902_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1557_c2_5902] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_5902_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_5902_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_5902_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_5902_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_01ac_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1587_c22_1501_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_2d6c_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1584_c7_01ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_2d6c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1584_c7_01ac_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_2d6c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1584_c7_01ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1573_c7_9202_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1584_c7_01ac_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1573_c7_9202_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1573_c7_9202] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_9202_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_9202_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_9202_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_9202_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1573_c7_9202] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1573_c7_9202_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_9202_cond;
     n16_high_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_9202_return_output := n16_high_MUX_uxn_opcodes_h_l1573_c7_9202_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1584_c7_01ac] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1584_c7_01ac_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_01ac_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1584_c7_01ac_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_01ac_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1584_c7_01ac_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_01ac_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_01ac_return_output := result_u16_value_MUX_uxn_opcodes_h_l1584_c7_01ac_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1577_c7_2d6c] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1577_c7_2d6c_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_2d6c_cond;
     n16_low_MUX_uxn_opcodes_h_l1577_c7_2d6c_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_2d6c_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1577_c7_2d6c_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_2d6c_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output := n16_low_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1577_c7_2d6c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_2d6c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_2d6c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_2d6c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_2d6c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_2d6c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_2d6c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output;

     -- t8_MUX[uxn_opcodes_h_l1570_c7_51ab] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1570_c7_51ab_cond <= VAR_t8_MUX_uxn_opcodes_h_l1570_c7_51ab_cond;
     t8_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue;
     t8_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output := t8_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1577_c7_2d6c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_2d6c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_2d6c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_2d6c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_2d6c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_2d6c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_2d6c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1577_c7_2d6c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1570_c7_51ab] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_51ab_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_51ab_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output;

     -- Submodule level 3
     VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1573_c7_9202_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1573_c7_9202_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1584_c7_01ac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1573_c7_9202] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_9202_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_9202_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_9202_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_9202_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1570_c7_51ab] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1570_c7_51ab_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_51ab_cond;
     n16_high_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output := n16_high_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1573_c7_9202] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1573_c7_9202_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_9202_cond;
     n16_low_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_9202_return_output := n16_low_MUX_uxn_opcodes_h_l1573_c7_9202_return_output;

     -- t8_MUX[uxn_opcodes_h_l1557_c2_5902] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1557_c2_5902_cond <= VAR_t8_MUX_uxn_opcodes_h_l1557_c2_5902_cond;
     t8_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue;
     t8_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1557_c2_5902_return_output := t8_MUX_uxn_opcodes_h_l1557_c2_5902_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1557_c2_5902] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_5902_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_5902_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_5902_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_5902_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1577_c7_2d6c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output := result_u16_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1570_c7_51ab] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_51ab_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_51ab_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1573_c7_9202] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_9202_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_9202_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_9202_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_9202_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1573_c7_9202] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1573_c7_9202_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_9202_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_9202_return_output := result_u8_value_MUX_uxn_opcodes_h_l1573_c7_9202_return_output;

     -- Submodule level 4
     VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1573_c7_9202_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1573_c7_9202_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1573_c7_9202_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1577_c7_2d6c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1573_c7_9202_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1557_c2_5902_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1570_c7_51ab] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1570_c7_51ab_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_51ab_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output := result_u8_value_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1570_c7_51ab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_51ab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_51ab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1570_c7_51ab] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1570_c7_51ab_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_51ab_cond;
     n16_low_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output := n16_low_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1557_c2_5902] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_5902_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_5902_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_5902_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_5902_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l1557_c2_5902] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l1557_c2_5902_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_5902_cond;
     n16_high_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue;
     n16_high_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_5902_return_output := n16_high_MUX_uxn_opcodes_h_l1557_c2_5902_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1573_c7_9202] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1573_c7_9202_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_9202_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_9202_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_9202_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_9202_return_output := result_u16_value_MUX_uxn_opcodes_h_l1573_c7_9202_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1570_c7_51ab] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_51ab_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_51ab_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output;

     -- Submodule level 5
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l1557_c2_5902_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1573_c7_9202_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1557_c2_5902] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1557_c2_5902_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_5902_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_5902_return_output := result_u8_value_MUX_uxn_opcodes_h_l1557_c2_5902_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1557_c2_5902] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_5902_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_5902_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_5902_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_5902_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1570_c7_51ab] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1570_c7_51ab_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_51ab_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_51ab_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_51ab_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output := result_u16_value_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l1557_c2_5902] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l1557_c2_5902_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_5902_cond;
     n16_low_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue;
     n16_low_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_5902_return_output := n16_low_MUX_uxn_opcodes_h_l1557_c2_5902_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1557_c2_5902] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_5902_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_5902_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_5902_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_5902_return_output;

     -- Submodule level 6
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l1557_c2_5902_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1570_c7_51ab_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1557_c2_5902] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1557_c2_5902_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_5902_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_5902_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_5902_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_5902_return_output := result_u16_value_MUX_uxn_opcodes_h_l1557_c2_5902_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e393_uxn_opcodes_h_l1592_l1552_DUPLICATE_71ab LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e393_uxn_opcodes_h_l1592_l1552_DUPLICATE_71ab_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e393(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1557_c2_5902_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c2_5902_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c2_5902_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c2_5902_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1557_c2_5902_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1557_c2_5902_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c2_5902_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1557_c2_5902_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1557_c2_5902_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c2_5902_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e393_uxn_opcodes_h_l1592_l1552_DUPLICATE_71ab_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e393_uxn_opcodes_h_l1592_l1552_DUPLICATE_71ab_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n16_low <= REG_VAR_n16_low;
REG_COMB_n16_high <= REG_VAR_n16_high;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n16_low <= REG_COMB_n16_low;
     n16_high <= REG_COMB_n16_high;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
