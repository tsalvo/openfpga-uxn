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
-- BIN_OP_EQ[uxn_opcodes_h_l694_c6_d7d1]
signal BIN_OP_EQ_uxn_opcodes_h_l694_c6_d7d1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l694_c6_d7d1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l694_c6_d7d1_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l694_c2_9e2c]
signal n8_MUX_uxn_opcodes_h_l694_c2_9e2c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l694_c2_9e2c]
signal t16_MUX_uxn_opcodes_h_l694_c2_9e2c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l694_c2_9e2c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_9e2c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l694_c2_9e2c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_9e2c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l694_c2_9e2c]
signal result_u16_value_MUX_uxn_opcodes_h_l694_c2_9e2c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l694_c2_9e2c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_9e2c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l694_c2_9e2c]
signal result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l694_c2_9e2c]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_9e2c_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l694_c2_9e2c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_9e2c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l694_c2_9e2c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l694_c2_9e2c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_9e2c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l707_c11_d1d3]
signal BIN_OP_EQ_uxn_opcodes_h_l707_c11_d1d3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l707_c11_d1d3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l707_c11_d1d3_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l707_c7_b2d0]
signal n8_MUX_uxn_opcodes_h_l707_c7_b2d0_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l707_c7_b2d0_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l707_c7_b2d0_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l707_c7_b2d0]
signal t16_MUX_uxn_opcodes_h_l707_c7_b2d0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l707_c7_b2d0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l707_c7_b2d0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l707_c7_b2d0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_b2d0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_b2d0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_b2d0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l707_c7_b2d0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_b2d0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_b2d0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_b2d0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l707_c7_b2d0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_b2d0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_b2d0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_b2d0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l707_c7_b2d0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_b2d0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_b2d0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_b2d0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l707_c7_b2d0]
signal result_u16_value_MUX_uxn_opcodes_h_l707_c7_b2d0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l707_c7_b2d0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l707_c7_b2d0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l710_c11_6a78]
signal BIN_OP_EQ_uxn_opcodes_h_l710_c11_6a78_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l710_c11_6a78_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l710_c11_6a78_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l710_c7_06cb]
signal n8_MUX_uxn_opcodes_h_l710_c7_06cb_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l710_c7_06cb_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l710_c7_06cb_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l710_c7_06cb_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l710_c7_06cb]
signal t16_MUX_uxn_opcodes_h_l710_c7_06cb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l710_c7_06cb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l710_c7_06cb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l710_c7_06cb_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l710_c7_06cb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_06cb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_06cb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_06cb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_06cb_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l710_c7_06cb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_06cb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_06cb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_06cb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_06cb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l710_c7_06cb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_06cb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_06cb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_06cb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_06cb_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l710_c7_06cb]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_06cb_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_06cb_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_06cb_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_06cb_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l710_c7_06cb]
signal result_u16_value_MUX_uxn_opcodes_h_l710_c7_06cb_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l710_c7_06cb_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l710_c7_06cb_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l710_c7_06cb_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l712_c3_0e5e]
signal CONST_SL_8_uxn_opcodes_h_l712_c3_0e5e_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l712_c3_0e5e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l715_c11_4543]
signal BIN_OP_EQ_uxn_opcodes_h_l715_c11_4543_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l715_c11_4543_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l715_c11_4543_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l715_c7_04dd]
signal n8_MUX_uxn_opcodes_h_l715_c7_04dd_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l715_c7_04dd_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l715_c7_04dd_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l715_c7_04dd_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l715_c7_04dd]
signal t16_MUX_uxn_opcodes_h_l715_c7_04dd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l715_c7_04dd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l715_c7_04dd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l715_c7_04dd_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l715_c7_04dd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_04dd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_04dd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_04dd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_04dd_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l715_c7_04dd]
signal result_u16_value_MUX_uxn_opcodes_h_l715_c7_04dd_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l715_c7_04dd_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l715_c7_04dd_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l715_c7_04dd_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l715_c7_04dd]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_04dd_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_04dd_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_04dd_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_04dd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l715_c7_04dd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_04dd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_04dd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_04dd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_04dd_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l716_c3_8c6d]
signal BIN_OP_OR_uxn_opcodes_h_l716_c3_8c6d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l716_c3_8c6d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l716_c3_8c6d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l718_c11_dd8a]
signal BIN_OP_EQ_uxn_opcodes_h_l718_c11_dd8a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l718_c11_dd8a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l718_c11_dd8a_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l718_c7_40ba]
signal n8_MUX_uxn_opcodes_h_l718_c7_40ba_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l718_c7_40ba_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l718_c7_40ba_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l718_c7_40ba_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l718_c7_40ba]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_40ba_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_40ba_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_40ba_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_40ba_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l718_c7_40ba]
signal result_u16_value_MUX_uxn_opcodes_h_l718_c7_40ba_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l718_c7_40ba_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l718_c7_40ba_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l718_c7_40ba_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l718_c7_40ba]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_40ba_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_40ba_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_40ba_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_40ba_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l718_c7_40ba]
signal result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_40ba_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_40ba_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_40ba_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_40ba_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l720_c30_5e35]
signal sp_relative_shift_uxn_opcodes_h_l720_c30_5e35_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l720_c30_5e35_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l720_c30_5e35_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l720_c30_5e35_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l721_c26_839d]
signal BIN_OP_EQ_uxn_opcodes_h_l721_c26_839d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l721_c26_839d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l721_c26_839d_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l721_c26_2610]
signal MUX_uxn_opcodes_h_l721_c26_2610_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l721_c26_2610_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l721_c26_2610_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l721_c26_2610_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l722_c22_9843]
signal BIN_OP_EQ_uxn_opcodes_h_l722_c22_9843_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l722_c22_9843_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l722_c22_9843_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l722_c22_d6c5]
signal MUX_uxn_opcodes_h_l722_c22_d6c5_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l722_c22_d6c5_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l722_c22_d6c5_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l722_c22_d6c5_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_6063( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_vram_write := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.is_stack_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l694_c6_d7d1
BIN_OP_EQ_uxn_opcodes_h_l694_c6_d7d1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l694_c6_d7d1_left,
BIN_OP_EQ_uxn_opcodes_h_l694_c6_d7d1_right,
BIN_OP_EQ_uxn_opcodes_h_l694_c6_d7d1_return_output);

