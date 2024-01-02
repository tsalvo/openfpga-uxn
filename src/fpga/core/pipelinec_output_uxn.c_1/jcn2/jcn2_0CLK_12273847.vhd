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
-- BIN_OP_EQ[uxn_opcodes_h_l693_c6_1f82]
signal BIN_OP_EQ_uxn_opcodes_h_l693_c6_1f82_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l693_c6_1f82_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l693_c6_1f82_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l693_c2_e1ee]
signal n8_MUX_uxn_opcodes_h_l693_c2_e1ee_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l693_c2_e1ee]
signal t16_MUX_uxn_opcodes_h_l693_c2_e1ee_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l693_c2_e1ee]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_e1ee_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l693_c2_e1ee]
signal result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l693_c2_e1ee]
signal result_u16_value_MUX_uxn_opcodes_h_l693_c2_e1ee_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l693_c2_e1ee]
signal result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_e1ee_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l693_c2_e1ee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_e1ee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l693_c2_e1ee]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_e1ee_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l693_c2_e1ee]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_e1ee_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l693_c2_e1ee]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_e1ee_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l693_c2_e1ee]
signal result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l706_c11_67bc]
signal BIN_OP_EQ_uxn_opcodes_h_l706_c11_67bc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l706_c11_67bc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l706_c11_67bc_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l706_c7_bf5f]
signal n8_MUX_uxn_opcodes_h_l706_c7_bf5f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l706_c7_bf5f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l706_c7_bf5f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l706_c7_bf5f]
signal t16_MUX_uxn_opcodes_h_l706_c7_bf5f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l706_c7_bf5f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l706_c7_bf5f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l706_c7_bf5f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_bf5f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_bf5f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_bf5f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l706_c7_bf5f]
signal result_u16_value_MUX_uxn_opcodes_h_l706_c7_bf5f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l706_c7_bf5f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l706_c7_bf5f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l706_c7_bf5f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_bf5f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_bf5f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_bf5f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l706_c7_bf5f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_bf5f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_bf5f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_bf5f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l706_c7_bf5f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_bf5f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_bf5f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_bf5f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l709_c11_62f0]
signal BIN_OP_EQ_uxn_opcodes_h_l709_c11_62f0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l709_c11_62f0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l709_c11_62f0_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l709_c7_dcf2]
signal n8_MUX_uxn_opcodes_h_l709_c7_dcf2_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l709_c7_dcf2_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l709_c7_dcf2_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l709_c7_dcf2]
signal t16_MUX_uxn_opcodes_h_l709_c7_dcf2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l709_c7_dcf2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l709_c7_dcf2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l709_c7_dcf2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dcf2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dcf2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dcf2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l709_c7_dcf2]
signal result_u16_value_MUX_uxn_opcodes_h_l709_c7_dcf2_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l709_c7_dcf2_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l709_c7_dcf2_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l709_c7_dcf2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dcf2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dcf2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dcf2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l709_c7_dcf2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dcf2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dcf2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dcf2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l709_c7_dcf2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dcf2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dcf2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dcf2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output : unsigned(3 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l711_c3_03b9]
signal CONST_SL_8_uxn_opcodes_h_l711_c3_03b9_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l711_c3_03b9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l714_c11_6a8b]
signal BIN_OP_EQ_uxn_opcodes_h_l714_c11_6a8b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l714_c11_6a8b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l714_c11_6a8b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l714_c7_6a14]
signal n8_MUX_uxn_opcodes_h_l714_c7_6a14_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l714_c7_6a14_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l714_c7_6a14_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l714_c7_6a14_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l714_c7_6a14]
signal t16_MUX_uxn_opcodes_h_l714_c7_6a14_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l714_c7_6a14_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l714_c7_6a14_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l714_c7_6a14_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l714_c7_6a14]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_6a14_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_6a14_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_6a14_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_6a14_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l714_c7_6a14]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_6a14_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_6a14_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_6a14_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_6a14_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l714_c7_6a14]
signal result_u16_value_MUX_uxn_opcodes_h_l714_c7_6a14_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l714_c7_6a14_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l714_c7_6a14_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l714_c7_6a14_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l714_c7_6a14]
signal result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_6a14_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_6a14_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_6a14_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_6a14_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l715_c3_25ff]
signal BIN_OP_OR_uxn_opcodes_h_l715_c3_25ff_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l715_c3_25ff_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l715_c3_25ff_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l717_c11_7875]
signal BIN_OP_EQ_uxn_opcodes_h_l717_c11_7875_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l717_c11_7875_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l717_c11_7875_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l717_c7_f6d6]
signal n8_MUX_uxn_opcodes_h_l717_c7_f6d6_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l717_c7_f6d6_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l717_c7_f6d6_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l717_c7_f6d6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l717_c7_f6d6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_f6d6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_f6d6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_f6d6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_f6d6_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l717_c7_f6d6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_f6d6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_f6d6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_f6d6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_f6d6_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l717_c7_f6d6]
signal result_u16_value_MUX_uxn_opcodes_h_l717_c7_f6d6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l717_c7_f6d6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l717_c7_f6d6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l717_c7_f6d6_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l717_c7_f6d6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_f6d6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_f6d6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_f6d6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_f6d6_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l719_c30_5585]
signal sp_relative_shift_uxn_opcodes_h_l719_c30_5585_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l719_c30_5585_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l719_c30_5585_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l719_c30_5585_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l720_c26_b41e]
signal BIN_OP_EQ_uxn_opcodes_h_l720_c26_b41e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l720_c26_b41e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l720_c26_b41e_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l720_c26_d211]
signal MUX_uxn_opcodes_h_l720_c26_d211_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l720_c26_d211_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l720_c26_d211_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l720_c26_d211_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l721_c22_bfc5]
signal BIN_OP_EQ_uxn_opcodes_h_l721_c22_bfc5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l721_c22_bfc5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l721_c22_bfc5_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l721_c22_9975]
signal MUX_uxn_opcodes_h_l721_c22_9975_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l721_c22_9975_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l721_c22_9975_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l721_c22_9975_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_af90( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
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
      base.is_pc_updated := ref_toks_8;
      base.is_vram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l693_c6_1f82
BIN_OP_EQ_uxn_opcodes_h_l693_c6_1f82 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l693_c6_1f82_left,
BIN_OP_EQ_uxn_opcodes_h_l693_c6_1f82_right,
BIN_OP_EQ_uxn_opcodes_h_l693_c6_1f82_return_output);

