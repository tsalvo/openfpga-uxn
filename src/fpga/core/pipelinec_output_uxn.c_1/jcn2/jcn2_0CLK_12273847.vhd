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
-- BIN_OP_EQ[uxn_opcodes_h_l693_c6_a19f]
signal BIN_OP_EQ_uxn_opcodes_h_l693_c6_a19f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l693_c6_a19f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l693_c6_a19f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l693_c2_da35]
signal t16_MUX_uxn_opcodes_h_l693_c2_da35_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l693_c2_da35_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l693_c2_da35_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l693_c2_da35_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l693_c2_da35]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_da35_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_da35_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_da35_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_da35_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l693_c2_da35]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_da35_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_da35_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_da35_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_da35_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l693_c2_da35]
signal result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_da35_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_da35_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_da35_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_da35_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l693_c2_da35]
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_da35_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_da35_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_da35_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_da35_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l693_c2_da35]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_da35_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_da35_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_da35_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_da35_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l693_c2_da35]
signal result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_da35_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_da35_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_da35_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_da35_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l693_c2_da35]
signal result_u16_value_MUX_uxn_opcodes_h_l693_c2_da35_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l693_c2_da35_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l693_c2_da35_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l693_c2_da35_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l693_c2_da35]
signal result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_da35_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_da35_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_da35_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_da35_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l693_c2_da35]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_da35_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_da35_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_da35_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_da35_return_output : unsigned(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l693_c2_da35]
signal n8_MUX_uxn_opcodes_h_l693_c2_da35_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l693_c2_da35_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l693_c2_da35_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l693_c2_da35_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l706_c11_1b7d]
signal BIN_OP_EQ_uxn_opcodes_h_l706_c11_1b7d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l706_c11_1b7d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l706_c11_1b7d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l706_c7_4da6]
signal t16_MUX_uxn_opcodes_h_l706_c7_4da6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l706_c7_4da6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l706_c7_4da6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l706_c7_4da6_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l706_c7_4da6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_4da6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_4da6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_4da6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_4da6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l706_c7_4da6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_4da6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_4da6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_4da6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_4da6_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l706_c7_4da6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_4da6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_4da6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_4da6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_4da6_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l706_c7_4da6]
signal result_u16_value_MUX_uxn_opcodes_h_l706_c7_4da6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l706_c7_4da6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l706_c7_4da6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l706_c7_4da6_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l706_c7_4da6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_4da6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_4da6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_4da6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_4da6_return_output : unsigned(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l706_c7_4da6]
signal n8_MUX_uxn_opcodes_h_l706_c7_4da6_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l706_c7_4da6_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l706_c7_4da6_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l706_c7_4da6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l709_c11_9a91]
signal BIN_OP_EQ_uxn_opcodes_h_l709_c11_9a91_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l709_c11_9a91_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l709_c11_9a91_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l709_c7_a1bc]
signal t16_MUX_uxn_opcodes_h_l709_c7_a1bc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l709_c7_a1bc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l709_c7_a1bc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l709_c7_a1bc]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_a1bc_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_a1bc_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_a1bc_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l709_c7_a1bc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_a1bc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_a1bc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_a1bc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l709_c7_a1bc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_a1bc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_a1bc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_a1bc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l709_c7_a1bc]
signal result_u16_value_MUX_uxn_opcodes_h_l709_c7_a1bc_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l709_c7_a1bc_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l709_c7_a1bc_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l709_c7_a1bc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_a1bc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_a1bc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_a1bc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output : unsigned(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l709_c7_a1bc]
signal n8_MUX_uxn_opcodes_h_l709_c7_a1bc_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l709_c7_a1bc_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l709_c7_a1bc_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l711_c3_cf5a]
signal CONST_SL_8_uxn_opcodes_h_l711_c3_cf5a_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l711_c3_cf5a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l714_c11_f29c]
signal BIN_OP_EQ_uxn_opcodes_h_l714_c11_f29c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l714_c11_f29c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l714_c11_f29c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l714_c7_b68d]
signal t16_MUX_uxn_opcodes_h_l714_c7_b68d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l714_c7_b68d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l714_c7_b68d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l714_c7_b68d_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l714_c7_b68d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_b68d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_b68d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_b68d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_b68d_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l714_c7_b68d]
signal result_u16_value_MUX_uxn_opcodes_h_l714_c7_b68d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l714_c7_b68d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l714_c7_b68d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l714_c7_b68d_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l714_c7_b68d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_b68d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_b68d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_b68d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_b68d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l714_c7_b68d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_b68d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_b68d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_b68d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_b68d_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l714_c7_b68d]
signal n8_MUX_uxn_opcodes_h_l714_c7_b68d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l714_c7_b68d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l714_c7_b68d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l714_c7_b68d_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l715_c3_5e1b]
signal BIN_OP_OR_uxn_opcodes_h_l715_c3_5e1b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l715_c3_5e1b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l715_c3_5e1b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l717_c11_5c82]
signal BIN_OP_EQ_uxn_opcodes_h_l717_c11_5c82_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l717_c11_5c82_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l717_c11_5c82_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l717_c7_938b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_938b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_938b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_938b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_938b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l717_c7_938b]
signal result_u16_value_MUX_uxn_opcodes_h_l717_c7_938b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l717_c7_938b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l717_c7_938b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l717_c7_938b_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l717_c7_938b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_938b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_938b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_938b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_938b_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l717_c7_938b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_938b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_938b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_938b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_938b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l717_c7_938b]
signal n8_MUX_uxn_opcodes_h_l717_c7_938b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l717_c7_938b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l717_c7_938b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l717_c7_938b_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l719_c30_c1b5]
signal sp_relative_shift_uxn_opcodes_h_l719_c30_c1b5_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l719_c30_c1b5_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l719_c30_c1b5_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l719_c30_c1b5_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l720_c26_3805]
signal BIN_OP_EQ_uxn_opcodes_h_l720_c26_3805_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l720_c26_3805_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l720_c26_3805_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l720_c26_e8e9]
signal MUX_uxn_opcodes_h_l720_c26_e8e9_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l720_c26_e8e9_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l720_c26_e8e9_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l720_c26_e8e9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l721_c22_089c]
signal BIN_OP_EQ_uxn_opcodes_h_l721_c22_089c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l721_c22_089c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l721_c22_089c_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l721_c22_1311]
signal MUX_uxn_opcodes_h_l721_c22_1311_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l721_c22_1311_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l721_c22_1311_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l721_c22_1311_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_6a57( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_index_flipped := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_vram_write := ref_toks_6;
      base.u16_value := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l693_c6_a19f
BIN_OP_EQ_uxn_opcodes_h_l693_c6_a19f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l693_c6_a19f_left,
BIN_OP_EQ_uxn_opcodes_h_l693_c6_a19f_right,
BIN_OP_EQ_uxn_opcodes_h_l693_c6_a19f_return_output);