-- n8_MUX_uxn_opcodes_h_l694_c2_9e2c
n8_MUX_uxn_opcodes_h_l694_c2_9e2c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l694_c2_9e2c_cond,
n8_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue,
n8_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse,
n8_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output);

-- t16_MUX_uxn_opcodes_h_l694_c2_9e2c
t16_MUX_uxn_opcodes_h_l694_c2_9e2c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l694_c2_9e2c_cond,
t16_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue,
t16_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse,
t16_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_9e2c
result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_9e2c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_9e2c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_9e2c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_9e2c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_9e2c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l694_c2_9e2c
result_u16_value_MUX_uxn_opcodes_h_l694_c2_9e2c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l694_c2_9e2c_cond,
result_u16_value_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_9e2c
result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_9e2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_9e2c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_9e2c
result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_9e2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_9e2c
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_9e2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_9e2c_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_9e2c
result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_9e2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_9e2c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_9e2c
result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_9e2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_9e2c
result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_9e2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_9e2c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l707_c11_d1d3
BIN_OP_EQ_uxn_opcodes_h_l707_c11_d1d3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l707_c11_d1d3_left,
BIN_OP_EQ_uxn_opcodes_h_l707_c11_d1d3_right,
BIN_OP_EQ_uxn_opcodes_h_l707_c11_d1d3_return_output);

-- n8_MUX_uxn_opcodes_h_l707_c7_b2d0
n8_MUX_uxn_opcodes_h_l707_c7_b2d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l707_c7_b2d0_cond,
n8_MUX_uxn_opcodes_h_l707_c7_b2d0_iftrue,
n8_MUX_uxn_opcodes_h_l707_c7_b2d0_iffalse,
n8_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output);

-- t16_MUX_uxn_opcodes_h_l707_c7_b2d0
t16_MUX_uxn_opcodes_h_l707_c7_b2d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l707_c7_b2d0_cond,
t16_MUX_uxn_opcodes_h_l707_c7_b2d0_iftrue,
t16_MUX_uxn_opcodes_h_l707_c7_b2d0_iffalse,
t16_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_b2d0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_b2d0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_b2d0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_b2d0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_b2d0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_b2d0
result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_b2d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_b2d0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_b2d0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_b2d0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_b2d0
result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_b2d0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_b2d0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_b2d0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_b2d0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_b2d0
result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_b2d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_b2d0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_b2d0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_b2d0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l707_c7_b2d0
result_u16_value_MUX_uxn_opcodes_h_l707_c7_b2d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l707_c7_b2d0_cond,
result_u16_value_MUX_uxn_opcodes_h_l707_c7_b2d0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l707_c7_b2d0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l710_c11_6a78
BIN_OP_EQ_uxn_opcodes_h_l710_c11_6a78 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l710_c11_6a78_left,
BIN_OP_EQ_uxn_opcodes_h_l710_c11_6a78_right,
BIN_OP_EQ_uxn_opcodes_h_l710_c11_6a78_return_output);

-- n8_MUX_uxn_opcodes_h_l710_c7_06cb
n8_MUX_uxn_opcodes_h_l710_c7_06cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l710_c7_06cb_cond,
n8_MUX_uxn_opcodes_h_l710_c7_06cb_iftrue,
n8_MUX_uxn_opcodes_h_l710_c7_06cb_iffalse,
n8_MUX_uxn_opcodes_h_l710_c7_06cb_return_output);