-- n8_MUX_uxn_opcodes_h_l693_c2_e1ee
n8_MUX_uxn_opcodes_h_l693_c2_e1ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l693_c2_e1ee_cond,
n8_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue,
n8_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse,
n8_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output);

-- t16_MUX_uxn_opcodes_h_l693_c2_e1ee
t16_MUX_uxn_opcodes_h_l693_c2_e1ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l693_c2_e1ee_cond,
t16_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue,
t16_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse,
t16_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_e1ee
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_e1ee : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_e1ee_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_e1ee
result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_e1ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l693_c2_e1ee
result_u16_value_MUX_uxn_opcodes_h_l693_c2_e1ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l693_c2_e1ee_cond,
result_u16_value_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_e1ee
result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_e1ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_e1ee_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_e1ee
result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_e1ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_e1ee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_e1ee
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_e1ee : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_e1ee_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_e1ee
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_e1ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_e1ee_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_e1ee
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_e1ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_e1ee_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_e1ee
result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_e1ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l706_c11_67bc
BIN_OP_EQ_uxn_opcodes_h_l706_c11_67bc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l706_c11_67bc_left,
BIN_OP_EQ_uxn_opcodes_h_l706_c11_67bc_right,
BIN_OP_EQ_uxn_opcodes_h_l706_c11_67bc_return_output);

-- n8_MUX_uxn_opcodes_h_l706_c7_bf5f
n8_MUX_uxn_opcodes_h_l706_c7_bf5f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l706_c7_bf5f_cond,
n8_MUX_uxn_opcodes_h_l706_c7_bf5f_iftrue,
n8_MUX_uxn_opcodes_h_l706_c7_bf5f_iffalse,
n8_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output);

-- t16_MUX_uxn_opcodes_h_l706_c7_bf5f
t16_MUX_uxn_opcodes_h_l706_c7_bf5f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l706_c7_bf5f_cond,
t16_MUX_uxn_opcodes_h_l706_c7_bf5f_iftrue,
t16_MUX_uxn_opcodes_h_l706_c7_bf5f_iffalse,
t16_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_bf5f
result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_bf5f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_bf5f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_bf5f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_bf5f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l706_c7_bf5f
result_u16_value_MUX_uxn_opcodes_h_l706_c7_bf5f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l706_c7_bf5f_cond,
result_u16_value_MUX_uxn_opcodes_h_l706_c7_bf5f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l706_c7_bf5f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_bf5f
result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_bf5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_bf5f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_bf5f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_bf5f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_bf5f
result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_bf5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_bf5f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_bf5f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_bf5f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_bf5f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_bf5f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_bf5f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_bf5f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_bf5f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l709_c11_62f0
BIN_OP_EQ_uxn_opcodes_h_l709_c11_62f0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l709_c11_62f0_left,
BIN_OP_EQ_uxn_opcodes_h_l709_c11_62f0_right,
BIN_OP_EQ_uxn_opcodes_h_l709_c11_62f0_return_output);