-- t16_MUX_uxn_opcodes_h_l693_c2_da35
t16_MUX_uxn_opcodes_h_l693_c2_da35 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l693_c2_da35_cond,
t16_MUX_uxn_opcodes_h_l693_c2_da35_iftrue,
t16_MUX_uxn_opcodes_h_l693_c2_da35_iffalse,
t16_MUX_uxn_opcodes_h_l693_c2_da35_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_da35
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_da35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_da35_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_da35_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_da35_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_da35_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_da35
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_da35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_da35_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_da35_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_da35_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_da35_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_da35
result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_da35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_da35_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_da35_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_da35_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_da35_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_da35
result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_da35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_da35_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_da35_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_da35_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_da35_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_da35
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_da35 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_da35_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_da35_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_da35_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_da35_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_da35
result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_da35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_da35_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_da35_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_da35_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_da35_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l693_c2_da35
result_u16_value_MUX_uxn_opcodes_h_l693_c2_da35 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l693_c2_da35_cond,
result_u16_value_MUX_uxn_opcodes_h_l693_c2_da35_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l693_c2_da35_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l693_c2_da35_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_da35
result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_da35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_da35_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_da35_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_da35_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_da35_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_da35
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_da35 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_da35_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_da35_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_da35_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_da35_return_output);

-- n8_MUX_uxn_opcodes_h_l693_c2_da35
n8_MUX_uxn_opcodes_h_l693_c2_da35 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l693_c2_da35_cond,
n8_MUX_uxn_opcodes_h_l693_c2_da35_iftrue,
n8_MUX_uxn_opcodes_h_l693_c2_da35_iffalse,
n8_MUX_uxn_opcodes_h_l693_c2_da35_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l706_c11_1b7d
BIN_OP_EQ_uxn_opcodes_h_l706_c11_1b7d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l706_c11_1b7d_left,
BIN_OP_EQ_uxn_opcodes_h_l706_c11_1b7d_right,
BIN_OP_EQ_uxn_opcodes_h_l706_c11_1b7d_return_output);

-- t16_MUX_uxn_opcodes_h_l706_c7_4da6
t16_MUX_uxn_opcodes_h_l706_c7_4da6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l706_c7_4da6_cond,
t16_MUX_uxn_opcodes_h_l706_c7_4da6_iftrue,
t16_MUX_uxn_opcodes_h_l706_c7_4da6_iffalse,
t16_MUX_uxn_opcodes_h_l706_c7_4da6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_4da6
result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_4da6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_4da6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_4da6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_4da6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_4da6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_4da6
result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_4da6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_4da6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_4da6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_4da6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_4da6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_4da6
result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_4da6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_4da6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_4da6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_4da6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_4da6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l706_c7_4da6
result_u16_value_MUX_uxn_opcodes_h_l706_c7_4da6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l706_c7_4da6_cond,
result_u16_value_MUX_uxn_opcodes_h_l706_c7_4da6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l706_c7_4da6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l706_c7_4da6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_4da6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_4da6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_4da6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_4da6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_4da6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_4da6_return_output);

