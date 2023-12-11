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
-- BIN_OP_EQ[uxn_opcodes_h_l715_c6_87f2]
signal BIN_OP_EQ_uxn_opcodes_h_l715_c6_87f2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l715_c6_87f2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l715_c6_87f2_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l715_c2_9831]
signal t16_MUX_uxn_opcodes_h_l715_c2_9831_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l715_c2_9831_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l715_c2_9831_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l715_c2_9831_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l715_c2_9831]
signal n8_MUX_uxn_opcodes_h_l715_c2_9831_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l715_c2_9831_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l715_c2_9831_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l715_c2_9831_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l715_c2_9831]
signal result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_9831_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_9831_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_9831_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_9831_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l715_c2_9831]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_9831_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_9831_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_9831_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_9831_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l715_c2_9831]
signal result_u16_value_MUX_uxn_opcodes_h_l715_c2_9831_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l715_c2_9831_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l715_c2_9831_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l715_c2_9831_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l715_c2_9831]
signal result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_9831_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_9831_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_9831_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_9831_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l715_c2_9831]
signal result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_9831_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_9831_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_9831_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_9831_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l715_c2_9831]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_9831_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_9831_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_9831_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_9831_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l715_c2_9831]
signal result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_9831_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_9831_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_9831_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_9831_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l715_c2_9831]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_9831_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_9831_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_9831_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_9831_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l715_c2_9831]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_9831_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_9831_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_9831_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_9831_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l728_c11_547b]
signal BIN_OP_EQ_uxn_opcodes_h_l728_c11_547b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l728_c11_547b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l728_c11_547b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l728_c7_c688]
signal t16_MUX_uxn_opcodes_h_l728_c7_c688_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l728_c7_c688_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l728_c7_c688_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l728_c7_c688_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l728_c7_c688]
signal n8_MUX_uxn_opcodes_h_l728_c7_c688_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l728_c7_c688_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l728_c7_c688_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l728_c7_c688_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l728_c7_c688]
signal result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_c688_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_c688_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_c688_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_c688_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l728_c7_c688]
signal result_u16_value_MUX_uxn_opcodes_h_l728_c7_c688_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l728_c7_c688_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l728_c7_c688_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l728_c7_c688_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l728_c7_c688]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_c688_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_c688_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_c688_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_c688_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l728_c7_c688]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_c688_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_c688_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_c688_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_c688_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l728_c7_c688]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_c688_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_c688_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_c688_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_c688_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l731_c11_f099]
signal BIN_OP_EQ_uxn_opcodes_h_l731_c11_f099_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l731_c11_f099_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l731_c11_f099_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l731_c7_6955]
signal t16_MUX_uxn_opcodes_h_l731_c7_6955_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l731_c7_6955_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l731_c7_6955_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l731_c7_6955_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l731_c7_6955]
signal n8_MUX_uxn_opcodes_h_l731_c7_6955_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l731_c7_6955_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l731_c7_6955_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l731_c7_6955_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l731_c7_6955]
signal result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_6955_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_6955_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_6955_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_6955_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l731_c7_6955]
signal result_u16_value_MUX_uxn_opcodes_h_l731_c7_6955_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l731_c7_6955_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l731_c7_6955_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l731_c7_6955_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l731_c7_6955]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_6955_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_6955_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_6955_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_6955_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l731_c7_6955]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_6955_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_6955_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_6955_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_6955_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l731_c7_6955]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_6955_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_6955_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_6955_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_6955_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l733_c3_0601]
signal CONST_SL_8_uxn_opcodes_h_l733_c3_0601_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l733_c3_0601_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l736_c11_3d93]
signal BIN_OP_EQ_uxn_opcodes_h_l736_c11_3d93_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l736_c11_3d93_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l736_c11_3d93_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l736_c7_8d97]
signal t16_MUX_uxn_opcodes_h_l736_c7_8d97_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l736_c7_8d97_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l736_c7_8d97_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l736_c7_8d97_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l736_c7_8d97]
signal n8_MUX_uxn_opcodes_h_l736_c7_8d97_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l736_c7_8d97_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l736_c7_8d97_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l736_c7_8d97_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l736_c7_8d97]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_8d97_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_8d97_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_8d97_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_8d97_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l736_c7_8d97]
signal result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_8d97_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_8d97_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_8d97_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_8d97_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l736_c7_8d97]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_8d97_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_8d97_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_8d97_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_8d97_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l736_c7_8d97]
signal result_u16_value_MUX_uxn_opcodes_h_l736_c7_8d97_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l736_c7_8d97_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l736_c7_8d97_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l736_c7_8d97_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l737_c3_ecb3]
signal BIN_OP_OR_uxn_opcodes_h_l737_c3_ecb3_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l737_c3_ecb3_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l737_c3_ecb3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l739_c11_2536]
signal BIN_OP_EQ_uxn_opcodes_h_l739_c11_2536_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l739_c11_2536_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l739_c11_2536_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l739_c7_0c92]
signal n8_MUX_uxn_opcodes_h_l739_c7_0c92_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l739_c7_0c92_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l739_c7_0c92_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l739_c7_0c92_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l739_c7_0c92]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_0c92_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_0c92_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_0c92_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_0c92_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l739_c7_0c92]
signal result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_0c92_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_0c92_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_0c92_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_0c92_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l739_c7_0c92]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_0c92_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_0c92_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_0c92_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_0c92_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l739_c7_0c92]
signal result_u16_value_MUX_uxn_opcodes_h_l739_c7_0c92_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l739_c7_0c92_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l739_c7_0c92_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l739_c7_0c92_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l741_c30_34ae]
signal sp_relative_shift_uxn_opcodes_h_l741_c30_34ae_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l741_c30_34ae_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l741_c30_34ae_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l741_c30_34ae_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l742_c26_812c]
signal BIN_OP_EQ_uxn_opcodes_h_l742_c26_812c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l742_c26_812c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l742_c26_812c_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l742_c26_0a91]
signal MUX_uxn_opcodes_h_l742_c26_0a91_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l742_c26_0a91_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l742_c26_0a91_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l742_c26_0a91_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l743_c22_e7e2]
signal BIN_OP_EQ_uxn_opcodes_h_l743_c22_e7e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l743_c22_e7e2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l743_c22_e7e2_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l743_c22_4e1c]
signal MUX_uxn_opcodes_h_l743_c22_4e1c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l743_c22_4e1c_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l743_c22_4e1c_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l743_c22_4e1c_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_763b( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_pc_updated := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l715_c6_87f2
BIN_OP_EQ_uxn_opcodes_h_l715_c6_87f2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l715_c6_87f2_left,
BIN_OP_EQ_uxn_opcodes_h_l715_c6_87f2_right,
BIN_OP_EQ_uxn_opcodes_h_l715_c6_87f2_return_output);