-- n8_MUX_uxn_opcodes_h_l709_c7_dcf2
n8_MUX_uxn_opcodes_h_l709_c7_dcf2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l709_c7_dcf2_cond,
n8_MUX_uxn_opcodes_h_l709_c7_dcf2_iftrue,
n8_MUX_uxn_opcodes_h_l709_c7_dcf2_iffalse,
n8_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output);

-- t16_MUX_uxn_opcodes_h_l709_c7_dcf2
t16_MUX_uxn_opcodes_h_l709_c7_dcf2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l709_c7_dcf2_cond,
t16_MUX_uxn_opcodes_h_l709_c7_dcf2_iftrue,
t16_MUX_uxn_opcodes_h_l709_c7_dcf2_iffalse,
t16_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dcf2
result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dcf2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dcf2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dcf2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dcf2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l709_c7_dcf2
result_u16_value_MUX_uxn_opcodes_h_l709_c7_dcf2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l709_c7_dcf2_cond,
result_u16_value_MUX_uxn_opcodes_h_l709_c7_dcf2_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l709_c7_dcf2_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dcf2
result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dcf2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dcf2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dcf2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dcf2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dcf2
result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dcf2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dcf2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dcf2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dcf2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dcf2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dcf2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dcf2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dcf2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dcf2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output);

-- CONST_SL_8_uxn_opcodes_h_l711_c3_03b9
CONST_SL_8_uxn_opcodes_h_l711_c3_03b9 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l711_c3_03b9_x,
CONST_SL_8_uxn_opcodes_h_l711_c3_03b9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l714_c11_6a8b
BIN_OP_EQ_uxn_opcodes_h_l714_c11_6a8b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l714_c11_6a8b_left,
BIN_OP_EQ_uxn_opcodes_h_l714_c11_6a8b_right,
BIN_OP_EQ_uxn_opcodes_h_l714_c11_6a8b_return_output);

-- n8_MUX_uxn_opcodes_h_l714_c7_6a14
n8_MUX_uxn_opcodes_h_l714_c7_6a14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l714_c7_6a14_cond,
n8_MUX_uxn_opcodes_h_l714_c7_6a14_iftrue,
n8_MUX_uxn_opcodes_h_l714_c7_6a14_iffalse,
n8_MUX_uxn_opcodes_h_l714_c7_6a14_return_output);

-- t16_MUX_uxn_opcodes_h_l714_c7_6a14
t16_MUX_uxn_opcodes_h_l714_c7_6a14 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l714_c7_6a14_cond,
t16_MUX_uxn_opcodes_h_l714_c7_6a14_iftrue,
t16_MUX_uxn_opcodes_h_l714_c7_6a14_iffalse,
t16_MUX_uxn_opcodes_h_l714_c7_6a14_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_6a14
result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_6a14 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_6a14_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_6a14_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_6a14_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_6a14_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_6a14
result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_6a14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_6a14_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_6a14_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_6a14_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_6a14_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l714_c7_6a14
result_u16_value_MUX_uxn_opcodes_h_l714_c7_6a14 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l714_c7_6a14_cond,
result_u16_value_MUX_uxn_opcodes_h_l714_c7_6a14_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l714_c7_6a14_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l714_c7_6a14_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_6a14
result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_6a14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_6a14_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_6a14_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_6a14_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_6a14_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l715_c3_25ff
BIN_OP_OR_uxn_opcodes_h_l715_c3_25ff : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l715_c3_25ff_left,
BIN_OP_OR_uxn_opcodes_h_l715_c3_25ff_right,
BIN_OP_OR_uxn_opcodes_h_l715_c3_25ff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l717_c11_7875
BIN_OP_EQ_uxn_opcodes_h_l717_c11_7875 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l717_c11_7875_left,
BIN_OP_EQ_uxn_opcodes_h_l717_c11_7875_right,
BIN_OP_EQ_uxn_opcodes_h_l717_c11_7875_return_output);

-- n8_MUX_uxn_opcodes_h_l717_c7_f6d6
n8_MUX_uxn_opcodes_h_l717_c7_f6d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l717_c7_f6d6_cond,
n8_MUX_uxn_opcodes_h_l717_c7_f6d6_iftrue,
n8_MUX_uxn_opcodes_h_l717_c7_f6d6_iffalse,
n8_MUX_uxn_opcodes_h_l717_c7_f6d6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_f6d6
result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_f6d6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_f6d6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_f6d6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_f6d6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_f6d6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_f6d6
result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_f6d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_f6d6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_f6d6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_f6d6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_f6d6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l717_c7_f6d6
result_u16_value_MUX_uxn_opcodes_h_l717_c7_f6d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l717_c7_f6d6_cond,
result_u16_value_MUX_uxn_opcodes_h_l717_c7_f6d6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l717_c7_f6d6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l717_c7_f6d6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_f6d6
result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_f6d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_f6d6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_f6d6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_f6d6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_f6d6_return_output);

