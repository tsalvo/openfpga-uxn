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
-- BIN_OP_EQ[uxn_opcodes_h_l694_c6_1518]
signal BIN_OP_EQ_uxn_opcodes_h_l694_c6_1518_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l694_c6_1518_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l694_c6_1518_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l694_c2_c915]
signal t16_MUX_uxn_opcodes_h_l694_c2_c915_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l694_c2_c915_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l694_c2_c915_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l694_c2_c915_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l694_c2_c915]
signal n8_MUX_uxn_opcodes_h_l694_c2_c915_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l694_c2_c915_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l694_c2_c915_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l694_c2_c915_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l694_c2_c915]
signal result_u16_value_MUX_uxn_opcodes_h_l694_c2_c915_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l694_c2_c915_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l694_c2_c915_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l694_c2_c915_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l694_c2_c915]
signal result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_c915_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_c915_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_c915_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_c915_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l694_c2_c915]
signal result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_c915_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_c915_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_c915_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_c915_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l694_c2_c915]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_c915_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_c915_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_c915_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_c915_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l694_c2_c915]
signal result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_c915_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_c915_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_c915_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_c915_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l694_c2_c915]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_c915_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_c915_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_c915_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_c915_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l694_c2_c915]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_c915_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_c915_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_c915_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_c915_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l694_c2_c915]
signal result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_c915_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_c915_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_c915_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_c915_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l694_c2_c915]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_c915_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_c915_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_c915_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_c915_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l707_c11_6f2a]
signal BIN_OP_EQ_uxn_opcodes_h_l707_c11_6f2a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l707_c11_6f2a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l707_c11_6f2a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l707_c7_f837]
signal t16_MUX_uxn_opcodes_h_l707_c7_f837_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l707_c7_f837_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l707_c7_f837_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l707_c7_f837_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l707_c7_f837]
signal n8_MUX_uxn_opcodes_h_l707_c7_f837_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l707_c7_f837_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l707_c7_f837_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l707_c7_f837_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l707_c7_f837]
signal result_u16_value_MUX_uxn_opcodes_h_l707_c7_f837_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l707_c7_f837_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l707_c7_f837_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l707_c7_f837_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l707_c7_f837]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_f837_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_f837_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_f837_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_f837_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l707_c7_f837]
signal result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_f837_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_f837_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_f837_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_f837_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l707_c7_f837]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_f837_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_f837_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_f837_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_f837_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l707_c7_f837]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_f837_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_f837_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_f837_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_f837_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l710_c11_c821]
signal BIN_OP_EQ_uxn_opcodes_h_l710_c11_c821_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l710_c11_c821_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l710_c11_c821_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l710_c7_a9f4]
signal t16_MUX_uxn_opcodes_h_l710_c7_a9f4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l710_c7_a9f4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l710_c7_a9f4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l710_c7_a9f4]
signal n8_MUX_uxn_opcodes_h_l710_c7_a9f4_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l710_c7_a9f4_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l710_c7_a9f4_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l710_c7_a9f4]
signal result_u16_value_MUX_uxn_opcodes_h_l710_c7_a9f4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l710_c7_a9f4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l710_c7_a9f4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l710_c7_a9f4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_a9f4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_a9f4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_a9f4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l710_c7_a9f4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_a9f4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_a9f4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_a9f4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l710_c7_a9f4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_a9f4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_a9f4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_a9f4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l710_c7_a9f4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_a9f4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_a9f4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_a9f4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output : unsigned(3 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l712_c3_7c15]
signal CONST_SL_8_uxn_opcodes_h_l712_c3_7c15_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l712_c3_7c15_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l715_c11_5f0f]
signal BIN_OP_EQ_uxn_opcodes_h_l715_c11_5f0f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l715_c11_5f0f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l715_c11_5f0f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l715_c7_ba5e]
signal t16_MUX_uxn_opcodes_h_l715_c7_ba5e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l715_c7_ba5e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l715_c7_ba5e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l715_c7_ba5e_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l715_c7_ba5e]
signal n8_MUX_uxn_opcodes_h_l715_c7_ba5e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l715_c7_ba5e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l715_c7_ba5e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l715_c7_ba5e_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l715_c7_ba5e]
signal result_u16_value_MUX_uxn_opcodes_h_l715_c7_ba5e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l715_c7_ba5e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l715_c7_ba5e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l715_c7_ba5e_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l715_c7_ba5e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_ba5e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_ba5e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_ba5e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_ba5e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l715_c7_ba5e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_ba5e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_ba5e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_ba5e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_ba5e_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l715_c7_ba5e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_ba5e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_ba5e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_ba5e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_ba5e_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l716_c3_d5cf]
signal BIN_OP_OR_uxn_opcodes_h_l716_c3_d5cf_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l716_c3_d5cf_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l716_c3_d5cf_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l718_c11_152f]
signal BIN_OP_EQ_uxn_opcodes_h_l718_c11_152f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l718_c11_152f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l718_c11_152f_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l718_c7_110d]
signal n8_MUX_uxn_opcodes_h_l718_c7_110d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l718_c7_110d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l718_c7_110d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l718_c7_110d_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l718_c7_110d]
signal result_u16_value_MUX_uxn_opcodes_h_l718_c7_110d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l718_c7_110d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l718_c7_110d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l718_c7_110d_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l718_c7_110d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_110d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_110d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_110d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_110d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l718_c7_110d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_110d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_110d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_110d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_110d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l718_c7_110d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_110d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_110d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_110d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_110d_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l720_c30_f630]
signal sp_relative_shift_uxn_opcodes_h_l720_c30_f630_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l720_c30_f630_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l720_c30_f630_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l720_c30_f630_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l721_c26_249a]
signal BIN_OP_EQ_uxn_opcodes_h_l721_c26_249a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l721_c26_249a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l721_c26_249a_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l721_c26_a409]
signal MUX_uxn_opcodes_h_l721_c26_a409_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l721_c26_a409_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l721_c26_a409_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l721_c26_a409_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l722_c22_a9ab]
signal BIN_OP_EQ_uxn_opcodes_h_l722_c22_a9ab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l722_c22_a9ab_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l722_c22_a9ab_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l722_c22_1482]
signal MUX_uxn_opcodes_h_l722_c22_1482_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l722_c22_1482_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l722_c22_1482_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l722_c22_1482_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_3dff( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_vram_write := ref_toks_8;
      base.is_pc_updated := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l694_c6_1518
BIN_OP_EQ_uxn_opcodes_h_l694_c6_1518 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l694_c6_1518_left,
BIN_OP_EQ_uxn_opcodes_h_l694_c6_1518_right,
BIN_OP_EQ_uxn_opcodes_h_l694_c6_1518_return_output);