-- t16_MUX_uxn_opcodes_h_l715_c2_9831
t16_MUX_uxn_opcodes_h_l715_c2_9831 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l715_c2_9831_cond,
t16_MUX_uxn_opcodes_h_l715_c2_9831_iftrue,
t16_MUX_uxn_opcodes_h_l715_c2_9831_iffalse,
t16_MUX_uxn_opcodes_h_l715_c2_9831_return_output);

-- n8_MUX_uxn_opcodes_h_l715_c2_9831
n8_MUX_uxn_opcodes_h_l715_c2_9831 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l715_c2_9831_cond,
n8_MUX_uxn_opcodes_h_l715_c2_9831_iftrue,
n8_MUX_uxn_opcodes_h_l715_c2_9831_iffalse,
n8_MUX_uxn_opcodes_h_l715_c2_9831_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_9831
result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_9831 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_9831_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_9831_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_9831_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_9831_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_9831
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_9831 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_9831_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_9831_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_9831_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_9831_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l715_c2_9831
result_u16_value_MUX_uxn_opcodes_h_l715_c2_9831 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l715_c2_9831_cond,
result_u16_value_MUX_uxn_opcodes_h_l715_c2_9831_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l715_c2_9831_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l715_c2_9831_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_9831
result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_9831 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_9831_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_9831_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_9831_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_9831_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_9831
result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_9831 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_9831_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_9831_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_9831_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_9831_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_9831
result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_9831 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_9831_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_9831_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_9831_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_9831_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_9831
result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_9831 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_9831_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_9831_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_9831_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_9831_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_9831
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_9831 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_9831_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_9831_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_9831_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_9831_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_9831
result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_9831 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_9831_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_9831_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_9831_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_9831_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l728_c11_547b
BIN_OP_EQ_uxn_opcodes_h_l728_c11_547b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l728_c11_547b_left,
BIN_OP_EQ_uxn_opcodes_h_l728_c11_547b_right,
BIN_OP_EQ_uxn_opcodes_h_l728_c11_547b_return_output);

-- t16_MUX_uxn_opcodes_h_l728_c7_c688
t16_MUX_uxn_opcodes_h_l728_c7_c688 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l728_c7_c688_cond,
t16_MUX_uxn_opcodes_h_l728_c7_c688_iftrue,
t16_MUX_uxn_opcodes_h_l728_c7_c688_iffalse,
t16_MUX_uxn_opcodes_h_l728_c7_c688_return_output);

-- n8_MUX_uxn_opcodes_h_l728_c7_c688
n8_MUX_uxn_opcodes_h_l728_c7_c688 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l728_c7_c688_cond,
n8_MUX_uxn_opcodes_h_l728_c7_c688_iftrue,
n8_MUX_uxn_opcodes_h_l728_c7_c688_iffalse,
n8_MUX_uxn_opcodes_h_l728_c7_c688_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_c688
result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_c688 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_c688_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_c688_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_c688_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_c688_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l728_c7_c688
result_u16_value_MUX_uxn_opcodes_h_l728_c7_c688 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l728_c7_c688_cond,
result_u16_value_MUX_uxn_opcodes_h_l728_c7_c688_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l728_c7_c688_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l728_c7_c688_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_c688
result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_c688 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_c688_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_c688_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_c688_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_c688_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_c688
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_c688 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_c688_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_c688_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_c688_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_c688_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_c688
result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_c688 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_c688_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_c688_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_c688_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_c688_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l731_c11_f099
BIN_OP_EQ_uxn_opcodes_h_l731_c11_f099 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l731_c11_f099_left,
BIN_OP_EQ_uxn_opcodes_h_l731_c11_f099_right,
BIN_OP_EQ_uxn_opcodes_h_l731_c11_f099_return_output);

-- t16_MUX_uxn_opcodes_h_l731_c7_6955
t16_MUX_uxn_opcodes_h_l731_c7_6955 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l731_c7_6955_cond,
t16_MUX_uxn_opcodes_h_l731_c7_6955_iftrue,
t16_MUX_uxn_opcodes_h_l731_c7_6955_iffalse,
t16_MUX_uxn_opcodes_h_l731_c7_6955_return_output);

