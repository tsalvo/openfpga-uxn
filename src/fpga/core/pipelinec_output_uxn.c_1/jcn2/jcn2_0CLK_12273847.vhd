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
-- BIN_OP_EQ[uxn_opcodes_h_l694_c6_6663]
signal BIN_OP_EQ_uxn_opcodes_h_l694_c6_6663_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l694_c6_6663_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l694_c6_6663_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l694_c2_ddfe]
signal t16_MUX_uxn_opcodes_h_l694_c2_ddfe_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l694_c2_ddfe]
signal result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l694_c2_ddfe]
signal result_u16_value_MUX_uxn_opcodes_h_l694_c2_ddfe_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l694_c2_ddfe]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_ddfe_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l694_c2_ddfe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_ddfe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l694_c2_ddfe]
signal result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_ddfe_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l694_c2_ddfe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_ddfe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l694_c2_ddfe]
signal result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l694_c2_ddfe]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_ddfe_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l694_c2_ddfe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_ddfe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l694_c2_ddfe]
signal n8_MUX_uxn_opcodes_h_l694_c2_ddfe_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l707_c11_0470]
signal BIN_OP_EQ_uxn_opcodes_h_l707_c11_0470_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l707_c11_0470_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l707_c11_0470_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l707_c7_87fc]
signal t16_MUX_uxn_opcodes_h_l707_c7_87fc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l707_c7_87fc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l707_c7_87fc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l707_c7_87fc_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l707_c7_87fc]
signal result_u16_value_MUX_uxn_opcodes_h_l707_c7_87fc_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l707_c7_87fc_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l707_c7_87fc_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l707_c7_87fc_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l707_c7_87fc]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_87fc_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_87fc_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_87fc_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_87fc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l707_c7_87fc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_87fc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_87fc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_87fc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_87fc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l707_c7_87fc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_87fc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_87fc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_87fc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_87fc_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l707_c7_87fc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_87fc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_87fc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_87fc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_87fc_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l707_c7_87fc]
signal n8_MUX_uxn_opcodes_h_l707_c7_87fc_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l707_c7_87fc_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l707_c7_87fc_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l707_c7_87fc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l710_c11_013d]
signal BIN_OP_EQ_uxn_opcodes_h_l710_c11_013d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l710_c11_013d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l710_c11_013d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l710_c7_17d0]
signal t16_MUX_uxn_opcodes_h_l710_c7_17d0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l710_c7_17d0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l710_c7_17d0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l710_c7_17d0_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l710_c7_17d0]
signal result_u16_value_MUX_uxn_opcodes_h_l710_c7_17d0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l710_c7_17d0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l710_c7_17d0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l710_c7_17d0_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l710_c7_17d0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_17d0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_17d0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_17d0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_17d0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l710_c7_17d0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_17d0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_17d0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_17d0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_17d0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l710_c7_17d0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_17d0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_17d0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_17d0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_17d0_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l710_c7_17d0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_17d0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_17d0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_17d0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_17d0_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l710_c7_17d0]
signal n8_MUX_uxn_opcodes_h_l710_c7_17d0_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l710_c7_17d0_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l710_c7_17d0_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l710_c7_17d0_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l712_c3_7d32]
signal CONST_SL_8_uxn_opcodes_h_l712_c3_7d32_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l712_c3_7d32_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l715_c11_b00d]
signal BIN_OP_EQ_uxn_opcodes_h_l715_c11_b00d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l715_c11_b00d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l715_c11_b00d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l715_c7_4a8f]
signal t16_MUX_uxn_opcodes_h_l715_c7_4a8f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l715_c7_4a8f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l715_c7_4a8f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l715_c7_4a8f_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l715_c7_4a8f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_4a8f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_4a8f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_4a8f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_4a8f_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l715_c7_4a8f]
signal result_u16_value_MUX_uxn_opcodes_h_l715_c7_4a8f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l715_c7_4a8f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l715_c7_4a8f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l715_c7_4a8f_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l715_c7_4a8f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_4a8f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_4a8f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_4a8f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_4a8f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l715_c7_4a8f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_4a8f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_4a8f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_4a8f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_4a8f_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l715_c7_4a8f]
signal n8_MUX_uxn_opcodes_h_l715_c7_4a8f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l715_c7_4a8f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l715_c7_4a8f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l715_c7_4a8f_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l716_c3_9078]
signal BIN_OP_OR_uxn_opcodes_h_l716_c3_9078_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l716_c3_9078_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l716_c3_9078_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l718_c11_7500]
signal BIN_OP_EQ_uxn_opcodes_h_l718_c11_7500_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l718_c11_7500_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l718_c11_7500_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l718_c7_a1f6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_a1f6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_a1f6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_a1f6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_a1f6_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l718_c7_a1f6]
signal result_u16_value_MUX_uxn_opcodes_h_l718_c7_a1f6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l718_c7_a1f6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l718_c7_a1f6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l718_c7_a1f6_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l718_c7_a1f6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_a1f6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_a1f6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_a1f6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_a1f6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l718_c7_a1f6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_a1f6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_a1f6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_a1f6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_a1f6_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l718_c7_a1f6]
signal n8_MUX_uxn_opcodes_h_l718_c7_a1f6_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l718_c7_a1f6_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l718_c7_a1f6_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l718_c7_a1f6_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l720_c30_0ec8]
signal sp_relative_shift_uxn_opcodes_h_l720_c30_0ec8_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l720_c30_0ec8_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l720_c30_0ec8_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l720_c30_0ec8_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l721_c26_d6ce]
signal BIN_OP_EQ_uxn_opcodes_h_l721_c26_d6ce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l721_c26_d6ce_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l721_c26_d6ce_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l721_c26_b909]
signal MUX_uxn_opcodes_h_l721_c26_b909_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l721_c26_b909_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l721_c26_b909_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l721_c26_b909_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l722_c22_f014]
signal BIN_OP_EQ_uxn_opcodes_h_l722_c22_f014_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l722_c22_f014_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l722_c22_f014_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l722_c22_3656]
signal MUX_uxn_opcodes_h_l722_c22_3656_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l722_c22_3656_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l722_c22_3656_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l722_c22_3656_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_161f( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_vram_write := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.is_pc_updated := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.sp_relative_shift := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l694_c6_6663
BIN_OP_EQ_uxn_opcodes_h_l694_c6_6663 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l694_c6_6663_left,
BIN_OP_EQ_uxn_opcodes_h_l694_c6_6663_right,
BIN_OP_EQ_uxn_opcodes_h_l694_c6_6663_return_output);