-- t16_MUX_uxn_opcodes_h_l694_c2_c915
t16_MUX_uxn_opcodes_h_l694_c2_c915 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l694_c2_c915_cond,
t16_MUX_uxn_opcodes_h_l694_c2_c915_iftrue,
t16_MUX_uxn_opcodes_h_l694_c2_c915_iffalse,
t16_MUX_uxn_opcodes_h_l694_c2_c915_return_output);

-- n8_MUX_uxn_opcodes_h_l694_c2_c915
n8_MUX_uxn_opcodes_h_l694_c2_c915 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l694_c2_c915_cond,
n8_MUX_uxn_opcodes_h_l694_c2_c915_iftrue,
n8_MUX_uxn_opcodes_h_l694_c2_c915_iffalse,
n8_MUX_uxn_opcodes_h_l694_c2_c915_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l694_c2_c915
result_u16_value_MUX_uxn_opcodes_h_l694_c2_c915 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l694_c2_c915_cond,
result_u16_value_MUX_uxn_opcodes_h_l694_c2_c915_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l694_c2_c915_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l694_c2_c915_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_c915
result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_c915 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_c915_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_c915_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_c915_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_c915_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_c915
result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_c915 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_c915_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_c915_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_c915_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_c915_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_c915
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_c915 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_c915_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_c915_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_c915_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_c915_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_c915
result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_c915 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_c915_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_c915_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_c915_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_c915_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_c915
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_c915 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_c915_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_c915_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_c915_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_c915_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_c915
result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_c915 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_c915_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_c915_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_c915_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_c915_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_c915
result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_c915 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_c915_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_c915_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_c915_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_c915_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_c915
result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_c915 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_c915_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_c915_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_c915_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_c915_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l707_c11_6f2a
BIN_OP_EQ_uxn_opcodes_h_l707_c11_6f2a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l707_c11_6f2a_left,
BIN_OP_EQ_uxn_opcodes_h_l707_c11_6f2a_right,
BIN_OP_EQ_uxn_opcodes_h_l707_c11_6f2a_return_output);

-- t16_MUX_uxn_opcodes_h_l707_c7_f837
t16_MUX_uxn_opcodes_h_l707_c7_f837 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l707_c7_f837_cond,
t16_MUX_uxn_opcodes_h_l707_c7_f837_iftrue,
t16_MUX_uxn_opcodes_h_l707_c7_f837_iffalse,
t16_MUX_uxn_opcodes_h_l707_c7_f837_return_output);

-- n8_MUX_uxn_opcodes_h_l707_c7_f837
n8_MUX_uxn_opcodes_h_l707_c7_f837 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l707_c7_f837_cond,
n8_MUX_uxn_opcodes_h_l707_c7_f837_iftrue,
n8_MUX_uxn_opcodes_h_l707_c7_f837_iffalse,
n8_MUX_uxn_opcodes_h_l707_c7_f837_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l707_c7_f837
result_u16_value_MUX_uxn_opcodes_h_l707_c7_f837 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l707_c7_f837_cond,
result_u16_value_MUX_uxn_opcodes_h_l707_c7_f837_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l707_c7_f837_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l707_c7_f837_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_f837
result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_f837 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_f837_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_f837_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_f837_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_f837_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_f837
result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_f837 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_f837_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_f837_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_f837_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_f837_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_f837
result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_f837 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_f837_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_f837_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_f837_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_f837_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_f837
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_f837 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_f837_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_f837_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_f837_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_f837_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l710_c11_c821
BIN_OP_EQ_uxn_opcodes_h_l710_c11_c821 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l710_c11_c821_left,
BIN_OP_EQ_uxn_opcodes_h_l710_c11_c821_right,
BIN_OP_EQ_uxn_opcodes_h_l710_c11_c821_return_output);