-- n8_MUX_uxn_opcodes_h_l731_c7_6955
n8_MUX_uxn_opcodes_h_l731_c7_6955 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l731_c7_6955_cond,
n8_MUX_uxn_opcodes_h_l731_c7_6955_iftrue,
n8_MUX_uxn_opcodes_h_l731_c7_6955_iffalse,
n8_MUX_uxn_opcodes_h_l731_c7_6955_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_6955
result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_6955 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_6955_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_6955_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_6955_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_6955_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l731_c7_6955
result_u16_value_MUX_uxn_opcodes_h_l731_c7_6955 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l731_c7_6955_cond,
result_u16_value_MUX_uxn_opcodes_h_l731_c7_6955_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l731_c7_6955_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l731_c7_6955_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_6955
result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_6955 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_6955_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_6955_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_6955_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_6955_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_6955
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_6955 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_6955_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_6955_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_6955_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_6955_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_6955
result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_6955 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_6955_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_6955_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_6955_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_6955_return_output);

-- CONST_SL_8_uxn_opcodes_h_l733_c3_0601
CONST_SL_8_uxn_opcodes_h_l733_c3_0601 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l733_c3_0601_x,
CONST_SL_8_uxn_opcodes_h_l733_c3_0601_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l736_c11_3d93
BIN_OP_EQ_uxn_opcodes_h_l736_c11_3d93 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l736_c11_3d93_left,
BIN_OP_EQ_uxn_opcodes_h_l736_c11_3d93_right,
BIN_OP_EQ_uxn_opcodes_h_l736_c11_3d93_return_output);

-- t16_MUX_uxn_opcodes_h_l736_c7_8d97
t16_MUX_uxn_opcodes_h_l736_c7_8d97 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l736_c7_8d97_cond,
t16_MUX_uxn_opcodes_h_l736_c7_8d97_iftrue,
t16_MUX_uxn_opcodes_h_l736_c7_8d97_iffalse,
t16_MUX_uxn_opcodes_h_l736_c7_8d97_return_output);

-- n8_MUX_uxn_opcodes_h_l736_c7_8d97
n8_MUX_uxn_opcodes_h_l736_c7_8d97 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l736_c7_8d97_cond,
n8_MUX_uxn_opcodes_h_l736_c7_8d97_iftrue,
n8_MUX_uxn_opcodes_h_l736_c7_8d97_iffalse,
n8_MUX_uxn_opcodes_h_l736_c7_8d97_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_8d97
result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_8d97 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_8d97_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_8d97_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_8d97_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_8d97_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_8d97
result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_8d97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_8d97_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_8d97_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_8d97_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_8d97_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_8d97
result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_8d97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_8d97_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_8d97_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_8d97_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_8d97_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l736_c7_8d97
result_u16_value_MUX_uxn_opcodes_h_l736_c7_8d97 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l736_c7_8d97_cond,
result_u16_value_MUX_uxn_opcodes_h_l736_c7_8d97_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l736_c7_8d97_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l736_c7_8d97_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l737_c3_ecb3
BIN_OP_OR_uxn_opcodes_h_l737_c3_ecb3 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l737_c3_ecb3_left,
BIN_OP_OR_uxn_opcodes_h_l737_c3_ecb3_right,
BIN_OP_OR_uxn_opcodes_h_l737_c3_ecb3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l739_c11_2536
BIN_OP_EQ_uxn_opcodes_h_l739_c11_2536 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l739_c11_2536_left,
BIN_OP_EQ_uxn_opcodes_h_l739_c11_2536_right,
BIN_OP_EQ_uxn_opcodes_h_l739_c11_2536_return_output);

-- n8_MUX_uxn_opcodes_h_l739_c7_0c92
n8_MUX_uxn_opcodes_h_l739_c7_0c92 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l739_c7_0c92_cond,
n8_MUX_uxn_opcodes_h_l739_c7_0c92_iftrue,
n8_MUX_uxn_opcodes_h_l739_c7_0c92_iffalse,
n8_MUX_uxn_opcodes_h_l739_c7_0c92_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_0c92
result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_0c92 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_0c92_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_0c92_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_0c92_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_0c92_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_0c92
result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_0c92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_0c92_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_0c92_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_0c92_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_0c92_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_0c92
result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_0c92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_0c92_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_0c92_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_0c92_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_0c92_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l739_c7_0c92
result_u16_value_MUX_uxn_opcodes_h_l739_c7_0c92 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l739_c7_0c92_cond,
result_u16_value_MUX_uxn_opcodes_h_l739_c7_0c92_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l739_c7_0c92_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l739_c7_0c92_return_output);

-- sp_relative_shift_uxn_opcodes_h_l741_c30_34ae
sp_relative_shift_uxn_opcodes_h_l741_c30_34ae : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l741_c30_34ae_ins,
sp_relative_shift_uxn_opcodes_h_l741_c30_34ae_x,
sp_relative_shift_uxn_opcodes_h_l741_c30_34ae_y,
sp_relative_shift_uxn_opcodes_h_l741_c30_34ae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l742_c26_812c
BIN_OP_EQ_uxn_opcodes_h_l742_c26_812c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l742_c26_812c_left,
BIN_OP_EQ_uxn_opcodes_h_l742_c26_812c_right,
BIN_OP_EQ_uxn_opcodes_h_l742_c26_812c_return_output);

