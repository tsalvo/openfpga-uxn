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
-- Submodules: 50
entity jcn2_0CLK_12273847 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jcn2_0CLK_12273847;
architecture arch of jcn2_0CLK_12273847 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l694_c6_fb38]
signal BIN_OP_EQ_uxn_opcodes_h_l694_c6_fb38_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l694_c6_fb38_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l694_c6_fb38_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l694_c2_509a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_509a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_509a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_509a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_509a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l694_c2_509a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_509a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_509a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_509a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_509a_return_output : unsigned(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l694_c2_509a]
signal result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_509a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_509a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_509a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_509a_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l694_c2_509a]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_509a_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_509a_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_509a_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_509a_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l694_c2_509a]
signal result_u16_value_MUX_uxn_opcodes_h_l694_c2_509a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l694_c2_509a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l694_c2_509a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l694_c2_509a_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l694_c2_509a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_509a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_509a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_509a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_509a_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l694_c2_509a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_509a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_509a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_509a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_509a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l694_c2_509a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_509a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_509a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_509a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_509a_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l694_c2_509a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_509a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_509a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_509a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_509a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l694_c2_509a]
signal t16_MUX_uxn_opcodes_h_l694_c2_509a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l694_c2_509a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l694_c2_509a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l694_c2_509a_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l694_c2_509a]
signal n8_MUX_uxn_opcodes_h_l694_c2_509a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l694_c2_509a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l694_c2_509a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l694_c2_509a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l707_c11_4d4f]
signal BIN_OP_EQ_uxn_opcodes_h_l707_c11_4d4f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l707_c11_4d4f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l707_c11_4d4f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l707_c7_d7e0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_d7e0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_d7e0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_d7e0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l707_c7_d7e0]
signal result_u16_value_MUX_uxn_opcodes_h_l707_c7_d7e0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l707_c7_d7e0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l707_c7_d7e0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l707_c7_d7e0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d7e0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d7e0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d7e0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l707_c7_d7e0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d7e0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d7e0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d7e0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l707_c7_d7e0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d7e0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d7e0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d7e0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l707_c7_d7e0]
signal t16_MUX_uxn_opcodes_h_l707_c7_d7e0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l707_c7_d7e0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l707_c7_d7e0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l707_c7_d7e0]
signal n8_MUX_uxn_opcodes_h_l707_c7_d7e0_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l707_c7_d7e0_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l707_c7_d7e0_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l710_c11_a421]
signal BIN_OP_EQ_uxn_opcodes_h_l710_c11_a421_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l710_c11_a421_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l710_c11_a421_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l710_c7_5946]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_5946_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_5946_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_5946_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_5946_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l710_c7_5946]
signal result_u16_value_MUX_uxn_opcodes_h_l710_c7_5946_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l710_c7_5946_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l710_c7_5946_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l710_c7_5946_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l710_c7_5946]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_5946_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_5946_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_5946_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_5946_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l710_c7_5946]
signal result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_5946_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_5946_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_5946_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_5946_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l710_c7_5946]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_5946_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_5946_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_5946_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_5946_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l710_c7_5946]
signal t16_MUX_uxn_opcodes_h_l710_c7_5946_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l710_c7_5946_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l710_c7_5946_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l710_c7_5946_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l710_c7_5946]
signal n8_MUX_uxn_opcodes_h_l710_c7_5946_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l710_c7_5946_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l710_c7_5946_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l710_c7_5946_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l712_c3_7ac4]
signal CONST_SL_8_uxn_opcodes_h_l712_c3_7ac4_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l712_c3_7ac4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l715_c11_4854]
signal BIN_OP_EQ_uxn_opcodes_h_l715_c11_4854_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l715_c11_4854_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l715_c11_4854_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l715_c7_d5f0]
signal result_u16_value_MUX_uxn_opcodes_h_l715_c7_d5f0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l715_c7_d5f0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l715_c7_d5f0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l715_c7_d5f0_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l715_c7_d5f0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_d5f0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_d5f0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_d5f0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_d5f0_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l715_c7_d5f0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_d5f0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_d5f0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_d5f0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_d5f0_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l715_c7_d5f0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_d5f0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_d5f0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_d5f0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_d5f0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l715_c7_d5f0]
signal t16_MUX_uxn_opcodes_h_l715_c7_d5f0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l715_c7_d5f0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l715_c7_d5f0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l715_c7_d5f0_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l715_c7_d5f0]
signal n8_MUX_uxn_opcodes_h_l715_c7_d5f0_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l715_c7_d5f0_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l715_c7_d5f0_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l715_c7_d5f0_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l716_c3_54c6]
signal BIN_OP_OR_uxn_opcodes_h_l716_c3_54c6_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l716_c3_54c6_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l716_c3_54c6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l718_c11_84ff]
signal BIN_OP_EQ_uxn_opcodes_h_l718_c11_84ff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l718_c11_84ff_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l718_c11_84ff_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l718_c7_7ec3]
signal result_u16_value_MUX_uxn_opcodes_h_l718_c7_7ec3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l718_c7_7ec3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l718_c7_7ec3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l718_c7_7ec3_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l718_c7_7ec3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_7ec3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_7ec3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_7ec3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_7ec3_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l718_c7_7ec3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_7ec3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_7ec3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_7ec3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_7ec3_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l718_c7_7ec3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_7ec3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_7ec3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_7ec3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_7ec3_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l718_c7_7ec3]
signal n8_MUX_uxn_opcodes_h_l718_c7_7ec3_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l718_c7_7ec3_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l718_c7_7ec3_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l718_c7_7ec3_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l720_c30_d685]
signal sp_relative_shift_uxn_opcodes_h_l720_c30_d685_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l720_c30_d685_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l720_c30_d685_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l720_c30_d685_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l721_c26_c8a8]
signal BIN_OP_EQ_uxn_opcodes_h_l721_c26_c8a8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l721_c26_c8a8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l721_c26_c8a8_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l721_c26_5d1f]
signal MUX_uxn_opcodes_h_l721_c26_5d1f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l721_c26_5d1f_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l721_c26_5d1f_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l721_c26_5d1f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l722_c22_2770]
signal BIN_OP_EQ_uxn_opcodes_h_l722_c22_2770_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l722_c22_2770_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l722_c22_2770_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l722_c22_a9bd]
signal MUX_uxn_opcodes_h_l722_c22_a9bd_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l722_c22_a9bd_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l722_c22_a9bd_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l722_c22_a9bd_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_6c0a( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.u16_value := ref_toks_5;
      base.is_pc_updated := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l694_c6_fb38
BIN_OP_EQ_uxn_opcodes_h_l694_c6_fb38 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l694_c6_fb38_left,
BIN_OP_EQ_uxn_opcodes_h_l694_c6_fb38_right,
BIN_OP_EQ_uxn_opcodes_h_l694_c6_fb38_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_509a
result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_509a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_509a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_509a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_509a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_509a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_509a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_509a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_509a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_509a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_509a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_509a_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_509a
result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_509a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_509a_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_509a_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_509a_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_509a_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_509a
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_509a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_509a_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_509a_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_509a_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_509a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l694_c2_509a
result_u16_value_MUX_uxn_opcodes_h_l694_c2_509a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l694_c2_509a_cond,
result_u16_value_MUX_uxn_opcodes_h_l694_c2_509a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l694_c2_509a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l694_c2_509a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_509a
result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_509a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_509a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_509a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_509a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_509a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_509a
result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_509a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_509a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_509a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_509a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_509a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_509a
result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_509a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_509a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_509a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_509a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_509a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_509a
result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_509a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_509a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_509a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_509a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_509a_return_output);