-- t16_MUX_uxn_opcodes_h_l710_c7_06cb
t16_MUX_uxn_opcodes_h_l710_c7_06cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l710_c7_06cb_cond,
t16_MUX_uxn_opcodes_h_l710_c7_06cb_iftrue,
t16_MUX_uxn_opcodes_h_l710_c7_06cb_iffalse,
t16_MUX_uxn_opcodes_h_l710_c7_06cb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_06cb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_06cb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_06cb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_06cb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_06cb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_06cb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_06cb
result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_06cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_06cb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_06cb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_06cb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_06cb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_06cb
result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_06cb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_06cb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_06cb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_06cb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_06cb_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_06cb
result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_06cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_06cb_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_06cb_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_06cb_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_06cb_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l710_c7_06cb
result_u16_value_MUX_uxn_opcodes_h_l710_c7_06cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l710_c7_06cb_cond,
result_u16_value_MUX_uxn_opcodes_h_l710_c7_06cb_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l710_c7_06cb_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l710_c7_06cb_return_output);

-- CONST_SL_8_uxn_opcodes_h_l712_c3_0e5e
CONST_SL_8_uxn_opcodes_h_l712_c3_0e5e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l712_c3_0e5e_x,
CONST_SL_8_uxn_opcodes_h_l712_c3_0e5e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l715_c11_4543
BIN_OP_EQ_uxn_opcodes_h_l715_c11_4543 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l715_c11_4543_left,
BIN_OP_EQ_uxn_opcodes_h_l715_c11_4543_right,
BIN_OP_EQ_uxn_opcodes_h_l715_c11_4543_return_output);

-- n8_MUX_uxn_opcodes_h_l715_c7_04dd
n8_MUX_uxn_opcodes_h_l715_c7_04dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l715_c7_04dd_cond,
n8_MUX_uxn_opcodes_h_l715_c7_04dd_iftrue,
n8_MUX_uxn_opcodes_h_l715_c7_04dd_iffalse,
n8_MUX_uxn_opcodes_h_l715_c7_04dd_return_output);

-- t16_MUX_uxn_opcodes_h_l715_c7_04dd
t16_MUX_uxn_opcodes_h_l715_c7_04dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l715_c7_04dd_cond,
t16_MUX_uxn_opcodes_h_l715_c7_04dd_iftrue,
t16_MUX_uxn_opcodes_h_l715_c7_04dd_iffalse,
t16_MUX_uxn_opcodes_h_l715_c7_04dd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_04dd
result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_04dd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_04dd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_04dd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_04dd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_04dd_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l715_c7_04dd
result_u16_value_MUX_uxn_opcodes_h_l715_c7_04dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l715_c7_04dd_cond,
result_u16_value_MUX_uxn_opcodes_h_l715_c7_04dd_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l715_c7_04dd_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l715_c7_04dd_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_04dd
result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_04dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_04dd_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_04dd_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_04dd_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_04dd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_04dd
result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_04dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_04dd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_04dd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_04dd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_04dd_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l716_c3_8c6d
BIN_OP_OR_uxn_opcodes_h_l716_c3_8c6d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l716_c3_8c6d_left,
BIN_OP_OR_uxn_opcodes_h_l716_c3_8c6d_right,
BIN_OP_OR_uxn_opcodes_h_l716_c3_8c6d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l718_c11_dd8a
BIN_OP_EQ_uxn_opcodes_h_l718_c11_dd8a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l718_c11_dd8a_left,
BIN_OP_EQ_uxn_opcodes_h_l718_c11_dd8a_right,
BIN_OP_EQ_uxn_opcodes_h_l718_c11_dd8a_return_output);

-- n8_MUX_uxn_opcodes_h_l718_c7_40ba
n8_MUX_uxn_opcodes_h_l718_c7_40ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l718_c7_40ba_cond,
n8_MUX_uxn_opcodes_h_l718_c7_40ba_iftrue,
n8_MUX_uxn_opcodes_h_l718_c7_40ba_iffalse,
n8_MUX_uxn_opcodes_h_l718_c7_40ba_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_40ba
result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_40ba : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_40ba_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_40ba_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_40ba_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_40ba_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l718_c7_40ba
result_u16_value_MUX_uxn_opcodes_h_l718_c7_40ba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l718_c7_40ba_cond,
result_u16_value_MUX_uxn_opcodes_h_l718_c7_40ba_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l718_c7_40ba_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l718_c7_40ba_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_40ba
result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_40ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_40ba_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_40ba_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_40ba_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_40ba_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_40ba
result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_40ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_40ba_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_40ba_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_40ba_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_40ba_return_output);