-- MUX_uxn_opcodes_h_l742_c26_0a91
MUX_uxn_opcodes_h_l742_c26_0a91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l742_c26_0a91_cond,
MUX_uxn_opcodes_h_l742_c26_0a91_iftrue,
MUX_uxn_opcodes_h_l742_c26_0a91_iffalse,
MUX_uxn_opcodes_h_l742_c26_0a91_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l743_c22_e7e2
BIN_OP_EQ_uxn_opcodes_h_l743_c22_e7e2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l743_c22_e7e2_left,
BIN_OP_EQ_uxn_opcodes_h_l743_c22_e7e2_right,
BIN_OP_EQ_uxn_opcodes_h_l743_c22_e7e2_return_output);

-- MUX_uxn_opcodes_h_l743_c22_4e1c
MUX_uxn_opcodes_h_l743_c22_4e1c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l743_c22_4e1c_cond,
MUX_uxn_opcodes_h_l743_c22_4e1c_iftrue,
MUX_uxn_opcodes_h_l743_c22_4e1c_iffalse,
MUX_uxn_opcodes_h_l743_c22_4e1c_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l715_c6_87f2_return_output,
 t16_MUX_uxn_opcodes_h_l715_c2_9831_return_output,
 n8_MUX_uxn_opcodes_h_l715_c2_9831_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_9831_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_9831_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l715_c2_9831_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_9831_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_9831_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_9831_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_9831_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_9831_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_9831_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l728_c11_547b_return_output,
 t16_MUX_uxn_opcodes_h_l728_c7_c688_return_output,
 n8_MUX_uxn_opcodes_h_l728_c7_c688_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_c688_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l728_c7_c688_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_c688_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_c688_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_c688_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l731_c11_f099_return_output,
 t16_MUX_uxn_opcodes_h_l731_c7_6955_return_output,
 n8_MUX_uxn_opcodes_h_l731_c7_6955_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_6955_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l731_c7_6955_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_6955_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_6955_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_6955_return_output,
 CONST_SL_8_uxn_opcodes_h_l733_c3_0601_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l736_c11_3d93_return_output,
 t16_MUX_uxn_opcodes_h_l736_c7_8d97_return_output,
 n8_MUX_uxn_opcodes_h_l736_c7_8d97_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_8d97_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_8d97_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_8d97_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l736_c7_8d97_return_output,
 BIN_OP_OR_uxn_opcodes_h_l737_c3_ecb3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l739_c11_2536_return_output,
 n8_MUX_uxn_opcodes_h_l739_c7_0c92_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_0c92_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_0c92_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_0c92_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l739_c7_0c92_return_output,
 sp_relative_shift_uxn_opcodes_h_l741_c30_34ae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l742_c26_812c_return_output,
 MUX_uxn_opcodes_h_l742_c26_0a91_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l743_c22_e7e2_return_output,
 MUX_uxn_opcodes_h_l743_c22_4e1c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c6_87f2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c6_87f2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c6_87f2_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l715_c2_9831_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l715_c2_9831_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l728_c7_c688_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l715_c2_9831_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l715_c2_9831_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l715_c2_9831_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l715_c2_9831_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l728_c7_c688_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l715_c2_9831_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l715_c2_9831_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_9831_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_9831_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_c688_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_9831_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_9831_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_9831_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_9831_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l715_c2_9831_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_9831_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_9831_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c2_9831_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c2_9831_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l728_c7_c688_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c2_9831_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c2_9831_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_9831_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_9831_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l715_c2_9831_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_9831_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_9831_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_9831_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_9831_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l715_c2_9831_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_9831_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_9831_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_9831_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l720_c3_749e : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_9831_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_c688_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_9831_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_9831_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_9831_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_9831_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l715_c2_9831_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_9831_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_9831_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_9831_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l725_c3_7499 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_9831_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_c688_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_9831_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_9831_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_9831_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_9831_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_c688_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_9831_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_9831_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c11_547b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c11_547b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c11_547b_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l728_c7_c688_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l728_c7_c688_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l731_c7_6955_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l728_c7_c688_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l728_c7_c688_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l728_c7_c688_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l731_c7_6955_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l728_c7_c688_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_c688_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_c688_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_6955_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_c688_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l728_c7_c688_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l728_c7_c688_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_6955_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l728_c7_c688_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_c688_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_c688_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_6955_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_c688_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_c688_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l729_c3_5039 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_c688_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_6955_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_c688_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_c688_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_c688_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_6955_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_c688_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_f099_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_f099_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_f099_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l731_c7_6955_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l731_c7_6955_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l736_c7_8d97_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l731_c7_6955_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l731_c7_6955_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l731_c7_6955_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l736_c7_8d97_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l731_c7_6955_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_6955_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_6955_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_8d97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_6955_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_6955_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_6955_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l736_c7_8d97_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_6955_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_6955_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_6955_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_8d97_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_6955_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_6955_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l734_c3_aa3c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_6955_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l731_c7_6955_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_6955_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_6955_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_6955_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_8d97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_6955_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l733_c3_0601_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l733_c3_0601_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_3d93_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_3d93_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_3d93_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l736_c7_8d97_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l736_c7_8d97_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l736_c7_8d97_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l736_c7_8d97_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l736_c7_8d97_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l739_c7_0c92_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l736_c7_8d97_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_8d97_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_8d97_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_0c92_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_8d97_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_8d97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_8d97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_0c92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_8d97_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_8d97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_8d97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_0c92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_8d97_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l736_c7_8d97_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l736_c7_8d97_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l739_c7_0c92_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l736_c7_8d97_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l737_c3_ecb3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l737_c3_ecb3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l737_c3_ecb3_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_2536_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_2536_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_2536_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l739_c7_0c92_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l739_c7_0c92_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l739_c7_0c92_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_0c92_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_0c92_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_0c92_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_0c92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_0c92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_0c92_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_0c92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_0c92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_0c92_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l739_c7_0c92_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l739_c7_0c92_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l739_c7_0c92_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l741_c30_34ae_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l741_c30_34ae_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l741_c30_34ae_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l741_c30_34ae_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l742_c26_0a91_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c26_812c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c26_812c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c26_812c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l742_c26_0a91_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l742_c26_0a91_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l742_c26_0a91_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l743_c22_4e1c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l743_c22_e7e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l743_c22_e7e2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l743_c22_e7e2_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l743_c22_4e1c_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l743_c22_4e1c_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l743_c22_4e1c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l715_l728_l731_l736_l739_DUPLICATE_c62a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l736_l739_l731_l728_DUPLICATE_b7cc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l736_l739_l731_l728_DUPLICATE_75d0_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l736_l739_l731_l728_DUPLICATE_5aec_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l737_l732_DUPLICATE_db47_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_763b_uxn_opcodes_h_l747_l710_DUPLICATE_541a_return_output : opcode_result_t;
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
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_9831_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c26_812c_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_9831_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_2536_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l743_c22_4e1c_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l743_c22_e7e2_right := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_9831_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l742_c26_0a91_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_f099_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l720_c3_749e := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_9831_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l720_c3_749e;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_0c92_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_9831_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_3d93_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_9831_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l742_c26_0a91_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c6_87f2_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l725_c3_7499 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_9831_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l725_c3_7499;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l734_c3_aa3c := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_6955_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l734_c3_aa3c;
     VAR_sp_relative_shift_uxn_opcodes_h_l741_c30_34ae_y := resize(to_signed(-3, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l729_c3_5039 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_c688_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l729_c3_5039;
     VAR_sp_relative_shift_uxn_opcodes_h_l741_c30_34ae_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_9831_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c11_547b_right := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l741_c30_34ae_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l715_c2_9831_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l728_c7_c688_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l731_c7_6955_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l736_c7_8d97_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l739_c7_0c92_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c6_87f2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c11_547b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_f099_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_3d93_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_2536_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c26_812c_left := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l743_c22_e7e2_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l739_c7_0c92_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l737_c3_ecb3_left := t16;
     VAR_MUX_uxn_opcodes_h_l743_c22_4e1c_iffalse := t16;
     VAR_t16_MUX_uxn_opcodes_h_l715_c2_9831_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l728_c7_c688_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l736_c7_8d97_iffalse := t16;
     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l715_l728_l731_l736_l739_DUPLICATE_c62a LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l715_l728_l731_l736_l739_DUPLICATE_c62a_return_output := result.u16_value;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l715_c2_9831] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l715_c2_9831_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l743_c22_e7e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l743_c22_e7e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l743_c22_e7e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l743_c22_e7e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l743_c22_e7e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l743_c22_e7e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l743_c22_e7e2_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l715_c2_9831] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l715_c2_9831_return_output := result.is_ram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l736_l739_l731_l728_DUPLICATE_75d0 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l736_l739_l731_l728_DUPLICATE_75d0_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l736_l739_l731_l728_DUPLICATE_5aec LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l736_l739_l731_l728_DUPLICATE_5aec_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l739_c11_2536] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l739_c11_2536_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_2536_left;
     BIN_OP_EQ_uxn_opcodes_h_l739_c11_2536_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_2536_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_2536_return_output := BIN_OP_EQ_uxn_opcodes_h_l739_c11_2536_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l741_c30_34ae] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l741_c30_34ae_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l741_c30_34ae_ins;
     sp_relative_shift_uxn_opcodes_h_l741_c30_34ae_x <= VAR_sp_relative_shift_uxn_opcodes_h_l741_c30_34ae_x;
     sp_relative_shift_uxn_opcodes_h_l741_c30_34ae_y <= VAR_sp_relative_shift_uxn_opcodes_h_l741_c30_34ae_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l741_c30_34ae_return_output := sp_relative_shift_uxn_opcodes_h_l741_c30_34ae_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l728_c11_547b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l728_c11_547b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c11_547b_left;
     BIN_OP_EQ_uxn_opcodes_h_l728_c11_547b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c11_547b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c11_547b_return_output := BIN_OP_EQ_uxn_opcodes_h_l728_c11_547b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l736_l739_l731_l728_DUPLICATE_b7cc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l736_l739_l731_l728_DUPLICATE_b7cc_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l736_c11_3d93] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l736_c11_3d93_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_3d93_left;
     BIN_OP_EQ_uxn_opcodes_h_l736_c11_3d93_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_3d93_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_3d93_return_output := BIN_OP_EQ_uxn_opcodes_h_l736_c11_3d93_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l731_c7_6955] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l731_c7_6955_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l715_c6_87f2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l715_c6_87f2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c6_87f2_left;
     BIN_OP_EQ_uxn_opcodes_h_l715_c6_87f2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c6_87f2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c6_87f2_return_output := BIN_OP_EQ_uxn_opcodes_h_l715_c6_87f2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l742_c26_812c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l742_c26_812c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c26_812c_left;
     BIN_OP_EQ_uxn_opcodes_h_l742_c26_812c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c26_812c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c26_812c_return_output := BIN_OP_EQ_uxn_opcodes_h_l742_c26_812c_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l715_c2_9831] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l715_c2_9831_return_output := result.is_stack_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l715_c2_9831] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l715_c2_9831_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l731_c11_f099] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l731_c11_f099_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_f099_left;
     BIN_OP_EQ_uxn_opcodes_h_l731_c11_f099_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_f099_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_f099_return_output := BIN_OP_EQ_uxn_opcodes_h_l731_c11_f099_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l737_l732_DUPLICATE_db47 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l737_l732_DUPLICATE_db47_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l715_c2_9831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c6_87f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_9831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c6_87f2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_9831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c6_87f2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_9831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c6_87f2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_9831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c6_87f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_9831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c6_87f2_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_9831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c6_87f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_9831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c6_87f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_9831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c6_87f2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c2_9831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c6_87f2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l715_c2_9831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c6_87f2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l728_c7_c688_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c11_547b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_c688_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c11_547b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_c688_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c11_547b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_c688_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c11_547b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_c688_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c11_547b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l728_c7_c688_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c11_547b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l728_c7_c688_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c11_547b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l731_c7_6955_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_f099_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_6955_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_f099_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_6955_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_f099_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_6955_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_f099_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_6955_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_f099_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_6955_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_f099_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l731_c7_6955_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_f099_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l736_c7_8d97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_3d93_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_8d97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_3d93_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_8d97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_3d93_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_8d97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_3d93_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l736_c7_8d97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_3d93_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l736_c7_8d97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_3d93_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l739_c7_0c92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_2536_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_0c92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_2536_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_0c92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_2536_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_0c92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_2536_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l739_c7_0c92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_2536_return_output;
     VAR_MUX_uxn_opcodes_h_l742_c26_0a91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c26_812c_return_output;
     VAR_MUX_uxn_opcodes_h_l743_c22_4e1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l743_c22_e7e2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l737_c3_ecb3_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l737_l732_DUPLICATE_db47_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l733_c3_0601_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l737_l732_DUPLICATE_db47_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_c688_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l736_l739_l731_l728_DUPLICATE_75d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_6955_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l736_l739_l731_l728_DUPLICATE_75d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_8d97_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l736_l739_l731_l728_DUPLICATE_75d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_0c92_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l736_l739_l731_l728_DUPLICATE_75d0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c2_9831_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l715_l728_l731_l736_l739_DUPLICATE_c62a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l728_c7_c688_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l715_l728_l731_l736_l739_DUPLICATE_c62a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_6955_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l715_l728_l731_l736_l739_DUPLICATE_c62a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l736_c7_8d97_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l715_l728_l731_l736_l739_DUPLICATE_c62a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l739_c7_0c92_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l715_l728_l731_l736_l739_DUPLICATE_c62a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_c688_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l736_l739_l731_l728_DUPLICATE_b7cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_6955_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l736_l739_l731_l728_DUPLICATE_b7cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_8d97_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l736_l739_l731_l728_DUPLICATE_b7cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_0c92_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l736_l739_l731_l728_DUPLICATE_b7cc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_c688_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l736_l739_l731_l728_DUPLICATE_5aec_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_6955_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l736_l739_l731_l728_DUPLICATE_5aec_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_8d97_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l736_l739_l731_l728_DUPLICATE_5aec_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_0c92_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l736_l739_l731_l728_DUPLICATE_5aec_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_9831_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l715_c2_9831_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_9831_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l715_c2_9831_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_9831_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l715_c2_9831_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_9831_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l715_c2_9831_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_6955_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l731_c7_6955_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_0c92_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l741_c30_34ae_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l739_c7_0c92] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_0c92_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_0c92_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_0c92_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_0c92_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_0c92_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_0c92_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_0c92_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_0c92_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l739_c7_0c92] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_0c92_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_0c92_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_0c92_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_0c92_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_0c92_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_0c92_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_0c92_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_0c92_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l715_c2_9831] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_9831_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_9831_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_9831_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_9831_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_9831_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_9831_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_9831_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_9831_return_output;

     -- n8_MUX[uxn_opcodes_h_l739_c7_0c92] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l739_c7_0c92_cond <= VAR_n8_MUX_uxn_opcodes_h_l739_c7_0c92_cond;
     n8_MUX_uxn_opcodes_h_l739_c7_0c92_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l739_c7_0c92_iftrue;
     n8_MUX_uxn_opcodes_h_l739_c7_0c92_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l739_c7_0c92_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l739_c7_0c92_return_output := n8_MUX_uxn_opcodes_h_l739_c7_0c92_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l731_c7_6955] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_6955_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_6955_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_6955_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_6955_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_6955_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_6955_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_6955_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_6955_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l737_c3_ecb3] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l737_c3_ecb3_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l737_c3_ecb3_left;
     BIN_OP_OR_uxn_opcodes_h_l737_c3_ecb3_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l737_c3_ecb3_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l737_c3_ecb3_return_output := BIN_OP_OR_uxn_opcodes_h_l737_c3_ecb3_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l715_c2_9831] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_9831_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_9831_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_9831_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_9831_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_9831_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_9831_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_9831_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_9831_return_output;

     -- MUX[uxn_opcodes_h_l742_c26_0a91] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l742_c26_0a91_cond <= VAR_MUX_uxn_opcodes_h_l742_c26_0a91_cond;
     MUX_uxn_opcodes_h_l742_c26_0a91_iftrue <= VAR_MUX_uxn_opcodes_h_l742_c26_0a91_iftrue;
     MUX_uxn_opcodes_h_l742_c26_0a91_iffalse <= VAR_MUX_uxn_opcodes_h_l742_c26_0a91_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l742_c26_0a91_return_output := MUX_uxn_opcodes_h_l742_c26_0a91_return_output;

     -- MUX[uxn_opcodes_h_l743_c22_4e1c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l743_c22_4e1c_cond <= VAR_MUX_uxn_opcodes_h_l743_c22_4e1c_cond;
     MUX_uxn_opcodes_h_l743_c22_4e1c_iftrue <= VAR_MUX_uxn_opcodes_h_l743_c22_4e1c_iftrue;
     MUX_uxn_opcodes_h_l743_c22_4e1c_iffalse <= VAR_MUX_uxn_opcodes_h_l743_c22_4e1c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l743_c22_4e1c_return_output := MUX_uxn_opcodes_h_l743_c22_4e1c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l715_c2_9831] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_9831_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_9831_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_9831_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_9831_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_9831_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_9831_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_9831_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_9831_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l715_c2_9831] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_9831_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_9831_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_9831_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_9831_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_9831_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_9831_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_9831_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_9831_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l733_c3_0601] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l733_c3_0601_x <= VAR_CONST_SL_8_uxn_opcodes_h_l733_c3_0601_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l733_c3_0601_return_output := CONST_SL_8_uxn_opcodes_h_l733_c3_0601_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l736_c7_8d97_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l737_c3_ecb3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l731_c7_6955_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l733_c3_0601_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_0c92_iftrue := VAR_MUX_uxn_opcodes_h_l742_c26_0a91_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l739_c7_0c92_iftrue := VAR_MUX_uxn_opcodes_h_l743_c22_4e1c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l736_c7_8d97_iffalse := VAR_n8_MUX_uxn_opcodes_h_l739_c7_0c92_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_8d97_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_0c92_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_8d97_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_0c92_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_c688_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_6955_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l736_c7_8d97] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_8d97_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_8d97_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_8d97_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_8d97_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_8d97_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_8d97_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_8d97_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_8d97_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l728_c7_c688] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_c688_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_c688_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_c688_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_c688_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_c688_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_c688_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_c688_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_c688_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l739_c7_0c92] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_0c92_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_0c92_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_0c92_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_0c92_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_0c92_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_0c92_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_0c92_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_0c92_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l739_c7_0c92] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l739_c7_0c92_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l739_c7_0c92_cond;
     result_u16_value_MUX_uxn_opcodes_h_l739_c7_0c92_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l739_c7_0c92_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l739_c7_0c92_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l739_c7_0c92_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l739_c7_0c92_return_output := result_u16_value_MUX_uxn_opcodes_h_l739_c7_0c92_return_output;

     -- t16_MUX[uxn_opcodes_h_l736_c7_8d97] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l736_c7_8d97_cond <= VAR_t16_MUX_uxn_opcodes_h_l736_c7_8d97_cond;
     t16_MUX_uxn_opcodes_h_l736_c7_8d97_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l736_c7_8d97_iftrue;
     t16_MUX_uxn_opcodes_h_l736_c7_8d97_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l736_c7_8d97_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l736_c7_8d97_return_output := t16_MUX_uxn_opcodes_h_l736_c7_8d97_return_output;

     -- n8_MUX[uxn_opcodes_h_l736_c7_8d97] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l736_c7_8d97_cond <= VAR_n8_MUX_uxn_opcodes_h_l736_c7_8d97_cond;
     n8_MUX_uxn_opcodes_h_l736_c7_8d97_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l736_c7_8d97_iftrue;
     n8_MUX_uxn_opcodes_h_l736_c7_8d97_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l736_c7_8d97_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l736_c7_8d97_return_output := n8_MUX_uxn_opcodes_h_l736_c7_8d97_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l736_c7_8d97] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_8d97_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_8d97_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_8d97_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_8d97_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_8d97_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_8d97_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_8d97_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_8d97_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l731_c7_6955_iffalse := VAR_n8_MUX_uxn_opcodes_h_l736_c7_8d97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_6955_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_8d97_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_8d97_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_0c92_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_6955_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_8d97_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_9831_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_c688_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l736_c7_8d97_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l739_c7_0c92_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l731_c7_6955_iffalse := VAR_t16_MUX_uxn_opcodes_h_l736_c7_8d97_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l731_c7_6955] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_6955_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_6955_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_6955_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_6955_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_6955_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_6955_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_6955_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_6955_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l736_c7_8d97] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_8d97_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_8d97_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_8d97_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_8d97_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_8d97_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_8d97_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_8d97_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_8d97_return_output;

     -- t16_MUX[uxn_opcodes_h_l731_c7_6955] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l731_c7_6955_cond <= VAR_t16_MUX_uxn_opcodes_h_l731_c7_6955_cond;
     t16_MUX_uxn_opcodes_h_l731_c7_6955_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l731_c7_6955_iftrue;
     t16_MUX_uxn_opcodes_h_l731_c7_6955_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l731_c7_6955_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l731_c7_6955_return_output := t16_MUX_uxn_opcodes_h_l731_c7_6955_return_output;

     -- n8_MUX[uxn_opcodes_h_l731_c7_6955] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l731_c7_6955_cond <= VAR_n8_MUX_uxn_opcodes_h_l731_c7_6955_cond;
     n8_MUX_uxn_opcodes_h_l731_c7_6955_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l731_c7_6955_iftrue;
     n8_MUX_uxn_opcodes_h_l731_c7_6955_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l731_c7_6955_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l731_c7_6955_return_output := n8_MUX_uxn_opcodes_h_l731_c7_6955_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l736_c7_8d97] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l736_c7_8d97_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l736_c7_8d97_cond;
     result_u16_value_MUX_uxn_opcodes_h_l736_c7_8d97_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l736_c7_8d97_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l736_c7_8d97_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l736_c7_8d97_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l736_c7_8d97_return_output := result_u16_value_MUX_uxn_opcodes_h_l736_c7_8d97_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l731_c7_6955] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_6955_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_6955_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_6955_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_6955_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_6955_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_6955_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_6955_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_6955_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l715_c2_9831] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_9831_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_9831_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_9831_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_9831_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_9831_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_9831_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_9831_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_9831_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l728_c7_c688_iffalse := VAR_n8_MUX_uxn_opcodes_h_l731_c7_6955_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_c688_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_6955_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_6955_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_8d97_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_c688_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_6955_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_6955_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l736_c7_8d97_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l728_c7_c688_iffalse := VAR_t16_MUX_uxn_opcodes_h_l731_c7_6955_return_output;
     -- t16_MUX[uxn_opcodes_h_l728_c7_c688] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l728_c7_c688_cond <= VAR_t16_MUX_uxn_opcodes_h_l728_c7_c688_cond;
     t16_MUX_uxn_opcodes_h_l728_c7_c688_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l728_c7_c688_iftrue;
     t16_MUX_uxn_opcodes_h_l728_c7_c688_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l728_c7_c688_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l728_c7_c688_return_output := t16_MUX_uxn_opcodes_h_l728_c7_c688_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l731_c7_6955] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l731_c7_6955_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_6955_cond;
     result_u16_value_MUX_uxn_opcodes_h_l731_c7_6955_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_6955_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l731_c7_6955_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_6955_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_6955_return_output := result_u16_value_MUX_uxn_opcodes_h_l731_c7_6955_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l731_c7_6955] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_6955_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_6955_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_6955_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_6955_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_6955_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_6955_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_6955_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_6955_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l728_c7_c688] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_c688_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_c688_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_c688_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_c688_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_c688_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_c688_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_c688_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_c688_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l728_c7_c688] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_c688_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_c688_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_c688_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_c688_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_c688_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_c688_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_c688_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_c688_return_output;

     -- n8_MUX[uxn_opcodes_h_l728_c7_c688] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l728_c7_c688_cond <= VAR_n8_MUX_uxn_opcodes_h_l728_c7_c688_cond;
     n8_MUX_uxn_opcodes_h_l728_c7_c688_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l728_c7_c688_iftrue;
     n8_MUX_uxn_opcodes_h_l728_c7_c688_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l728_c7_c688_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l728_c7_c688_return_output := n8_MUX_uxn_opcodes_h_l728_c7_c688_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l715_c2_9831_iffalse := VAR_n8_MUX_uxn_opcodes_h_l728_c7_c688_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_9831_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_c688_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_c688_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_6955_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_9831_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_c688_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l728_c7_c688_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_6955_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l715_c2_9831_iffalse := VAR_t16_MUX_uxn_opcodes_h_l728_c7_c688_return_output;
     -- n8_MUX[uxn_opcodes_h_l715_c2_9831] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l715_c2_9831_cond <= VAR_n8_MUX_uxn_opcodes_h_l715_c2_9831_cond;
     n8_MUX_uxn_opcodes_h_l715_c2_9831_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l715_c2_9831_iftrue;
     n8_MUX_uxn_opcodes_h_l715_c2_9831_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l715_c2_9831_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l715_c2_9831_return_output := n8_MUX_uxn_opcodes_h_l715_c2_9831_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l715_c2_9831] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_9831_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_9831_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_9831_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_9831_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_9831_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_9831_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_9831_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_9831_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l728_c7_c688] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l728_c7_c688_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l728_c7_c688_cond;
     result_u16_value_MUX_uxn_opcodes_h_l728_c7_c688_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l728_c7_c688_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l728_c7_c688_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l728_c7_c688_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l728_c7_c688_return_output := result_u16_value_MUX_uxn_opcodes_h_l728_c7_c688_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l728_c7_c688] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_c688_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_c688_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_c688_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_c688_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_c688_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_c688_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_c688_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_c688_return_output;

     -- t16_MUX[uxn_opcodes_h_l715_c2_9831] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l715_c2_9831_cond <= VAR_t16_MUX_uxn_opcodes_h_l715_c2_9831_cond;
     t16_MUX_uxn_opcodes_h_l715_c2_9831_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l715_c2_9831_iftrue;
     t16_MUX_uxn_opcodes_h_l715_c2_9831_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l715_c2_9831_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l715_c2_9831_return_output := t16_MUX_uxn_opcodes_h_l715_c2_9831_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l715_c2_9831] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_9831_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_9831_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_9831_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_9831_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_9831_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_9831_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_9831_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_9831_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l715_c2_9831_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_9831_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_c688_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c2_9831_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l728_c7_c688_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l715_c2_9831_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l715_c2_9831] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_9831_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_9831_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_9831_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_9831_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_9831_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_9831_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_9831_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_9831_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l715_c2_9831] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l715_c2_9831_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c2_9831_cond;
     result_u16_value_MUX_uxn_opcodes_h_l715_c2_9831_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c2_9831_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l715_c2_9831_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c2_9831_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c2_9831_return_output := result_u16_value_MUX_uxn_opcodes_h_l715_c2_9831_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_763b_uxn_opcodes_h_l747_l710_DUPLICATE_541a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_763b_uxn_opcodes_h_l747_l710_DUPLICATE_541a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_763b(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_9831_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_9831_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c2_9831_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_9831_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_9831_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_9831_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_9831_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_9831_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_9831_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_763b_uxn_opcodes_h_l747_l710_DUPLICATE_541a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_763b_uxn_opcodes_h_l747_l710_DUPLICATE_541a_return_output;
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
