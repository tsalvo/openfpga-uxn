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
-- BIN_OP_EQ[uxn_opcodes_h_l693_c6_bd14]
signal BIN_OP_EQ_uxn_opcodes_h_l693_c6_bd14_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l693_c6_bd14_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l693_c6_bd14_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l693_c2_c8ff]
signal n8_MUX_uxn_opcodes_h_l693_c2_c8ff_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l693_c2_c8ff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_c8ff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l693_c2_c8ff]
signal result_u16_value_MUX_uxn_opcodes_h_l693_c2_c8ff_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l693_c2_c8ff]
signal result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l693_c2_c8ff]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_c8ff_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l693_c2_c8ff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_c8ff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l693_c2_c8ff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_c8ff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l693_c2_c8ff]
signal result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l693_c2_c8ff]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_c8ff_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l693_c2_c8ff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_c8ff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l693_c2_c8ff]
signal t16_MUX_uxn_opcodes_h_l693_c2_c8ff_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l706_c11_877e]
signal BIN_OP_EQ_uxn_opcodes_h_l706_c11_877e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l706_c11_877e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l706_c11_877e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l706_c7_8a9d]
signal n8_MUX_uxn_opcodes_h_l706_c7_8a9d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l706_c7_8a9d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l706_c7_8a9d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l706_c7_8a9d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_8a9d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_8a9d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_8a9d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l706_c7_8a9d]
signal result_u16_value_MUX_uxn_opcodes_h_l706_c7_8a9d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l706_c7_8a9d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l706_c7_8a9d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l706_c7_8a9d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_8a9d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_8a9d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_8a9d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l706_c7_8a9d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_8a9d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_8a9d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_8a9d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l706_c7_8a9d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_8a9d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_8a9d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_8a9d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l706_c7_8a9d]
signal t16_MUX_uxn_opcodes_h_l706_c7_8a9d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l706_c7_8a9d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l706_c7_8a9d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l709_c11_de31]
signal BIN_OP_EQ_uxn_opcodes_h_l709_c11_de31_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l709_c11_de31_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l709_c11_de31_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l709_c7_7fdd]
signal n8_MUX_uxn_opcodes_h_l709_c7_7fdd_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l709_c7_7fdd_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l709_c7_7fdd_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l709_c7_7fdd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_7fdd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_7fdd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_7fdd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l709_c7_7fdd]
signal result_u16_value_MUX_uxn_opcodes_h_l709_c7_7fdd_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l709_c7_7fdd_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l709_c7_7fdd_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l709_c7_7fdd]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_7fdd_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_7fdd_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_7fdd_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l709_c7_7fdd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_7fdd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_7fdd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_7fdd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l709_c7_7fdd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_7fdd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_7fdd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_7fdd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l709_c7_7fdd]
signal t16_MUX_uxn_opcodes_h_l709_c7_7fdd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l709_c7_7fdd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l709_c7_7fdd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l711_c3_8291]
signal CONST_SL_8_uxn_opcodes_h_l711_c3_8291_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l711_c3_8291_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l714_c11_41f5]
signal BIN_OP_EQ_uxn_opcodes_h_l714_c11_41f5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l714_c11_41f5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l714_c11_41f5_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l714_c7_70f3]
signal n8_MUX_uxn_opcodes_h_l714_c7_70f3_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l714_c7_70f3_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l714_c7_70f3_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l714_c7_70f3_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l714_c7_70f3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_70f3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_70f3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_70f3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_70f3_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l714_c7_70f3]
signal result_u16_value_MUX_uxn_opcodes_h_l714_c7_70f3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l714_c7_70f3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l714_c7_70f3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l714_c7_70f3_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l714_c7_70f3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_70f3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_70f3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_70f3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_70f3_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l714_c7_70f3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_70f3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_70f3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_70f3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_70f3_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l714_c7_70f3]
signal t16_MUX_uxn_opcodes_h_l714_c7_70f3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l714_c7_70f3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l714_c7_70f3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l714_c7_70f3_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l715_c3_e4b2]
signal BIN_OP_OR_uxn_opcodes_h_l715_c3_e4b2_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l715_c3_e4b2_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l715_c3_e4b2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l717_c11_94c5]
signal BIN_OP_EQ_uxn_opcodes_h_l717_c11_94c5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l717_c11_94c5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l717_c11_94c5_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l717_c7_d933]
signal n8_MUX_uxn_opcodes_h_l717_c7_d933_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l717_c7_d933_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l717_c7_d933_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l717_c7_d933_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l717_c7_d933]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_d933_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_d933_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_d933_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_d933_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l717_c7_d933]
signal result_u16_value_MUX_uxn_opcodes_h_l717_c7_d933_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l717_c7_d933_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l717_c7_d933_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l717_c7_d933_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l717_c7_d933]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_d933_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_d933_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_d933_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_d933_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l717_c7_d933]
signal result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_d933_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_d933_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_d933_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_d933_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l719_c30_17bb]
signal sp_relative_shift_uxn_opcodes_h_l719_c30_17bb_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l719_c30_17bb_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l719_c30_17bb_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l719_c30_17bb_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l720_c26_d3a5]
signal BIN_OP_EQ_uxn_opcodes_h_l720_c26_d3a5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l720_c26_d3a5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l720_c26_d3a5_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l720_c26_1c4a]
signal MUX_uxn_opcodes_h_l720_c26_1c4a_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l720_c26_1c4a_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l720_c26_1c4a_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l720_c26_1c4a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l721_c22_0d9d]
signal BIN_OP_EQ_uxn_opcodes_h_l721_c22_0d9d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l721_c22_0d9d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l721_c22_0d9d_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l721_c22_a88c]
signal MUX_uxn_opcodes_h_l721_c22_a88c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l721_c22_a88c_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l721_c22_a88c_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l721_c22_a88c_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_c1cd( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l693_c6_bd14
BIN_OP_EQ_uxn_opcodes_h_l693_c6_bd14 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l693_c6_bd14_left,
BIN_OP_EQ_uxn_opcodes_h_l693_c6_bd14_right,
BIN_OP_EQ_uxn_opcodes_h_l693_c6_bd14_return_output);