-- sp_relative_shift_uxn_opcodes_h_l720_c30_5e35
sp_relative_shift_uxn_opcodes_h_l720_c30_5e35 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l720_c30_5e35_ins,
sp_relative_shift_uxn_opcodes_h_l720_c30_5e35_x,
sp_relative_shift_uxn_opcodes_h_l720_c30_5e35_y,
sp_relative_shift_uxn_opcodes_h_l720_c30_5e35_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l721_c26_839d
BIN_OP_EQ_uxn_opcodes_h_l721_c26_839d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l721_c26_839d_left,
BIN_OP_EQ_uxn_opcodes_h_l721_c26_839d_right,
BIN_OP_EQ_uxn_opcodes_h_l721_c26_839d_return_output);

-- MUX_uxn_opcodes_h_l721_c26_2610
MUX_uxn_opcodes_h_l721_c26_2610 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l721_c26_2610_cond,
MUX_uxn_opcodes_h_l721_c26_2610_iftrue,
MUX_uxn_opcodes_h_l721_c26_2610_iffalse,
MUX_uxn_opcodes_h_l721_c26_2610_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l722_c22_9843
BIN_OP_EQ_uxn_opcodes_h_l722_c22_9843 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l722_c22_9843_left,
BIN_OP_EQ_uxn_opcodes_h_l722_c22_9843_right,
BIN_OP_EQ_uxn_opcodes_h_l722_c22_9843_return_output);

