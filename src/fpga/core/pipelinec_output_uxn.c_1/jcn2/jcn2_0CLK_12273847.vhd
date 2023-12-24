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
-- BIN_OP_EQ[uxn_opcodes_h_l693_c6_15a2]
signal BIN_OP_EQ_uxn_opcodes_h_l693_c6_15a2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l693_c6_15a2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l693_c6_15a2_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l693_c2_d0e6]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_d0e6_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l693_c2_d0e6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_d0e6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l693_c2_d0e6]
signal result_u16_value_MUX_uxn_opcodes_h_l693_c2_d0e6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l693_c2_d0e6]
signal result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l693_c2_d0e6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_d0e6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l693_c2_d0e6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_d0e6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l693_c2_d0e6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_d0e6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l693_c2_d0e6]
signal result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l693_c2_d0e6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_d0e6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l693_c2_d0e6]
signal n8_MUX_uxn_opcodes_h_l693_c2_d0e6_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l693_c2_d0e6]
signal t16_MUX_uxn_opcodes_h_l693_c2_d0e6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l706_c11_182e]
signal BIN_OP_EQ_uxn_opcodes_h_l706_c11_182e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l706_c11_182e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l706_c11_182e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l706_c7_5ca8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_5ca8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_5ca8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_5ca8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l706_c7_5ca8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_5ca8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_5ca8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_5ca8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l706_c7_5ca8]
signal result_u16_value_MUX_uxn_opcodes_h_l706_c7_5ca8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l706_c7_5ca8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l706_c7_5ca8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l706_c7_5ca8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_5ca8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_5ca8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_5ca8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l706_c7_5ca8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_5ca8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_5ca8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_5ca8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l706_c7_5ca8]
signal n8_MUX_uxn_opcodes_h_l706_c7_5ca8_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l706_c7_5ca8_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l706_c7_5ca8_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l706_c7_5ca8]
signal t16_MUX_uxn_opcodes_h_l706_c7_5ca8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l706_c7_5ca8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l706_c7_5ca8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l709_c11_60ba]
signal BIN_OP_EQ_uxn_opcodes_h_l709_c11_60ba_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l709_c11_60ba_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l709_c11_60ba_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l709_c7_8b10]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_8b10_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_8b10_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_8b10_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_8b10_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l709_c7_8b10]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_8b10_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_8b10_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_8b10_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_8b10_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l709_c7_8b10]
signal result_u16_value_MUX_uxn_opcodes_h_l709_c7_8b10_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l709_c7_8b10_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l709_c7_8b10_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l709_c7_8b10_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l709_c7_8b10]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_8b10_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_8b10_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_8b10_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_8b10_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l709_c7_8b10]
signal result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_8b10_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_8b10_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_8b10_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_8b10_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l709_c7_8b10]
signal n8_MUX_uxn_opcodes_h_l709_c7_8b10_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l709_c7_8b10_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l709_c7_8b10_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l709_c7_8b10_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l709_c7_8b10]
signal t16_MUX_uxn_opcodes_h_l709_c7_8b10_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l709_c7_8b10_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l709_c7_8b10_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l709_c7_8b10_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l711_c3_baed]
signal CONST_SL_8_uxn_opcodes_h_l711_c3_baed_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l711_c3_baed_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l714_c11_6981]
signal BIN_OP_EQ_uxn_opcodes_h_l714_c11_6981_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l714_c11_6981_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l714_c11_6981_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l714_c7_f4c2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l714_c7_f4c2]
signal result_u16_value_MUX_uxn_opcodes_h_l714_c7_f4c2_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l714_c7_f4c2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l714_c7_f4c2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l714_c7_f4c2]
signal n8_MUX_uxn_opcodes_h_l714_c7_f4c2_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l714_c7_f4c2]
signal t16_MUX_uxn_opcodes_h_l714_c7_f4c2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l715_c3_1069]
signal BIN_OP_OR_uxn_opcodes_h_l715_c3_1069_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l715_c3_1069_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l715_c3_1069_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l717_c11_df57]
signal BIN_OP_EQ_uxn_opcodes_h_l717_c11_df57_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l717_c11_df57_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l717_c11_df57_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l717_c7_c854]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_c854_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_c854_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_c854_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_c854_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l717_c7_c854]
signal result_u16_value_MUX_uxn_opcodes_h_l717_c7_c854_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l717_c7_c854_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l717_c7_c854_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l717_c7_c854_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l717_c7_c854]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_c854_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_c854_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_c854_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_c854_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l717_c7_c854]
signal result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_c854_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_c854_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_c854_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_c854_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l717_c7_c854]
signal n8_MUX_uxn_opcodes_h_l717_c7_c854_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l717_c7_c854_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l717_c7_c854_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l717_c7_c854_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l719_c30_92c5]
signal sp_relative_shift_uxn_opcodes_h_l719_c30_92c5_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l719_c30_92c5_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l719_c30_92c5_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l719_c30_92c5_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l720_c26_5f83]
signal BIN_OP_EQ_uxn_opcodes_h_l720_c26_5f83_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l720_c26_5f83_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l720_c26_5f83_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l720_c26_37ce]
signal MUX_uxn_opcodes_h_l720_c26_37ce_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l720_c26_37ce_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l720_c26_37ce_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l720_c26_37ce_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l721_c22_586e]
signal BIN_OP_EQ_uxn_opcodes_h_l721_c22_586e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l721_c22_586e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l721_c22_586e_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l721_c22_f160]
signal MUX_uxn_opcodes_h_l721_c22_f160_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l721_c22_f160_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l721_c22_f160_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l721_c22_f160_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_d1aa( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_pc_updated := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.is_stack_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l693_c6_15a2
BIN_OP_EQ_uxn_opcodes_h_l693_c6_15a2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l693_c6_15a2_left,
BIN_OP_EQ_uxn_opcodes_h_l693_c6_15a2_right,
BIN_OP_EQ_uxn_opcodes_h_l693_c6_15a2_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_d0e6
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_d0e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_d0e6_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_d0e6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_d0e6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_d0e6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l693_c2_d0e6
result_u16_value_MUX_uxn_opcodes_h_l693_c2_d0e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l693_c2_d0e6_cond,
result_u16_value_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_d0e6
result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_d0e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_d0e6
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_d0e6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_d0e6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_d0e6
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_d0e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_d0e6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_d0e6
result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_d0e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_d0e6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_d0e6
result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_d0e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_d0e6
result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_d0e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_d0e6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output);