-- sp_relative_shift_uxn_opcodes_h_l719_c30_5585
sp_relative_shift_uxn_opcodes_h_l719_c30_5585 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l719_c30_5585_ins,
sp_relative_shift_uxn_opcodes_h_l719_c30_5585_x,
sp_relative_shift_uxn_opcodes_h_l719_c30_5585_y,
sp_relative_shift_uxn_opcodes_h_l719_c30_5585_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l720_c26_b41e
BIN_OP_EQ_uxn_opcodes_h_l720_c26_b41e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l720_c26_b41e_left,
BIN_OP_EQ_uxn_opcodes_h_l720_c26_b41e_right,
BIN_OP_EQ_uxn_opcodes_h_l720_c26_b41e_return_output);

-- MUX_uxn_opcodes_h_l720_c26_d211
MUX_uxn_opcodes_h_l720_c26_d211 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l720_c26_d211_cond,
MUX_uxn_opcodes_h_l720_c26_d211_iftrue,
MUX_uxn_opcodes_h_l720_c26_d211_iffalse,
MUX_uxn_opcodes_h_l720_c26_d211_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l721_c22_bfc5
BIN_OP_EQ_uxn_opcodes_h_l721_c22_bfc5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l721_c22_bfc5_left,
BIN_OP_EQ_uxn_opcodes_h_l721_c22_bfc5_right,
BIN_OP_EQ_uxn_opcodes_h_l721_c22_bfc5_return_output);