-- MUX_uxn_opcodes_h_l722_c22_d6c5
MUX_uxn_opcodes_h_l722_c22_d6c5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l722_c22_d6c5_cond,
MUX_uxn_opcodes_h_l722_c22_d6c5_iftrue,
MUX_uxn_opcodes_h_l722_c22_d6c5_iffalse,
MUX_uxn_opcodes_h_l722_c22_d6c5_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l694_c6_d7d1_return_output,
 n8_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output,
 t16_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l707_c11_d1d3_return_output,
 n8_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output,
 t16_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l710_c11_6a78_return_output,
 n8_MUX_uxn_opcodes_h_l710_c7_06cb_return_output,
 t16_MUX_uxn_opcodes_h_l710_c7_06cb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_06cb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_06cb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_06cb_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_06cb_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l710_c7_06cb_return_output,
 CONST_SL_8_uxn_opcodes_h_l712_c3_0e5e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l715_c11_4543_return_output,
 n8_MUX_uxn_opcodes_h_l715_c7_04dd_return_output,
 t16_MUX_uxn_opcodes_h_l715_c7_04dd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_04dd_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l715_c7_04dd_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_04dd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_04dd_return_output,
 BIN_OP_OR_uxn_opcodes_h_l716_c3_8c6d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l718_c11_dd8a_return_output,
 n8_MUX_uxn_opcodes_h_l718_c7_40ba_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_40ba_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l718_c7_40ba_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_40ba_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_40ba_return_output,
 sp_relative_shift_uxn_opcodes_h_l720_c30_5e35_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l721_c26_839d_return_output,
 MUX_uxn_opcodes_h_l721_c26_2610_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l722_c22_9843_return_output,
 MUX_uxn_opcodes_h_l722_c22_d6c5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_d7d1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_d7d1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_d7d1_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l694_c2_9e2c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l694_c2_9e2c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l699_c3_53b3 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_9e2c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l704_c3_015f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_9e2c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_9e2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_9e2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l694_c2_9e2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l694_c2_9e2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_9e2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_9e2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l694_c2_9e2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l694_c2_9e2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_9e2c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_d1d3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_d1d3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_d1d3_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l707_c7_b2d0_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l707_c7_b2d0_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l710_c7_06cb_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l707_c7_b2d0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l707_c7_b2d0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l707_c7_b2d0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l710_c7_06cb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l707_c7_b2d0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_b2d0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l708_c3_0e68 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_b2d0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_06cb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_b2d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_b2d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_b2d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_06cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_b2d0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_b2d0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_b2d0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_06cb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_b2d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_b2d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_b2d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_06cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_b2d0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_b2d0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_b2d0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_06cb_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_b2d0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_6a78_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_6a78_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_6a78_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l710_c7_06cb_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l710_c7_06cb_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l715_c7_04dd_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l710_c7_06cb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l710_c7_06cb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l710_c7_06cb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l715_c7_04dd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l710_c7_06cb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_06cb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l713_c3_bec6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_06cb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l710_c7_06cb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_06cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_06cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_06cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_04dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_06cb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_06cb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_06cb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_04dd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_06cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_06cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_06cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_04dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_06cb_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_06cb_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_06cb_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_04dd_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_06cb_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l712_c3_0e5e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l712_c3_0e5e_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_4543_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_4543_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_4543_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l715_c7_04dd_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l715_c7_04dd_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l718_c7_40ba_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l715_c7_04dd_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l715_c7_04dd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l715_c7_04dd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l715_c7_04dd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_04dd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_04dd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_40ba_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_04dd_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_04dd_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_04dd_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_40ba_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_04dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_04dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_04dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_40ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_04dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_04dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_04dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_40ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_04dd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l716_c3_8c6d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l716_c3_8c6d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l716_c3_8c6d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_dd8a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_dd8a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_dd8a_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l718_c7_40ba_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l718_c7_40ba_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l718_c7_40ba_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_40ba_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_40ba_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_40ba_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_40ba_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_40ba_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_40ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_40ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_40ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_40ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_40ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_40ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_40ba_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_5e35_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_5e35_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_5e35_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_5e35_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l721_c26_2610_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c26_839d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c26_839d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c26_839d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l721_c26_2610_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l721_c26_2610_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l721_c26_2610_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l722_c22_d6c5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l722_c22_9843_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l722_c22_9843_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l722_c22_9843_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l722_c22_d6c5_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l722_c22_d6c5_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l722_c22_d6c5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l718_l715_l710_l707_l694_DUPLICATE_e26c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l715_l707_l718_l710_DUPLICATE_f531_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l715_l707_l718_l710_DUPLICATE_04b4_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l715_l707_l718_l710_DUPLICATE_7b49_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l711_l716_DUPLICATE_fe9d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6063_uxn_opcodes_h_l726_l689_DUPLICATE_de18_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_d1d3_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c26_839d_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_4543_right := to_unsigned(3, 2);
     VAR_MUX_uxn_opcodes_h_l722_c22_d6c5_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l722_c22_9843_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l721_c26_2610_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_d7d1_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l708_c3_0e68 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_b2d0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l708_c3_0e68;
     VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_5e35_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l704_c3_015f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l704_c3_015f;
     VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_5e35_y := resize(to_signed(-3, 3), 4);
     VAR_MUX_uxn_opcodes_h_l721_c26_2610_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_dd8a_right := to_unsigned(4, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l699_c3_53b3 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l699_c3_53b3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l713_c3_bec6 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_06cb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l713_c3_bec6;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_6a78_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_40ba_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_5e35_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l707_c7_b2d0_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l710_c7_06cb_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l715_c7_04dd_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l718_c7_40ba_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_d7d1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_d1d3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_6a78_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_4543_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_dd8a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c26_839d_left := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l722_c22_9843_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l718_c7_40ba_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l716_c3_8c6d_left := t16;
     VAR_MUX_uxn_opcodes_h_l722_c22_d6c5_iffalse := t16;
     VAR_t16_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l707_c7_b2d0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l715_c7_04dd_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l721_c26_839d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l721_c26_839d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c26_839d_left;
     BIN_OP_EQ_uxn_opcodes_h_l721_c26_839d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c26_839d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c26_839d_return_output := BIN_OP_EQ_uxn_opcodes_h_l721_c26_839d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l722_c22_9843] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l722_c22_9843_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l722_c22_9843_left;
     BIN_OP_EQ_uxn_opcodes_h_l722_c22_9843_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l722_c22_9843_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l722_c22_9843_return_output := BIN_OP_EQ_uxn_opcodes_h_l722_c22_9843_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l694_c2_9e2c] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l694_c2_9e2c_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l710_c11_6a78] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l710_c11_6a78_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_6a78_left;
     BIN_OP_EQ_uxn_opcodes_h_l710_c11_6a78_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_6a78_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_6a78_return_output := BIN_OP_EQ_uxn_opcodes_h_l710_c11_6a78_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l715_c11_4543] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l715_c11_4543_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_4543_left;
     BIN_OP_EQ_uxn_opcodes_h_l715_c11_4543_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_4543_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_4543_return_output := BIN_OP_EQ_uxn_opcodes_h_l715_c11_4543_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l694_c2_9e2c] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l694_c2_9e2c_return_output := result.is_vram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l694_c2_9e2c] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l694_c2_9e2c_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l715_l707_l718_l710_DUPLICATE_7b49 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l715_l707_l718_l710_DUPLICATE_7b49_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l707_c11_d1d3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l707_c11_d1d3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_d1d3_left;
     BIN_OP_EQ_uxn_opcodes_h_l707_c11_d1d3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_d1d3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_d1d3_return_output := BIN_OP_EQ_uxn_opcodes_h_l707_c11_d1d3_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l694_c2_9e2c] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l694_c2_9e2c_return_output := result.is_ram_write;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l710_c7_06cb] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l710_c7_06cb_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l718_l715_l710_l707_l694_DUPLICATE_e26c LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l718_l715_l710_l707_l694_DUPLICATE_e26c_return_output := result.u16_value;

     -- sp_relative_shift[uxn_opcodes_h_l720_c30_5e35] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l720_c30_5e35_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_5e35_ins;
     sp_relative_shift_uxn_opcodes_h_l720_c30_5e35_x <= VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_5e35_x;
     sp_relative_shift_uxn_opcodes_h_l720_c30_5e35_y <= VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_5e35_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_5e35_return_output := sp_relative_shift_uxn_opcodes_h_l720_c30_5e35_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l718_c11_dd8a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l718_c11_dd8a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_dd8a_left;
     BIN_OP_EQ_uxn_opcodes_h_l718_c11_dd8a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_dd8a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_dd8a_return_output := BIN_OP_EQ_uxn_opcodes_h_l718_c11_dd8a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l715_l707_l718_l710_DUPLICATE_f531 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l715_l707_l718_l710_DUPLICATE_f531_return_output := result.is_opc_done;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l715_l707_l718_l710_DUPLICATE_04b4 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l715_l707_l718_l710_DUPLICATE_04b4_return_output := result.sp_relative_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l711_l716_DUPLICATE_fe9d LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l711_l716_DUPLICATE_fe9d_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l694_c6_d7d1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l694_c6_d7d1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_d7d1_left;
     BIN_OP_EQ_uxn_opcodes_h_l694_c6_d7d1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_d7d1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_d7d1_return_output := BIN_OP_EQ_uxn_opcodes_h_l694_c6_d7d1_return_output;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l694_c2_9e2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_d7d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_9e2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_d7d1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_9e2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_d7d1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_d7d1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_9e2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_d7d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_9e2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_d7d1_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_d7d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_9e2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_d7d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_9e2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_d7d1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_9e2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_d7d1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l694_c2_9e2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_d7d1_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l707_c7_b2d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_d1d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_b2d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_d1d3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_b2d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_d1d3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_b2d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_d1d3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_b2d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_d1d3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_b2d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_d1d3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l707_c7_b2d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_d1d3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l710_c7_06cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_6a78_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_06cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_6a78_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_06cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_6a78_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_06cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_6a78_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_06cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_6a78_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_06cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_6a78_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l710_c7_06cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_6a78_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l715_c7_04dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_4543_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_04dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_4543_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_04dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_4543_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_04dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_4543_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_04dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_4543_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l715_c7_04dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_4543_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l718_c7_40ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_dd8a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_40ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_dd8a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_40ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_dd8a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_40ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_dd8a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_40ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_dd8a_return_output;
     VAR_MUX_uxn_opcodes_h_l721_c26_2610_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c26_839d_return_output;
     VAR_MUX_uxn_opcodes_h_l722_c22_d6c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l722_c22_9843_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l716_c3_8c6d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l711_l716_DUPLICATE_fe9d_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l712_c3_0e5e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l711_l716_DUPLICATE_fe9d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_b2d0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l715_l707_l718_l710_DUPLICATE_04b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_06cb_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l715_l707_l718_l710_DUPLICATE_04b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_04dd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l715_l707_l718_l710_DUPLICATE_04b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_40ba_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l715_l707_l718_l710_DUPLICATE_04b4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l718_l715_l710_l707_l694_DUPLICATE_e26c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_b2d0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l718_l715_l710_l707_l694_DUPLICATE_e26c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_06cb_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l718_l715_l710_l707_l694_DUPLICATE_e26c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_04dd_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l718_l715_l710_l707_l694_DUPLICATE_e26c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_40ba_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l718_l715_l710_l707_l694_DUPLICATE_e26c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_b2d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l715_l707_l718_l710_DUPLICATE_f531_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_06cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l715_l707_l718_l710_DUPLICATE_f531_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_04dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l715_l707_l718_l710_DUPLICATE_f531_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_40ba_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l715_l707_l718_l710_DUPLICATE_f531_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_b2d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l715_l707_l718_l710_DUPLICATE_7b49_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_06cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l715_l707_l718_l710_DUPLICATE_7b49_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_04dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l715_l707_l718_l710_DUPLICATE_7b49_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_40ba_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l715_l707_l718_l710_DUPLICATE_7b49_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l694_c2_9e2c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l694_c2_9e2c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l694_c2_9e2c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l694_c2_9e2c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_06cb_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l710_c7_06cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_40ba_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_5e35_return_output;
     -- MUX[uxn_opcodes_h_l722_c22_d6c5] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l722_c22_d6c5_cond <= VAR_MUX_uxn_opcodes_h_l722_c22_d6c5_cond;
     MUX_uxn_opcodes_h_l722_c22_d6c5_iftrue <= VAR_MUX_uxn_opcodes_h_l722_c22_d6c5_iftrue;
     MUX_uxn_opcodes_h_l722_c22_d6c5_iffalse <= VAR_MUX_uxn_opcodes_h_l722_c22_d6c5_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l722_c22_d6c5_return_output := MUX_uxn_opcodes_h_l722_c22_d6c5_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l712_c3_0e5e] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l712_c3_0e5e_x <= VAR_CONST_SL_8_uxn_opcodes_h_l712_c3_0e5e_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l712_c3_0e5e_return_output := CONST_SL_8_uxn_opcodes_h_l712_c3_0e5e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l718_c7_40ba] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_40ba_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_40ba_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_40ba_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_40ba_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_40ba_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_40ba_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_40ba_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_40ba_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l694_c2_9e2c] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l694_c2_9e2c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l718_c7_40ba] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_40ba_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_40ba_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_40ba_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_40ba_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_40ba_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_40ba_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_40ba_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_40ba_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l694_c2_9e2c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_9e2c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_9e2c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l710_c7_06cb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_06cb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_06cb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_06cb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_06cb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_06cb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_06cb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_06cb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_06cb_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l716_c3_8c6d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l716_c3_8c6d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l716_c3_8c6d_left;
     BIN_OP_OR_uxn_opcodes_h_l716_c3_8c6d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l716_c3_8c6d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l716_c3_8c6d_return_output := BIN_OP_OR_uxn_opcodes_h_l716_c3_8c6d_return_output;

     -- n8_MUX[uxn_opcodes_h_l718_c7_40ba] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l718_c7_40ba_cond <= VAR_n8_MUX_uxn_opcodes_h_l718_c7_40ba_cond;
     n8_MUX_uxn_opcodes_h_l718_c7_40ba_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l718_c7_40ba_iftrue;
     n8_MUX_uxn_opcodes_h_l718_c7_40ba_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l718_c7_40ba_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l718_c7_40ba_return_output := n8_MUX_uxn_opcodes_h_l718_c7_40ba_return_output;

     -- MUX[uxn_opcodes_h_l721_c26_2610] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l721_c26_2610_cond <= VAR_MUX_uxn_opcodes_h_l721_c26_2610_cond;
     MUX_uxn_opcodes_h_l721_c26_2610_iftrue <= VAR_MUX_uxn_opcodes_h_l721_c26_2610_iftrue;
     MUX_uxn_opcodes_h_l721_c26_2610_iffalse <= VAR_MUX_uxn_opcodes_h_l721_c26_2610_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l721_c26_2610_return_output := MUX_uxn_opcodes_h_l721_c26_2610_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l694_c2_9e2c] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_9e2c_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_9e2c_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l715_c7_04dd_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l716_c3_8c6d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l710_c7_06cb_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l712_c3_0e5e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_40ba_iftrue := VAR_MUX_uxn_opcodes_h_l721_c26_2610_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_40ba_iftrue := VAR_MUX_uxn_opcodes_h_l722_c22_d6c5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l715_c7_04dd_iffalse := VAR_n8_MUX_uxn_opcodes_h_l718_c7_40ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_04dd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_40ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_04dd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_40ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_b2d0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_06cb_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l718_c7_40ba] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l718_c7_40ba_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_40ba_cond;
     result_u16_value_MUX_uxn_opcodes_h_l718_c7_40ba_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_40ba_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l718_c7_40ba_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_40ba_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_40ba_return_output := result_u16_value_MUX_uxn_opcodes_h_l718_c7_40ba_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l707_c7_b2d0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_b2d0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_b2d0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_b2d0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_b2d0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_b2d0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_b2d0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l715_c7_04dd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_04dd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_04dd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_04dd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_04dd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_04dd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_04dd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_04dd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_04dd_return_output;

     -- t16_MUX[uxn_opcodes_h_l715_c7_04dd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l715_c7_04dd_cond <= VAR_t16_MUX_uxn_opcodes_h_l715_c7_04dd_cond;
     t16_MUX_uxn_opcodes_h_l715_c7_04dd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l715_c7_04dd_iftrue;
     t16_MUX_uxn_opcodes_h_l715_c7_04dd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l715_c7_04dd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l715_c7_04dd_return_output := t16_MUX_uxn_opcodes_h_l715_c7_04dd_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l718_c7_40ba] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_40ba_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_40ba_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_40ba_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_40ba_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_40ba_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_40ba_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_40ba_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_40ba_return_output;

     -- n8_MUX[uxn_opcodes_h_l715_c7_04dd] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l715_c7_04dd_cond <= VAR_n8_MUX_uxn_opcodes_h_l715_c7_04dd_cond;
     n8_MUX_uxn_opcodes_h_l715_c7_04dd_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l715_c7_04dd_iftrue;
     n8_MUX_uxn_opcodes_h_l715_c7_04dd_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l715_c7_04dd_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l715_c7_04dd_return_output := n8_MUX_uxn_opcodes_h_l715_c7_04dd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l715_c7_04dd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_04dd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_04dd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_04dd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_04dd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_04dd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_04dd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_04dd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_04dd_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l710_c7_06cb_iffalse := VAR_n8_MUX_uxn_opcodes_h_l715_c7_04dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_06cb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_04dd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_04dd_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_40ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_06cb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_04dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_04dd_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_40ba_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l710_c7_06cb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l715_c7_04dd_return_output;
     -- t16_MUX[uxn_opcodes_h_l710_c7_06cb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l710_c7_06cb_cond <= VAR_t16_MUX_uxn_opcodes_h_l710_c7_06cb_cond;
     t16_MUX_uxn_opcodes_h_l710_c7_06cb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l710_c7_06cb_iftrue;
     t16_MUX_uxn_opcodes_h_l710_c7_06cb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l710_c7_06cb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l710_c7_06cb_return_output := t16_MUX_uxn_opcodes_h_l710_c7_06cb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l710_c7_06cb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_06cb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_06cb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_06cb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_06cb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_06cb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_06cb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_06cb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_06cb_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l715_c7_04dd] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l715_c7_04dd_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_04dd_cond;
     result_u16_value_MUX_uxn_opcodes_h_l715_c7_04dd_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_04dd_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l715_c7_04dd_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_04dd_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_04dd_return_output := result_u16_value_MUX_uxn_opcodes_h_l715_c7_04dd_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l715_c7_04dd] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_04dd_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_04dd_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_04dd_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_04dd_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_04dd_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_04dd_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_04dd_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_04dd_return_output;

     -- n8_MUX[uxn_opcodes_h_l710_c7_06cb] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l710_c7_06cb_cond <= VAR_n8_MUX_uxn_opcodes_h_l710_c7_06cb_cond;
     n8_MUX_uxn_opcodes_h_l710_c7_06cb_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l710_c7_06cb_iftrue;
     n8_MUX_uxn_opcodes_h_l710_c7_06cb_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l710_c7_06cb_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l710_c7_06cb_return_output := n8_MUX_uxn_opcodes_h_l710_c7_06cb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l694_c2_9e2c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_9e2c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_9e2c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l710_c7_06cb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_06cb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_06cb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_06cb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_06cb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_06cb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_06cb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_06cb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_06cb_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l707_c7_b2d0_iffalse := VAR_n8_MUX_uxn_opcodes_h_l710_c7_06cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_b2d0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_06cb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_06cb_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_04dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_b2d0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_06cb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_06cb_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_04dd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l707_c7_b2d0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l710_c7_06cb_return_output;
     -- t16_MUX[uxn_opcodes_h_l707_c7_b2d0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l707_c7_b2d0_cond <= VAR_t16_MUX_uxn_opcodes_h_l707_c7_b2d0_cond;
     t16_MUX_uxn_opcodes_h_l707_c7_b2d0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l707_c7_b2d0_iftrue;
     t16_MUX_uxn_opcodes_h_l707_c7_b2d0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l707_c7_b2d0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output := t16_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l710_c7_06cb] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_06cb_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_06cb_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_06cb_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_06cb_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_06cb_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_06cb_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_06cb_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_06cb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l707_c7_b2d0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_b2d0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_b2d0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_b2d0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_b2d0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_b2d0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_b2d0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l710_c7_06cb] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l710_c7_06cb_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_06cb_cond;
     result_u16_value_MUX_uxn_opcodes_h_l710_c7_06cb_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_06cb_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l710_c7_06cb_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_06cb_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_06cb_return_output := result_u16_value_MUX_uxn_opcodes_h_l710_c7_06cb_return_output;

     -- n8_MUX[uxn_opcodes_h_l707_c7_b2d0] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l707_c7_b2d0_cond <= VAR_n8_MUX_uxn_opcodes_h_l707_c7_b2d0_cond;
     n8_MUX_uxn_opcodes_h_l707_c7_b2d0_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l707_c7_b2d0_iftrue;
     n8_MUX_uxn_opcodes_h_l707_c7_b2d0_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l707_c7_b2d0_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output := n8_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l707_c7_b2d0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_b2d0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_b2d0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_b2d0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_b2d0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_b2d0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_b2d0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_b2d0_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_06cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_b2d0_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_06cb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output;
     -- n8_MUX[uxn_opcodes_h_l694_c2_9e2c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l694_c2_9e2c_cond <= VAR_n8_MUX_uxn_opcodes_h_l694_c2_9e2c_cond;
     n8_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue;
     n8_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output := n8_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l707_c7_b2d0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l707_c7_b2d0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_b2d0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l707_c7_b2d0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_b2d0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l707_c7_b2d0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_b2d0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output := result_u16_value_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l707_c7_b2d0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_b2d0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_b2d0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_b2d0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_b2d0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_b2d0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_b2d0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output;

     -- t16_MUX[uxn_opcodes_h_l694_c2_9e2c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l694_c2_9e2c_cond <= VAR_t16_MUX_uxn_opcodes_h_l694_c2_9e2c_cond;
     t16_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue;
     t16_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output := t16_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l694_c2_9e2c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_9e2c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_9e2c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l694_c2_9e2c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_9e2c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_9e2c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_b2d0_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l694_c2_9e2c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_9e2c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_9e2c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l694_c2_9e2c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l694_c2_9e2c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_9e2c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_9e2c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_9e2c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output := result_u16_value_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6063_uxn_opcodes_h_l726_l689_DUPLICATE_de18 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6063_uxn_opcodes_h_l726_l689_DUPLICATE_de18_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6063(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_9e2c_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6063_uxn_opcodes_h_l726_l689_DUPLICATE_de18_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6063_uxn_opcodes_h_l726_l689_DUPLICATE_de18_return_output;
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