-- n8_MUX_uxn_opcodes_h_l693_c2_d0e6
n8_MUX_uxn_opcodes_h_l693_c2_d0e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l693_c2_d0e6_cond,
n8_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue,
n8_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse,
n8_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output);

-- t16_MUX_uxn_opcodes_h_l693_c2_d0e6
t16_MUX_uxn_opcodes_h_l693_c2_d0e6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l693_c2_d0e6_cond,
t16_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue,
t16_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse,
t16_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l706_c11_182e
BIN_OP_EQ_uxn_opcodes_h_l706_c11_182e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l706_c11_182e_left,
BIN_OP_EQ_uxn_opcodes_h_l706_c11_182e_right,
BIN_OP_EQ_uxn_opcodes_h_l706_c11_182e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_5ca8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_5ca8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_5ca8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_5ca8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_5ca8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_5ca8
result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_5ca8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_5ca8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_5ca8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_5ca8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l706_c7_5ca8
result_u16_value_MUX_uxn_opcodes_h_l706_c7_5ca8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l706_c7_5ca8_cond,
result_u16_value_MUX_uxn_opcodes_h_l706_c7_5ca8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l706_c7_5ca8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_5ca8
result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_5ca8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_5ca8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_5ca8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_5ca8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_5ca8
result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_5ca8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_5ca8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_5ca8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_5ca8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output);

-- n8_MUX_uxn_opcodes_h_l706_c7_5ca8
n8_MUX_uxn_opcodes_h_l706_c7_5ca8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l706_c7_5ca8_cond,
n8_MUX_uxn_opcodes_h_l706_c7_5ca8_iftrue,
n8_MUX_uxn_opcodes_h_l706_c7_5ca8_iffalse,
n8_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output);