-- t16_MUX_uxn_opcodes_h_l710_c7_a9f4
t16_MUX_uxn_opcodes_h_l710_c7_a9f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l710_c7_a9f4_cond,
t16_MUX_uxn_opcodes_h_l710_c7_a9f4_iftrue,
t16_MUX_uxn_opcodes_h_l710_c7_a9f4_iffalse,
t16_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output);

-- n8_MUX_uxn_opcodes_h_l710_c7_a9f4
n8_MUX_uxn_opcodes_h_l710_c7_a9f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l710_c7_a9f4_cond,
n8_MUX_uxn_opcodes_h_l710_c7_a9f4_iftrue,
n8_MUX_uxn_opcodes_h_l710_c7_a9f4_iffalse,
n8_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l710_c7_a9f4
result_u16_value_MUX_uxn_opcodes_h_l710_c7_a9f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l710_c7_a9f4_cond,
result_u16_value_MUX_uxn_opcodes_h_l710_c7_a9f4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l710_c7_a9f4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_a9f4
result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_a9f4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_a9f4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_a9f4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_a9f4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_a9f4
result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_a9f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_a9f4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_a9f4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_a9f4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_a9f4
result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_a9f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_a9f4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_a9f4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_a9f4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_a9f4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_a9f4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_a9f4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_a9f4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_a9f4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output);

-- CONST_SL_8_uxn_opcodes_h_l712_c3_7c15
CONST_SL_8_uxn_opcodes_h_l712_c3_7c15 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l712_c3_7c15_x,
CONST_SL_8_uxn_opcodes_h_l712_c3_7c15_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l715_c11_5f0f
BIN_OP_EQ_uxn_opcodes_h_l715_c11_5f0f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l715_c11_5f0f_left,
BIN_OP_EQ_uxn_opcodes_h_l715_c11_5f0f_right,
BIN_OP_EQ_uxn_opcodes_h_l715_c11_5f0f_return_output);

-- t16_MUX_uxn_opcodes_h_l715_c7_ba5e
t16_MUX_uxn_opcodes_h_l715_c7_ba5e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l715_c7_ba5e_cond,
t16_MUX_uxn_opcodes_h_l715_c7_ba5e_iftrue,
t16_MUX_uxn_opcodes_h_l715_c7_ba5e_iffalse,
t16_MUX_uxn_opcodes_h_l715_c7_ba5e_return_output);

-- n8_MUX_uxn_opcodes_h_l715_c7_ba5e
n8_MUX_uxn_opcodes_h_l715_c7_ba5e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l715_c7_ba5e_cond,
n8_MUX_uxn_opcodes_h_l715_c7_ba5e_iftrue,
n8_MUX_uxn_opcodes_h_l715_c7_ba5e_iffalse,
n8_MUX_uxn_opcodes_h_l715_c7_ba5e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l715_c7_ba5e
result_u16_value_MUX_uxn_opcodes_h_l715_c7_ba5e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l715_c7_ba5e_cond,
result_u16_value_MUX_uxn_opcodes_h_l715_c7_ba5e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l715_c7_ba5e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l715_c7_ba5e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_ba5e
result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_ba5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_ba5e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_ba5e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_ba5e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_ba5e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_ba5e
result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_ba5e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_ba5e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_ba5e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_ba5e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_ba5e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_ba5e
result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_ba5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_ba5e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_ba5e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_ba5e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_ba5e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l716_c3_d5cf
BIN_OP_OR_uxn_opcodes_h_l716_c3_d5cf : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l716_c3_d5cf_left,
BIN_OP_OR_uxn_opcodes_h_l716_c3_d5cf_right,
BIN_OP_OR_uxn_opcodes_h_l716_c3_d5cf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l718_c11_152f
BIN_OP_EQ_uxn_opcodes_h_l718_c11_152f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l718_c11_152f_left,
BIN_OP_EQ_uxn_opcodes_h_l718_c11_152f_right,
BIN_OP_EQ_uxn_opcodes_h_l718_c11_152f_return_output);

-- n8_MUX_uxn_opcodes_h_l718_c7_110d
n8_MUX_uxn_opcodes_h_l718_c7_110d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l718_c7_110d_cond,
n8_MUX_uxn_opcodes_h_l718_c7_110d_iftrue,
n8_MUX_uxn_opcodes_h_l718_c7_110d_iffalse,
n8_MUX_uxn_opcodes_h_l718_c7_110d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l718_c7_110d
result_u16_value_MUX_uxn_opcodes_h_l718_c7_110d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l718_c7_110d_cond,
result_u16_value_MUX_uxn_opcodes_h_l718_c7_110d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l718_c7_110d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l718_c7_110d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_110d
result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_110d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_110d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_110d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_110d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_110d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_110d
result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_110d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_110d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_110d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_110d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_110d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_110d
result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_110d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_110d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_110d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_110d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_110d_return_output);

-- sp_relative_shift_uxn_opcodes_h_l720_c30_f630
sp_relative_shift_uxn_opcodes_h_l720_c30_f630 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l720_c30_f630_ins,
sp_relative_shift_uxn_opcodes_h_l720_c30_f630_x,
sp_relative_shift_uxn_opcodes_h_l720_c30_f630_y,
sp_relative_shift_uxn_opcodes_h_l720_c30_f630_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l721_c26_249a
BIN_OP_EQ_uxn_opcodes_h_l721_c26_249a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l721_c26_249a_left,
BIN_OP_EQ_uxn_opcodes_h_l721_c26_249a_right,
BIN_OP_EQ_uxn_opcodes_h_l721_c26_249a_return_output);