-- t16_MUX_uxn_opcodes_h_l694_c2_509a
t16_MUX_uxn_opcodes_h_l694_c2_509a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l694_c2_509a_cond,
t16_MUX_uxn_opcodes_h_l694_c2_509a_iftrue,
t16_MUX_uxn_opcodes_h_l694_c2_509a_iffalse,
t16_MUX_uxn_opcodes_h_l694_c2_509a_return_output);

-- n8_MUX_uxn_opcodes_h_l694_c2_509a
n8_MUX_uxn_opcodes_h_l694_c2_509a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l694_c2_509a_cond,
n8_MUX_uxn_opcodes_h_l694_c2_509a_iftrue,
n8_MUX_uxn_opcodes_h_l694_c2_509a_iffalse,
n8_MUX_uxn_opcodes_h_l694_c2_509a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l707_c11_4d4f
BIN_OP_EQ_uxn_opcodes_h_l707_c11_4d4f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l707_c11_4d4f_left,
BIN_OP_EQ_uxn_opcodes_h_l707_c11_4d4f_right,
BIN_OP_EQ_uxn_opcodes_h_l707_c11_4d4f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_d7e0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_d7e0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_d7e0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_d7e0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_d7e0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l707_c7_d7e0
result_u16_value_MUX_uxn_opcodes_h_l707_c7_d7e0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l707_c7_d7e0_cond,
result_u16_value_MUX_uxn_opcodes_h_l707_c7_d7e0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l707_c7_d7e0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d7e0
result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d7e0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d7e0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d7e0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d7e0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d7e0
result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d7e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d7e0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d7e0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d7e0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d7e0
result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d7e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d7e0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d7e0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d7e0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output);

-- t16_MUX_uxn_opcodes_h_l707_c7_d7e0
t16_MUX_uxn_opcodes_h_l707_c7_d7e0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l707_c7_d7e0_cond,
t16_MUX_uxn_opcodes_h_l707_c7_d7e0_iftrue,
t16_MUX_uxn_opcodes_h_l707_c7_d7e0_iffalse,
t16_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output);

-- n8_MUX_uxn_opcodes_h_l707_c7_d7e0
n8_MUX_uxn_opcodes_h_l707_c7_d7e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l707_c7_d7e0_cond,
n8_MUX_uxn_opcodes_h_l707_c7_d7e0_iftrue,
n8_MUX_uxn_opcodes_h_l707_c7_d7e0_iffalse,
n8_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l710_c11_a421
BIN_OP_EQ_uxn_opcodes_h_l710_c11_a421 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l710_c11_a421_left,
BIN_OP_EQ_uxn_opcodes_h_l710_c11_a421_right,
BIN_OP_EQ_uxn_opcodes_h_l710_c11_a421_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_5946
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_5946 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_5946_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_5946_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_5946_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_5946_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l710_c7_5946
result_u16_value_MUX_uxn_opcodes_h_l710_c7_5946 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l710_c7_5946_cond,
result_u16_value_MUX_uxn_opcodes_h_l710_c7_5946_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l710_c7_5946_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l710_c7_5946_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_5946
result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_5946 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_5946_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_5946_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_5946_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_5946_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_5946
result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_5946 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_5946_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_5946_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_5946_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_5946_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_5946
result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_5946 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_5946_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_5946_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_5946_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_5946_return_output);