-- t16_MUX_uxn_opcodes_h_l706_c7_5ca8
t16_MUX_uxn_opcodes_h_l706_c7_5ca8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l706_c7_5ca8_cond,
t16_MUX_uxn_opcodes_h_l706_c7_5ca8_iftrue,
t16_MUX_uxn_opcodes_h_l706_c7_5ca8_iffalse,
t16_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l709_c11_60ba
BIN_OP_EQ_uxn_opcodes_h_l709_c11_60ba : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l709_c11_60ba_left,
BIN_OP_EQ_uxn_opcodes_h_l709_c11_60ba_right,
BIN_OP_EQ_uxn_opcodes_h_l709_c11_60ba_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_8b10
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_8b10 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_8b10_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_8b10_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_8b10_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_8b10_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_8b10
result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_8b10 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_8b10_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_8b10_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_8b10_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_8b10_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l709_c7_8b10
result_u16_value_MUX_uxn_opcodes_h_l709_c7_8b10 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l709_c7_8b10_cond,
result_u16_value_MUX_uxn_opcodes_h_l709_c7_8b10_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l709_c7_8b10_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l709_c7_8b10_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_8b10
result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_8b10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_8b10_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_8b10_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_8b10_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_8b10_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_8b10
result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_8b10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_8b10_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_8b10_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_8b10_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_8b10_return_output);

-- n8_MUX_uxn_opcodes_h_l709_c7_8b10
n8_MUX_uxn_opcodes_h_l709_c7_8b10 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l709_c7_8b10_cond,
n8_MUX_uxn_opcodes_h_l709_c7_8b10_iftrue,
n8_MUX_uxn_opcodes_h_l709_c7_8b10_iffalse,
n8_MUX_uxn_opcodes_h_l709_c7_8b10_return_output);

-- t16_MUX_uxn_opcodes_h_l709_c7_8b10
t16_MUX_uxn_opcodes_h_l709_c7_8b10 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l709_c7_8b10_cond,
t16_MUX_uxn_opcodes_h_l709_c7_8b10_iftrue,
t16_MUX_uxn_opcodes_h_l709_c7_8b10_iffalse,
t16_MUX_uxn_opcodes_h_l709_c7_8b10_return_output);

-- CONST_SL_8_uxn_opcodes_h_l711_c3_baed
CONST_SL_8_uxn_opcodes_h_l711_c3_baed : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l711_c3_baed_x,
CONST_SL_8_uxn_opcodes_h_l711_c3_baed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l714_c11_6981
BIN_OP_EQ_uxn_opcodes_h_l714_c11_6981 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l714_c11_6981_left,
BIN_OP_EQ_uxn_opcodes_h_l714_c11_6981_right,
BIN_OP_EQ_uxn_opcodes_h_l714_c11_6981_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_f4c2
result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_f4c2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l714_c7_f4c2
result_u16_value_MUX_uxn_opcodes_h_l714_c7_f4c2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l714_c7_f4c2_cond,
result_u16_value_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2
result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2
result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output);

-- n8_MUX_uxn_opcodes_h_l714_c7_f4c2
n8_MUX_uxn_opcodes_h_l714_c7_f4c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l714_c7_f4c2_cond,
n8_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue,
n8_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse,
n8_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output);

-- t16_MUX_uxn_opcodes_h_l714_c7_f4c2
t16_MUX_uxn_opcodes_h_l714_c7_f4c2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l714_c7_f4c2_cond,
t16_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue,
t16_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse,
t16_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l715_c3_1069
BIN_OP_OR_uxn_opcodes_h_l715_c3_1069 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l715_c3_1069_left,
BIN_OP_OR_uxn_opcodes_h_l715_c3_1069_right,
BIN_OP_OR_uxn_opcodes_h_l715_c3_1069_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l717_c11_df57
BIN_OP_EQ_uxn_opcodes_h_l717_c11_df57 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l717_c11_df57_left,
BIN_OP_EQ_uxn_opcodes_h_l717_c11_df57_right,
BIN_OP_EQ_uxn_opcodes_h_l717_c11_df57_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_c854
result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_c854 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_c854_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_c854_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_c854_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_c854_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l717_c7_c854
result_u16_value_MUX_uxn_opcodes_h_l717_c7_c854 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l717_c7_c854_cond,
result_u16_value_MUX_uxn_opcodes_h_l717_c7_c854_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l717_c7_c854_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l717_c7_c854_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_c854
result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_c854 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_c854_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_c854_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_c854_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_c854_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_c854
result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_c854 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_c854_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_c854_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_c854_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_c854_return_output);