-- n8_MUX_uxn_opcodes_h_l693_c2_c8ff
n8_MUX_uxn_opcodes_h_l693_c2_c8ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l693_c2_c8ff_cond,
n8_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue,
n8_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse,
n8_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_c8ff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_c8ff : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_c8ff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l693_c2_c8ff
result_u16_value_MUX_uxn_opcodes_h_l693_c2_c8ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l693_c2_c8ff_cond,
result_u16_value_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_c8ff
result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_c8ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_c8ff
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_c8ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_c8ff_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_c8ff
result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_c8ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_c8ff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_c8ff
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_c8ff : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_c8ff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_c8ff
result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_c8ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_c8ff
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_c8ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_c8ff_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_c8ff
result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_c8ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_c8ff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output);

-- t16_MUX_uxn_opcodes_h_l693_c2_c8ff
t16_MUX_uxn_opcodes_h_l693_c2_c8ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l693_c2_c8ff_cond,
t16_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue,
t16_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse,
t16_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l706_c11_877e
BIN_OP_EQ_uxn_opcodes_h_l706_c11_877e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l706_c11_877e_left,
BIN_OP_EQ_uxn_opcodes_h_l706_c11_877e_right,
BIN_OP_EQ_uxn_opcodes_h_l706_c11_877e_return_output);

-- n8_MUX_uxn_opcodes_h_l706_c7_8a9d
n8_MUX_uxn_opcodes_h_l706_c7_8a9d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l706_c7_8a9d_cond,
n8_MUX_uxn_opcodes_h_l706_c7_8a9d_iftrue,
n8_MUX_uxn_opcodes_h_l706_c7_8a9d_iffalse,
n8_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_8a9d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_8a9d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_8a9d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_8a9d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_8a9d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l706_c7_8a9d
result_u16_value_MUX_uxn_opcodes_h_l706_c7_8a9d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l706_c7_8a9d_cond,
result_u16_value_MUX_uxn_opcodes_h_l706_c7_8a9d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l706_c7_8a9d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_8a9d
result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_8a9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_8a9d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_8a9d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_8a9d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_8a9d
result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_8a9d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_8a9d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_8a9d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_8a9d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_8a9d
result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_8a9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_8a9d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_8a9d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_8a9d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output);

-- t16_MUX_uxn_opcodes_h_l706_c7_8a9d
t16_MUX_uxn_opcodes_h_l706_c7_8a9d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l706_c7_8a9d_cond,
t16_MUX_uxn_opcodes_h_l706_c7_8a9d_iftrue,
t16_MUX_uxn_opcodes_h_l706_c7_8a9d_iffalse,
t16_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l709_c11_de31
BIN_OP_EQ_uxn_opcodes_h_l709_c11_de31 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l709_c11_de31_left,
BIN_OP_EQ_uxn_opcodes_h_l709_c11_de31_right,
BIN_OP_EQ_uxn_opcodes_h_l709_c11_de31_return_output);