-- t16_MUX_uxn_opcodes_h_l694_c2_ddfe
t16_MUX_uxn_opcodes_h_l694_c2_ddfe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l694_c2_ddfe_cond,
t16_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue,
t16_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse,
t16_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_ddfe
result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_ddfe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l694_c2_ddfe
result_u16_value_MUX_uxn_opcodes_h_l694_c2_ddfe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l694_c2_ddfe_cond,
result_u16_value_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_ddfe
result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_ddfe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_ddfe_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_ddfe
result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_ddfe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_ddfe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_ddfe
result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_ddfe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_ddfe_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_ddfe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_ddfe : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_ddfe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_ddfe
result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_ddfe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_ddfe
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_ddfe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_ddfe_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_ddfe
result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_ddfe : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_ddfe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output);

-- n8_MUX_uxn_opcodes_h_l694_c2_ddfe
n8_MUX_uxn_opcodes_h_l694_c2_ddfe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l694_c2_ddfe_cond,
n8_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue,
n8_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse,
n8_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l707_c11_0470
BIN_OP_EQ_uxn_opcodes_h_l707_c11_0470 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l707_c11_0470_left,
BIN_OP_EQ_uxn_opcodes_h_l707_c11_0470_right,
BIN_OP_EQ_uxn_opcodes_h_l707_c11_0470_return_output);

-- t16_MUX_uxn_opcodes_h_l707_c7_87fc
t16_MUX_uxn_opcodes_h_l707_c7_87fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l707_c7_87fc_cond,
t16_MUX_uxn_opcodes_h_l707_c7_87fc_iftrue,
t16_MUX_uxn_opcodes_h_l707_c7_87fc_iffalse,
t16_MUX_uxn_opcodes_h_l707_c7_87fc_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l707_c7_87fc
result_u16_value_MUX_uxn_opcodes_h_l707_c7_87fc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l707_c7_87fc_cond,
result_u16_value_MUX_uxn_opcodes_h_l707_c7_87fc_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l707_c7_87fc_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l707_c7_87fc_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_87fc
result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_87fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_87fc_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_87fc_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_87fc_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_87fc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_87fc
result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_87fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_87fc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_87fc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_87fc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_87fc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_87fc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_87fc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_87fc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_87fc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_87fc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_87fc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_87fc
result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_87fc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_87fc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_87fc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_87fc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_87fc_return_output);

-- n8_MUX_uxn_opcodes_h_l707_c7_87fc
n8_MUX_uxn_opcodes_h_l707_c7_87fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l707_c7_87fc_cond,
n8_MUX_uxn_opcodes_h_l707_c7_87fc_iftrue,
n8_MUX_uxn_opcodes_h_l707_c7_87fc_iffalse,
n8_MUX_uxn_opcodes_h_l707_c7_87fc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l710_c11_013d
BIN_OP_EQ_uxn_opcodes_h_l710_c11_013d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l710_c11_013d_left,
BIN_OP_EQ_uxn_opcodes_h_l710_c11_013d_right,
BIN_OP_EQ_uxn_opcodes_h_l710_c11_013d_return_output);