-- n8_MUX_uxn_opcodes_h_l717_c7_c854
n8_MUX_uxn_opcodes_h_l717_c7_c854 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l717_c7_c854_cond,
n8_MUX_uxn_opcodes_h_l717_c7_c854_iftrue,
n8_MUX_uxn_opcodes_h_l717_c7_c854_iffalse,
n8_MUX_uxn_opcodes_h_l717_c7_c854_return_output);

-- sp_relative_shift_uxn_opcodes_h_l719_c30_92c5
sp_relative_shift_uxn_opcodes_h_l719_c30_92c5 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l719_c30_92c5_ins,
sp_relative_shift_uxn_opcodes_h_l719_c30_92c5_x,
sp_relative_shift_uxn_opcodes_h_l719_c30_92c5_y,
sp_relative_shift_uxn_opcodes_h_l719_c30_92c5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l720_c26_5f83
BIN_OP_EQ_uxn_opcodes_h_l720_c26_5f83 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l720_c26_5f83_left,
BIN_OP_EQ_uxn_opcodes_h_l720_c26_5f83_right,
BIN_OP_EQ_uxn_opcodes_h_l720_c26_5f83_return_output);

-- MUX_uxn_opcodes_h_l720_c26_37ce
MUX_uxn_opcodes_h_l720_c26_37ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l720_c26_37ce_cond,
MUX_uxn_opcodes_h_l720_c26_37ce_iftrue,
MUX_uxn_opcodes_h_l720_c26_37ce_iffalse,
MUX_uxn_opcodes_h_l720_c26_37ce_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l721_c22_586e
BIN_OP_EQ_uxn_opcodes_h_l721_c22_586e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l721_c22_586e_left,
BIN_OP_EQ_uxn_opcodes_h_l721_c22_586e_right,
BIN_OP_EQ_uxn_opcodes_h_l721_c22_586e_return_output);