-- n8_MUX_uxn_opcodes_h_l709_c7_7fdd
n8_MUX_uxn_opcodes_h_l709_c7_7fdd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l709_c7_7fdd_cond,
n8_MUX_uxn_opcodes_h_l709_c7_7fdd_iftrue,
n8_MUX_uxn_opcodes_h_l709_c7_7fdd_iffalse,
n8_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_7fdd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_7fdd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_7fdd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_7fdd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_7fdd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l709_c7_7fdd
result_u16_value_MUX_uxn_opcodes_h_l709_c7_7fdd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l709_c7_7fdd_cond,
result_u16_value_MUX_uxn_opcodes_h_l709_c7_7fdd_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l709_c7_7fdd_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_7fdd
result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_7fdd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_7fdd_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_7fdd_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_7fdd_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_7fdd
result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_7fdd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_7fdd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_7fdd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_7fdd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_7fdd
result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_7fdd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_7fdd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_7fdd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_7fdd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output);

-- t16_MUX_uxn_opcodes_h_l709_c7_7fdd
t16_MUX_uxn_opcodes_h_l709_c7_7fdd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l709_c7_7fdd_cond,
t16_MUX_uxn_opcodes_h_l709_c7_7fdd_iftrue,
t16_MUX_uxn_opcodes_h_l709_c7_7fdd_iffalse,
t16_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output);

-- CONST_SL_8_uxn_opcodes_h_l711_c3_8291
CONST_SL_8_uxn_opcodes_h_l711_c3_8291 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l711_c3_8291_x,
CONST_SL_8_uxn_opcodes_h_l711_c3_8291_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l714_c11_41f5
BIN_OP_EQ_uxn_opcodes_h_l714_c11_41f5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l714_c11_41f5_left,
BIN_OP_EQ_uxn_opcodes_h_l714_c11_41f5_right,
BIN_OP_EQ_uxn_opcodes_h_l714_c11_41f5_return_output);

-- n8_MUX_uxn_opcodes_h_l714_c7_70f3
n8_MUX_uxn_opcodes_h_l714_c7_70f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l714_c7_70f3_cond,
n8_MUX_uxn_opcodes_h_l714_c7_70f3_iftrue,
n8_MUX_uxn_opcodes_h_l714_c7_70f3_iffalse,
n8_MUX_uxn_opcodes_h_l714_c7_70f3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_70f3
result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_70f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_70f3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_70f3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_70f3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_70f3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l714_c7_70f3
result_u16_value_MUX_uxn_opcodes_h_l714_c7_70f3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l714_c7_70f3_cond,
result_u16_value_MUX_uxn_opcodes_h_l714_c7_70f3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l714_c7_70f3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l714_c7_70f3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_70f3
result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_70f3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_70f3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_70f3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_70f3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_70f3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_70f3
result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_70f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_70f3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_70f3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_70f3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_70f3_return_output);

-- t16_MUX_uxn_opcodes_h_l714_c7_70f3
t16_MUX_uxn_opcodes_h_l714_c7_70f3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l714_c7_70f3_cond,
t16_MUX_uxn_opcodes_h_l714_c7_70f3_iftrue,
t16_MUX_uxn_opcodes_h_l714_c7_70f3_iffalse,
t16_MUX_uxn_opcodes_h_l714_c7_70f3_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l715_c3_e4b2
BIN_OP_OR_uxn_opcodes_h_l715_c3_e4b2 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l715_c3_e4b2_left,
BIN_OP_OR_uxn_opcodes_h_l715_c3_e4b2_right,
BIN_OP_OR_uxn_opcodes_h_l715_c3_e4b2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l717_c11_94c5
BIN_OP_EQ_uxn_opcodes_h_l717_c11_94c5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l717_c11_94c5_left,
BIN_OP_EQ_uxn_opcodes_h_l717_c11_94c5_right,
BIN_OP_EQ_uxn_opcodes_h_l717_c11_94c5_return_output);

-- n8_MUX_uxn_opcodes_h_l717_c7_d933
n8_MUX_uxn_opcodes_h_l717_c7_d933 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l717_c7_d933_cond,
n8_MUX_uxn_opcodes_h_l717_c7_d933_iftrue,
n8_MUX_uxn_opcodes_h_l717_c7_d933_iffalse,
n8_MUX_uxn_opcodes_h_l717_c7_d933_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_d933
result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_d933 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_d933_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_d933_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_d933_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_d933_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l717_c7_d933
result_u16_value_MUX_uxn_opcodes_h_l717_c7_d933 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l717_c7_d933_cond,
result_u16_value_MUX_uxn_opcodes_h_l717_c7_d933_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l717_c7_d933_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l717_c7_d933_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_d933
result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_d933 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_d933_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_d933_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_d933_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_d933_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_d933
result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_d933 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_d933_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_d933_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_d933_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_d933_return_output);