-- t16_MUX_uxn_opcodes_h_l710_c7_17d0
t16_MUX_uxn_opcodes_h_l710_c7_17d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l710_c7_17d0_cond,
t16_MUX_uxn_opcodes_h_l710_c7_17d0_iftrue,
t16_MUX_uxn_opcodes_h_l710_c7_17d0_iffalse,
t16_MUX_uxn_opcodes_h_l710_c7_17d0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l710_c7_17d0
result_u16_value_MUX_uxn_opcodes_h_l710_c7_17d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l710_c7_17d0_cond,
result_u16_value_MUX_uxn_opcodes_h_l710_c7_17d0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l710_c7_17d0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l710_c7_17d0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_17d0
result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_17d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_17d0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_17d0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_17d0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_17d0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_17d0
result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_17d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_17d0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_17d0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_17d0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_17d0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_17d0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_17d0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_17d0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_17d0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_17d0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_17d0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_17d0
result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_17d0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_17d0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_17d0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_17d0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_17d0_return_output);

-- n8_MUX_uxn_opcodes_h_l710_c7_17d0
n8_MUX_uxn_opcodes_h_l710_c7_17d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l710_c7_17d0_cond,
n8_MUX_uxn_opcodes_h_l710_c7_17d0_iftrue,
n8_MUX_uxn_opcodes_h_l710_c7_17d0_iffalse,
n8_MUX_uxn_opcodes_h_l710_c7_17d0_return_output);

-- CONST_SL_8_uxn_opcodes_h_l712_c3_7d32
CONST_SL_8_uxn_opcodes_h_l712_c3_7d32 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l712_c3_7d32_x,
CONST_SL_8_uxn_opcodes_h_l712_c3_7d32_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l715_c11_b00d
BIN_OP_EQ_uxn_opcodes_h_l715_c11_b00d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l715_c11_b00d_left,
BIN_OP_EQ_uxn_opcodes_h_l715_c11_b00d_right,
BIN_OP_EQ_uxn_opcodes_h_l715_c11_b00d_return_output);

-- t16_MUX_uxn_opcodes_h_l715_c7_4a8f
t16_MUX_uxn_opcodes_h_l715_c7_4a8f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l715_c7_4a8f_cond,
t16_MUX_uxn_opcodes_h_l715_c7_4a8f_iftrue,
t16_MUX_uxn_opcodes_h_l715_c7_4a8f_iffalse,
t16_MUX_uxn_opcodes_h_l715_c7_4a8f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_4a8f
result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_4a8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_4a8f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_4a8f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_4a8f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_4a8f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l715_c7_4a8f
result_u16_value_MUX_uxn_opcodes_h_l715_c7_4a8f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l715_c7_4a8f_cond,
result_u16_value_MUX_uxn_opcodes_h_l715_c7_4a8f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l715_c7_4a8f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l715_c7_4a8f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_4a8f
result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_4a8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_4a8f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_4a8f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_4a8f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_4a8f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_4a8f
result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_4a8f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_4a8f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_4a8f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_4a8f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_4a8f_return_output);

-- n8_MUX_uxn_opcodes_h_l715_c7_4a8f
n8_MUX_uxn_opcodes_h_l715_c7_4a8f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l715_c7_4a8f_cond,
n8_MUX_uxn_opcodes_h_l715_c7_4a8f_iftrue,
n8_MUX_uxn_opcodes_h_l715_c7_4a8f_iffalse,
n8_MUX_uxn_opcodes_h_l715_c7_4a8f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l716_c3_9078
BIN_OP_OR_uxn_opcodes_h_l716_c3_9078 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l716_c3_9078_left,
BIN_OP_OR_uxn_opcodes_h_l716_c3_9078_right,
BIN_OP_OR_uxn_opcodes_h_l716_c3_9078_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l718_c11_7500
BIN_OP_EQ_uxn_opcodes_h_l718_c11_7500 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l718_c11_7500_left,
BIN_OP_EQ_uxn_opcodes_h_l718_c11_7500_right,
BIN_OP_EQ_uxn_opcodes_h_l718_c11_7500_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_a1f6
result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_a1f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_a1f6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_a1f6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_a1f6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_a1f6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l718_c7_a1f6
result_u16_value_MUX_uxn_opcodes_h_l718_c7_a1f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l718_c7_a1f6_cond,
result_u16_value_MUX_uxn_opcodes_h_l718_c7_a1f6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l718_c7_a1f6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l718_c7_a1f6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_a1f6
result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_a1f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_a1f6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_a1f6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_a1f6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_a1f6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_a1f6
result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_a1f6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_a1f6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_a1f6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_a1f6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_a1f6_return_output);

-- n8_MUX_uxn_opcodes_h_l718_c7_a1f6
n8_MUX_uxn_opcodes_h_l718_c7_a1f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l718_c7_a1f6_cond,
n8_MUX_uxn_opcodes_h_l718_c7_a1f6_iftrue,
n8_MUX_uxn_opcodes_h_l718_c7_a1f6_iffalse,
n8_MUX_uxn_opcodes_h_l718_c7_a1f6_return_output);