-- t16_MUX_uxn_opcodes_h_l710_c7_5946
t16_MUX_uxn_opcodes_h_l710_c7_5946 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l710_c7_5946_cond,
t16_MUX_uxn_opcodes_h_l710_c7_5946_iftrue,
t16_MUX_uxn_opcodes_h_l710_c7_5946_iffalse,
t16_MUX_uxn_opcodes_h_l710_c7_5946_return_output);

-- n8_MUX_uxn_opcodes_h_l710_c7_5946
n8_MUX_uxn_opcodes_h_l710_c7_5946 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l710_c7_5946_cond,
n8_MUX_uxn_opcodes_h_l710_c7_5946_iftrue,
n8_MUX_uxn_opcodes_h_l710_c7_5946_iffalse,
n8_MUX_uxn_opcodes_h_l710_c7_5946_return_output);

-- CONST_SL_8_uxn_opcodes_h_l712_c3_7ac4
CONST_SL_8_uxn_opcodes_h_l712_c3_7ac4 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l712_c3_7ac4_x,
CONST_SL_8_uxn_opcodes_h_l712_c3_7ac4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l715_c11_4854
BIN_OP_EQ_uxn_opcodes_h_l715_c11_4854 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l715_c11_4854_left,
BIN_OP_EQ_uxn_opcodes_h_l715_c11_4854_right,
BIN_OP_EQ_uxn_opcodes_h_l715_c11_4854_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l715_c7_d5f0
result_u16_value_MUX_uxn_opcodes_h_l715_c7_d5f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l715_c7_d5f0_cond,
result_u16_value_MUX_uxn_opcodes_h_l715_c7_d5f0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l715_c7_d5f0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l715_c7_d5f0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_d5f0
result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_d5f0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_d5f0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_d5f0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_d5f0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_d5f0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_d5f0
result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_d5f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_d5f0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_d5f0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_d5f0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_d5f0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_d5f0
result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_d5f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_d5f0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_d5f0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_d5f0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_d5f0_return_output);

-- t16_MUX_uxn_opcodes_h_l715_c7_d5f0
t16_MUX_uxn_opcodes_h_l715_c7_d5f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l715_c7_d5f0_cond,
t16_MUX_uxn_opcodes_h_l715_c7_d5f0_iftrue,
t16_MUX_uxn_opcodes_h_l715_c7_d5f0_iffalse,
t16_MUX_uxn_opcodes_h_l715_c7_d5f0_return_output);

-- n8_MUX_uxn_opcodes_h_l715_c7_d5f0
n8_MUX_uxn_opcodes_h_l715_c7_d5f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l715_c7_d5f0_cond,
n8_MUX_uxn_opcodes_h_l715_c7_d5f0_iftrue,
n8_MUX_uxn_opcodes_h_l715_c7_d5f0_iffalse,
n8_MUX_uxn_opcodes_h_l715_c7_d5f0_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l716_c3_54c6
BIN_OP_OR_uxn_opcodes_h_l716_c3_54c6 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l716_c3_54c6_left,
BIN_OP_OR_uxn_opcodes_h_l716_c3_54c6_right,
BIN_OP_OR_uxn_opcodes_h_l716_c3_54c6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l718_c11_84ff
BIN_OP_EQ_uxn_opcodes_h_l718_c11_84ff : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l718_c11_84ff_left,
BIN_OP_EQ_uxn_opcodes_h_l718_c11_84ff_right,
BIN_OP_EQ_uxn_opcodes_h_l718_c11_84ff_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l718_c7_7ec3
result_u16_value_MUX_uxn_opcodes_h_l718_c7_7ec3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l718_c7_7ec3_cond,
result_u16_value_MUX_uxn_opcodes_h_l718_c7_7ec3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l718_c7_7ec3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l718_c7_7ec3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_7ec3
result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_7ec3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_7ec3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_7ec3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_7ec3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_7ec3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_7ec3
result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_7ec3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_7ec3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_7ec3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_7ec3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_7ec3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_7ec3
result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_7ec3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_7ec3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_7ec3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_7ec3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_7ec3_return_output);

-- n8_MUX_uxn_opcodes_h_l718_c7_7ec3
n8_MUX_uxn_opcodes_h_l718_c7_7ec3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l718_c7_7ec3_cond,
n8_MUX_uxn_opcodes_h_l718_c7_7ec3_iftrue,
n8_MUX_uxn_opcodes_h_l718_c7_7ec3_iffalse,
n8_MUX_uxn_opcodes_h_l718_c7_7ec3_return_output);