-- MUX_uxn_opcodes_h_l721_c26_a409
MUX_uxn_opcodes_h_l721_c26_a409 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l721_c26_a409_cond,
MUX_uxn_opcodes_h_l721_c26_a409_iftrue,
MUX_uxn_opcodes_h_l721_c26_a409_iffalse,
MUX_uxn_opcodes_h_l721_c26_a409_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l722_c22_a9ab
BIN_OP_EQ_uxn_opcodes_h_l722_c22_a9ab : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l722_c22_a9ab_left,
BIN_OP_EQ_uxn_opcodes_h_l722_c22_a9ab_right,
BIN_OP_EQ_uxn_opcodes_h_l722_c22_a9ab_return_output);

-- MUX_uxn_opcodes_h_l722_c22_1482
MUX_uxn_opcodes_h_l722_c22_1482 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l722_c22_1482_cond,
MUX_uxn_opcodes_h_l722_c22_1482_iftrue,
MUX_uxn_opcodes_h_l722_c22_1482_iffalse,
MUX_uxn_opcodes_h_l722_c22_1482_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l694_c6_1518_return_output,
 t16_MUX_uxn_opcodes_h_l694_c2_c915_return_output,
 n8_MUX_uxn_opcodes_h_l694_c2_c915_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l694_c2_c915_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_c915_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_c915_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_c915_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_c915_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_c915_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_c915_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_c915_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_c915_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l707_c11_6f2a_return_output,
 t16_MUX_uxn_opcodes_h_l707_c7_f837_return_output,
 n8_MUX_uxn_opcodes_h_l707_c7_f837_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l707_c7_f837_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_f837_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_f837_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_f837_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_f837_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l710_c11_c821_return_output,
 t16_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output,
 n8_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output,
 CONST_SL_8_uxn_opcodes_h_l712_c3_7c15_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l715_c11_5f0f_return_output,
 t16_MUX_uxn_opcodes_h_l715_c7_ba5e_return_output,
 n8_MUX_uxn_opcodes_h_l715_c7_ba5e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l715_c7_ba5e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_ba5e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_ba5e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_ba5e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l716_c3_d5cf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l718_c11_152f_return_output,
 n8_MUX_uxn_opcodes_h_l718_c7_110d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l718_c7_110d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_110d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_110d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_110d_return_output,
 sp_relative_shift_uxn_opcodes_h_l720_c30_f630_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l721_c26_249a_return_output,
 MUX_uxn_opcodes_h_l721_c26_a409_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l722_c22_a9ab_return_output,
 MUX_uxn_opcodes_h_l722_c22_1482_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_1518_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_1518_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_1518_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l694_c2_c915_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l694_c2_c915_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l707_c7_f837_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l694_c2_c915_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l694_c2_c915_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l694_c2_c915_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l694_c2_c915_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l707_c7_f837_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l694_c2_c915_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l694_c2_c915_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_c915_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_c915_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_f837_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_c915_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_c915_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_c915_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_c915_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_f837_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_c915_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_c915_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_c915_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_c915_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l694_c2_c915_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_c915_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_c915_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_c915_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l704_c3_a5b8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_c915_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_f837_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_c915_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_c915_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_c915_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_c915_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l694_c2_c915_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_c915_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_c915_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_c915_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_c915_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l694_c2_c915_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_c915_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_c915_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_c915_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l699_c3_60df : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_c915_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_f837_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_c915_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_c915_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_c915_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_c915_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l694_c2_c915_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_c915_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_c915_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_c915_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_c915_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_f837_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_c915_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_c915_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_6f2a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_6f2a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_6f2a_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l707_c7_f837_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l707_c7_f837_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l707_c7_f837_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l707_c7_f837_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l707_c7_f837_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l707_c7_f837_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_f837_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_f837_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_f837_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_f837_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_f837_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_f837_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_f837_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_f837_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_f837_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_f837_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_f837_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_f837_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_f837_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l708_c3_6da9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_f837_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_f837_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_c821_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_c821_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_c821_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l710_c7_a9f4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l710_c7_a9f4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l715_c7_ba5e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l710_c7_a9f4_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l710_c7_a9f4_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l710_c7_a9f4_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l715_c7_ba5e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l710_c7_a9f4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_a9f4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_a9f4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_ba5e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_a9f4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_a9f4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_a9f4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_ba5e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_a9f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_a9f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_a9f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_ba5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_a9f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_a9f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_a9f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_ba5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_a9f4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_a9f4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l713_c3_8616 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_a9f4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l710_c7_a9f4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_a9f4_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l712_c3_7c15_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l712_c3_7c15_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_5f0f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_5f0f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_5f0f_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l715_c7_ba5e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l715_c7_ba5e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l715_c7_ba5e_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l715_c7_ba5e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l715_c7_ba5e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l718_c7_110d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l715_c7_ba5e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_ba5e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_ba5e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_110d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_ba5e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_ba5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_ba5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_110d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_ba5e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_ba5e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_ba5e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_110d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_ba5e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_ba5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_ba5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_110d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_ba5e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l716_c3_d5cf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l716_c3_d5cf_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l716_c3_d5cf_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_152f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_152f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_152f_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l718_c7_110d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l718_c7_110d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l718_c7_110d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_110d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_110d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_110d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_110d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_110d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_110d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_110d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_110d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_110d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_110d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_110d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_110d_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_f630_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_f630_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_f630_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_f630_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l721_c26_a409_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c26_249a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c26_249a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c26_249a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l721_c26_a409_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l721_c26_a409_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l721_c26_a409_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l722_c22_1482_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l722_c22_a9ab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l722_c22_a9ab_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l722_c22_a9ab_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l722_c22_1482_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l722_c22_1482_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l722_c22_1482_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l718_l715_l710_l707_l694_DUPLICATE_b5be_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l718_l710_l715_l707_DUPLICATE_51bd_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l718_l710_l715_l707_DUPLICATE_e9a2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l718_l710_l715_l707_DUPLICATE_4d5c_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l711_l716_DUPLICATE_cedc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3dff_uxn_opcodes_h_l726_l689_DUPLICATE_3a72_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l708_c3_6da9 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_f837_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l708_c3_6da9;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_c915_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c26_249a_right := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_c915_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_c915_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_c915_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_f630_y := resize(to_signed(-3, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l704_c3_a5b8 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_c915_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l704_c3_a5b8;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_c915_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_6f2a_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l722_c22_a9ab_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_110d_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l713_c3_8616 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_a9f4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l713_c3_8616;
     VAR_MUX_uxn_opcodes_h_l722_c22_1482_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_152f_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_f630_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_c821_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_1518_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l699_c3_60df := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_c915_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l699_c3_60df;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_c915_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l721_c26_a409_iffalse := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l721_c26_a409_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_5f0f_right := to_unsigned(3, 2);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_f630_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l694_c2_c915_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l707_c7_f837_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l710_c7_a9f4_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l715_c7_ba5e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l718_c7_110d_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_1518_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_6f2a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_c821_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_5f0f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_152f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c26_249a_left := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l722_c22_a9ab_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l718_c7_110d_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l716_c3_d5cf_left := t16;
     VAR_MUX_uxn_opcodes_h_l722_c22_1482_iffalse := t16;
     VAR_t16_MUX_uxn_opcodes_h_l694_c2_c915_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l707_c7_f837_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l715_c7_ba5e_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l710_c11_c821] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l710_c11_c821_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_c821_left;
     BIN_OP_EQ_uxn_opcodes_h_l710_c11_c821_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_c821_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_c821_return_output := BIN_OP_EQ_uxn_opcodes_h_l710_c11_c821_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l722_c22_a9ab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l722_c22_a9ab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l722_c22_a9ab_left;
     BIN_OP_EQ_uxn_opcodes_h_l722_c22_a9ab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l722_c22_a9ab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l722_c22_a9ab_return_output := BIN_OP_EQ_uxn_opcodes_h_l722_c22_a9ab_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l694_c2_c915] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l694_c2_c915_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l715_c11_5f0f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l715_c11_5f0f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_5f0f_left;
     BIN_OP_EQ_uxn_opcodes_h_l715_c11_5f0f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_5f0f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_5f0f_return_output := BIN_OP_EQ_uxn_opcodes_h_l715_c11_5f0f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l721_c26_249a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l721_c26_249a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c26_249a_left;
     BIN_OP_EQ_uxn_opcodes_h_l721_c26_249a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c26_249a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c26_249a_return_output := BIN_OP_EQ_uxn_opcodes_h_l721_c26_249a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l718_c11_152f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l718_c11_152f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_152f_left;
     BIN_OP_EQ_uxn_opcodes_h_l718_c11_152f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_152f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_152f_return_output := BIN_OP_EQ_uxn_opcodes_h_l718_c11_152f_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l711_l716_DUPLICATE_cedc LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l711_l716_DUPLICATE_cedc_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l694_c2_c915] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l694_c2_c915_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l718_l710_l715_l707_DUPLICATE_4d5c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l718_l710_l715_l707_DUPLICATE_4d5c_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l718_l710_l715_l707_DUPLICATE_e9a2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l718_l710_l715_l707_DUPLICATE_e9a2_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l718_l715_l710_l707_l694_DUPLICATE_b5be LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l718_l715_l710_l707_l694_DUPLICATE_b5be_return_output := result.u16_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l718_l710_l715_l707_DUPLICATE_51bd LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l718_l710_l715_l707_DUPLICATE_51bd_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l720_c30_f630] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l720_c30_f630_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_f630_ins;
     sp_relative_shift_uxn_opcodes_h_l720_c30_f630_x <= VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_f630_x;
     sp_relative_shift_uxn_opcodes_h_l720_c30_f630_y <= VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_f630_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_f630_return_output := sp_relative_shift_uxn_opcodes_h_l720_c30_f630_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l710_c7_a9f4] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l710_c7_a9f4_return_output := result.stack_address_sp_offset;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l694_c2_c915] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l694_c2_c915_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l707_c11_6f2a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l707_c11_6f2a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_6f2a_left;
     BIN_OP_EQ_uxn_opcodes_h_l707_c11_6f2a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_6f2a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_6f2a_return_output := BIN_OP_EQ_uxn_opcodes_h_l707_c11_6f2a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l694_c6_1518] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l694_c6_1518_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_1518_left;
     BIN_OP_EQ_uxn_opcodes_h_l694_c6_1518_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_1518_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_1518_return_output := BIN_OP_EQ_uxn_opcodes_h_l694_c6_1518_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l694_c2_c915] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l694_c2_c915_return_output := result.is_ram_write;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l694_c2_c915_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_1518_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_c915_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_1518_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_c915_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_1518_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_c915_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_1518_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_c915_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_1518_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_c915_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_1518_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_c915_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_1518_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_c915_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_1518_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_c915_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_1518_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_c915_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_1518_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l694_c2_c915_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_1518_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l707_c7_f837_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_6f2a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_f837_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_6f2a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_f837_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_6f2a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_f837_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_6f2a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_f837_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_6f2a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_f837_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_6f2a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l707_c7_f837_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_6f2a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l710_c7_a9f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_c821_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_a9f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_c821_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_a9f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_c821_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_a9f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_c821_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_a9f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_c821_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_a9f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_c821_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l710_c7_a9f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_c821_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l715_c7_ba5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_5f0f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_ba5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_5f0f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_ba5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_5f0f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_ba5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_5f0f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_ba5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_5f0f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l715_c7_ba5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_5f0f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l718_c7_110d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_152f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_110d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_152f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_110d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_152f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_110d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_152f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_110d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_152f_return_output;
     VAR_MUX_uxn_opcodes_h_l721_c26_a409_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c26_249a_return_output;
     VAR_MUX_uxn_opcodes_h_l722_c22_1482_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l722_c22_a9ab_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l716_c3_d5cf_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l711_l716_DUPLICATE_cedc_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l712_c3_7c15_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l711_l716_DUPLICATE_cedc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_f837_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l718_l710_l715_l707_DUPLICATE_51bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_a9f4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l718_l710_l715_l707_DUPLICATE_51bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_ba5e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l718_l710_l715_l707_DUPLICATE_51bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_110d_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l718_l710_l715_l707_DUPLICATE_51bd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_c915_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l718_l715_l710_l707_l694_DUPLICATE_b5be_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_f837_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l718_l715_l710_l707_l694_DUPLICATE_b5be_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_a9f4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l718_l715_l710_l707_l694_DUPLICATE_b5be_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_ba5e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l718_l715_l710_l707_l694_DUPLICATE_b5be_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_110d_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l718_l715_l710_l707_l694_DUPLICATE_b5be_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_f837_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l718_l710_l715_l707_DUPLICATE_e9a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_a9f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l718_l710_l715_l707_DUPLICATE_e9a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_ba5e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l718_l710_l715_l707_DUPLICATE_e9a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_110d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l718_l710_l715_l707_DUPLICATE_e9a2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_f837_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l718_l710_l715_l707_DUPLICATE_4d5c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_a9f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l718_l710_l715_l707_DUPLICATE_4d5c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_ba5e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l718_l710_l715_l707_DUPLICATE_4d5c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_110d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l718_l710_l715_l707_DUPLICATE_4d5c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_c915_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l694_c2_c915_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_c915_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l694_c2_c915_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_c915_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l694_c2_c915_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_c915_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l694_c2_c915_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_a9f4_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l710_c7_a9f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_110d_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_f630_return_output;
     -- CONST_SL_8[uxn_opcodes_h_l712_c3_7c15] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l712_c3_7c15_x <= VAR_CONST_SL_8_uxn_opcodes_h_l712_c3_7c15_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l712_c3_7c15_return_output := CONST_SL_8_uxn_opcodes_h_l712_c3_7c15_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l694_c2_c915] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_c915_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_c915_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_c915_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_c915_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_c915_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_c915_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_c915_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_c915_return_output;

     -- n8_MUX[uxn_opcodes_h_l718_c7_110d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l718_c7_110d_cond <= VAR_n8_MUX_uxn_opcodes_h_l718_c7_110d_cond;
     n8_MUX_uxn_opcodes_h_l718_c7_110d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l718_c7_110d_iftrue;
     n8_MUX_uxn_opcodes_h_l718_c7_110d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l718_c7_110d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l718_c7_110d_return_output := n8_MUX_uxn_opcodes_h_l718_c7_110d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l710_c7_a9f4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_a9f4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_a9f4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_a9f4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_a9f4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_a9f4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_a9f4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output;

     -- MUX[uxn_opcodes_h_l721_c26_a409] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l721_c26_a409_cond <= VAR_MUX_uxn_opcodes_h_l721_c26_a409_cond;
     MUX_uxn_opcodes_h_l721_c26_a409_iftrue <= VAR_MUX_uxn_opcodes_h_l721_c26_a409_iftrue;
     MUX_uxn_opcodes_h_l721_c26_a409_iffalse <= VAR_MUX_uxn_opcodes_h_l721_c26_a409_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l721_c26_a409_return_output := MUX_uxn_opcodes_h_l721_c26_a409_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l694_c2_c915] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_c915_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_c915_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_c915_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_c915_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_c915_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_c915_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_c915_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_c915_return_output;

     -- MUX[uxn_opcodes_h_l722_c22_1482] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l722_c22_1482_cond <= VAR_MUX_uxn_opcodes_h_l722_c22_1482_cond;
     MUX_uxn_opcodes_h_l722_c22_1482_iftrue <= VAR_MUX_uxn_opcodes_h_l722_c22_1482_iftrue;
     MUX_uxn_opcodes_h_l722_c22_1482_iffalse <= VAR_MUX_uxn_opcodes_h_l722_c22_1482_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l722_c22_1482_return_output := MUX_uxn_opcodes_h_l722_c22_1482_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l718_c7_110d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_110d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_110d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_110d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_110d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_110d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_110d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_110d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_110d_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l694_c2_c915] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_c915_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_c915_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_c915_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_c915_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_c915_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_c915_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_c915_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_c915_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l694_c2_c915] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_c915_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_c915_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_c915_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_c915_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_c915_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_c915_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_c915_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_c915_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l718_c7_110d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_110d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_110d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_110d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_110d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_110d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_110d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_110d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_110d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l716_c3_d5cf] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l716_c3_d5cf_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l716_c3_d5cf_left;
     BIN_OP_OR_uxn_opcodes_h_l716_c3_d5cf_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l716_c3_d5cf_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l716_c3_d5cf_return_output := BIN_OP_OR_uxn_opcodes_h_l716_c3_d5cf_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l715_c7_ba5e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l716_c3_d5cf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l710_c7_a9f4_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l712_c3_7c15_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_110d_iftrue := VAR_MUX_uxn_opcodes_h_l721_c26_a409_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_110d_iftrue := VAR_MUX_uxn_opcodes_h_l722_c22_1482_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l715_c7_ba5e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l718_c7_110d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_ba5e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_110d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_ba5e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_110d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_f837_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l715_c7_ba5e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_ba5e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_ba5e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_ba5e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_ba5e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_ba5e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_ba5e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_ba5e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_ba5e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l718_c7_110d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_110d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_110d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_110d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_110d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_110d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_110d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_110d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_110d_return_output;

     -- t16_MUX[uxn_opcodes_h_l715_c7_ba5e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l715_c7_ba5e_cond <= VAR_t16_MUX_uxn_opcodes_h_l715_c7_ba5e_cond;
     t16_MUX_uxn_opcodes_h_l715_c7_ba5e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l715_c7_ba5e_iftrue;
     t16_MUX_uxn_opcodes_h_l715_c7_ba5e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l715_c7_ba5e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l715_c7_ba5e_return_output := t16_MUX_uxn_opcodes_h_l715_c7_ba5e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l715_c7_ba5e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_ba5e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_ba5e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_ba5e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_ba5e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_ba5e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_ba5e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_ba5e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_ba5e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l707_c7_f837] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_f837_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_f837_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_f837_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_f837_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_f837_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_f837_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_f837_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_f837_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l718_c7_110d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l718_c7_110d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_110d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l718_c7_110d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_110d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l718_c7_110d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_110d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_110d_return_output := result_u16_value_MUX_uxn_opcodes_h_l718_c7_110d_return_output;

     -- n8_MUX[uxn_opcodes_h_l715_c7_ba5e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l715_c7_ba5e_cond <= VAR_n8_MUX_uxn_opcodes_h_l715_c7_ba5e_cond;
     n8_MUX_uxn_opcodes_h_l715_c7_ba5e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l715_c7_ba5e_iftrue;
     n8_MUX_uxn_opcodes_h_l715_c7_ba5e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l715_c7_ba5e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l715_c7_ba5e_return_output := n8_MUX_uxn_opcodes_h_l715_c7_ba5e_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l710_c7_a9f4_iffalse := VAR_n8_MUX_uxn_opcodes_h_l715_c7_ba5e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_a9f4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_ba5e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_ba5e_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_110d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_a9f4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_ba5e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_c915_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_f837_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_ba5e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_110d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l710_c7_a9f4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l715_c7_ba5e_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l715_c7_ba5e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l715_c7_ba5e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_ba5e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l715_c7_ba5e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_ba5e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l715_c7_ba5e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_ba5e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_ba5e_return_output := result_u16_value_MUX_uxn_opcodes_h_l715_c7_ba5e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l715_c7_ba5e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_ba5e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_ba5e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_ba5e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_ba5e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_ba5e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_ba5e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_ba5e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_ba5e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l710_c7_a9f4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_a9f4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_a9f4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_a9f4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_a9f4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_a9f4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_a9f4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output;

     -- n8_MUX[uxn_opcodes_h_l710_c7_a9f4] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l710_c7_a9f4_cond <= VAR_n8_MUX_uxn_opcodes_h_l710_c7_a9f4_cond;
     n8_MUX_uxn_opcodes_h_l710_c7_a9f4_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l710_c7_a9f4_iftrue;
     n8_MUX_uxn_opcodes_h_l710_c7_a9f4_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l710_c7_a9f4_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output := n8_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l710_c7_a9f4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_a9f4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_a9f4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_a9f4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_a9f4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_a9f4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_a9f4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output;

     -- t16_MUX[uxn_opcodes_h_l710_c7_a9f4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l710_c7_a9f4_cond <= VAR_t16_MUX_uxn_opcodes_h_l710_c7_a9f4_cond;
     t16_MUX_uxn_opcodes_h_l710_c7_a9f4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l710_c7_a9f4_iftrue;
     t16_MUX_uxn_opcodes_h_l710_c7_a9f4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l710_c7_a9f4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output := t16_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l694_c2_c915] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_c915_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_c915_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_c915_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_c915_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_c915_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_c915_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_c915_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_c915_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l707_c7_f837_iffalse := VAR_n8_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_f837_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_a9f4_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_ba5e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_f837_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_a9f4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_ba5e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l707_c7_f837_iffalse := VAR_t16_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l710_c7_a9f4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l710_c7_a9f4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_a9f4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l710_c7_a9f4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_a9f4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l710_c7_a9f4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_a9f4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output := result_u16_value_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output;

     -- t16_MUX[uxn_opcodes_h_l707_c7_f837] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l707_c7_f837_cond <= VAR_t16_MUX_uxn_opcodes_h_l707_c7_f837_cond;
     t16_MUX_uxn_opcodes_h_l707_c7_f837_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l707_c7_f837_iftrue;
     t16_MUX_uxn_opcodes_h_l707_c7_f837_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l707_c7_f837_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l707_c7_f837_return_output := t16_MUX_uxn_opcodes_h_l707_c7_f837_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l710_c7_a9f4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_a9f4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_a9f4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_a9f4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_a9f4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_a9f4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_a9f4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output;

     -- n8_MUX[uxn_opcodes_h_l707_c7_f837] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l707_c7_f837_cond <= VAR_n8_MUX_uxn_opcodes_h_l707_c7_f837_cond;
     n8_MUX_uxn_opcodes_h_l707_c7_f837_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l707_c7_f837_iftrue;
     n8_MUX_uxn_opcodes_h_l707_c7_f837_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l707_c7_f837_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l707_c7_f837_return_output := n8_MUX_uxn_opcodes_h_l707_c7_f837_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l707_c7_f837] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_f837_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_f837_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_f837_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_f837_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_f837_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_f837_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_f837_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_f837_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l707_c7_f837] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_f837_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_f837_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_f837_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_f837_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_f837_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_f837_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_f837_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_f837_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l694_c2_c915_iffalse := VAR_n8_MUX_uxn_opcodes_h_l707_c7_f837_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_c915_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_f837_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_f837_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_c915_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_f837_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_f837_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_a9f4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l694_c2_c915_iffalse := VAR_t16_MUX_uxn_opcodes_h_l707_c7_f837_return_output;
     -- n8_MUX[uxn_opcodes_h_l694_c2_c915] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l694_c2_c915_cond <= VAR_n8_MUX_uxn_opcodes_h_l694_c2_c915_cond;
     n8_MUX_uxn_opcodes_h_l694_c2_c915_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l694_c2_c915_iftrue;
     n8_MUX_uxn_opcodes_h_l694_c2_c915_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l694_c2_c915_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l694_c2_c915_return_output := n8_MUX_uxn_opcodes_h_l694_c2_c915_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l694_c2_c915] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_c915_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_c915_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_c915_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_c915_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_c915_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_c915_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_c915_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_c915_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l694_c2_c915] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_c915_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_c915_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_c915_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_c915_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_c915_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_c915_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_c915_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_c915_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l707_c7_f837] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_f837_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_f837_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_f837_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_f837_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_f837_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_f837_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_f837_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_f837_return_output;

     -- t16_MUX[uxn_opcodes_h_l694_c2_c915] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l694_c2_c915_cond <= VAR_t16_MUX_uxn_opcodes_h_l694_c2_c915_cond;
     t16_MUX_uxn_opcodes_h_l694_c2_c915_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l694_c2_c915_iftrue;
     t16_MUX_uxn_opcodes_h_l694_c2_c915_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l694_c2_c915_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l694_c2_c915_return_output := t16_MUX_uxn_opcodes_h_l694_c2_c915_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l707_c7_f837] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l707_c7_f837_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_f837_cond;
     result_u16_value_MUX_uxn_opcodes_h_l707_c7_f837_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_f837_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l707_c7_f837_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_f837_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_f837_return_output := result_u16_value_MUX_uxn_opcodes_h_l707_c7_f837_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l694_c2_c915_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_c915_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_f837_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_c915_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_f837_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l694_c2_c915_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l694_c2_c915] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_c915_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_c915_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_c915_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_c915_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_c915_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_c915_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_c915_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_c915_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l694_c2_c915] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l694_c2_c915_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_c915_cond;
     result_u16_value_MUX_uxn_opcodes_h_l694_c2_c915_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_c915_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l694_c2_c915_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_c915_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_c915_return_output := result_u16_value_MUX_uxn_opcodes_h_l694_c2_c915_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3dff_uxn_opcodes_h_l726_l689_DUPLICATE_3a72 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3dff_uxn_opcodes_h_l726_l689_DUPLICATE_3a72_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3dff(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_c915_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_c915_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_c915_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_c915_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_c915_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_c915_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_c915_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_c915_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_c915_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3dff_uxn_opcodes_h_l726_l689_DUPLICATE_3a72_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3dff_uxn_opcodes_h_l726_l689_DUPLICATE_3a72_return_output;
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