-- n8_MUX_uxn_opcodes_h_l706_c7_4da6
n8_MUX_uxn_opcodes_h_l706_c7_4da6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l706_c7_4da6_cond,
n8_MUX_uxn_opcodes_h_l706_c7_4da6_iftrue,
n8_MUX_uxn_opcodes_h_l706_c7_4da6_iffalse,
n8_MUX_uxn_opcodes_h_l706_c7_4da6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l709_c11_9a91
BIN_OP_EQ_uxn_opcodes_h_l709_c11_9a91 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l709_c11_9a91_left,
BIN_OP_EQ_uxn_opcodes_h_l709_c11_9a91_right,
BIN_OP_EQ_uxn_opcodes_h_l709_c11_9a91_return_output);

-- t16_MUX_uxn_opcodes_h_l709_c7_a1bc
t16_MUX_uxn_opcodes_h_l709_c7_a1bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l709_c7_a1bc_cond,
t16_MUX_uxn_opcodes_h_l709_c7_a1bc_iftrue,
t16_MUX_uxn_opcodes_h_l709_c7_a1bc_iffalse,
t16_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_a1bc
result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_a1bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_a1bc_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_a1bc_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_a1bc_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_a1bc
result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_a1bc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_a1bc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_a1bc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_a1bc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_a1bc
result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_a1bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_a1bc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_a1bc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_a1bc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l709_c7_a1bc
result_u16_value_MUX_uxn_opcodes_h_l709_c7_a1bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l709_c7_a1bc_cond,
result_u16_value_MUX_uxn_opcodes_h_l709_c7_a1bc_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l709_c7_a1bc_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_a1bc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_a1bc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_a1bc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_a1bc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_a1bc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output);

-- n8_MUX_uxn_opcodes_h_l709_c7_a1bc
n8_MUX_uxn_opcodes_h_l709_c7_a1bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l709_c7_a1bc_cond,
n8_MUX_uxn_opcodes_h_l709_c7_a1bc_iftrue,
n8_MUX_uxn_opcodes_h_l709_c7_a1bc_iffalse,
n8_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output);

-- CONST_SL_8_uxn_opcodes_h_l711_c3_cf5a
CONST_SL_8_uxn_opcodes_h_l711_c3_cf5a : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l711_c3_cf5a_x,
CONST_SL_8_uxn_opcodes_h_l711_c3_cf5a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l714_c11_f29c
BIN_OP_EQ_uxn_opcodes_h_l714_c11_f29c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l714_c11_f29c_left,
BIN_OP_EQ_uxn_opcodes_h_l714_c11_f29c_right,
BIN_OP_EQ_uxn_opcodes_h_l714_c11_f29c_return_output);

-- t16_MUX_uxn_opcodes_h_l714_c7_b68d
t16_MUX_uxn_opcodes_h_l714_c7_b68d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l714_c7_b68d_cond,
t16_MUX_uxn_opcodes_h_l714_c7_b68d_iftrue,
t16_MUX_uxn_opcodes_h_l714_c7_b68d_iffalse,
t16_MUX_uxn_opcodes_h_l714_c7_b68d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_b68d
result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_b68d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_b68d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_b68d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_b68d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_b68d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l714_c7_b68d
result_u16_value_MUX_uxn_opcodes_h_l714_c7_b68d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l714_c7_b68d_cond,
result_u16_value_MUX_uxn_opcodes_h_l714_c7_b68d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l714_c7_b68d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l714_c7_b68d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_b68d
result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_b68d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_b68d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_b68d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_b68d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_b68d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_b68d
result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_b68d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_b68d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_b68d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_b68d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_b68d_return_output);

-- n8_MUX_uxn_opcodes_h_l714_c7_b68d
n8_MUX_uxn_opcodes_h_l714_c7_b68d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l714_c7_b68d_cond,
n8_MUX_uxn_opcodes_h_l714_c7_b68d_iftrue,
n8_MUX_uxn_opcodes_h_l714_c7_b68d_iffalse,
n8_MUX_uxn_opcodes_h_l714_c7_b68d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l715_c3_5e1b
BIN_OP_OR_uxn_opcodes_h_l715_c3_5e1b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l715_c3_5e1b_left,
BIN_OP_OR_uxn_opcodes_h_l715_c3_5e1b_right,
BIN_OP_OR_uxn_opcodes_h_l715_c3_5e1b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l717_c11_5c82
BIN_OP_EQ_uxn_opcodes_h_l717_c11_5c82 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l717_c11_5c82_left,
BIN_OP_EQ_uxn_opcodes_h_l717_c11_5c82_right,
BIN_OP_EQ_uxn_opcodes_h_l717_c11_5c82_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_938b
result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_938b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_938b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_938b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_938b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_938b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l717_c7_938b
result_u16_value_MUX_uxn_opcodes_h_l717_c7_938b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l717_c7_938b_cond,
result_u16_value_MUX_uxn_opcodes_h_l717_c7_938b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l717_c7_938b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l717_c7_938b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_938b
result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_938b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_938b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_938b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_938b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_938b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_938b
result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_938b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_938b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_938b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_938b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_938b_return_output);

-- n8_MUX_uxn_opcodes_h_l717_c7_938b
n8_MUX_uxn_opcodes_h_l717_c7_938b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l717_c7_938b_cond,
n8_MUX_uxn_opcodes_h_l717_c7_938b_iftrue,
n8_MUX_uxn_opcodes_h_l717_c7_938b_iffalse,
n8_MUX_uxn_opcodes_h_l717_c7_938b_return_output);