-- sp_relative_shift_uxn_opcodes_h_l720_c30_d685
sp_relative_shift_uxn_opcodes_h_l720_c30_d685 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l720_c30_d685_ins,
sp_relative_shift_uxn_opcodes_h_l720_c30_d685_x,
sp_relative_shift_uxn_opcodes_h_l720_c30_d685_y,
sp_relative_shift_uxn_opcodes_h_l720_c30_d685_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l721_c26_c8a8
BIN_OP_EQ_uxn_opcodes_h_l721_c26_c8a8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l721_c26_c8a8_left,
BIN_OP_EQ_uxn_opcodes_h_l721_c26_c8a8_right,
BIN_OP_EQ_uxn_opcodes_h_l721_c26_c8a8_return_output);

-- MUX_uxn_opcodes_h_l721_c26_5d1f
MUX_uxn_opcodes_h_l721_c26_5d1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l721_c26_5d1f_cond,
MUX_uxn_opcodes_h_l721_c26_5d1f_iftrue,
MUX_uxn_opcodes_h_l721_c26_5d1f_iffalse,
MUX_uxn_opcodes_h_l721_c26_5d1f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l722_c22_2770
BIN_OP_EQ_uxn_opcodes_h_l722_c22_2770 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l722_c22_2770_left,
BIN_OP_EQ_uxn_opcodes_h_l722_c22_2770_right,
BIN_OP_EQ_uxn_opcodes_h_l722_c22_2770_return_output);