-- sp_relative_shift_uxn_opcodes_h_l719_c30_17bb
sp_relative_shift_uxn_opcodes_h_l719_c30_17bb : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l719_c30_17bb_ins,
sp_relative_shift_uxn_opcodes_h_l719_c30_17bb_x,
sp_relative_shift_uxn_opcodes_h_l719_c30_17bb_y,
sp_relative_shift_uxn_opcodes_h_l719_c30_17bb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l720_c26_d3a5
BIN_OP_EQ_uxn_opcodes_h_l720_c26_d3a5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l720_c26_d3a5_left,
BIN_OP_EQ_uxn_opcodes_h_l720_c26_d3a5_right,
BIN_OP_EQ_uxn_opcodes_h_l720_c26_d3a5_return_output);

-- MUX_uxn_opcodes_h_l720_c26_1c4a
MUX_uxn_opcodes_h_l720_c26_1c4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l720_c26_1c4a_cond,
MUX_uxn_opcodes_h_l720_c26_1c4a_iftrue,
MUX_uxn_opcodes_h_l720_c26_1c4a_iffalse,
MUX_uxn_opcodes_h_l720_c26_1c4a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l721_c22_0d9d
BIN_OP_EQ_uxn_opcodes_h_l721_c22_0d9d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l721_c22_0d9d_left,
BIN_OP_EQ_uxn_opcodes_h_l721_c22_0d9d_right,
BIN_OP_EQ_uxn_opcodes_h_l721_c22_0d9d_return_output);