-- sp_relative_shift_uxn_opcodes_h_l719_c30_c1b5
sp_relative_shift_uxn_opcodes_h_l719_c30_c1b5 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l719_c30_c1b5_ins,
sp_relative_shift_uxn_opcodes_h_l719_c30_c1b5_x,
sp_relative_shift_uxn_opcodes_h_l719_c30_c1b5_y,
sp_relative_shift_uxn_opcodes_h_l719_c30_c1b5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l720_c26_3805
BIN_OP_EQ_uxn_opcodes_h_l720_c26_3805 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l720_c26_3805_left,
BIN_OP_EQ_uxn_opcodes_h_l720_c26_3805_right,
BIN_OP_EQ_uxn_opcodes_h_l720_c26_3805_return_output);

-- MUX_uxn_opcodes_h_l720_c26_e8e9
MUX_uxn_opcodes_h_l720_c26_e8e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l720_c26_e8e9_cond,
MUX_uxn_opcodes_h_l720_c26_e8e9_iftrue,
MUX_uxn_opcodes_h_l720_c26_e8e9_iffalse,
MUX_uxn_opcodes_h_l720_c26_e8e9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l721_c22_089c
BIN_OP_EQ_uxn_opcodes_h_l721_c22_089c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l721_c22_089c_left,
BIN_OP_EQ_uxn_opcodes_h_l721_c22_089c_right,
BIN_OP_EQ_uxn_opcodes_h_l721_c22_089c_return_output);