-- MUX_uxn_opcodes_h_l722_c22_a9bd
MUX_uxn_opcodes_h_l722_c22_a9bd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l722_c22_a9bd_cond,
MUX_uxn_opcodes_h_l722_c22_a9bd_iftrue,
MUX_uxn_opcodes_h_l722_c22_a9bd_iffalse,
MUX_uxn_opcodes_h_l722_c22_a9bd_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l694_c6_fb38_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_509a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_509a_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_509a_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_509a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l694_c2_509a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_509a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_509a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_509a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_509a_return_output,
 t16_MUX_uxn_opcodes_h_l694_c2_509a_return_output,
 n8_MUX_uxn_opcodes_h_l694_c2_509a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l707_c11_4d4f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output,
 t16_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output,
 n8_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l710_c11_a421_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_5946_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l710_c7_5946_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_5946_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_5946_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_5946_return_output,
 t16_MUX_uxn_opcodes_h_l710_c7_5946_return_output,
 n8_MUX_uxn_opcodes_h_l710_c7_5946_return_output,
 CONST_SL_8_uxn_opcodes_h_l712_c3_7ac4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l715_c11_4854_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l715_c7_d5f0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_d5f0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_d5f0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_d5f0_return_output,
 t16_MUX_uxn_opcodes_h_l715_c7_d5f0_return_output,
 n8_MUX_uxn_opcodes_h_l715_c7_d5f0_return_output,
 BIN_OP_OR_uxn_opcodes_h_l716_c3_54c6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l718_c11_84ff_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l718_c7_7ec3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_7ec3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_7ec3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_7ec3_return_output,
 n8_MUX_uxn_opcodes_h_l718_c7_7ec3_return_output,
 sp_relative_shift_uxn_opcodes_h_l720_c30_d685_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l721_c26_c8a8_return_output,
 MUX_uxn_opcodes_h_l721_c26_5d1f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l722_c22_2770_return_output,
 MUX_uxn_opcodes_h_l722_c22_a9bd_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_fb38_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_fb38_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_fb38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_509a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_509a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l694_c2_509a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_509a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_509a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_509a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l704_c3_2b64 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_509a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_509a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_509a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_509a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_509a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l694_c2_509a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_509a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_509a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_509a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_509a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l694_c2_509a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_509a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_509a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_509a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_509a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_509a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_509a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_509a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_509a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_509a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_509a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_509a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_509a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l694_c2_509a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_509a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_509a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_509a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l699_c3_b911 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_509a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_509a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_509a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_509a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_509a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_509a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_509a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l694_c2_509a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l694_c2_509a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l694_c2_509a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l694_c2_509a_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l694_c2_509a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l694_c2_509a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l694_c2_509a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l694_c2_509a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_4d4f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_4d4f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_4d4f_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_d7e0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l708_c3_cc2e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_d7e0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_5946_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_d7e0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_d7e0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_d7e0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_5946_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_d7e0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d7e0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d7e0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_5946_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d7e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d7e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d7e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_5946_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d7e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d7e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d7e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_5946_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d7e0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l707_c7_d7e0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l707_c7_d7e0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l710_c7_5946_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l707_c7_d7e0_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l707_c7_d7e0_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l707_c7_d7e0_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l710_c7_5946_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l707_c7_d7e0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_a421_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_a421_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_a421_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_5946_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l713_c3_03cf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_5946_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l710_c7_5946_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_5946_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_5946_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_5946_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_d5f0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_5946_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_5946_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_5946_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_d5f0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_5946_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_5946_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_5946_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_d5f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_5946_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_5946_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_5946_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_d5f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_5946_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l710_c7_5946_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l710_c7_5946_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l715_c7_d5f0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l710_c7_5946_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l710_c7_5946_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l710_c7_5946_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l715_c7_d5f0_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l710_c7_5946_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l712_c3_7ac4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l712_c3_7ac4_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_4854_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_4854_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_4854_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_d5f0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_d5f0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_7ec3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_d5f0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_d5f0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_d5f0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_7ec3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_d5f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_d5f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_d5f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_7ec3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_d5f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_d5f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_d5f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_7ec3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_d5f0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l715_c7_d5f0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l715_c7_d5f0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l715_c7_d5f0_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l715_c7_d5f0_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l715_c7_d5f0_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l718_c7_7ec3_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l715_c7_d5f0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l716_c3_54c6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l716_c3_54c6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l716_c3_54c6_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_84ff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_84ff_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_84ff_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_7ec3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_7ec3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_7ec3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_7ec3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_7ec3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_7ec3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_7ec3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_7ec3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_7ec3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_7ec3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_7ec3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_7ec3_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l718_c7_7ec3_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l718_c7_7ec3_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l718_c7_7ec3_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_d685_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_d685_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_d685_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_d685_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l721_c26_5d1f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c26_c8a8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c26_c8a8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c26_c8a8_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l721_c26_5d1f_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l721_c26_5d1f_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l721_c26_5d1f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l722_c22_a9bd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l722_c22_2770_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l722_c22_2770_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l722_c22_2770_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l722_c22_a9bd_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l722_c22_a9bd_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l722_c22_a9bd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l694_l718_l715_l710_l707_DUPLICATE_aa37_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l710_l715_l707_l718_DUPLICATE_f588_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l710_l715_l707_l718_DUPLICATE_32bf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l710_l715_l707_l718_DUPLICATE_4946_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l711_l716_DUPLICATE_2f73_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6c0a_uxn_opcodes_h_l726_l689_DUPLICATE_3583_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l713_c3_03cf := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_5946_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l713_c3_03cf;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_509a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_84ff_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c26_c8a8_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l722_c22_a9bd_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_4d4f_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_509a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_4854_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l699_c3_b911 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_509a_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l699_c3_b911;
     VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_d685_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_509a_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_7ec3_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l704_c3_2b64 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_509a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l704_c3_2b64;
     VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_d685_y := resize(to_signed(-3, 3), 4);
     VAR_MUX_uxn_opcodes_h_l721_c26_5d1f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_fb38_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l721_c26_5d1f_iffalse := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l708_c3_cc2e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_d7e0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l708_c3_cc2e;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_509a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_a421_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_509a_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_509a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l722_c22_2770_right := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_d685_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l694_c2_509a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l707_c7_d7e0_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l710_c7_5946_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l715_c7_d5f0_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l718_c7_7ec3_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_fb38_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_4d4f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_a421_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_4854_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_84ff_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c26_c8a8_left := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l722_c22_2770_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l718_c7_7ec3_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l716_c3_54c6_left := t16;
     VAR_MUX_uxn_opcodes_h_l722_c22_a9bd_iffalse := t16;
     VAR_t16_MUX_uxn_opcodes_h_l694_c2_509a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l707_c7_d7e0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l715_c7_d5f0_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l718_c11_84ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l718_c11_84ff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_84ff_left;
     BIN_OP_EQ_uxn_opcodes_h_l718_c11_84ff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_84ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_84ff_return_output := BIN_OP_EQ_uxn_opcodes_h_l718_c11_84ff_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l710_l715_l707_l718_DUPLICATE_4946 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l710_l715_l707_l718_DUPLICATE_4946_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l710_c11_a421] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l710_c11_a421_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_a421_left;
     BIN_OP_EQ_uxn_opcodes_h_l710_c11_a421_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_a421_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_a421_return_output := BIN_OP_EQ_uxn_opcodes_h_l710_c11_a421_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l720_c30_d685] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l720_c30_d685_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_d685_ins;
     sp_relative_shift_uxn_opcodes_h_l720_c30_d685_x <= VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_d685_x;
     sp_relative_shift_uxn_opcodes_h_l720_c30_d685_y <= VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_d685_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_d685_return_output := sp_relative_shift_uxn_opcodes_h_l720_c30_d685_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l694_c2_509a] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l694_c2_509a_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l715_c11_4854] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l715_c11_4854_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_4854_left;
     BIN_OP_EQ_uxn_opcodes_h_l715_c11_4854_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_4854_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_4854_return_output := BIN_OP_EQ_uxn_opcodes_h_l715_c11_4854_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l694_c2_509a] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l694_c2_509a_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l721_c26_c8a8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l721_c26_c8a8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c26_c8a8_left;
     BIN_OP_EQ_uxn_opcodes_h_l721_c26_c8a8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c26_c8a8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c26_c8a8_return_output := BIN_OP_EQ_uxn_opcodes_h_l721_c26_c8a8_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l711_l716_DUPLICATE_2f73 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l711_l716_DUPLICATE_2f73_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l707_c11_4d4f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l707_c11_4d4f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_4d4f_left;
     BIN_OP_EQ_uxn_opcodes_h_l707_c11_4d4f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_4d4f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_4d4f_return_output := BIN_OP_EQ_uxn_opcodes_h_l707_c11_4d4f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l694_c6_fb38] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l694_c6_fb38_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_fb38_left;
     BIN_OP_EQ_uxn_opcodes_h_l694_c6_fb38_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_fb38_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_fb38_return_output := BIN_OP_EQ_uxn_opcodes_h_l694_c6_fb38_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l722_c22_2770] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l722_c22_2770_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l722_c22_2770_left;
     BIN_OP_EQ_uxn_opcodes_h_l722_c22_2770_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l722_c22_2770_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l722_c22_2770_return_output := BIN_OP_EQ_uxn_opcodes_h_l722_c22_2770_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l710_c7_5946] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l710_c7_5946_return_output := result.stack_address_sp_offset;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l694_c2_509a] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l694_c2_509a_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l710_l715_l707_l718_DUPLICATE_32bf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l710_l715_l707_l718_DUPLICATE_32bf_return_output := result.is_opc_done;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l710_l715_l707_l718_DUPLICATE_f588 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l710_l715_l707_l718_DUPLICATE_f588_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l694_l718_l715_l710_l707_DUPLICATE_aa37 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l694_l718_l715_l710_l707_DUPLICATE_aa37_return_output := result.u16_value;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l694_c2_509a] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l694_c2_509a_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l694_c2_509a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_fb38_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_509a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_fb38_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_509a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_fb38_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_509a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_fb38_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_509a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_fb38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_509a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_fb38_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_509a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_fb38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_509a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_fb38_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_509a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_fb38_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_509a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_fb38_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l694_c2_509a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_fb38_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l707_c7_d7e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_4d4f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d7e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_4d4f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d7e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_4d4f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d7e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_4d4f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_d7e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_4d4f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_d7e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_4d4f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l707_c7_d7e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_4d4f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l710_c7_5946_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_a421_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_5946_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_a421_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_5946_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_a421_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_5946_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_a421_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_5946_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_a421_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_5946_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_a421_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l710_c7_5946_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_a421_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l715_c7_d5f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_4854_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_d5f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_4854_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_d5f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_4854_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_d5f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_4854_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_d5f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_4854_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l715_c7_d5f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_4854_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l718_c7_7ec3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_84ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_7ec3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_84ff_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_7ec3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_84ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_7ec3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_84ff_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_7ec3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_84ff_return_output;
     VAR_MUX_uxn_opcodes_h_l721_c26_5d1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c26_c8a8_return_output;
     VAR_MUX_uxn_opcodes_h_l722_c22_a9bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l722_c22_2770_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l716_c3_54c6_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l711_l716_DUPLICATE_2f73_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l712_c3_7ac4_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l711_l716_DUPLICATE_2f73_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d7e0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l710_l715_l707_l718_DUPLICATE_f588_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_5946_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l710_l715_l707_l718_DUPLICATE_f588_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_d5f0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l710_l715_l707_l718_DUPLICATE_f588_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_7ec3_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l710_l715_l707_l718_DUPLICATE_f588_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_509a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l694_l718_l715_l710_l707_DUPLICATE_aa37_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_d7e0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l694_l718_l715_l710_l707_DUPLICATE_aa37_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_5946_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l694_l718_l715_l710_l707_DUPLICATE_aa37_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_d5f0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l694_l718_l715_l710_l707_DUPLICATE_aa37_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_7ec3_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l694_l718_l715_l710_l707_DUPLICATE_aa37_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d7e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l710_l715_l707_l718_DUPLICATE_32bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_5946_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l710_l715_l707_l718_DUPLICATE_32bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_d5f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l710_l715_l707_l718_DUPLICATE_32bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_7ec3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l710_l715_l707_l718_DUPLICATE_32bf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d7e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l710_l715_l707_l718_DUPLICATE_4946_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_5946_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l710_l715_l707_l718_DUPLICATE_4946_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_d5f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l710_l715_l707_l718_DUPLICATE_4946_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_7ec3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l710_l715_l707_l718_DUPLICATE_4946_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_509a_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l694_c2_509a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_509a_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l694_c2_509a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_509a_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l694_c2_509a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_509a_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l694_c2_509a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_5946_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l710_c7_5946_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_7ec3_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_d685_return_output;
     -- CONST_SL_8[uxn_opcodes_h_l712_c3_7ac4] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l712_c3_7ac4_x <= VAR_CONST_SL_8_uxn_opcodes_h_l712_c3_7ac4_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l712_c3_7ac4_return_output := CONST_SL_8_uxn_opcodes_h_l712_c3_7ac4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l710_c7_5946] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_5946_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_5946_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_5946_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_5946_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_5946_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_5946_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_5946_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_5946_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l694_c2_509a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_509a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_509a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_509a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_509a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_509a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_509a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_509a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_509a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l716_c3_54c6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l716_c3_54c6_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l716_c3_54c6_left;
     BIN_OP_OR_uxn_opcodes_h_l716_c3_54c6_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l716_c3_54c6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l716_c3_54c6_return_output := BIN_OP_OR_uxn_opcodes_h_l716_c3_54c6_return_output;

     -- MUX[uxn_opcodes_h_l721_c26_5d1f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l721_c26_5d1f_cond <= VAR_MUX_uxn_opcodes_h_l721_c26_5d1f_cond;
     MUX_uxn_opcodes_h_l721_c26_5d1f_iftrue <= VAR_MUX_uxn_opcodes_h_l721_c26_5d1f_iftrue;
     MUX_uxn_opcodes_h_l721_c26_5d1f_iffalse <= VAR_MUX_uxn_opcodes_h_l721_c26_5d1f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l721_c26_5d1f_return_output := MUX_uxn_opcodes_h_l721_c26_5d1f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l694_c2_509a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_509a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_509a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_509a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_509a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_509a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_509a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_509a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_509a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l718_c7_7ec3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_7ec3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_7ec3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_7ec3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_7ec3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_7ec3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_7ec3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_7ec3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_7ec3_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l694_c2_509a] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_509a_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_509a_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_509a_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_509a_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_509a_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_509a_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_509a_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_509a_return_output;

     -- n8_MUX[uxn_opcodes_h_l718_c7_7ec3] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l718_c7_7ec3_cond <= VAR_n8_MUX_uxn_opcodes_h_l718_c7_7ec3_cond;
     n8_MUX_uxn_opcodes_h_l718_c7_7ec3_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l718_c7_7ec3_iftrue;
     n8_MUX_uxn_opcodes_h_l718_c7_7ec3_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l718_c7_7ec3_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l718_c7_7ec3_return_output := n8_MUX_uxn_opcodes_h_l718_c7_7ec3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l718_c7_7ec3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_7ec3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_7ec3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_7ec3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_7ec3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_7ec3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_7ec3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_7ec3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_7ec3_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l694_c2_509a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_509a_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_509a_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_509a_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_509a_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_509a_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_509a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_509a_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_509a_return_output;

     -- MUX[uxn_opcodes_h_l722_c22_a9bd] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l722_c22_a9bd_cond <= VAR_MUX_uxn_opcodes_h_l722_c22_a9bd_cond;
     MUX_uxn_opcodes_h_l722_c22_a9bd_iftrue <= VAR_MUX_uxn_opcodes_h_l722_c22_a9bd_iftrue;
     MUX_uxn_opcodes_h_l722_c22_a9bd_iffalse <= VAR_MUX_uxn_opcodes_h_l722_c22_a9bd_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l722_c22_a9bd_return_output := MUX_uxn_opcodes_h_l722_c22_a9bd_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l715_c7_d5f0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l716_c3_54c6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l710_c7_5946_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l712_c3_7ac4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_7ec3_iftrue := VAR_MUX_uxn_opcodes_h_l721_c26_5d1f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_7ec3_iftrue := VAR_MUX_uxn_opcodes_h_l722_c22_a9bd_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l715_c7_d5f0_iffalse := VAR_n8_MUX_uxn_opcodes_h_l718_c7_7ec3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_d5f0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_7ec3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_d5f0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_7ec3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_d7e0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_5946_return_output;
     -- t16_MUX[uxn_opcodes_h_l715_c7_d5f0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l715_c7_d5f0_cond <= VAR_t16_MUX_uxn_opcodes_h_l715_c7_d5f0_cond;
     t16_MUX_uxn_opcodes_h_l715_c7_d5f0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l715_c7_d5f0_iftrue;
     t16_MUX_uxn_opcodes_h_l715_c7_d5f0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l715_c7_d5f0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l715_c7_d5f0_return_output := t16_MUX_uxn_opcodes_h_l715_c7_d5f0_return_output;

     -- n8_MUX[uxn_opcodes_h_l715_c7_d5f0] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l715_c7_d5f0_cond <= VAR_n8_MUX_uxn_opcodes_h_l715_c7_d5f0_cond;
     n8_MUX_uxn_opcodes_h_l715_c7_d5f0_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l715_c7_d5f0_iftrue;
     n8_MUX_uxn_opcodes_h_l715_c7_d5f0_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l715_c7_d5f0_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l715_c7_d5f0_return_output := n8_MUX_uxn_opcodes_h_l715_c7_d5f0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l707_c7_d7e0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_d7e0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_d7e0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_d7e0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_d7e0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_d7e0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_d7e0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l715_c7_d5f0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_d5f0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_d5f0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_d5f0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_d5f0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_d5f0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_d5f0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_d5f0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_d5f0_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l718_c7_7ec3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l718_c7_7ec3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_7ec3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l718_c7_7ec3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_7ec3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l718_c7_7ec3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_7ec3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_7ec3_return_output := result_u16_value_MUX_uxn_opcodes_h_l718_c7_7ec3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l718_c7_7ec3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_7ec3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_7ec3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_7ec3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_7ec3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_7ec3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_7ec3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_7ec3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_7ec3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l715_c7_d5f0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_d5f0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_d5f0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_d5f0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_d5f0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_d5f0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_d5f0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_d5f0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_d5f0_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l710_c7_5946_iffalse := VAR_n8_MUX_uxn_opcodes_h_l715_c7_d5f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_5946_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_d5f0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_d5f0_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_7ec3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_5946_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_d5f0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_509a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_d5f0_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_7ec3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l710_c7_5946_iffalse := VAR_t16_MUX_uxn_opcodes_h_l715_c7_d5f0_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l710_c7_5946] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_5946_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_5946_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_5946_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_5946_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_5946_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_5946_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_5946_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_5946_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l694_c2_509a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_509a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_509a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_509a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_509a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_509a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_509a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_509a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_509a_return_output;

     -- t16_MUX[uxn_opcodes_h_l710_c7_5946] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l710_c7_5946_cond <= VAR_t16_MUX_uxn_opcodes_h_l710_c7_5946_cond;
     t16_MUX_uxn_opcodes_h_l710_c7_5946_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l710_c7_5946_iftrue;
     t16_MUX_uxn_opcodes_h_l710_c7_5946_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l710_c7_5946_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l710_c7_5946_return_output := t16_MUX_uxn_opcodes_h_l710_c7_5946_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l710_c7_5946] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_5946_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_5946_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_5946_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_5946_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_5946_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_5946_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_5946_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_5946_return_output;

     -- n8_MUX[uxn_opcodes_h_l710_c7_5946] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l710_c7_5946_cond <= VAR_n8_MUX_uxn_opcodes_h_l710_c7_5946_cond;
     n8_MUX_uxn_opcodes_h_l710_c7_5946_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l710_c7_5946_iftrue;
     n8_MUX_uxn_opcodes_h_l710_c7_5946_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l710_c7_5946_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l710_c7_5946_return_output := n8_MUX_uxn_opcodes_h_l710_c7_5946_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l715_c7_d5f0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_d5f0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_d5f0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_d5f0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_d5f0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_d5f0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_d5f0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_d5f0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_d5f0_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l715_c7_d5f0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l715_c7_d5f0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_d5f0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l715_c7_d5f0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_d5f0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l715_c7_d5f0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_d5f0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_d5f0_return_output := result_u16_value_MUX_uxn_opcodes_h_l715_c7_d5f0_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l707_c7_d7e0_iffalse := VAR_n8_MUX_uxn_opcodes_h_l710_c7_5946_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d7e0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_5946_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_5946_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_d5f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d7e0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_5946_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_5946_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_d5f0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l707_c7_d7e0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l710_c7_5946_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l710_c7_5946] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l710_c7_5946_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_5946_cond;
     result_u16_value_MUX_uxn_opcodes_h_l710_c7_5946_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_5946_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l710_c7_5946_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_5946_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_5946_return_output := result_u16_value_MUX_uxn_opcodes_h_l710_c7_5946_return_output;

     -- n8_MUX[uxn_opcodes_h_l707_c7_d7e0] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l707_c7_d7e0_cond <= VAR_n8_MUX_uxn_opcodes_h_l707_c7_d7e0_cond;
     n8_MUX_uxn_opcodes_h_l707_c7_d7e0_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l707_c7_d7e0_iftrue;
     n8_MUX_uxn_opcodes_h_l707_c7_d7e0_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l707_c7_d7e0_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output := n8_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output;

     -- t16_MUX[uxn_opcodes_h_l707_c7_d7e0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l707_c7_d7e0_cond <= VAR_t16_MUX_uxn_opcodes_h_l707_c7_d7e0_cond;
     t16_MUX_uxn_opcodes_h_l707_c7_d7e0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l707_c7_d7e0_iftrue;
     t16_MUX_uxn_opcodes_h_l707_c7_d7e0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l707_c7_d7e0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output := t16_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l710_c7_5946] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_5946_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_5946_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_5946_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_5946_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_5946_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_5946_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_5946_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_5946_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l707_c7_d7e0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d7e0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d7e0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d7e0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d7e0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d7e0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d7e0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l707_c7_d7e0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d7e0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d7e0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d7e0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d7e0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d7e0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d7e0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l694_c2_509a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_509a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d7e0_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_5946_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_509a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_d7e0_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_5946_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l694_c2_509a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output;
     -- t16_MUX[uxn_opcodes_h_l694_c2_509a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l694_c2_509a_cond <= VAR_t16_MUX_uxn_opcodes_h_l694_c2_509a_cond;
     t16_MUX_uxn_opcodes_h_l694_c2_509a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l694_c2_509a_iftrue;
     t16_MUX_uxn_opcodes_h_l694_c2_509a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l694_c2_509a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l694_c2_509a_return_output := t16_MUX_uxn_opcodes_h_l694_c2_509a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l707_c7_d7e0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d7e0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d7e0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d7e0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d7e0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d7e0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d7e0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l694_c2_509a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_509a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_509a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_509a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_509a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_509a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_509a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_509a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_509a_return_output;

     -- n8_MUX[uxn_opcodes_h_l694_c2_509a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l694_c2_509a_cond <= VAR_n8_MUX_uxn_opcodes_h_l694_c2_509a_cond;
     n8_MUX_uxn_opcodes_h_l694_c2_509a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l694_c2_509a_iftrue;
     n8_MUX_uxn_opcodes_h_l694_c2_509a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l694_c2_509a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l694_c2_509a_return_output := n8_MUX_uxn_opcodes_h_l694_c2_509a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l694_c2_509a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_509a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_509a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_509a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_509a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_509a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_509a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_509a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_509a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l707_c7_d7e0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l707_c7_d7e0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_d7e0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l707_c7_d7e0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_d7e0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l707_c7_d7e0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_d7e0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output := result_u16_value_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l694_c2_509a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_509a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_509a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_d7e0_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l694_c2_509a_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l694_c2_509a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_509a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_509a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_509a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_509a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_509a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_509a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_509a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_509a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l694_c2_509a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l694_c2_509a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_509a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l694_c2_509a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_509a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l694_c2_509a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_509a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_509a_return_output := result_u16_value_MUX_uxn_opcodes_h_l694_c2_509a_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6c0a_uxn_opcodes_h_l726_l689_DUPLICATE_3583 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6c0a_uxn_opcodes_h_l726_l689_DUPLICATE_3583_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6c0a(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_509a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_509a_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_509a_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_509a_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_509a_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_509a_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_509a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_509a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_509a_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6c0a_uxn_opcodes_h_l726_l689_DUPLICATE_3583_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6c0a_uxn_opcodes_h_l726_l689_DUPLICATE_3583_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