-- sp_relative_shift_uxn_opcodes_h_l720_c30_0ec8
sp_relative_shift_uxn_opcodes_h_l720_c30_0ec8 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l720_c30_0ec8_ins,
sp_relative_shift_uxn_opcodes_h_l720_c30_0ec8_x,
sp_relative_shift_uxn_opcodes_h_l720_c30_0ec8_y,
sp_relative_shift_uxn_opcodes_h_l720_c30_0ec8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l721_c26_d6ce
BIN_OP_EQ_uxn_opcodes_h_l721_c26_d6ce : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l721_c26_d6ce_left,
BIN_OP_EQ_uxn_opcodes_h_l721_c26_d6ce_right,
BIN_OP_EQ_uxn_opcodes_h_l721_c26_d6ce_return_output);

-- MUX_uxn_opcodes_h_l721_c26_b909
MUX_uxn_opcodes_h_l721_c26_b909 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l721_c26_b909_cond,
MUX_uxn_opcodes_h_l721_c26_b909_iftrue,
MUX_uxn_opcodes_h_l721_c26_b909_iffalse,
MUX_uxn_opcodes_h_l721_c26_b909_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l722_c22_f014
BIN_OP_EQ_uxn_opcodes_h_l722_c22_f014 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l722_c22_f014_left,
BIN_OP_EQ_uxn_opcodes_h_l722_c22_f014_right,
BIN_OP_EQ_uxn_opcodes_h_l722_c22_f014_return_output);