-- MUX_uxn_opcodes_h_l721_c22_a88c
MUX_uxn_opcodes_h_l721_c22_a88c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l721_c22_a88c_cond,
MUX_uxn_opcodes_h_l721_c22_a88c_iftrue,
MUX_uxn_opcodes_h_l721_c22_a88c_iffalse,
MUX_uxn_opcodes_h_l721_c22_a88c_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l693_c6_bd14_return_output,
 n8_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output,
 t16_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l706_c11_877e_return_output,
 n8_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output,
 t16_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l709_c11_de31_return_output,
 n8_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output,
 t16_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output,
 CONST_SL_8_uxn_opcodes_h_l711_c3_8291_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l714_c11_41f5_return_output,
 n8_MUX_uxn_opcodes_h_l714_c7_70f3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_70f3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l714_c7_70f3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_70f3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_70f3_return_output,
 t16_MUX_uxn_opcodes_h_l714_c7_70f3_return_output,
 BIN_OP_OR_uxn_opcodes_h_l715_c3_e4b2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l717_c11_94c5_return_output,
 n8_MUX_uxn_opcodes_h_l717_c7_d933_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_d933_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l717_c7_d933_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_d933_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_d933_return_output,
 sp_relative_shift_uxn_opcodes_h_l719_c30_17bb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l720_c26_d3a5_return_output,
 MUX_uxn_opcodes_h_l720_c26_1c4a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l721_c22_0d9d_return_output,
 MUX_uxn_opcodes_h_l721_c22_a88c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_bd14_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_bd14_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_bd14_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l693_c2_c8ff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l703_c3_f1be : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_c8ff_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_c8ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l693_c2_c8ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l693_c2_c8ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_c8ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l693_c2_c8ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_c8ff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l698_c3_79a0 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_c8ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l693_c2_c8ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_c8ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_c8ff_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l693_c2_c8ff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_877e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_877e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_877e_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l706_c7_8a9d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l706_c7_8a9d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l706_c7_8a9d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_8a9d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l707_c3_5f8c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_8a9d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_8a9d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_8a9d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_8a9d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_8a9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_8a9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_8a9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_8a9d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_8a9d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_8a9d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_8a9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_8a9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_8a9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_8a9d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l706_c7_8a9d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l706_c7_8a9d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l706_c7_8a9d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_de31_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_de31_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_de31_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l709_c7_7fdd_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l709_c7_7fdd_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l714_c7_70f3_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l709_c7_7fdd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_7fdd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l712_c3_5485 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_7fdd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l709_c7_7fdd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_7fdd_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_7fdd_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_7fdd_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_70f3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_7fdd_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_7fdd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_7fdd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_70f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_7fdd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_7fdd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_7fdd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_70f3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_7fdd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_7fdd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_7fdd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_70f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_7fdd_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l709_c7_7fdd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l709_c7_7fdd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l714_c7_70f3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l709_c7_7fdd_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l711_c3_8291_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l711_c3_8291_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_41f5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_41f5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_41f5_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l714_c7_70f3_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l714_c7_70f3_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l717_c7_d933_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l714_c7_70f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_70f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_70f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_d933_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_70f3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_70f3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_70f3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_d933_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_70f3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_70f3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_70f3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_d933_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_70f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_70f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_70f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_d933_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_70f3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l714_c7_70f3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l714_c7_70f3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l714_c7_70f3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_e4b2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_e4b2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_e4b2_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_94c5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_94c5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_94c5_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l717_c7_d933_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l717_c7_d933_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l717_c7_d933_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_d933_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_d933_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_d933_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_d933_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_d933_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_d933_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_d933_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_d933_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_d933_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_d933_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_d933_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_d933_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_17bb_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_17bb_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_17bb_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_17bb_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l720_c26_1c4a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_d3a5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_d3a5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_d3a5_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l720_c26_1c4a_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l720_c26_1c4a_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l720_c26_1c4a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l721_c22_a88c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_0d9d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_0d9d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_0d9d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l721_c22_a88c_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l721_c22_a88c_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l721_c22_a88c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l717_l714_l709_l706_l693_DUPLICATE_4ddd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_b456_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_f2f1_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_b744_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l710_l715_DUPLICATE_25f2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c1cd_uxn_opcodes_h_l725_l688_DUPLICATE_a6af_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_de31_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_17bb_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l698_c3_79a0 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l698_c3_79a0;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l703_c3_f1be := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l703_c3_f1be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_41f5_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_17bb_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l720_c26_1c4a_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l720_c26_1c4a_iffalse := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l721_c22_a88c_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_d3a5_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l707_c3_5f8c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_8a9d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l707_c3_5f8c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_0d9d_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_bd14_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_94c5_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_d933_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_877e_right := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l712_c3_5485 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_7fdd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l712_c3_5485;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_17bb_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l706_c7_8a9d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l709_c7_7fdd_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l714_c7_70f3_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l717_c7_d933_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_bd14_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_877e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_de31_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_41f5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_94c5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_d3a5_left := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_0d9d_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l717_c7_d933_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_e4b2_left := t16;
     VAR_MUX_uxn_opcodes_h_l721_c22_a88c_iffalse := t16;
     VAR_t16_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l706_c7_8a9d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l714_c7_70f3_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l714_c11_41f5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l714_c11_41f5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_41f5_left;
     BIN_OP_EQ_uxn_opcodes_h_l714_c11_41f5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_41f5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_41f5_return_output := BIN_OP_EQ_uxn_opcodes_h_l714_c11_41f5_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l717_l714_l709_l706_l693_DUPLICATE_4ddd LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l717_l714_l709_l706_l693_DUPLICATE_4ddd_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l709_c11_de31] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l709_c11_de31_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_de31_left;
     BIN_OP_EQ_uxn_opcodes_h_l709_c11_de31_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_de31_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_de31_return_output := BIN_OP_EQ_uxn_opcodes_h_l709_c11_de31_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_b744 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_b744_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l710_l715_DUPLICATE_25f2 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l710_l715_DUPLICATE_25f2_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l693_c2_c8ff] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l693_c2_c8ff_return_output := result.is_stack_index_flipped;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l709_c7_7fdd] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l709_c7_7fdd_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l706_c11_877e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l706_c11_877e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_877e_left;
     BIN_OP_EQ_uxn_opcodes_h_l706_c11_877e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_877e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_877e_return_output := BIN_OP_EQ_uxn_opcodes_h_l706_c11_877e_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_f2f1 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_f2f1_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l721_c22_0d9d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l721_c22_0d9d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_0d9d_left;
     BIN_OP_EQ_uxn_opcodes_h_l721_c22_0d9d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_0d9d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_0d9d_return_output := BIN_OP_EQ_uxn_opcodes_h_l721_c22_0d9d_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l693_c2_c8ff] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l693_c2_c8ff_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l693_c6_bd14] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l693_c6_bd14_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_bd14_left;
     BIN_OP_EQ_uxn_opcodes_h_l693_c6_bd14_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_bd14_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_bd14_return_output := BIN_OP_EQ_uxn_opcodes_h_l693_c6_bd14_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_b456 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_b456_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l720_c26_d3a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l720_c26_d3a5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_d3a5_left;
     BIN_OP_EQ_uxn_opcodes_h_l720_c26_d3a5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_d3a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_d3a5_return_output := BIN_OP_EQ_uxn_opcodes_h_l720_c26_d3a5_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l719_c30_17bb] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l719_c30_17bb_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_17bb_ins;
     sp_relative_shift_uxn_opcodes_h_l719_c30_17bb_x <= VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_17bb_x;
     sp_relative_shift_uxn_opcodes_h_l719_c30_17bb_y <= VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_17bb_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_17bb_return_output := sp_relative_shift_uxn_opcodes_h_l719_c30_17bb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l717_c11_94c5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l717_c11_94c5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_94c5_left;
     BIN_OP_EQ_uxn_opcodes_h_l717_c11_94c5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_94c5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_94c5_return_output := BIN_OP_EQ_uxn_opcodes_h_l717_c11_94c5_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l693_c2_c8ff] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l693_c2_c8ff_return_output := result.is_stack_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l693_c2_c8ff] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l693_c2_c8ff_return_output := result.is_vram_write;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l693_c2_c8ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_bd14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_c8ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_bd14_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_c8ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_bd14_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_bd14_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_c8ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_bd14_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_c8ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_bd14_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_bd14_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_c8ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_bd14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_c8ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_bd14_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_c8ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_bd14_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l693_c2_c8ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_bd14_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l706_c7_8a9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_877e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_8a9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_877e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_8a9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_877e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_8a9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_877e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_8a9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_877e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_8a9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_877e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l706_c7_8a9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_877e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l709_c7_7fdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_de31_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_7fdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_de31_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_7fdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_de31_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_7fdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_de31_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_7fdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_de31_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_7fdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_de31_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l709_c7_7fdd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_de31_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l714_c7_70f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_41f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_70f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_41f5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_70f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_41f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_70f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_41f5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_70f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_41f5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l714_c7_70f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_41f5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l717_c7_d933_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_94c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_d933_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_94c5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_d933_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_94c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_d933_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_94c5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_d933_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_94c5_return_output;
     VAR_MUX_uxn_opcodes_h_l720_c26_1c4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_d3a5_return_output;
     VAR_MUX_uxn_opcodes_h_l721_c22_a88c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_0d9d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_e4b2_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l710_l715_DUPLICATE_25f2_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l711_c3_8291_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l710_l715_DUPLICATE_25f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_8a9d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_f2f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_7fdd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_f2f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_70f3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_f2f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_d933_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_f2f1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l717_l714_l709_l706_l693_DUPLICATE_4ddd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_8a9d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l717_l714_l709_l706_l693_DUPLICATE_4ddd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_7fdd_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l717_l714_l709_l706_l693_DUPLICATE_4ddd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_70f3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l717_l714_l709_l706_l693_DUPLICATE_4ddd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_d933_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l717_l714_l709_l706_l693_DUPLICATE_4ddd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_8a9d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_b744_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_7fdd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_b744_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_70f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_b744_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_d933_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_b744_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_8a9d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_b456_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_7fdd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_b456_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_70f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_b456_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_d933_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_b456_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l693_c2_c8ff_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l693_c2_c8ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l693_c2_c8ff_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l693_c2_c8ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_7fdd_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l709_c7_7fdd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_d933_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_17bb_return_output;
     -- MUX[uxn_opcodes_h_l721_c22_a88c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l721_c22_a88c_cond <= VAR_MUX_uxn_opcodes_h_l721_c22_a88c_cond;
     MUX_uxn_opcodes_h_l721_c22_a88c_iftrue <= VAR_MUX_uxn_opcodes_h_l721_c22_a88c_iftrue;
     MUX_uxn_opcodes_h_l721_c22_a88c_iffalse <= VAR_MUX_uxn_opcodes_h_l721_c22_a88c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l721_c22_a88c_return_output := MUX_uxn_opcodes_h_l721_c22_a88c_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l693_c2_c8ff] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_c8ff_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_c8ff_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output;

     -- MUX[uxn_opcodes_h_l720_c26_1c4a] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l720_c26_1c4a_cond <= VAR_MUX_uxn_opcodes_h_l720_c26_1c4a_cond;
     MUX_uxn_opcodes_h_l720_c26_1c4a_iftrue <= VAR_MUX_uxn_opcodes_h_l720_c26_1c4a_iftrue;
     MUX_uxn_opcodes_h_l720_c26_1c4a_iffalse <= VAR_MUX_uxn_opcodes_h_l720_c26_1c4a_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l720_c26_1c4a_return_output := MUX_uxn_opcodes_h_l720_c26_1c4a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l709_c7_7fdd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_7fdd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_7fdd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_7fdd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_7fdd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_7fdd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_7fdd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l711_c3_8291] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l711_c3_8291_x <= VAR_CONST_SL_8_uxn_opcodes_h_l711_c3_8291_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l711_c3_8291_return_output := CONST_SL_8_uxn_opcodes_h_l711_c3_8291_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l717_c7_d933] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_d933_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_d933_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_d933_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_d933_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_d933_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_d933_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_d933_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_d933_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l717_c7_d933] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_d933_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_d933_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_d933_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_d933_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_d933_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_d933_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_d933_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_d933_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l693_c2_c8ff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_c8ff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_c8ff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l693_c2_c8ff] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output;

     -- n8_MUX[uxn_opcodes_h_l717_c7_d933] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l717_c7_d933_cond <= VAR_n8_MUX_uxn_opcodes_h_l717_c7_d933_cond;
     n8_MUX_uxn_opcodes_h_l717_c7_d933_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l717_c7_d933_iftrue;
     n8_MUX_uxn_opcodes_h_l717_c7_d933_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l717_c7_d933_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l717_c7_d933_return_output := n8_MUX_uxn_opcodes_h_l717_c7_d933_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l715_c3_e4b2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l715_c3_e4b2_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_e4b2_left;
     BIN_OP_OR_uxn_opcodes_h_l715_c3_e4b2_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_e4b2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_e4b2_return_output := BIN_OP_OR_uxn_opcodes_h_l715_c3_e4b2_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l693_c2_c8ff] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l714_c7_70f3_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_e4b2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l709_c7_7fdd_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l711_c3_8291_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_d933_iftrue := VAR_MUX_uxn_opcodes_h_l720_c26_1c4a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_d933_iftrue := VAR_MUX_uxn_opcodes_h_l721_c22_a88c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l714_c7_70f3_iffalse := VAR_n8_MUX_uxn_opcodes_h_l717_c7_d933_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_70f3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_d933_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_70f3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_d933_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_8a9d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l714_c7_70f3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_70f3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_70f3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_70f3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_70f3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_70f3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_70f3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_70f3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_70f3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l706_c7_8a9d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_8a9d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_8a9d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_8a9d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_8a9d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_8a9d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_8a9d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l714_c7_70f3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_70f3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_70f3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_70f3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_70f3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_70f3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_70f3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_70f3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_70f3_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l717_c7_d933] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l717_c7_d933_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_d933_cond;
     result_u16_value_MUX_uxn_opcodes_h_l717_c7_d933_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_d933_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l717_c7_d933_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_d933_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_d933_return_output := result_u16_value_MUX_uxn_opcodes_h_l717_c7_d933_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l717_c7_d933] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_d933_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_d933_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_d933_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_d933_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_d933_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_d933_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_d933_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_d933_return_output;

     -- n8_MUX[uxn_opcodes_h_l714_c7_70f3] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l714_c7_70f3_cond <= VAR_n8_MUX_uxn_opcodes_h_l714_c7_70f3_cond;
     n8_MUX_uxn_opcodes_h_l714_c7_70f3_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l714_c7_70f3_iftrue;
     n8_MUX_uxn_opcodes_h_l714_c7_70f3_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l714_c7_70f3_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l714_c7_70f3_return_output := n8_MUX_uxn_opcodes_h_l714_c7_70f3_return_output;

     -- t16_MUX[uxn_opcodes_h_l714_c7_70f3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l714_c7_70f3_cond <= VAR_t16_MUX_uxn_opcodes_h_l714_c7_70f3_cond;
     t16_MUX_uxn_opcodes_h_l714_c7_70f3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l714_c7_70f3_iftrue;
     t16_MUX_uxn_opcodes_h_l714_c7_70f3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l714_c7_70f3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l714_c7_70f3_return_output := t16_MUX_uxn_opcodes_h_l714_c7_70f3_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l709_c7_7fdd_iffalse := VAR_n8_MUX_uxn_opcodes_h_l714_c7_70f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_7fdd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_70f3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_70f3_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_d933_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_7fdd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_70f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_70f3_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_d933_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l709_c7_7fdd_iffalse := VAR_t16_MUX_uxn_opcodes_h_l714_c7_70f3_return_output;
     -- n8_MUX[uxn_opcodes_h_l709_c7_7fdd] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l709_c7_7fdd_cond <= VAR_n8_MUX_uxn_opcodes_h_l709_c7_7fdd_cond;
     n8_MUX_uxn_opcodes_h_l709_c7_7fdd_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l709_c7_7fdd_iftrue;
     n8_MUX_uxn_opcodes_h_l709_c7_7fdd_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l709_c7_7fdd_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output := n8_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output;

     -- t16_MUX[uxn_opcodes_h_l709_c7_7fdd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l709_c7_7fdd_cond <= VAR_t16_MUX_uxn_opcodes_h_l709_c7_7fdd_cond;
     t16_MUX_uxn_opcodes_h_l709_c7_7fdd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l709_c7_7fdd_iftrue;
     t16_MUX_uxn_opcodes_h_l709_c7_7fdd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l709_c7_7fdd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output := t16_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l714_c7_70f3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l714_c7_70f3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_70f3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l714_c7_70f3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_70f3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l714_c7_70f3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_70f3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_70f3_return_output := result_u16_value_MUX_uxn_opcodes_h_l714_c7_70f3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l693_c2_c8ff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_c8ff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_c8ff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l709_c7_7fdd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_7fdd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_7fdd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_7fdd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_7fdd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_7fdd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_7fdd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l709_c7_7fdd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_7fdd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_7fdd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_7fdd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_7fdd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_7fdd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_7fdd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l714_c7_70f3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_70f3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_70f3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_70f3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_70f3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_70f3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_70f3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_70f3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_70f3_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l706_c7_8a9d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_8a9d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_7fdd_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_70f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_8a9d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_7fdd_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_70f3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l706_c7_8a9d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l709_c7_7fdd] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l709_c7_7fdd_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_7fdd_cond;
     result_u16_value_MUX_uxn_opcodes_h_l709_c7_7fdd_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_7fdd_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l709_c7_7fdd_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_7fdd_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output := result_u16_value_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l706_c7_8a9d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_8a9d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_8a9d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_8a9d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_8a9d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_8a9d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_8a9d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l706_c7_8a9d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_8a9d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_8a9d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_8a9d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_8a9d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_8a9d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_8a9d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l709_c7_7fdd] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_7fdd_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_7fdd_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_7fdd_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_7fdd_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_7fdd_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_7fdd_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output;

     -- n8_MUX[uxn_opcodes_h_l706_c7_8a9d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l706_c7_8a9d_cond <= VAR_n8_MUX_uxn_opcodes_h_l706_c7_8a9d_cond;
     n8_MUX_uxn_opcodes_h_l706_c7_8a9d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l706_c7_8a9d_iftrue;
     n8_MUX_uxn_opcodes_h_l706_c7_8a9d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l706_c7_8a9d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output := n8_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output;

     -- t16_MUX[uxn_opcodes_h_l706_c7_8a9d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l706_c7_8a9d_cond <= VAR_t16_MUX_uxn_opcodes_h_l706_c7_8a9d_cond;
     t16_MUX_uxn_opcodes_h_l706_c7_8a9d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l706_c7_8a9d_iftrue;
     t16_MUX_uxn_opcodes_h_l706_c7_8a9d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l706_c7_8a9d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output := t16_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse := VAR_n8_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_8a9d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_8a9d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_7fdd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse := VAR_t16_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l706_c7_8a9d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l706_c7_8a9d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_8a9d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l706_c7_8a9d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_8a9d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l706_c7_8a9d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_8a9d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output := result_u16_value_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l693_c2_c8ff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_c8ff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_c8ff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output;

     -- t16_MUX[uxn_opcodes_h_l693_c2_c8ff] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l693_c2_c8ff_cond <= VAR_t16_MUX_uxn_opcodes_h_l693_c2_c8ff_cond;
     t16_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue;
     t16_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output := t16_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output;

     -- n8_MUX[uxn_opcodes_h_l693_c2_c8ff] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l693_c2_c8ff_cond <= VAR_n8_MUX_uxn_opcodes_h_l693_c2_c8ff_cond;
     n8_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue;
     n8_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output := n8_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l693_c2_c8ff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_c8ff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_c8ff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l706_c7_8a9d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_8a9d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_8a9d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_8a9d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_8a9d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_8a9d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_8a9d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_8a9d_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l693_c2_c8ff] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_c8ff_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_c8ff_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l693_c2_c8ff] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l693_c2_c8ff_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_c8ff_cond;
     result_u16_value_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_c8ff_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_c8ff_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output := result_u16_value_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c1cd_uxn_opcodes_h_l725_l688_DUPLICATE_a6af LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c1cd_uxn_opcodes_h_l725_l688_DUPLICATE_a6af_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c1cd(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_c8ff_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c1cd_uxn_opcodes_h_l725_l688_DUPLICATE_a6af_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c1cd_uxn_opcodes_h_l725_l688_DUPLICATE_a6af_return_output;
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