-- MUX_uxn_opcodes_h_l721_c22_9975
MUX_uxn_opcodes_h_l721_c22_9975 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l721_c22_9975_cond,
MUX_uxn_opcodes_h_l721_c22_9975_iftrue,
MUX_uxn_opcodes_h_l721_c22_9975_iffalse,
MUX_uxn_opcodes_h_l721_c22_9975_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l693_c6_1f82_return_output,
 n8_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output,
 t16_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l706_c11_67bc_return_output,
 n8_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output,
 t16_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l709_c11_62f0_return_output,
 n8_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output,
 t16_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output,
 CONST_SL_8_uxn_opcodes_h_l711_c3_03b9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l714_c11_6a8b_return_output,
 n8_MUX_uxn_opcodes_h_l714_c7_6a14_return_output,
 t16_MUX_uxn_opcodes_h_l714_c7_6a14_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_6a14_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_6a14_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l714_c7_6a14_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_6a14_return_output,
 BIN_OP_OR_uxn_opcodes_h_l715_c3_25ff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l717_c11_7875_return_output,
 n8_MUX_uxn_opcodes_h_l717_c7_f6d6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_f6d6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_f6d6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l717_c7_f6d6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_f6d6_return_output,
 sp_relative_shift_uxn_opcodes_h_l719_c30_5585_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l720_c26_b41e_return_output,
 MUX_uxn_opcodes_h_l720_c26_d211_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l721_c22_bfc5_return_output,
 MUX_uxn_opcodes_h_l721_c22_9975_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_1f82_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_1f82_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_1f82_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l693_c2_e1ee_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l693_c2_e1ee_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l698_c3_b9a5 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_e1ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l693_c2_e1ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_e1ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l693_c2_e1ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_e1ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_e1ee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l703_c3_544b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_e1ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l693_c2_e1ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_e1ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_e1ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l693_c2_e1ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_67bc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_67bc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_67bc_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l706_c7_bf5f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l706_c7_bf5f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l706_c7_bf5f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l706_c7_bf5f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l706_c7_bf5f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l706_c7_bf5f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_bf5f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_bf5f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_bf5f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_bf5f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_bf5f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_bf5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_bf5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_bf5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_bf5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_bf5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_bf5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_bf5f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_bf5f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l707_c3_6577 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_bf5f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_bf5f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_62f0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_62f0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_62f0_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l709_c7_dcf2_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l709_c7_dcf2_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l714_c7_6a14_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l709_c7_dcf2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l709_c7_dcf2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l709_c7_dcf2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l714_c7_6a14_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l709_c7_dcf2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dcf2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dcf2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_6a14_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dcf2_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_dcf2_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_dcf2_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_6a14_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_dcf2_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dcf2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dcf2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_6a14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dcf2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dcf2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dcf2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_6a14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dcf2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dcf2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l712_c3_7256 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dcf2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l709_c7_dcf2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dcf2_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l711_c3_03b9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l711_c3_03b9_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_6a8b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_6a8b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_6a8b_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l714_c7_6a14_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l714_c7_6a14_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l717_c7_f6d6_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l714_c7_6a14_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l714_c7_6a14_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l714_c7_6a14_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l714_c7_6a14_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_6a14_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_6a14_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_f6d6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_6a14_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_6a14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_6a14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_f6d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_6a14_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_6a14_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_6a14_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_f6d6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_6a14_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_6a14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_6a14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_f6d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_6a14_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_25ff_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_25ff_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_25ff_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_7875_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_7875_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_7875_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l717_c7_f6d6_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l717_c7_f6d6_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l717_c7_f6d6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_f6d6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_f6d6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_f6d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_f6d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_f6d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_f6d6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_f6d6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_f6d6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_f6d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_f6d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_f6d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_f6d6_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_5585_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_5585_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_5585_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_5585_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l720_c26_d211_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_b41e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_b41e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_b41e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l720_c26_d211_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l720_c26_d211_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l720_c26_d211_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l721_c22_9975_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_bfc5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_bfc5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_bfc5_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l721_c22_9975_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l721_c22_9975_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l721_c22_9975_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l693_l714_l717_l706_l709_DUPLICATE_55d4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l717_l714_l706_l709_DUPLICATE_5374_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l717_l714_l706_l709_DUPLICATE_2550_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l717_l714_l706_l709_DUPLICATE_6977_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l715_l710_DUPLICATE_3367_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_af90_uxn_opcodes_h_l725_l688_DUPLICATE_832a_return_output : opcode_result_t;
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
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l712_c3_7256 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dcf2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l712_c3_7256;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l707_c3_6577 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_bf5f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l707_c3_6577;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l703_c3_544b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l703_c3_544b;
     VAR_MUX_uxn_opcodes_h_l720_c26_d211_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_6a8b_right := to_unsigned(3, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_5585_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_bfc5_right := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_67bc_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_f6d6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_62f0_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_1f82_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_b41e_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_7875_right := to_unsigned(4, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l698_c3_b9a5 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l698_c3_b9a5;
     VAR_MUX_uxn_opcodes_h_l721_c22_9975_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_MUX_uxn_opcodes_h_l720_c26_d211_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_5585_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));

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
     VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_5585_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l706_c7_bf5f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l709_c7_dcf2_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l714_c7_6a14_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l717_c7_f6d6_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_1f82_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_67bc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_62f0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_6a8b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_7875_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_b41e_left := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_bfc5_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l717_c7_f6d6_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_25ff_left := t16;
     VAR_MUX_uxn_opcodes_h_l721_c22_9975_iffalse := t16;
     VAR_t16_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l706_c7_bf5f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l714_c7_6a14_iffalse := t16;
     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l693_c2_e1ee] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l693_c2_e1ee_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l721_c22_bfc5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l721_c22_bfc5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_bfc5_left;
     BIN_OP_EQ_uxn_opcodes_h_l721_c22_bfc5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_bfc5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_bfc5_return_output := BIN_OP_EQ_uxn_opcodes_h_l721_c22_bfc5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l717_l714_l706_l709_DUPLICATE_6977 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l717_l714_l706_l709_DUPLICATE_6977_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l720_c26_b41e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l720_c26_b41e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_b41e_left;
     BIN_OP_EQ_uxn_opcodes_h_l720_c26_b41e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_b41e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_b41e_return_output := BIN_OP_EQ_uxn_opcodes_h_l720_c26_b41e_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l719_c30_5585] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l719_c30_5585_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_5585_ins;
     sp_relative_shift_uxn_opcodes_h_l719_c30_5585_x <= VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_5585_x;
     sp_relative_shift_uxn_opcodes_h_l719_c30_5585_y <= VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_5585_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_5585_return_output := sp_relative_shift_uxn_opcodes_h_l719_c30_5585_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l714_c11_6a8b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l714_c11_6a8b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_6a8b_left;
     BIN_OP_EQ_uxn_opcodes_h_l714_c11_6a8b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_6a8b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_6a8b_return_output := BIN_OP_EQ_uxn_opcodes_h_l714_c11_6a8b_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l693_c2_e1ee] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l693_c2_e1ee_return_output := result.is_stack_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l717_l714_l706_l709_DUPLICATE_5374 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l717_l714_l706_l709_DUPLICATE_5374_return_output := result.sp_relative_shift;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l693_c2_e1ee] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l693_c2_e1ee_return_output := result.is_ram_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l693_c2_e1ee] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l693_c2_e1ee_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l706_c11_67bc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l706_c11_67bc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_67bc_left;
     BIN_OP_EQ_uxn_opcodes_h_l706_c11_67bc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_67bc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_67bc_return_output := BIN_OP_EQ_uxn_opcodes_h_l706_c11_67bc_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l709_c7_dcf2] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l709_c7_dcf2_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l717_l714_l706_l709_DUPLICATE_2550 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l717_l714_l706_l709_DUPLICATE_2550_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l693_l714_l717_l706_l709_DUPLICATE_55d4 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l693_l714_l717_l706_l709_DUPLICATE_55d4_return_output := result.u16_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l715_l710_DUPLICATE_3367 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l715_l710_DUPLICATE_3367_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l717_c11_7875] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l717_c11_7875_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_7875_left;
     BIN_OP_EQ_uxn_opcodes_h_l717_c11_7875_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_7875_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_7875_return_output := BIN_OP_EQ_uxn_opcodes_h_l717_c11_7875_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l693_c6_1f82] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l693_c6_1f82_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_1f82_left;
     BIN_OP_EQ_uxn_opcodes_h_l693_c6_1f82_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_1f82_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_1f82_return_output := BIN_OP_EQ_uxn_opcodes_h_l693_c6_1f82_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l709_c11_62f0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l709_c11_62f0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_62f0_left;
     BIN_OP_EQ_uxn_opcodes_h_l709_c11_62f0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_62f0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_62f0_return_output := BIN_OP_EQ_uxn_opcodes_h_l709_c11_62f0_return_output;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l693_c2_e1ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_1f82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_e1ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_1f82_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_e1ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_1f82_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_1f82_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_e1ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_1f82_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_e1ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_1f82_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_1f82_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_e1ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_1f82_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_e1ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_1f82_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_e1ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_1f82_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l693_c2_e1ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c6_1f82_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l706_c7_bf5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_67bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_bf5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_67bc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_bf5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_67bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_bf5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_67bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_bf5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_67bc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_bf5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_67bc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l706_c7_bf5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l706_c11_67bc_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l709_c7_dcf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_62f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dcf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_62f0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dcf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_62f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dcf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_62f0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dcf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_62f0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_dcf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_62f0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l709_c7_dcf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l709_c11_62f0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l714_c7_6a14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_6a8b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_6a14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_6a8b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_6a14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_6a8b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_6a14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_6a8b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_6a14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_6a8b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l714_c7_6a14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l714_c11_6a8b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l717_c7_f6d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_7875_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_f6d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_7875_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_f6d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_7875_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_f6d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_7875_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_f6d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l717_c11_7875_return_output;
     VAR_MUX_uxn_opcodes_h_l720_c26_d211_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l720_c26_b41e_return_output;
     VAR_MUX_uxn_opcodes_h_l721_c22_9975_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c22_bfc5_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_25ff_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l715_l710_DUPLICATE_3367_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l711_c3_03b9_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l715_l710_DUPLICATE_3367_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_bf5f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l717_l714_l706_l709_DUPLICATE_5374_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dcf2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l717_l714_l706_l709_DUPLICATE_5374_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_6a14_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l717_l714_l706_l709_DUPLICATE_5374_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_f6d6_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l717_l714_l706_l709_DUPLICATE_5374_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l693_l714_l717_l706_l709_DUPLICATE_55d4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_bf5f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l693_l714_l717_l706_l709_DUPLICATE_55d4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_dcf2_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l693_l714_l717_l706_l709_DUPLICATE_55d4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_6a14_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l693_l714_l717_l706_l709_DUPLICATE_55d4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_f6d6_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l693_l714_l717_l706_l709_DUPLICATE_55d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_bf5f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l717_l714_l706_l709_DUPLICATE_6977_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dcf2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l717_l714_l706_l709_DUPLICATE_6977_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_6a14_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l717_l714_l706_l709_DUPLICATE_6977_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_f6d6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l717_l714_l706_l709_DUPLICATE_6977_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_bf5f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l717_l714_l706_l709_DUPLICATE_2550_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dcf2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l717_l714_l706_l709_DUPLICATE_2550_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_6a14_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l717_l714_l706_l709_DUPLICATE_2550_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_f6d6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l717_l714_l706_l709_DUPLICATE_2550_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l693_c2_e1ee_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l693_c2_e1ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l693_c2_e1ee_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l693_c2_e1ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dcf2_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l709_c7_dcf2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_f6d6_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l719_c30_5585_return_output;
     -- MUX[uxn_opcodes_h_l720_c26_d211] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l720_c26_d211_cond <= VAR_MUX_uxn_opcodes_h_l720_c26_d211_cond;
     MUX_uxn_opcodes_h_l720_c26_d211_iftrue <= VAR_MUX_uxn_opcodes_h_l720_c26_d211_iftrue;
     MUX_uxn_opcodes_h_l720_c26_d211_iffalse <= VAR_MUX_uxn_opcodes_h_l720_c26_d211_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l720_c26_d211_return_output := MUX_uxn_opcodes_h_l720_c26_d211_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l715_c3_25ff] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l715_c3_25ff_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_25ff_left;
     BIN_OP_OR_uxn_opcodes_h_l715_c3_25ff_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_25ff_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_25ff_return_output := BIN_OP_OR_uxn_opcodes_h_l715_c3_25ff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l693_c2_e1ee] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_e1ee_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_e1ee_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output;

     -- MUX[uxn_opcodes_h_l721_c22_9975] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l721_c22_9975_cond <= VAR_MUX_uxn_opcodes_h_l721_c22_9975_cond;
     MUX_uxn_opcodes_h_l721_c22_9975_iftrue <= VAR_MUX_uxn_opcodes_h_l721_c22_9975_iftrue;
     MUX_uxn_opcodes_h_l721_c22_9975_iffalse <= VAR_MUX_uxn_opcodes_h_l721_c22_9975_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l721_c22_9975_return_output := MUX_uxn_opcodes_h_l721_c22_9975_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l711_c3_03b9] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l711_c3_03b9_x <= VAR_CONST_SL_8_uxn_opcodes_h_l711_c3_03b9_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l711_c3_03b9_return_output := CONST_SL_8_uxn_opcodes_h_l711_c3_03b9_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l693_c2_e1ee] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l709_c7_dcf2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dcf2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dcf2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dcf2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dcf2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dcf2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dcf2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l693_c2_e1ee] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l717_c7_f6d6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_f6d6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_f6d6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_f6d6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_f6d6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_f6d6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_f6d6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_f6d6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_f6d6_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l693_c2_e1ee] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_e1ee_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_e1ee_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output;

     -- n8_MUX[uxn_opcodes_h_l717_c7_f6d6] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l717_c7_f6d6_cond <= VAR_n8_MUX_uxn_opcodes_h_l717_c7_f6d6_cond;
     n8_MUX_uxn_opcodes_h_l717_c7_f6d6_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l717_c7_f6d6_iftrue;
     n8_MUX_uxn_opcodes_h_l717_c7_f6d6_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l717_c7_f6d6_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l717_c7_f6d6_return_output := n8_MUX_uxn_opcodes_h_l717_c7_f6d6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l717_c7_f6d6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_f6d6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_f6d6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_f6d6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_f6d6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_f6d6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_f6d6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_f6d6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_f6d6_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l714_c7_6a14_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l715_c3_25ff_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l709_c7_dcf2_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l711_c3_03b9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_f6d6_iftrue := VAR_MUX_uxn_opcodes_h_l720_c26_d211_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_f6d6_iftrue := VAR_MUX_uxn_opcodes_h_l721_c22_9975_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l714_c7_6a14_iffalse := VAR_n8_MUX_uxn_opcodes_h_l717_c7_f6d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_6a14_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l717_c7_f6d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_6a14_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l717_c7_f6d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_bf5f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l717_c7_f6d6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_f6d6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_f6d6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_f6d6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_f6d6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_f6d6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_f6d6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_f6d6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_f6d6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l714_c7_6a14] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_6a14_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_6a14_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_6a14_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_6a14_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_6a14_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_6a14_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_6a14_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_6a14_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l706_c7_bf5f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_bf5f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_bf5f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_bf5f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_bf5f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_bf5f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_bf5f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l717_c7_f6d6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l717_c7_f6d6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_f6d6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l717_c7_f6d6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_f6d6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l717_c7_f6d6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_f6d6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_f6d6_return_output := result_u16_value_MUX_uxn_opcodes_h_l717_c7_f6d6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l714_c7_6a14] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_6a14_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_6a14_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_6a14_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_6a14_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_6a14_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_6a14_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_6a14_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_6a14_return_output;

     -- n8_MUX[uxn_opcodes_h_l714_c7_6a14] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l714_c7_6a14_cond <= VAR_n8_MUX_uxn_opcodes_h_l714_c7_6a14_cond;
     n8_MUX_uxn_opcodes_h_l714_c7_6a14_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l714_c7_6a14_iftrue;
     n8_MUX_uxn_opcodes_h_l714_c7_6a14_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l714_c7_6a14_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l714_c7_6a14_return_output := n8_MUX_uxn_opcodes_h_l714_c7_6a14_return_output;

     -- t16_MUX[uxn_opcodes_h_l714_c7_6a14] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l714_c7_6a14_cond <= VAR_t16_MUX_uxn_opcodes_h_l714_c7_6a14_cond;
     t16_MUX_uxn_opcodes_h_l714_c7_6a14_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l714_c7_6a14_iftrue;
     t16_MUX_uxn_opcodes_h_l714_c7_6a14_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l714_c7_6a14_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l714_c7_6a14_return_output := t16_MUX_uxn_opcodes_h_l714_c7_6a14_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l709_c7_dcf2_iffalse := VAR_n8_MUX_uxn_opcodes_h_l714_c7_6a14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dcf2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l714_c7_6a14_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_6a14_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l717_c7_f6d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dcf2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l714_c7_6a14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_6a14_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l717_c7_f6d6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l709_c7_dcf2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l714_c7_6a14_return_output;
     -- t16_MUX[uxn_opcodes_h_l709_c7_dcf2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l709_c7_dcf2_cond <= VAR_t16_MUX_uxn_opcodes_h_l709_c7_dcf2_cond;
     t16_MUX_uxn_opcodes_h_l709_c7_dcf2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l709_c7_dcf2_iftrue;
     t16_MUX_uxn_opcodes_h_l709_c7_dcf2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l709_c7_dcf2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output := t16_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l714_c7_6a14] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_6a14_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_6a14_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_6a14_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_6a14_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_6a14_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_6a14_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_6a14_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_6a14_return_output;

     -- n8_MUX[uxn_opcodes_h_l709_c7_dcf2] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l709_c7_dcf2_cond <= VAR_n8_MUX_uxn_opcodes_h_l709_c7_dcf2_cond;
     n8_MUX_uxn_opcodes_h_l709_c7_dcf2_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l709_c7_dcf2_iftrue;
     n8_MUX_uxn_opcodes_h_l709_c7_dcf2_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l709_c7_dcf2_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output := n8_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l709_c7_dcf2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dcf2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dcf2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dcf2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dcf2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dcf2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dcf2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l693_c2_e1ee] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_e1ee_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_e1ee_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l709_c7_dcf2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dcf2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dcf2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dcf2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dcf2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dcf2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dcf2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l714_c7_6a14] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l714_c7_6a14_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_6a14_cond;
     result_u16_value_MUX_uxn_opcodes_h_l714_c7_6a14_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_6a14_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l714_c7_6a14_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_6a14_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_6a14_return_output := result_u16_value_MUX_uxn_opcodes_h_l714_c7_6a14_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l706_c7_bf5f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_bf5f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dcf2_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l714_c7_6a14_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_bf5f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_dcf2_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l714_c7_6a14_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l706_c7_bf5f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l706_c7_bf5f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_bf5f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_bf5f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_bf5f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_bf5f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_bf5f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_bf5f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l706_c7_bf5f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_bf5f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_bf5f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_bf5f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_bf5f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_bf5f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_bf5f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l709_c7_dcf2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dcf2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dcf2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dcf2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dcf2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dcf2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dcf2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output;

     -- t16_MUX[uxn_opcodes_h_l706_c7_bf5f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l706_c7_bf5f_cond <= VAR_t16_MUX_uxn_opcodes_h_l706_c7_bf5f_cond;
     t16_MUX_uxn_opcodes_h_l706_c7_bf5f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l706_c7_bf5f_iftrue;
     t16_MUX_uxn_opcodes_h_l706_c7_bf5f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l706_c7_bf5f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output := t16_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output;

     -- n8_MUX[uxn_opcodes_h_l706_c7_bf5f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l706_c7_bf5f_cond <= VAR_n8_MUX_uxn_opcodes_h_l706_c7_bf5f_cond;
     n8_MUX_uxn_opcodes_h_l706_c7_bf5f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l706_c7_bf5f_iftrue;
     n8_MUX_uxn_opcodes_h_l706_c7_bf5f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l706_c7_bf5f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output := n8_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l709_c7_dcf2] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l709_c7_dcf2_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_dcf2_cond;
     result_u16_value_MUX_uxn_opcodes_h_l709_c7_dcf2_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_dcf2_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l709_c7_dcf2_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_dcf2_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output := result_u16_value_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse := VAR_n8_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_bf5f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_bf5f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l709_c7_dcf2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse := VAR_t16_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l706_c7_bf5f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l706_c7_bf5f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_bf5f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l706_c7_bf5f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_bf5f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l706_c7_bf5f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_bf5f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output := result_u16_value_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l693_c2_e1ee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_e1ee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_e1ee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output;

     -- t16_MUX[uxn_opcodes_h_l693_c2_e1ee] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l693_c2_e1ee_cond <= VAR_t16_MUX_uxn_opcodes_h_l693_c2_e1ee_cond;
     t16_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue;
     t16_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output := t16_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output;

     -- n8_MUX[uxn_opcodes_h_l693_c2_e1ee] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l693_c2_e1ee_cond <= VAR_n8_MUX_uxn_opcodes_h_l693_c2_e1ee_cond;
     n8_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue;
     n8_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output := n8_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l693_c2_e1ee] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_e1ee_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_e1ee_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l706_c7_bf5f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_bf5f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_bf5f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_bf5f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_bf5f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_bf5f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_bf5f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l706_c7_bf5f_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l693_c2_e1ee] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_e1ee_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_e1ee_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l693_c2_e1ee] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l693_c2_e1ee_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_e1ee_cond;
     result_u16_value_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_e1ee_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_e1ee_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output := result_u16_value_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_af90_uxn_opcodes_h_l725_l688_DUPLICATE_832a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_af90_uxn_opcodes_h_l725_l688_DUPLICATE_832a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_af90(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l693_c2_e1ee_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_af90_uxn_opcodes_h_l725_l688_DUPLICATE_832a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_af90_uxn_opcodes_h_l725_l688_DUPLICATE_832a_return_output;
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