-- MUX_uxn_opcodes_h_l722_c22_3656
MUX_uxn_opcodes_h_l722_c22_3656 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l722_c22_3656_cond,
MUX_uxn_opcodes_h_l722_c22_3656_iftrue,
MUX_uxn_opcodes_h_l722_c22_3656_iffalse,
MUX_uxn_opcodes_h_l722_c22_3656_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l694_c6_6663_return_output,
 t16_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output,
 n8_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l707_c11_0470_return_output,
 t16_MUX_uxn_opcodes_h_l707_c7_87fc_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l707_c7_87fc_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_87fc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_87fc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_87fc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_87fc_return_output,
 n8_MUX_uxn_opcodes_h_l707_c7_87fc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l710_c11_013d_return_output,
 t16_MUX_uxn_opcodes_h_l710_c7_17d0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l710_c7_17d0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_17d0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_17d0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_17d0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_17d0_return_output,
 n8_MUX_uxn_opcodes_h_l710_c7_17d0_return_output,
 CONST_SL_8_uxn_opcodes_h_l712_c3_7d32_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l715_c11_b00d_return_output,
 t16_MUX_uxn_opcodes_h_l715_c7_4a8f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_4a8f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l715_c7_4a8f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_4a8f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_4a8f_return_output,
 n8_MUX_uxn_opcodes_h_l715_c7_4a8f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l716_c3_9078_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l718_c11_7500_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_a1f6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l718_c7_a1f6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_a1f6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_a1f6_return_output,
 n8_MUX_uxn_opcodes_h_l718_c7_a1f6_return_output,
 sp_relative_shift_uxn_opcodes_h_l720_c30_0ec8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l721_c26_d6ce_return_output,
 MUX_uxn_opcodes_h_l721_c26_b909_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l722_c22_f014_return_output,
 MUX_uxn_opcodes_h_l722_c22_3656_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_6663_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_6663_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_6663_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l707_c7_87fc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l694_c2_ddfe_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l694_c2_ddfe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_87fc_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_ddfe_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_87fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_ddfe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_87fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_ddfe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l694_c2_ddfe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_ddfe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l704_c3_fbd0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_87fc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_ddfe_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l694_c2_ddfe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l694_c2_ddfe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_ddfe_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l699_c3_8aef : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_87fc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_ddfe_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l707_c7_87fc_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l694_c2_ddfe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_0470_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_0470_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_0470_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l707_c7_87fc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l707_c7_87fc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l710_c7_17d0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l707_c7_87fc_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_87fc_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_87fc_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_17d0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_87fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_87fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_87fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_17d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_87fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_87fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_87fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_17d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_87fc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_87fc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l708_c3_c07f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_87fc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_17d0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_87fc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_87fc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_87fc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_17d0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_87fc_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l707_c7_87fc_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l707_c7_87fc_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l710_c7_17d0_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l707_c7_87fc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_013d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_013d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_013d_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l710_c7_17d0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l710_c7_17d0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l715_c7_4a8f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l710_c7_17d0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_17d0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_17d0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_4a8f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_17d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_17d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_17d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_4a8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_17d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_17d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_17d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_4a8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_17d0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_17d0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l713_c3_f1bd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_17d0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l710_c7_17d0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_17d0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_17d0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_17d0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_4a8f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_17d0_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l710_c7_17d0_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l710_c7_17d0_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l715_c7_4a8f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l710_c7_17d0_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l712_c3_7d32_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l712_c3_7d32_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_b00d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_b00d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_b00d_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l715_c7_4a8f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l715_c7_4a8f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l715_c7_4a8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_4a8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_4a8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_a1f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_4a8f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_4a8f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_4a8f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_a1f6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_4a8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_4a8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_4a8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_a1f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_4a8f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_4a8f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_4a8f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_a1f6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_4a8f_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l715_c7_4a8f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l715_c7_4a8f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l718_c7_a1f6_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l715_c7_4a8f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l716_c3_9078_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l716_c3_9078_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l716_c3_9078_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_7500_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_7500_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_7500_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_a1f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_a1f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_a1f6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_a1f6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_a1f6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_a1f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_a1f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_a1f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_a1f6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_a1f6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_a1f6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_a1f6_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l718_c7_a1f6_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l718_c7_a1f6_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l718_c7_a1f6_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_0ec8_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_0ec8_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_0ec8_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_0ec8_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l721_c26_b909_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c26_d6ce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c26_d6ce_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c26_d6ce_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l721_c26_b909_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l721_c26_b909_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l721_c26_b909_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l722_c22_3656_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l722_c22_f014_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l722_c22_f014_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l722_c22_f014_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l722_c22_3656_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l722_c22_3656_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l722_c22_3656_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l710_l707_l694_l718_l715_DUPLICATE_687c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l718_l710_l715_l707_DUPLICATE_6657_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l718_l710_l715_l707_DUPLICATE_defa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l718_l710_l715_l707_DUPLICATE_c795_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l716_l711_DUPLICATE_acf4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_161f_uxn_opcodes_h_l726_l689_DUPLICATE_ef04_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l704_c3_fbd0 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l704_c3_fbd0;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l708_c3_c07f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_87fc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l708_c3_c07f;
     VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_0ec8_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c26_d6ce_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l722_c22_f014_right := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l721_c26_b909_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_b00d_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l722_c22_3656_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l713_c3_f1bd := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_17d0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l713_c3_f1bd;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_7500_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l721_c26_b909_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_6663_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_a1f6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_0470_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_013d_right := to_unsigned(2, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l699_c3_8aef := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l699_c3_8aef;
     VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_0ec8_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));

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
     VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_0ec8_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l707_c7_87fc_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l710_c7_17d0_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l715_c7_4a8f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l718_c7_a1f6_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_6663_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_0470_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_013d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_b00d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_7500_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c26_d6ce_left := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l722_c22_f014_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l718_c7_a1f6_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l716_c3_9078_left := t16;
     VAR_MUX_uxn_opcodes_h_l722_c22_3656_iffalse := t16;
     VAR_t16_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l707_c7_87fc_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l715_c7_4a8f_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l722_c22_f014] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l722_c22_f014_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l722_c22_f014_left;
     BIN_OP_EQ_uxn_opcodes_h_l722_c22_f014_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l722_c22_f014_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l722_c22_f014_return_output := BIN_OP_EQ_uxn_opcodes_h_l722_c22_f014_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l710_c11_013d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l710_c11_013d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_013d_left;
     BIN_OP_EQ_uxn_opcodes_h_l710_c11_013d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_013d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_013d_return_output := BIN_OP_EQ_uxn_opcodes_h_l710_c11_013d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l694_c6_6663] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l694_c6_6663_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_6663_left;
     BIN_OP_EQ_uxn_opcodes_h_l694_c6_6663_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_6663_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_6663_return_output := BIN_OP_EQ_uxn_opcodes_h_l694_c6_6663_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l710_l707_l694_l718_l715_DUPLICATE_687c LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l710_l707_l694_l718_l715_DUPLICATE_687c_return_output := result.u16_value;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l694_c2_ddfe] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l694_c2_ddfe_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l718_c11_7500] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l718_c11_7500_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_7500_left;
     BIN_OP_EQ_uxn_opcodes_h_l718_c11_7500_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_7500_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_7500_return_output := BIN_OP_EQ_uxn_opcodes_h_l718_c11_7500_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l707_c11_0470] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l707_c11_0470_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_0470_left;
     BIN_OP_EQ_uxn_opcodes_h_l707_c11_0470_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_0470_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_0470_return_output := BIN_OP_EQ_uxn_opcodes_h_l707_c11_0470_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l694_c2_ddfe] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l694_c2_ddfe_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l721_c26_d6ce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l721_c26_d6ce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c26_d6ce_left;
     BIN_OP_EQ_uxn_opcodes_h_l721_c26_d6ce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c26_d6ce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c26_d6ce_return_output := BIN_OP_EQ_uxn_opcodes_h_l721_c26_d6ce_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l715_c11_b00d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l715_c11_b00d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_b00d_left;
     BIN_OP_EQ_uxn_opcodes_h_l715_c11_b00d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_b00d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_b00d_return_output := BIN_OP_EQ_uxn_opcodes_h_l715_c11_b00d_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l710_c7_17d0] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l710_c7_17d0_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l718_l710_l715_l707_DUPLICATE_6657 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l718_l710_l715_l707_DUPLICATE_6657_return_output := result.is_pc_updated;

     -- sp_relative_shift[uxn_opcodes_h_l720_c30_0ec8] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l720_c30_0ec8_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_0ec8_ins;
     sp_relative_shift_uxn_opcodes_h_l720_c30_0ec8_x <= VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_0ec8_x;
     sp_relative_shift_uxn_opcodes_h_l720_c30_0ec8_y <= VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_0ec8_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_0ec8_return_output := sp_relative_shift_uxn_opcodes_h_l720_c30_0ec8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l718_l710_l715_l707_DUPLICATE_defa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l718_l710_l715_l707_DUPLICATE_defa_return_output := result.is_opc_done;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l718_l710_l715_l707_DUPLICATE_c795 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l718_l710_l715_l707_DUPLICATE_c795_return_output := result.sp_relative_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l716_l711_DUPLICATE_acf4 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l716_l711_DUPLICATE_acf4_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l694_c2_ddfe] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l694_c2_ddfe_return_output := result.is_stack_index_flipped;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l694_c2_ddfe] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l694_c2_ddfe_return_output := result.is_vram_write;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l694_c2_ddfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_6663_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_ddfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_6663_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_ddfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_6663_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_6663_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_ddfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_6663_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_ddfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_6663_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_6663_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_ddfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_6663_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_ddfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_6663_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_ddfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_6663_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l694_c2_ddfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l694_c6_6663_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l707_c7_87fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_0470_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_87fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_0470_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_87fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_0470_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_87fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_0470_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_87fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_0470_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_87fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_0470_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l707_c7_87fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l707_c11_0470_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l710_c7_17d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_013d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_17d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_013d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_17d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_013d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_17d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_013d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_17d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_013d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_17d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_013d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l710_c7_17d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l710_c11_013d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l715_c7_4a8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_b00d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_4a8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_b00d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_4a8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_b00d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_4a8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_b00d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_4a8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_b00d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l715_c7_4a8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_b00d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l718_c7_a1f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_7500_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_a1f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_7500_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_a1f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_7500_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_a1f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_7500_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_a1f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l718_c11_7500_return_output;
     VAR_MUX_uxn_opcodes_h_l721_c26_b909_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c26_d6ce_return_output;
     VAR_MUX_uxn_opcodes_h_l722_c22_3656_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l722_c22_f014_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l716_c3_9078_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l716_l711_DUPLICATE_acf4_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l712_c3_7d32_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l716_l711_DUPLICATE_acf4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_87fc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l718_l710_l715_l707_DUPLICATE_c795_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_17d0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l718_l710_l715_l707_DUPLICATE_c795_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_4a8f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l718_l710_l715_l707_DUPLICATE_c795_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_a1f6_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l718_l710_l715_l707_DUPLICATE_c795_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l710_l707_l694_l718_l715_DUPLICATE_687c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_87fc_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l710_l707_l694_l718_l715_DUPLICATE_687c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_17d0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l710_l707_l694_l718_l715_DUPLICATE_687c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_4a8f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l710_l707_l694_l718_l715_DUPLICATE_687c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_a1f6_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l710_l707_l694_l718_l715_DUPLICATE_687c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_87fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l718_l710_l715_l707_DUPLICATE_defa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_17d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l718_l710_l715_l707_DUPLICATE_defa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_4a8f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l718_l710_l715_l707_DUPLICATE_defa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_a1f6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l718_l710_l715_l707_DUPLICATE_defa_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_87fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l718_l710_l715_l707_DUPLICATE_6657_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_17d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l718_l710_l715_l707_DUPLICATE_6657_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_4a8f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l718_l710_l715_l707_DUPLICATE_6657_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_a1f6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l718_l710_l715_l707_DUPLICATE_6657_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l694_c2_ddfe_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l694_c2_ddfe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l694_c2_ddfe_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l694_c2_ddfe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_17d0_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l710_c7_17d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_a1f6_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l720_c30_0ec8_return_output;
     -- CONST_SL_8[uxn_opcodes_h_l712_c3_7d32] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l712_c3_7d32_x <= VAR_CONST_SL_8_uxn_opcodes_h_l712_c3_7d32_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l712_c3_7d32_return_output := CONST_SL_8_uxn_opcodes_h_l712_c3_7d32_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l694_c2_ddfe] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l718_c7_a1f6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_a1f6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_a1f6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_a1f6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_a1f6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_a1f6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_a1f6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_a1f6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_a1f6_return_output;

     -- n8_MUX[uxn_opcodes_h_l718_c7_a1f6] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l718_c7_a1f6_cond <= VAR_n8_MUX_uxn_opcodes_h_l718_c7_a1f6_cond;
     n8_MUX_uxn_opcodes_h_l718_c7_a1f6_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l718_c7_a1f6_iftrue;
     n8_MUX_uxn_opcodes_h_l718_c7_a1f6_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l718_c7_a1f6_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l718_c7_a1f6_return_output := n8_MUX_uxn_opcodes_h_l718_c7_a1f6_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l694_c2_ddfe] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_ddfe_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_ddfe_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output;

     -- MUX[uxn_opcodes_h_l722_c22_3656] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l722_c22_3656_cond <= VAR_MUX_uxn_opcodes_h_l722_c22_3656_cond;
     MUX_uxn_opcodes_h_l722_c22_3656_iftrue <= VAR_MUX_uxn_opcodes_h_l722_c22_3656_iftrue;
     MUX_uxn_opcodes_h_l722_c22_3656_iffalse <= VAR_MUX_uxn_opcodes_h_l722_c22_3656_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l722_c22_3656_return_output := MUX_uxn_opcodes_h_l722_c22_3656_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l716_c3_9078] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l716_c3_9078_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l716_c3_9078_left;
     BIN_OP_OR_uxn_opcodes_h_l716_c3_9078_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l716_c3_9078_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l716_c3_9078_return_output := BIN_OP_OR_uxn_opcodes_h_l716_c3_9078_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l694_c2_ddfe] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_ddfe_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_ddfe_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l718_c7_a1f6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_a1f6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_a1f6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_a1f6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_a1f6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_a1f6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_a1f6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_a1f6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_a1f6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l710_c7_17d0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_17d0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_17d0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_17d0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_17d0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_17d0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_17d0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_17d0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_17d0_return_output;

     -- MUX[uxn_opcodes_h_l721_c26_b909] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l721_c26_b909_cond <= VAR_MUX_uxn_opcodes_h_l721_c26_b909_cond;
     MUX_uxn_opcodes_h_l721_c26_b909_iftrue <= VAR_MUX_uxn_opcodes_h_l721_c26_b909_iftrue;
     MUX_uxn_opcodes_h_l721_c26_b909_iffalse <= VAR_MUX_uxn_opcodes_h_l721_c26_b909_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l721_c26_b909_return_output := MUX_uxn_opcodes_h_l721_c26_b909_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l694_c2_ddfe] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l715_c7_4a8f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l716_c3_9078_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l710_c7_17d0_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l712_c3_7d32_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_a1f6_iftrue := VAR_MUX_uxn_opcodes_h_l721_c26_b909_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_a1f6_iftrue := VAR_MUX_uxn_opcodes_h_l722_c22_3656_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l715_c7_4a8f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l718_c7_a1f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_4a8f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l718_c7_a1f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_4a8f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l718_c7_a1f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_87fc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l710_c7_17d0_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l718_c7_a1f6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l718_c7_a1f6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_a1f6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l718_c7_a1f6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_a1f6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l718_c7_a1f6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_a1f6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_a1f6_return_output := result_u16_value_MUX_uxn_opcodes_h_l718_c7_a1f6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l707_c7_87fc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_87fc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_87fc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_87fc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_87fc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_87fc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_87fc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_87fc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_87fc_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l718_c7_a1f6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_a1f6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_a1f6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_a1f6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_a1f6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_a1f6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_a1f6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_a1f6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_a1f6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l715_c7_4a8f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_4a8f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_4a8f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_4a8f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_4a8f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_4a8f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_4a8f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_4a8f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_4a8f_return_output;

     -- t16_MUX[uxn_opcodes_h_l715_c7_4a8f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l715_c7_4a8f_cond <= VAR_t16_MUX_uxn_opcodes_h_l715_c7_4a8f_cond;
     t16_MUX_uxn_opcodes_h_l715_c7_4a8f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l715_c7_4a8f_iftrue;
     t16_MUX_uxn_opcodes_h_l715_c7_4a8f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l715_c7_4a8f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l715_c7_4a8f_return_output := t16_MUX_uxn_opcodes_h_l715_c7_4a8f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l715_c7_4a8f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_4a8f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_4a8f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_4a8f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_4a8f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_4a8f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_4a8f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_4a8f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_4a8f_return_output;

     -- n8_MUX[uxn_opcodes_h_l715_c7_4a8f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l715_c7_4a8f_cond <= VAR_n8_MUX_uxn_opcodes_h_l715_c7_4a8f_cond;
     n8_MUX_uxn_opcodes_h_l715_c7_4a8f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l715_c7_4a8f_iftrue;
     n8_MUX_uxn_opcodes_h_l715_c7_4a8f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l715_c7_4a8f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l715_c7_4a8f_return_output := n8_MUX_uxn_opcodes_h_l715_c7_4a8f_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l710_c7_17d0_iffalse := VAR_n8_MUX_uxn_opcodes_h_l715_c7_4a8f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_17d0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_4a8f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_4a8f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l718_c7_a1f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_17d0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c7_4a8f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l707_c7_87fc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_4a8f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l718_c7_a1f6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l710_c7_17d0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l715_c7_4a8f_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l715_c7_4a8f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l715_c7_4a8f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_4a8f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l715_c7_4a8f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_4a8f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l715_c7_4a8f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_4a8f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_4a8f_return_output := result_u16_value_MUX_uxn_opcodes_h_l715_c7_4a8f_return_output;

     -- n8_MUX[uxn_opcodes_h_l710_c7_17d0] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l710_c7_17d0_cond <= VAR_n8_MUX_uxn_opcodes_h_l710_c7_17d0_cond;
     n8_MUX_uxn_opcodes_h_l710_c7_17d0_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l710_c7_17d0_iftrue;
     n8_MUX_uxn_opcodes_h_l710_c7_17d0_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l710_c7_17d0_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l710_c7_17d0_return_output := n8_MUX_uxn_opcodes_h_l710_c7_17d0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l710_c7_17d0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_17d0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_17d0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_17d0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_17d0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_17d0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_17d0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_17d0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_17d0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l715_c7_4a8f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_4a8f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_4a8f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_4a8f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_4a8f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_4a8f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_4a8f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_4a8f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_4a8f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l694_c2_ddfe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_ddfe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_ddfe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l710_c7_17d0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_17d0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_17d0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_17d0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_17d0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_17d0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_17d0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_17d0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_17d0_return_output;

     -- t16_MUX[uxn_opcodes_h_l710_c7_17d0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l710_c7_17d0_cond <= VAR_t16_MUX_uxn_opcodes_h_l710_c7_17d0_cond;
     t16_MUX_uxn_opcodes_h_l710_c7_17d0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l710_c7_17d0_iftrue;
     t16_MUX_uxn_opcodes_h_l710_c7_17d0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l710_c7_17d0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l710_c7_17d0_return_output := t16_MUX_uxn_opcodes_h_l710_c7_17d0_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l707_c7_87fc_iffalse := VAR_n8_MUX_uxn_opcodes_h_l710_c7_17d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_87fc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l710_c7_17d0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_17d0_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c7_4a8f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_87fc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l710_c7_17d0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_17d0_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c7_4a8f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l707_c7_87fc_iffalse := VAR_t16_MUX_uxn_opcodes_h_l710_c7_17d0_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l710_c7_17d0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l710_c7_17d0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_17d0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l710_c7_17d0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_17d0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l710_c7_17d0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_17d0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_17d0_return_output := result_u16_value_MUX_uxn_opcodes_h_l710_c7_17d0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l707_c7_87fc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_87fc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_87fc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_87fc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_87fc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_87fc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_87fc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_87fc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_87fc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l707_c7_87fc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_87fc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_87fc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_87fc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_87fc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_87fc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_87fc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_87fc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_87fc_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l710_c7_17d0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_17d0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_17d0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_17d0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_17d0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_17d0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_17d0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_17d0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_17d0_return_output;

     -- n8_MUX[uxn_opcodes_h_l707_c7_87fc] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l707_c7_87fc_cond <= VAR_n8_MUX_uxn_opcodes_h_l707_c7_87fc_cond;
     n8_MUX_uxn_opcodes_h_l707_c7_87fc_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l707_c7_87fc_iftrue;
     n8_MUX_uxn_opcodes_h_l707_c7_87fc_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l707_c7_87fc_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l707_c7_87fc_return_output := n8_MUX_uxn_opcodes_h_l707_c7_87fc_return_output;

     -- t16_MUX[uxn_opcodes_h_l707_c7_87fc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l707_c7_87fc_cond <= VAR_t16_MUX_uxn_opcodes_h_l707_c7_87fc_cond;
     t16_MUX_uxn_opcodes_h_l707_c7_87fc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l707_c7_87fc_iftrue;
     t16_MUX_uxn_opcodes_h_l707_c7_87fc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l707_c7_87fc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l707_c7_87fc_return_output := t16_MUX_uxn_opcodes_h_l707_c7_87fc_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse := VAR_n8_MUX_uxn_opcodes_h_l707_c7_87fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l707_c7_87fc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_87fc_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l710_c7_17d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l707_c7_87fc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_87fc_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l710_c7_17d0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse := VAR_t16_MUX_uxn_opcodes_h_l707_c7_87fc_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l694_c2_ddfe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_ddfe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_ddfe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output;

     -- t16_MUX[uxn_opcodes_h_l694_c2_ddfe] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l694_c2_ddfe_cond <= VAR_t16_MUX_uxn_opcodes_h_l694_c2_ddfe_cond;
     t16_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue;
     t16_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output := t16_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l707_c7_87fc] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_87fc_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_87fc_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_87fc_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_87fc_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_87fc_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_87fc_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_87fc_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_87fc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l694_c2_ddfe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_ddfe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_ddfe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output;

     -- n8_MUX[uxn_opcodes_h_l694_c2_ddfe] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l694_c2_ddfe_cond <= VAR_n8_MUX_uxn_opcodes_h_l694_c2_ddfe_cond;
     n8_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue;
     n8_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output := n8_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l707_c7_87fc] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l707_c7_87fc_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_87fc_cond;
     result_u16_value_MUX_uxn_opcodes_h_l707_c7_87fc_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_87fc_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l707_c7_87fc_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_87fc_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_87fc_return_output := result_u16_value_MUX_uxn_opcodes_h_l707_c7_87fc_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l707_c7_87fc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l707_c7_87fc_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l694_c2_ddfe] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l694_c2_ddfe_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_ddfe_cond;
     result_u16_value_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output := result_u16_value_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l694_c2_ddfe] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_ddfe_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_ddfe_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_ddfe_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_ddfe_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_161f_uxn_opcodes_h_l726_l689_DUPLICATE_ef04 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_161f_uxn_opcodes_h_l726_l689_DUPLICATE_ef04_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_161f(
     result,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l694_c2_ddfe_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_161f_uxn_opcodes_h_l726_l689_DUPLICATE_ef04_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_161f_uxn_opcodes_h_l726_l689_DUPLICATE_ef04_return_output;
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