-- MUX_uxn_opcodes_h_l721_c22_f160
MUX_uxn_opcodes_h_l721_c22_f160 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l721_c22_f160_cond,
MUX_uxn_opcodes_h_l721_c22_f160_iftrue,
MUX_uxn_opcodes_h_l721_c22_f160_iffalse,
MUX_uxn_opcodes_h_l721_c22_f160_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l693_c6_15a2_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output,
 n8_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output,
 t16_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l706_c11_182e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output,
 n8_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output,
 t16_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l709_c11_60ba_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_8b10_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_8b10_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l709_c7_8b10_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_8b10_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_8b10_return_output,
 n8_MUX_uxn_opcodes_h_l709_c7_8b10_return_output,
 t16_MUX_uxn_opcodes_h_l709_c7_8b10_return_output,
 CONST_SL_8_uxn_opcodes_h_l711_c3_baed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l714_c11_6981_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output,
 n8_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output,
 t16_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l715_c3_1069_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l717_c11_df57_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_c854_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l717_c7_c854_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_c854_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_c854_return_output,
 n8_MUX_uxn_opcodes_h_l717_c7_c854_return_output,
 sp_relative_shift_uxn_opcodes_h_l719_c30_92c5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l720_c26_5f83_return_output,
 MUX_uxn_opcodes_h_l720_c26_37ce_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l721_c22_586e_return_output,
 MUX_uxn_opcodes_h_l721_c22_f160_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_15a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_15a2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_15a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l693_c2_d0e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_d0e6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l703_c3_a147 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_d0e6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_d0e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l693_c2_d0e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l698_c3_2605 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_d0e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_d0e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_d0e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l693_c2_d0e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l693_c2_d0e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_d0e6_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l693_c2_d0e6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l693_c2_d0e6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_182e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_182e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_182e_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_5ca8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l707_c3_c5c4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_5ca8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_8b10_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_5ca8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_5ca8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_5ca8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_8b10_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_5ca8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_5ca8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_5ca8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_8b10_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_5ca8_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_5ca8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_5ca8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_8b10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_5ca8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_5ca8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_5ca8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_8b10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_5ca8_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l706_c7_5ca8_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l706_c7_5ca8_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l709_c7_8b10_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l706_c7_5ca8_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l706_c7_5ca8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l706_c7_5ca8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l709_c7_8b10_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l706_c7_5ca8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_60ba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_60ba_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_60ba_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_8b10_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l712_c3_9bc1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_8b10_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l709_c7_8b10_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_8b10_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_8b10_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_8b10_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_8b10_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_8b10_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_8b10_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_8b10_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_8b10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_8b10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_8b10_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_8b10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_8b10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_8b10_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l709_c7_8b10_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l709_c7_8b10_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l709_c7_8b10_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l709_c7_8b10_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l709_c7_8b10_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l709_c7_8b10_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l711_c3_baed_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l711_c3_baed_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_6981_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_6981_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_6981_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_c854_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_c854_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_f4c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_c854_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_c854_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l717_c7_c854_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l714_c7_f4c2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l714_c7_f4c2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_1069_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_1069_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_1069_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_df57_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_df57_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_df57_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_c854_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_c854_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_c854_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_c854_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_c854_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_c854_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_c854_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_c854_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_c854_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_c854_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_c854_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_c854_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l717_c7_c854_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l717_c7_c854_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l717_c7_c854_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_92c5_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_92c5_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_92c5_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_92c5_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l720_c26_37ce_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_5f83_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_5f83_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_5f83_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l720_c26_37ce_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l720_c26_37ce_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l720_c26_37ce_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l721_c22_f160_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_586e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_586e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_586e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l721_c22_f160_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l721_c22_f160_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l721_c22_f160_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l709_l706_l693_l717_l714_DUPLICATE_3af4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_aacc_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_79ea_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_f74c_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l710_l715_DUPLICATE_6655_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d1aa_uxn_opcodes_h_l688_l725_DUPLICATE_6d49_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l707_c3_c5c4 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_5ca8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l707_c3_c5c4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_15a2_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_c854_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l703_c3_a147 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l703_c3_a147;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_6981_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_5f83_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l712_c3_9bc1 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_8b10_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l712_c3_9bc1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_60ba_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_df57_right := to_unsigned(4, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l698_c3_2605 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l698_c3_2605;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_182e_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_92c5_y := resize(to_signed(-3, 3), 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_92c5_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_586e_right := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l721_c22_f160_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l720_c26_37ce_iffalse := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l720_c26_37ce_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_92c5_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l706_c7_5ca8_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l709_c7_8b10_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l717_c7_c854_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_15a2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_182e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_60ba_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_6981_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_df57_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_5f83_left := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_586e_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l717_c7_c854_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_1069_left := t16;
     VAR_MUX_uxn_opcodes_h_l721_c22_f160_iffalse := t16;
     VAR_t16_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l706_c7_5ca8_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse := t16;
     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l693_c2_d0e6] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l693_c2_d0e6_return_output := result.is_ram_write;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l693_c2_d0e6] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l693_c2_d0e6_return_output := result.is_stack_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l693_c2_d0e6] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l693_c2_d0e6_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l709_c11_60ba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l709_c11_60ba_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_60ba_left;
     BIN_OP_EQ_uxn_opcodes_h_l709_c11_60ba_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_60ba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_60ba_return_output := BIN_OP_EQ_uxn_opcodes_h_l709_c11_60ba_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l693_c2_d0e6] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l693_c2_d0e6_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l693_c6_15a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l693_c6_15a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_15a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l693_c6_15a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_15a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_15a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l693_c6_15a2_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l719_c30_92c5] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l719_c30_92c5_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_92c5_ins;
     sp_relative_shift_uxn_opcodes_h_l719_c30_92c5_x <= VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_92c5_x;
     sp_relative_shift_uxn_opcodes_h_l719_c30_92c5_y <= VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_92c5_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_92c5_return_output := sp_relative_shift_uxn_opcodes_h_l719_c30_92c5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_f74c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_f74c_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l720_c26_5f83] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l720_c26_5f83_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_5f83_left;
     BIN_OP_EQ_uxn_opcodes_h_l720_c26_5f83_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_5f83_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_5f83_return_output := BIN_OP_EQ_uxn_opcodes_h_l720_c26_5f83_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l710_l715_DUPLICATE_6655 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l710_l715_DUPLICATE_6655_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l709_c7_8b10] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l709_c7_8b10_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l706_c11_182e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l706_c11_182e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_182e_left;
     BIN_OP_EQ_uxn_opcodes_h_l706_c11_182e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_182e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_182e_return_output := BIN_OP_EQ_uxn_opcodes_h_l706_c11_182e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l717_c11_df57] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l717_c11_df57_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_df57_left;
     BIN_OP_EQ_uxn_opcodes_h_l717_c11_df57_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_df57_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_df57_return_output := BIN_OP_EQ_uxn_opcodes_h_l717_c11_df57_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_79ea LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_79ea_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l714_c11_6981] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l714_c11_6981_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_6981_left;
     BIN_OP_EQ_uxn_opcodes_h_l714_c11_6981_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_6981_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_6981_return_output := BIN_OP_EQ_uxn_opcodes_h_l714_c11_6981_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l709_l706_l693_l717_l714_DUPLICATE_3af4 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l709_l706_l693_l717_l714_DUPLICATE_3af4_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l721_c22_586e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l721_c22_586e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_586e_left;
     BIN_OP_EQ_uxn_opcodes_h_l721_c22_586e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_586e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_586e_return_output := BIN_OP_EQ_uxn_opcodes_h_l721_c22_586e_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_aacc LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_aacc_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l693_c2_d0e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_15a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_d0e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_15a2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_d0e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_15a2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_15a2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_d0e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_15a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_d0e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_15a2_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_15a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_d0e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_15a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_d0e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_15a2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_d0e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_15a2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l693_c2_d0e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_15a2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l706_c7_5ca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_182e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_5ca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_182e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_5ca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_182e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_5ca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_182e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_5ca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_182e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_5ca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_182e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l706_c7_5ca8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_182e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l709_c7_8b10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_60ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_8b10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_60ba_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_8b10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_60ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_8b10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_60ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_8b10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_60ba_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_8b10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_60ba_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l709_c7_8b10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_60ba_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l714_c7_f4c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_6981_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_6981_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_6981_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_6981_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_f4c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_6981_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l714_c7_f4c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_6981_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l717_c7_c854_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_df57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_c854_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_df57_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_c854_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_df57_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_c854_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_df57_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_c854_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_df57_return_output;
     VAR_MUX_uxn_opcodes_h_l720_c26_37ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_5f83_return_output;
     VAR_MUX_uxn_opcodes_h_l721_c22_f160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_586e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_1069_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l710_l715_DUPLICATE_6655_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l711_c3_baed_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l710_l715_DUPLICATE_6655_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_5ca8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_aacc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_8b10_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_aacc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_aacc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_c854_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_aacc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l709_l706_l693_l717_l714_DUPLICATE_3af4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_5ca8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l709_l706_l693_l717_l714_DUPLICATE_3af4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_8b10_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l709_l706_l693_l717_l714_DUPLICATE_3af4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l709_l706_l693_l717_l714_DUPLICATE_3af4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_c854_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l709_l706_l693_l717_l714_DUPLICATE_3af4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_5ca8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_f74c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_8b10_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_f74c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_f74c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_c854_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_f74c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_5ca8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_79ea_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_8b10_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_79ea_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_79ea_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_c854_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l709_l714_l706_l717_DUPLICATE_79ea_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l693_c2_d0e6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l693_c2_d0e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l693_c2_d0e6_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l693_c2_d0e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_8b10_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l709_c7_8b10_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_c854_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_92c5_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l717_c7_c854] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_c854_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_c854_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_c854_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_c854_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_c854_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_c854_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_c854_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_c854_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l693_c2_d0e6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_d0e6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_d0e6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l711_c3_baed] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l711_c3_baed_x <= VAR_CONST_SL_8_uxn_opcodes_h_l711_c3_baed_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l711_c3_baed_return_output := CONST_SL_8_uxn_opcodes_h_l711_c3_baed_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l693_c2_d0e6] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output;

     -- n8_MUX[uxn_opcodes_h_l717_c7_c854] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l717_c7_c854_cond <= VAR_n8_MUX_uxn_opcodes_h_l717_c7_c854_cond;
     n8_MUX_uxn_opcodes_h_l717_c7_c854_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l717_c7_c854_iftrue;
     n8_MUX_uxn_opcodes_h_l717_c7_c854_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l717_c7_c854_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l717_c7_c854_return_output := n8_MUX_uxn_opcodes_h_l717_c7_c854_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l693_c2_d0e6] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l717_c7_c854] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_c854_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_c854_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_c854_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_c854_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_c854_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_c854_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_c854_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_c854_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l709_c7_8b10] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_8b10_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_8b10_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_8b10_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_8b10_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_8b10_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_8b10_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_8b10_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_8b10_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l715_c3_1069] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l715_c3_1069_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_1069_left;
     BIN_OP_OR_uxn_opcodes_h_l715_c3_1069_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_1069_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_1069_return_output := BIN_OP_OR_uxn_opcodes_h_l715_c3_1069_return_output;

     -- MUX[uxn_opcodes_h_l720_c26_37ce] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l720_c26_37ce_cond <= VAR_MUX_uxn_opcodes_h_l720_c26_37ce_cond;
     MUX_uxn_opcodes_h_l720_c26_37ce_iftrue <= VAR_MUX_uxn_opcodes_h_l720_c26_37ce_iftrue;
     MUX_uxn_opcodes_h_l720_c26_37ce_iffalse <= VAR_MUX_uxn_opcodes_h_l720_c26_37ce_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l720_c26_37ce_return_output := MUX_uxn_opcodes_h_l720_c26_37ce_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l693_c2_d0e6] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_d0e6_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_d0e6_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output;

     -- MUX[uxn_opcodes_h_l721_c22_f160] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l721_c22_f160_cond <= VAR_MUX_uxn_opcodes_h_l721_c22_f160_cond;
     MUX_uxn_opcodes_h_l721_c22_f160_iftrue <= VAR_MUX_uxn_opcodes_h_l721_c22_f160_iftrue;
     MUX_uxn_opcodes_h_l721_c22_f160_iffalse <= VAR_MUX_uxn_opcodes_h_l721_c22_f160_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l721_c22_f160_return_output := MUX_uxn_opcodes_h_l721_c22_f160_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_1069_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l709_c7_8b10_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l711_c3_baed_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_c854_iftrue := VAR_MUX_uxn_opcodes_h_l720_c26_37ce_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_c854_iftrue := VAR_MUX_uxn_opcodes_h_l721_c22_f160_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse := VAR_n8_MUX_uxn_opcodes_h_l717_c7_c854_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_c854_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_c854_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_5ca8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_8b10_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l717_c7_c854] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l717_c7_c854_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_c854_cond;
     result_u16_value_MUX_uxn_opcodes_h_l717_c7_c854_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_c854_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l717_c7_c854_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_c854_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_c854_return_output := result_u16_value_MUX_uxn_opcodes_h_l717_c7_c854_return_output;

     -- n8_MUX[uxn_opcodes_h_l714_c7_f4c2] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l714_c7_f4c2_cond <= VAR_n8_MUX_uxn_opcodes_h_l714_c7_f4c2_cond;
     n8_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue;
     n8_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output := n8_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l706_c7_5ca8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_5ca8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_5ca8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_5ca8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_5ca8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_5ca8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_5ca8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l717_c7_c854] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_c854_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_c854_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_c854_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_c854_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_c854_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_c854_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_c854_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_c854_return_output;

     -- t16_MUX[uxn_opcodes_h_l714_c7_f4c2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l714_c7_f4c2_cond <= VAR_t16_MUX_uxn_opcodes_h_l714_c7_f4c2_cond;
     t16_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue;
     t16_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output := t16_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l714_c7_f4c2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l714_c7_f4c2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l709_c7_8b10_iffalse := VAR_n8_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_8b10_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_c854_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_8b10_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_c854_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l709_c7_8b10_iffalse := VAR_t16_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l709_c7_8b10] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_8b10_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_8b10_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_8b10_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_8b10_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_8b10_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_8b10_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_8b10_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_8b10_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l693_c2_d0e6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_d0e6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_d0e6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l714_c7_f4c2] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l714_c7_f4c2_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_f4c2_cond;
     result_u16_value_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output := result_u16_value_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l714_c7_f4c2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output;

     -- n8_MUX[uxn_opcodes_h_l709_c7_8b10] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l709_c7_8b10_cond <= VAR_n8_MUX_uxn_opcodes_h_l709_c7_8b10_cond;
     n8_MUX_uxn_opcodes_h_l709_c7_8b10_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l709_c7_8b10_iftrue;
     n8_MUX_uxn_opcodes_h_l709_c7_8b10_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l709_c7_8b10_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l709_c7_8b10_return_output := n8_MUX_uxn_opcodes_h_l709_c7_8b10_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l709_c7_8b10] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_8b10_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_8b10_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_8b10_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_8b10_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_8b10_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_8b10_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_8b10_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_8b10_return_output;

     -- t16_MUX[uxn_opcodes_h_l709_c7_8b10] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l709_c7_8b10_cond <= VAR_t16_MUX_uxn_opcodes_h_l709_c7_8b10_cond;
     t16_MUX_uxn_opcodes_h_l709_c7_8b10_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l709_c7_8b10_iftrue;
     t16_MUX_uxn_opcodes_h_l709_c7_8b10_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l709_c7_8b10_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l709_c7_8b10_return_output := t16_MUX_uxn_opcodes_h_l709_c7_8b10_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l706_c7_5ca8_iffalse := VAR_n8_MUX_uxn_opcodes_h_l709_c7_8b10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_5ca8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_8b10_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_8b10_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_5ca8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_8b10_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_8b10_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_f4c2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l706_c7_5ca8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l709_c7_8b10_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l706_c7_5ca8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_5ca8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_5ca8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_5ca8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_5ca8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_5ca8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_5ca8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l706_c7_5ca8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_5ca8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_5ca8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_5ca8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_5ca8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_5ca8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_5ca8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l709_c7_8b10] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_8b10_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_8b10_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_8b10_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_8b10_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_8b10_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_8b10_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_8b10_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_8b10_return_output;

     -- t16_MUX[uxn_opcodes_h_l706_c7_5ca8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l706_c7_5ca8_cond <= VAR_t16_MUX_uxn_opcodes_h_l706_c7_5ca8_cond;
     t16_MUX_uxn_opcodes_h_l706_c7_5ca8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l706_c7_5ca8_iftrue;
     t16_MUX_uxn_opcodes_h_l706_c7_5ca8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l706_c7_5ca8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output := t16_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output;

     -- n8_MUX[uxn_opcodes_h_l706_c7_5ca8] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l706_c7_5ca8_cond <= VAR_n8_MUX_uxn_opcodes_h_l706_c7_5ca8_cond;
     n8_MUX_uxn_opcodes_h_l706_c7_5ca8_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l706_c7_5ca8_iftrue;
     n8_MUX_uxn_opcodes_h_l706_c7_5ca8_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l706_c7_5ca8_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output := n8_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l709_c7_8b10] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l709_c7_8b10_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_8b10_cond;
     result_u16_value_MUX_uxn_opcodes_h_l709_c7_8b10_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_8b10_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l709_c7_8b10_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_8b10_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_8b10_return_output := result_u16_value_MUX_uxn_opcodes_h_l709_c7_8b10_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse := VAR_n8_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_5ca8_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_8b10_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_5ca8_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_8b10_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output;
     -- n8_MUX[uxn_opcodes_h_l693_c2_d0e6] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l693_c2_d0e6_cond <= VAR_n8_MUX_uxn_opcodes_h_l693_c2_d0e6_cond;
     n8_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue;
     n8_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output := n8_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l693_c2_d0e6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_d0e6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_d0e6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l706_c7_5ca8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_5ca8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_5ca8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_5ca8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_5ca8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_5ca8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_5ca8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l706_c7_5ca8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l706_c7_5ca8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_5ca8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l706_c7_5ca8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_5ca8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l706_c7_5ca8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_5ca8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output := result_u16_value_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l693_c2_d0e6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_d0e6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_d0e6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output;

     -- t16_MUX[uxn_opcodes_h_l693_c2_d0e6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l693_c2_d0e6_cond <= VAR_t16_MUX_uxn_opcodes_h_l693_c2_d0e6_cond;
     t16_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue;
     t16_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output := t16_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_5ca8_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l693_c2_d0e6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_d0e6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_d0e6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l693_c2_d0e6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l693_c2_d0e6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_d0e6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_d0e6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_d0e6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output := result_u16_value_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d1aa_uxn_opcodes_h_l688_l725_DUPLICATE_6d49 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d1aa_uxn_opcodes_h_l688_l725_DUPLICATE_6d49_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d1aa(
     result,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_d0e6_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d1aa_uxn_opcodes_h_l688_l725_DUPLICATE_6d49_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d1aa_uxn_opcodes_h_l688_l725_DUPLICATE_6d49_return_output;
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