-- MUX_uxn_opcodes_h_l721_c22_1311
MUX_uxn_opcodes_h_l721_c22_1311 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l721_c22_1311_cond,
MUX_uxn_opcodes_h_l721_c22_1311_iftrue,
MUX_uxn_opcodes_h_l721_c22_1311_iffalse,
MUX_uxn_opcodes_h_l721_c22_1311_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l693_c6_a19f_return_output,
 t16_MUX_uxn_opcodes_h_l693_c2_da35_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_da35_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_da35_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_da35_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_da35_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_da35_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_da35_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l693_c2_da35_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_da35_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_da35_return_output,
 n8_MUX_uxn_opcodes_h_l693_c2_da35_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l706_c11_1b7d_return_output,
 t16_MUX_uxn_opcodes_h_l706_c7_4da6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_4da6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_4da6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_4da6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l706_c7_4da6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_4da6_return_output,
 n8_MUX_uxn_opcodes_h_l706_c7_4da6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l709_c11_9a91_return_output,
 t16_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output,
 n8_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output,
 CONST_SL_8_uxn_opcodes_h_l711_c3_cf5a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l714_c11_f29c_return_output,
 t16_MUX_uxn_opcodes_h_l714_c7_b68d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_b68d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l714_c7_b68d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_b68d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_b68d_return_output,
 n8_MUX_uxn_opcodes_h_l714_c7_b68d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l715_c3_5e1b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l717_c11_5c82_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_938b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l717_c7_938b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_938b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_938b_return_output,
 n8_MUX_uxn_opcodes_h_l717_c7_938b_return_output,
 sp_relative_shift_uxn_opcodes_h_l719_c30_c1b5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l720_c26_3805_return_output,
 MUX_uxn_opcodes_h_l720_c26_e8e9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l721_c22_089c_return_output,
 MUX_uxn_opcodes_h_l721_c22_1311_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_a19f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_a19f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_a19f_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l693_c2_da35_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l693_c2_da35_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l706_c7_4da6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l693_c2_da35_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l693_c2_da35_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_da35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_da35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l693_c2_da35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_da35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_da35_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_da35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_da35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_4da6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_da35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_da35_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_da35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_da35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l693_c2_da35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_da35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_da35_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_da35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_da35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_4da6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_da35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_da35_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_da35_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l698_c3_04f9 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_da35_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_4da6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_da35_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_da35_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_da35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_da35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l693_c2_da35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_da35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_da35_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_da35_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_da35_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_4da6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_da35_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_da35_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_da35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_da35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l693_c2_da35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_da35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_da35_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_da35_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l703_c3_ca56 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_da35_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_4da6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_da35_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_da35_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l693_c2_da35_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l693_c2_da35_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l706_c7_4da6_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l693_c2_da35_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l693_c2_da35_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_1b7d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_1b7d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_1b7d_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l706_c7_4da6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l706_c7_4da6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l706_c7_4da6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_4da6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_4da6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_4da6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_4da6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_4da6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_4da6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_4da6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_4da6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_4da6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_4da6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_4da6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_4da6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_4da6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l707_c3_35d7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_4da6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_4da6_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l706_c7_4da6_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l706_c7_4da6_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l706_c7_4da6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_9a91_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_9a91_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_9a91_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l709_c7_a1bc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l709_c7_a1bc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l714_c7_b68d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l709_c7_a1bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_a1bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_a1bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_b68d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_a1bc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_a1bc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_a1bc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_b68d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_a1bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_a1bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_a1bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_b68d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_a1bc_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_a1bc_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_a1bc_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_b68d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_a1bc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_a1bc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l712_c3_7b7d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_a1bc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l709_c7_a1bc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_a1bc_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l709_c7_a1bc_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l709_c7_a1bc_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l714_c7_b68d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l709_c7_a1bc_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l711_c3_cf5a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l711_c3_cf5a_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_f29c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_f29c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_f29c_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l714_c7_b68d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l714_c7_b68d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l714_c7_b68d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_b68d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_b68d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_938b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_b68d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_b68d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_b68d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_938b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_b68d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_b68d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_b68d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_938b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_b68d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_b68d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_b68d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_938b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_b68d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l714_c7_b68d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l714_c7_b68d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l717_c7_938b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l714_c7_b68d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_5e1b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_5e1b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_5e1b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_5c82_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_5c82_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_5c82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_938b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_938b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_938b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_938b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_938b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_938b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_938b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_938b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_938b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_938b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_938b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_938b_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l717_c7_938b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l717_c7_938b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l717_c7_938b_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_c1b5_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_c1b5_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_c1b5_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_c1b5_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l720_c26_e8e9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_3805_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_3805_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_3805_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l720_c26_e8e9_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l720_c26_e8e9_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l720_c26_e8e9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l721_c22_1311_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_089c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_089c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_089c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l721_c22_1311_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l721_c22_1311_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l721_c22_1311_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l709_l714_l706_l693_l717_DUPLICATE_aa33_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_66c0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_558a_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_74d5_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l710_l715_DUPLICATE_307a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6a57_uxn_opcodes_h_l725_l688_DUPLICATE_5127_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_c1b5_y := resize(to_signed(-3, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l707_c3_35d7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_4da6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l707_c3_35d7;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_938b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_a19f_right := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_da35_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l720_c26_e8e9_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_c1b5_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_MUX_uxn_opcodes_h_l721_c22_1311_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_da35_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l698_c3_04f9 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_da35_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l698_c3_04f9;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l712_c3_7b7d := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_a1bc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l712_c3_7b7d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_1b7d_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l703_c3_ca56 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_da35_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l703_c3_ca56;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_da35_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_da35_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_f29c_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_9a91_right := to_unsigned(2, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_da35_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_3805_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l720_c26_e8e9_iffalse := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_da35_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_089c_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_5c82_right := to_unsigned(4, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_c1b5_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l693_c2_da35_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l706_c7_4da6_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l709_c7_a1bc_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l714_c7_b68d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l717_c7_938b_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_a19f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_1b7d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_9a91_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_f29c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_5c82_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_3805_left := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_089c_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l717_c7_938b_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_5e1b_left := t16;
     VAR_MUX_uxn_opcodes_h_l721_c22_1311_iffalse := t16;
     VAR_t16_MUX_uxn_opcodes_h_l693_c2_da35_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l706_c7_4da6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l714_c7_b68d_iffalse := t16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l710_l715_DUPLICATE_307a LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l710_l715_DUPLICATE_307a_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l693_c2_da35] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l693_c2_da35_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l717_c11_5c82] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l717_c11_5c82_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_5c82_left;
     BIN_OP_EQ_uxn_opcodes_h_l717_c11_5c82_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_5c82_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_5c82_return_output := BIN_OP_EQ_uxn_opcodes_h_l717_c11_5c82_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l693_c2_da35] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l693_c2_da35_return_output := result.is_stack_index_flipped;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l693_c2_da35] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l693_c2_da35_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l720_c26_3805] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l720_c26_3805_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_3805_left;
     BIN_OP_EQ_uxn_opcodes_h_l720_c26_3805_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_3805_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_3805_return_output := BIN_OP_EQ_uxn_opcodes_h_l720_c26_3805_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l709_c11_9a91] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l709_c11_9a91_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_9a91_left;
     BIN_OP_EQ_uxn_opcodes_h_l709_c11_9a91_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_9a91_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_9a91_return_output := BIN_OP_EQ_uxn_opcodes_h_l709_c11_9a91_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l709_l714_l706_l693_l717_DUPLICATE_aa33 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l709_l714_l706_l693_l717_DUPLICATE_aa33_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l693_c6_a19f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l693_c6_a19f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_a19f_left;
     BIN_OP_EQ_uxn_opcodes_h_l693_c6_a19f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_a19f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_a19f_return_output := BIN_OP_EQ_uxn_opcodes_h_l693_c6_a19f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_66c0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_66c0_return_output := result.is_pc_updated;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_558a LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_558a_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l706_c11_1b7d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l706_c11_1b7d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_1b7d_left;
     BIN_OP_EQ_uxn_opcodes_h_l706_c11_1b7d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_1b7d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_1b7d_return_output := BIN_OP_EQ_uxn_opcodes_h_l706_c11_1b7d_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l719_c30_c1b5] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l719_c30_c1b5_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_c1b5_ins;
     sp_relative_shift_uxn_opcodes_h_l719_c30_c1b5_x <= VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_c1b5_x;
     sp_relative_shift_uxn_opcodes_h_l719_c30_c1b5_y <= VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_c1b5_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_c1b5_return_output := sp_relative_shift_uxn_opcodes_h_l719_c30_c1b5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l714_c11_f29c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l714_c11_f29c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_f29c_left;
     BIN_OP_EQ_uxn_opcodes_h_l714_c11_f29c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_f29c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_f29c_return_output := BIN_OP_EQ_uxn_opcodes_h_l714_c11_f29c_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l709_c7_a1bc] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l709_c7_a1bc_return_output := result.stack_address_sp_offset;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l693_c2_da35] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l693_c2_da35_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_74d5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_74d5_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l721_c22_089c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l721_c22_089c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_089c_left;
     BIN_OP_EQ_uxn_opcodes_h_l721_c22_089c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_089c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_089c_return_output := BIN_OP_EQ_uxn_opcodes_h_l721_c22_089c_return_output;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l693_c2_da35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_a19f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_da35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_a19f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_da35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_a19f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_da35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_a19f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_da35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_a19f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_da35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_a19f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_da35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_a19f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_da35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_a19f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_da35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_a19f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_da35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_a19f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l693_c2_da35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_a19f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l706_c7_4da6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_1b7d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_4da6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_1b7d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_4da6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_1b7d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_4da6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_1b7d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_4da6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_1b7d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_4da6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_1b7d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l706_c7_4da6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_1b7d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l709_c7_a1bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_9a91_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_a1bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_9a91_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_a1bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_9a91_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_a1bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_9a91_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_a1bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_9a91_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_a1bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_9a91_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l709_c7_a1bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_9a91_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l714_c7_b68d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_f29c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_b68d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_f29c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_b68d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_f29c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_b68d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_f29c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_b68d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_f29c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l714_c7_b68d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_f29c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l717_c7_938b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_5c82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_938b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_5c82_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_938b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_5c82_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_938b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_5c82_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_938b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_5c82_return_output;
     VAR_MUX_uxn_opcodes_h_l720_c26_e8e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_3805_return_output;
     VAR_MUX_uxn_opcodes_h_l721_c22_1311_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_089c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_5e1b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l710_l715_DUPLICATE_307a_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l711_c3_cf5a_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l710_l715_DUPLICATE_307a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_4da6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_558a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_a1bc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_558a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_b68d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_558a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_938b_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_558a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_da35_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l709_l714_l706_l693_l717_DUPLICATE_aa33_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_4da6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l709_l714_l706_l693_l717_DUPLICATE_aa33_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_a1bc_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l709_l714_l706_l693_l717_DUPLICATE_aa33_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_b68d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l709_l714_l706_l693_l717_DUPLICATE_aa33_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_938b_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l709_l714_l706_l693_l717_DUPLICATE_aa33_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_4da6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_74d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_a1bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_74d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_b68d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_74d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_938b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_74d5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_4da6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_66c0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_a1bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_66c0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_b68d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_66c0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_938b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_66c0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_da35_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l693_c2_da35_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_da35_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l693_c2_da35_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_da35_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l693_c2_da35_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_da35_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l693_c2_da35_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_a1bc_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l709_c7_a1bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_938b_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_c1b5_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l709_c7_a1bc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_a1bc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_a1bc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_a1bc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_a1bc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_a1bc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_a1bc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l693_c2_da35] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_da35_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_da35_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_da35_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_da35_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_da35_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_da35_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_da35_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_da35_return_output;

     -- MUX[uxn_opcodes_h_l721_c22_1311] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l721_c22_1311_cond <= VAR_MUX_uxn_opcodes_h_l721_c22_1311_cond;
     MUX_uxn_opcodes_h_l721_c22_1311_iftrue <= VAR_MUX_uxn_opcodes_h_l721_c22_1311_iftrue;
     MUX_uxn_opcodes_h_l721_c22_1311_iffalse <= VAR_MUX_uxn_opcodes_h_l721_c22_1311_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l721_c22_1311_return_output := MUX_uxn_opcodes_h_l721_c22_1311_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l717_c7_938b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_938b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_938b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_938b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_938b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_938b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_938b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_938b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_938b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l715_c3_5e1b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l715_c3_5e1b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_5e1b_left;
     BIN_OP_OR_uxn_opcodes_h_l715_c3_5e1b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_5e1b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_5e1b_return_output := BIN_OP_OR_uxn_opcodes_h_l715_c3_5e1b_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l711_c3_cf5a] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l711_c3_cf5a_x <= VAR_CONST_SL_8_uxn_opcodes_h_l711_c3_cf5a_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l711_c3_cf5a_return_output := CONST_SL_8_uxn_opcodes_h_l711_c3_cf5a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l717_c7_938b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_938b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_938b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_938b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_938b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_938b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_938b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_938b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_938b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l693_c2_da35] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_da35_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_da35_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_da35_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_da35_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_da35_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_da35_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_da35_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_da35_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l693_c2_da35] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_da35_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_da35_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_da35_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_da35_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_da35_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_da35_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_da35_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_da35_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l693_c2_da35] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_da35_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_da35_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_da35_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_da35_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_da35_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_da35_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_da35_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_da35_return_output;

     -- n8_MUX[uxn_opcodes_h_l717_c7_938b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l717_c7_938b_cond <= VAR_n8_MUX_uxn_opcodes_h_l717_c7_938b_cond;
     n8_MUX_uxn_opcodes_h_l717_c7_938b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l717_c7_938b_iftrue;
     n8_MUX_uxn_opcodes_h_l717_c7_938b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l717_c7_938b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l717_c7_938b_return_output := n8_MUX_uxn_opcodes_h_l717_c7_938b_return_output;

     -- MUX[uxn_opcodes_h_l720_c26_e8e9] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l720_c26_e8e9_cond <= VAR_MUX_uxn_opcodes_h_l720_c26_e8e9_cond;
     MUX_uxn_opcodes_h_l720_c26_e8e9_iftrue <= VAR_MUX_uxn_opcodes_h_l720_c26_e8e9_iftrue;
     MUX_uxn_opcodes_h_l720_c26_e8e9_iffalse <= VAR_MUX_uxn_opcodes_h_l720_c26_e8e9_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l720_c26_e8e9_return_output := MUX_uxn_opcodes_h_l720_c26_e8e9_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l714_c7_b68d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_5e1b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l709_c7_a1bc_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l711_c3_cf5a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_938b_iftrue := VAR_MUX_uxn_opcodes_h_l720_c26_e8e9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_938b_iftrue := VAR_MUX_uxn_opcodes_h_l721_c22_1311_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l714_c7_b68d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l717_c7_938b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_b68d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_938b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_b68d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_938b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_4da6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output;
     -- t16_MUX[uxn_opcodes_h_l714_c7_b68d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l714_c7_b68d_cond <= VAR_t16_MUX_uxn_opcodes_h_l714_c7_b68d_cond;
     t16_MUX_uxn_opcodes_h_l714_c7_b68d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l714_c7_b68d_iftrue;
     t16_MUX_uxn_opcodes_h_l714_c7_b68d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l714_c7_b68d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l714_c7_b68d_return_output := t16_MUX_uxn_opcodes_h_l714_c7_b68d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l714_c7_b68d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_b68d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_b68d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_b68d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_b68d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_b68d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_b68d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_b68d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_b68d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l717_c7_938b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l717_c7_938b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_938b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l717_c7_938b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_938b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l717_c7_938b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_938b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_938b_return_output := result_u16_value_MUX_uxn_opcodes_h_l717_c7_938b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l706_c7_4da6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_4da6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_4da6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_4da6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_4da6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_4da6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_4da6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_4da6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_4da6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l717_c7_938b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_938b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_938b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_938b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_938b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_938b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_938b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_938b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_938b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l714_c7_b68d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_b68d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_b68d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_b68d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_b68d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_b68d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_b68d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_b68d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_b68d_return_output;

     -- n8_MUX[uxn_opcodes_h_l714_c7_b68d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l714_c7_b68d_cond <= VAR_n8_MUX_uxn_opcodes_h_l714_c7_b68d_cond;
     n8_MUX_uxn_opcodes_h_l714_c7_b68d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l714_c7_b68d_iftrue;
     n8_MUX_uxn_opcodes_h_l714_c7_b68d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l714_c7_b68d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l714_c7_b68d_return_output := n8_MUX_uxn_opcodes_h_l714_c7_b68d_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l709_c7_a1bc_iffalse := VAR_n8_MUX_uxn_opcodes_h_l714_c7_b68d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_a1bc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_b68d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_b68d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_938b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_a1bc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_b68d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_da35_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_4da6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_b68d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_938b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l709_c7_a1bc_iffalse := VAR_t16_MUX_uxn_opcodes_h_l714_c7_b68d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l709_c7_a1bc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_a1bc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_a1bc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_a1bc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_a1bc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_a1bc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_a1bc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output;

     -- n8_MUX[uxn_opcodes_h_l709_c7_a1bc] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l709_c7_a1bc_cond <= VAR_n8_MUX_uxn_opcodes_h_l709_c7_a1bc_cond;
     n8_MUX_uxn_opcodes_h_l709_c7_a1bc_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l709_c7_a1bc_iftrue;
     n8_MUX_uxn_opcodes_h_l709_c7_a1bc_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l709_c7_a1bc_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output := n8_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l714_c7_b68d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_b68d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_b68d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_b68d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_b68d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_b68d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_b68d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_b68d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_b68d_return_output;

     -- t16_MUX[uxn_opcodes_h_l709_c7_a1bc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l709_c7_a1bc_cond <= VAR_t16_MUX_uxn_opcodes_h_l709_c7_a1bc_cond;
     t16_MUX_uxn_opcodes_h_l709_c7_a1bc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l709_c7_a1bc_iftrue;
     t16_MUX_uxn_opcodes_h_l709_c7_a1bc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l709_c7_a1bc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output := t16_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l714_c7_b68d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l714_c7_b68d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_b68d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l714_c7_b68d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_b68d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l714_c7_b68d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_b68d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_b68d_return_output := result_u16_value_MUX_uxn_opcodes_h_l714_c7_b68d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l693_c2_da35] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_da35_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_da35_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_da35_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_da35_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_da35_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_da35_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_da35_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_da35_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l709_c7_a1bc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_a1bc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_a1bc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_a1bc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_a1bc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_a1bc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_a1bc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l706_c7_4da6_iffalse := VAR_n8_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_4da6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_a1bc_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_b68d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_4da6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_a1bc_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_b68d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l706_c7_4da6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l709_c7_a1bc] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_a1bc_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_a1bc_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_a1bc_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_a1bc_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_a1bc_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_a1bc_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output;

     -- n8_MUX[uxn_opcodes_h_l706_c7_4da6] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l706_c7_4da6_cond <= VAR_n8_MUX_uxn_opcodes_h_l706_c7_4da6_cond;
     n8_MUX_uxn_opcodes_h_l706_c7_4da6_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l706_c7_4da6_iftrue;
     n8_MUX_uxn_opcodes_h_l706_c7_4da6_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l706_c7_4da6_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l706_c7_4da6_return_output := n8_MUX_uxn_opcodes_h_l706_c7_4da6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l706_c7_4da6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_4da6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_4da6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_4da6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_4da6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_4da6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_4da6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_4da6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_4da6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l709_c7_a1bc] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l709_c7_a1bc_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_a1bc_cond;
     result_u16_value_MUX_uxn_opcodes_h_l709_c7_a1bc_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_a1bc_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l709_c7_a1bc_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_a1bc_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output := result_u16_value_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l706_c7_4da6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_4da6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_4da6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_4da6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_4da6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_4da6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_4da6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_4da6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_4da6_return_output;

     -- t16_MUX[uxn_opcodes_h_l706_c7_4da6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l706_c7_4da6_cond <= VAR_t16_MUX_uxn_opcodes_h_l706_c7_4da6_cond;
     t16_MUX_uxn_opcodes_h_l706_c7_4da6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l706_c7_4da6_iftrue;
     t16_MUX_uxn_opcodes_h_l706_c7_4da6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l706_c7_4da6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l706_c7_4da6_return_output := t16_MUX_uxn_opcodes_h_l706_c7_4da6_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l693_c2_da35_iffalse := VAR_n8_MUX_uxn_opcodes_h_l706_c7_4da6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_da35_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_4da6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_4da6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_da35_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_4da6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_4da6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_a1bc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l693_c2_da35_iffalse := VAR_t16_MUX_uxn_opcodes_h_l706_c7_4da6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l693_c2_da35] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_da35_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_da35_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_da35_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_da35_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_da35_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_da35_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_da35_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_da35_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l706_c7_4da6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l706_c7_4da6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_4da6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l706_c7_4da6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_4da6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l706_c7_4da6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_4da6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_4da6_return_output := result_u16_value_MUX_uxn_opcodes_h_l706_c7_4da6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l693_c2_da35] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_da35_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_da35_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_da35_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_da35_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_da35_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_da35_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_da35_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_da35_return_output;

     -- n8_MUX[uxn_opcodes_h_l693_c2_da35] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l693_c2_da35_cond <= VAR_n8_MUX_uxn_opcodes_h_l693_c2_da35_cond;
     n8_MUX_uxn_opcodes_h_l693_c2_da35_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l693_c2_da35_iftrue;
     n8_MUX_uxn_opcodes_h_l693_c2_da35_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l693_c2_da35_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l693_c2_da35_return_output := n8_MUX_uxn_opcodes_h_l693_c2_da35_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l706_c7_4da6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_4da6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_4da6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_4da6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_4da6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_4da6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_4da6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_4da6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_4da6_return_output;

     -- t16_MUX[uxn_opcodes_h_l693_c2_da35] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l693_c2_da35_cond <= VAR_t16_MUX_uxn_opcodes_h_l693_c2_da35_cond;
     t16_MUX_uxn_opcodes_h_l693_c2_da35_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l693_c2_da35_iftrue;
     t16_MUX_uxn_opcodes_h_l693_c2_da35_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l693_c2_da35_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l693_c2_da35_return_output := t16_MUX_uxn_opcodes_h_l693_c2_da35_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l693_c2_da35_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_da35_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_4da6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_da35_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_4da6_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l693_c2_da35_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l693_c2_da35] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l693_c2_da35_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_da35_cond;
     result_u16_value_MUX_uxn_opcodes_h_l693_c2_da35_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_da35_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l693_c2_da35_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_da35_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_da35_return_output := result_u16_value_MUX_uxn_opcodes_h_l693_c2_da35_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l693_c2_da35] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_da35_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_da35_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_da35_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_da35_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_da35_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_da35_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_da35_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_da35_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6a57_uxn_opcodes_h_l725_l688_DUPLICATE_5127 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6a57_uxn_opcodes_h_l725_l688_DUPLICATE_5127_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6a57(
     result,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_da35_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_da35_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_da35_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_da35_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_da35_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_da35_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_da35_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_da35_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_da35_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6a57_uxn_opcodes_h_l725_l688_DUPLICATE_5127_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6a57_uxn_opcodes_h_l725_l688_DUPLICATE_5127_return_output;
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
