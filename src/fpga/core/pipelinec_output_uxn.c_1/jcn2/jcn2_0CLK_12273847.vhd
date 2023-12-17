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
-- BIN_OP_EQ[uxn_opcodes_h_l715_c6_abb2]
signal BIN_OP_EQ_uxn_opcodes_h_l715_c6_abb2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l715_c6_abb2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l715_c6_abb2_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l715_c2_63b9]
signal n8_MUX_uxn_opcodes_h_l715_c2_63b9_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l715_c2_63b9_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l715_c2_63b9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_63b9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_63b9_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l715_c2_63b9]
signal result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_63b9_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_63b9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l715_c2_63b9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_63b9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_63b9_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l715_c2_63b9]
signal result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_63b9_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_63b9_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l715_c2_63b9]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_63b9_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_63b9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l715_c2_63b9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_63b9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_63b9_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l715_c2_63b9]
signal result_u16_value_MUX_uxn_opcodes_h_l715_c2_63b9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l715_c2_63b9_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l715_c2_63b9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_63b9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_63b9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l715_c2_63b9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_63b9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_63b9_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l715_c2_63b9]
signal t16_MUX_uxn_opcodes_h_l715_c2_63b9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l715_c2_63b9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l728_c11_71ee]
signal BIN_OP_EQ_uxn_opcodes_h_l728_c11_71ee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l728_c11_71ee_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l728_c11_71ee_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l728_c7_848d]
signal n8_MUX_uxn_opcodes_h_l728_c7_848d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l728_c7_848d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l728_c7_848d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l728_c7_848d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l728_c7_848d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_848d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_848d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_848d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_848d_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l728_c7_848d]
signal result_u16_value_MUX_uxn_opcodes_h_l728_c7_848d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l728_c7_848d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l728_c7_848d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l728_c7_848d_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l728_c7_848d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_848d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_848d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_848d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_848d_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l728_c7_848d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_848d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_848d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_848d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_848d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l728_c7_848d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_848d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_848d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_848d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_848d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l728_c7_848d]
signal t16_MUX_uxn_opcodes_h_l728_c7_848d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l728_c7_848d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l728_c7_848d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l728_c7_848d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l731_c11_1039]
signal BIN_OP_EQ_uxn_opcodes_h_l731_c11_1039_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l731_c11_1039_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l731_c11_1039_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l731_c7_75c2]
signal n8_MUX_uxn_opcodes_h_l731_c7_75c2_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l731_c7_75c2_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l731_c7_75c2_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l731_c7_75c2_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l731_c7_75c2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_75c2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_75c2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_75c2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_75c2_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l731_c7_75c2]
signal result_u16_value_MUX_uxn_opcodes_h_l731_c7_75c2_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l731_c7_75c2_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l731_c7_75c2_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l731_c7_75c2_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l731_c7_75c2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_75c2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_75c2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_75c2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_75c2_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l731_c7_75c2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_75c2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_75c2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_75c2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_75c2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l731_c7_75c2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_75c2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_75c2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_75c2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_75c2_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l731_c7_75c2]
signal t16_MUX_uxn_opcodes_h_l731_c7_75c2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l731_c7_75c2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l731_c7_75c2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l731_c7_75c2_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l733_c3_9859]
signal CONST_SL_8_uxn_opcodes_h_l733_c3_9859_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l733_c3_9859_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l736_c11_b2b4]
signal BIN_OP_EQ_uxn_opcodes_h_l736_c11_b2b4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l736_c11_b2b4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l736_c11_b2b4_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l736_c7_779d]
signal n8_MUX_uxn_opcodes_h_l736_c7_779d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l736_c7_779d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l736_c7_779d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l736_c7_779d_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l736_c7_779d]
signal result_u16_value_MUX_uxn_opcodes_h_l736_c7_779d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l736_c7_779d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l736_c7_779d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l736_c7_779d_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l736_c7_779d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_779d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_779d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_779d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_779d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l736_c7_779d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_779d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_779d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_779d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_779d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l736_c7_779d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_779d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_779d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_779d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_779d_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l736_c7_779d]
signal t16_MUX_uxn_opcodes_h_l736_c7_779d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l736_c7_779d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l736_c7_779d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l736_c7_779d_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l737_c3_1a99]
signal BIN_OP_OR_uxn_opcodes_h_l737_c3_1a99_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l737_c3_1a99_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l737_c3_1a99_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l739_c11_2591]
signal BIN_OP_EQ_uxn_opcodes_h_l739_c11_2591_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l739_c11_2591_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l739_c11_2591_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l739_c7_42ca]
signal n8_MUX_uxn_opcodes_h_l739_c7_42ca_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l739_c7_42ca_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l739_c7_42ca_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l739_c7_42ca_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l739_c7_42ca]
signal result_u16_value_MUX_uxn_opcodes_h_l739_c7_42ca_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l739_c7_42ca_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l739_c7_42ca_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l739_c7_42ca_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l739_c7_42ca]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_42ca_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_42ca_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_42ca_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_42ca_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l739_c7_42ca]
signal result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_42ca_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_42ca_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_42ca_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_42ca_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l739_c7_42ca]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_42ca_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_42ca_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_42ca_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_42ca_return_output : signed(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l741_c30_03e3]
signal sp_relative_shift_uxn_opcodes_h_l741_c30_03e3_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l741_c30_03e3_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l741_c30_03e3_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l741_c30_03e3_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l742_c26_2722]
signal BIN_OP_EQ_uxn_opcodes_h_l742_c26_2722_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l742_c26_2722_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l742_c26_2722_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l742_c26_61d8]
signal MUX_uxn_opcodes_h_l742_c26_61d8_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l742_c26_61d8_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l742_c26_61d8_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l742_c26_61d8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l743_c22_08cc]
signal BIN_OP_EQ_uxn_opcodes_h_l743_c22_08cc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l743_c22_08cc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l743_c22_08cc_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l743_c22_7e8d]
signal MUX_uxn_opcodes_h_l743_c22_7e8d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l743_c22_7e8d_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l743_c22_7e8d_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l743_c22_7e8d_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_5ddc( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
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
      base.is_stack_write := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.is_stack_index_flipped := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.u16_value := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l715_c6_abb2
BIN_OP_EQ_uxn_opcodes_h_l715_c6_abb2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l715_c6_abb2_left,
BIN_OP_EQ_uxn_opcodes_h_l715_c6_abb2_right,
BIN_OP_EQ_uxn_opcodes_h_l715_c6_abb2_return_output);

-- n8_MUX_uxn_opcodes_h_l715_c2_63b9
n8_MUX_uxn_opcodes_h_l715_c2_63b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l715_c2_63b9_cond,
n8_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue,
n8_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse,
n8_MUX_uxn_opcodes_h_l715_c2_63b9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_63b9
result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_63b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_63b9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_63b9_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_63b9
result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_63b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_63b9_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_63b9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_63b9
result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_63b9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_63b9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_63b9_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_63b9
result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_63b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_63b9_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_63b9_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_63b9
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_63b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_63b9_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_63b9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_63b9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_63b9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_63b9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_63b9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l715_c2_63b9
result_u16_value_MUX_uxn_opcodes_h_l715_c2_63b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l715_c2_63b9_cond,
result_u16_value_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l715_c2_63b9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_63b9
result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_63b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_63b9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_63b9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_63b9
result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_63b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_63b9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_63b9_return_output);

-- t16_MUX_uxn_opcodes_h_l715_c2_63b9
t16_MUX_uxn_opcodes_h_l715_c2_63b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l715_c2_63b9_cond,
t16_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue,
t16_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse,
t16_MUX_uxn_opcodes_h_l715_c2_63b9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l728_c11_71ee
BIN_OP_EQ_uxn_opcodes_h_l728_c11_71ee : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l728_c11_71ee_left,
BIN_OP_EQ_uxn_opcodes_h_l728_c11_71ee_right,
BIN_OP_EQ_uxn_opcodes_h_l728_c11_71ee_return_output);

-- n8_MUX_uxn_opcodes_h_l728_c7_848d
n8_MUX_uxn_opcodes_h_l728_c7_848d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l728_c7_848d_cond,
n8_MUX_uxn_opcodes_h_l728_c7_848d_iftrue,
n8_MUX_uxn_opcodes_h_l728_c7_848d_iffalse,
n8_MUX_uxn_opcodes_h_l728_c7_848d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_848d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_848d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_848d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_848d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_848d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_848d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l728_c7_848d
result_u16_value_MUX_uxn_opcodes_h_l728_c7_848d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l728_c7_848d_cond,
result_u16_value_MUX_uxn_opcodes_h_l728_c7_848d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l728_c7_848d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l728_c7_848d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_848d
result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_848d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_848d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_848d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_848d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_848d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_848d
result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_848d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_848d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_848d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_848d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_848d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_848d
result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_848d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_848d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_848d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_848d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_848d_return_output);

-- t16_MUX_uxn_opcodes_h_l728_c7_848d
t16_MUX_uxn_opcodes_h_l728_c7_848d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l728_c7_848d_cond,
t16_MUX_uxn_opcodes_h_l728_c7_848d_iftrue,
t16_MUX_uxn_opcodes_h_l728_c7_848d_iffalse,
t16_MUX_uxn_opcodes_h_l728_c7_848d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l731_c11_1039
BIN_OP_EQ_uxn_opcodes_h_l731_c11_1039 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l731_c11_1039_left,
BIN_OP_EQ_uxn_opcodes_h_l731_c11_1039_right,
BIN_OP_EQ_uxn_opcodes_h_l731_c11_1039_return_output);

-- n8_MUX_uxn_opcodes_h_l731_c7_75c2
n8_MUX_uxn_opcodes_h_l731_c7_75c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l731_c7_75c2_cond,
n8_MUX_uxn_opcodes_h_l731_c7_75c2_iftrue,
n8_MUX_uxn_opcodes_h_l731_c7_75c2_iffalse,
n8_MUX_uxn_opcodes_h_l731_c7_75c2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_75c2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_75c2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_75c2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_75c2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_75c2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_75c2_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l731_c7_75c2
result_u16_value_MUX_uxn_opcodes_h_l731_c7_75c2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l731_c7_75c2_cond,
result_u16_value_MUX_uxn_opcodes_h_l731_c7_75c2_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l731_c7_75c2_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l731_c7_75c2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_75c2
result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_75c2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_75c2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_75c2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_75c2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_75c2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_75c2
result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_75c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_75c2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_75c2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_75c2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_75c2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_75c2
result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_75c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_75c2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_75c2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_75c2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_75c2_return_output);

-- t16_MUX_uxn_opcodes_h_l731_c7_75c2
t16_MUX_uxn_opcodes_h_l731_c7_75c2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l731_c7_75c2_cond,
t16_MUX_uxn_opcodes_h_l731_c7_75c2_iftrue,
t16_MUX_uxn_opcodes_h_l731_c7_75c2_iffalse,
t16_MUX_uxn_opcodes_h_l731_c7_75c2_return_output);

-- CONST_SL_8_uxn_opcodes_h_l733_c3_9859
CONST_SL_8_uxn_opcodes_h_l733_c3_9859 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l733_c3_9859_x,
CONST_SL_8_uxn_opcodes_h_l733_c3_9859_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l736_c11_b2b4
BIN_OP_EQ_uxn_opcodes_h_l736_c11_b2b4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l736_c11_b2b4_left,
BIN_OP_EQ_uxn_opcodes_h_l736_c11_b2b4_right,
BIN_OP_EQ_uxn_opcodes_h_l736_c11_b2b4_return_output);

-- n8_MUX_uxn_opcodes_h_l736_c7_779d
n8_MUX_uxn_opcodes_h_l736_c7_779d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l736_c7_779d_cond,
n8_MUX_uxn_opcodes_h_l736_c7_779d_iftrue,
n8_MUX_uxn_opcodes_h_l736_c7_779d_iffalse,
n8_MUX_uxn_opcodes_h_l736_c7_779d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l736_c7_779d
result_u16_value_MUX_uxn_opcodes_h_l736_c7_779d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l736_c7_779d_cond,
result_u16_value_MUX_uxn_opcodes_h_l736_c7_779d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l736_c7_779d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l736_c7_779d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_779d
result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_779d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_779d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_779d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_779d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_779d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_779d
result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_779d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_779d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_779d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_779d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_779d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_779d
result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_779d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_779d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_779d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_779d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_779d_return_output);

-- t16_MUX_uxn_opcodes_h_l736_c7_779d
t16_MUX_uxn_opcodes_h_l736_c7_779d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l736_c7_779d_cond,
t16_MUX_uxn_opcodes_h_l736_c7_779d_iftrue,
t16_MUX_uxn_opcodes_h_l736_c7_779d_iffalse,
t16_MUX_uxn_opcodes_h_l736_c7_779d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l737_c3_1a99
BIN_OP_OR_uxn_opcodes_h_l737_c3_1a99 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l737_c3_1a99_left,
BIN_OP_OR_uxn_opcodes_h_l737_c3_1a99_right,
BIN_OP_OR_uxn_opcodes_h_l737_c3_1a99_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l739_c11_2591
BIN_OP_EQ_uxn_opcodes_h_l739_c11_2591 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l739_c11_2591_left,
BIN_OP_EQ_uxn_opcodes_h_l739_c11_2591_right,
BIN_OP_EQ_uxn_opcodes_h_l739_c11_2591_return_output);

-- n8_MUX_uxn_opcodes_h_l739_c7_42ca
n8_MUX_uxn_opcodes_h_l739_c7_42ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l739_c7_42ca_cond,
n8_MUX_uxn_opcodes_h_l739_c7_42ca_iftrue,
n8_MUX_uxn_opcodes_h_l739_c7_42ca_iffalse,
n8_MUX_uxn_opcodes_h_l739_c7_42ca_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l739_c7_42ca
result_u16_value_MUX_uxn_opcodes_h_l739_c7_42ca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l739_c7_42ca_cond,
result_u16_value_MUX_uxn_opcodes_h_l739_c7_42ca_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l739_c7_42ca_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l739_c7_42ca_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_42ca
result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_42ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_42ca_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_42ca_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_42ca_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_42ca_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_42ca
result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_42ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_42ca_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_42ca_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_42ca_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_42ca_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_42ca
result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_42ca : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_42ca_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_42ca_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_42ca_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_42ca_return_output);

-- sp_relative_shift_uxn_opcodes_h_l741_c30_03e3
sp_relative_shift_uxn_opcodes_h_l741_c30_03e3 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l741_c30_03e3_ins,
sp_relative_shift_uxn_opcodes_h_l741_c30_03e3_x,
sp_relative_shift_uxn_opcodes_h_l741_c30_03e3_y,
sp_relative_shift_uxn_opcodes_h_l741_c30_03e3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l742_c26_2722
BIN_OP_EQ_uxn_opcodes_h_l742_c26_2722 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l742_c26_2722_left,
BIN_OP_EQ_uxn_opcodes_h_l742_c26_2722_right,
BIN_OP_EQ_uxn_opcodes_h_l742_c26_2722_return_output);

-- MUX_uxn_opcodes_h_l742_c26_61d8
MUX_uxn_opcodes_h_l742_c26_61d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l742_c26_61d8_cond,
MUX_uxn_opcodes_h_l742_c26_61d8_iftrue,
MUX_uxn_opcodes_h_l742_c26_61d8_iffalse,
MUX_uxn_opcodes_h_l742_c26_61d8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l743_c22_08cc
BIN_OP_EQ_uxn_opcodes_h_l743_c22_08cc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l743_c22_08cc_left,
BIN_OP_EQ_uxn_opcodes_h_l743_c22_08cc_right,
BIN_OP_EQ_uxn_opcodes_h_l743_c22_08cc_return_output);

-- MUX_uxn_opcodes_h_l743_c22_7e8d
MUX_uxn_opcodes_h_l743_c22_7e8d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l743_c22_7e8d_cond,
MUX_uxn_opcodes_h_l743_c22_7e8d_iftrue,
MUX_uxn_opcodes_h_l743_c22_7e8d_iffalse,
MUX_uxn_opcodes_h_l743_c22_7e8d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l715_c6_abb2_return_output,
 n8_MUX_uxn_opcodes_h_l715_c2_63b9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_63b9_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_63b9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_63b9_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_63b9_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_63b9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_63b9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l715_c2_63b9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_63b9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_63b9_return_output,
 t16_MUX_uxn_opcodes_h_l715_c2_63b9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l728_c11_71ee_return_output,
 n8_MUX_uxn_opcodes_h_l728_c7_848d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_848d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l728_c7_848d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_848d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_848d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_848d_return_output,
 t16_MUX_uxn_opcodes_h_l728_c7_848d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l731_c11_1039_return_output,
 n8_MUX_uxn_opcodes_h_l731_c7_75c2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_75c2_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l731_c7_75c2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_75c2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_75c2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_75c2_return_output,
 t16_MUX_uxn_opcodes_h_l731_c7_75c2_return_output,
 CONST_SL_8_uxn_opcodes_h_l733_c3_9859_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l736_c11_b2b4_return_output,
 n8_MUX_uxn_opcodes_h_l736_c7_779d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l736_c7_779d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_779d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_779d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_779d_return_output,
 t16_MUX_uxn_opcodes_h_l736_c7_779d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l737_c3_1a99_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l739_c11_2591_return_output,
 n8_MUX_uxn_opcodes_h_l739_c7_42ca_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l739_c7_42ca_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_42ca_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_42ca_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_42ca_return_output,
 sp_relative_shift_uxn_opcodes_h_l741_c30_03e3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l742_c26_2722_return_output,
 MUX_uxn_opcodes_h_l742_c26_61d8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l743_c22_08cc_return_output,
 MUX_uxn_opcodes_h_l743_c22_7e8d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c6_abb2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c6_abb2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c6_abb2_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l728_c7_848d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l715_c2_63b9_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l715_c2_63b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l715_c2_63b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_63b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_63b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l715_c2_63b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_63b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_63b9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l720_c3_b658 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_848d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_63b9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_63b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l715_c2_63b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_63b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_63b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l715_c2_63b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_63b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_63b9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l725_c3_ae28 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_848d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_63b9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_63b9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l728_c7_848d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c2_63b9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c2_63b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_848d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_63b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_63b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_848d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_63b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_63b9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l728_c7_848d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l715_c2_63b9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l715_c2_63b9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c11_71ee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c11_71ee_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c11_71ee_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l728_c7_848d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l728_c7_848d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l731_c7_75c2_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l728_c7_848d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_848d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l729_c3_9404 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_848d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_75c2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_848d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l728_c7_848d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l728_c7_848d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_75c2_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l728_c7_848d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_848d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_848d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_75c2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_848d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_848d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_848d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_75c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_848d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_848d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_848d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_75c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_848d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l728_c7_848d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l728_c7_848d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l731_c7_75c2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l728_c7_848d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_1039_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_1039_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_1039_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l731_c7_75c2_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l731_c7_75c2_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l736_c7_779d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l731_c7_75c2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_75c2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l734_c3_50b3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_75c2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l731_c7_75c2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_75c2_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_75c2_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_75c2_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l736_c7_779d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_75c2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_75c2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_75c2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_779d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_75c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_75c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_75c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_779d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_75c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_75c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_75c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_779d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_75c2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l731_c7_75c2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l731_c7_75c2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l736_c7_779d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l731_c7_75c2_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l733_c3_9859_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l733_c3_9859_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_b2b4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_b2b4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_b2b4_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l736_c7_779d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l736_c7_779d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l739_c7_42ca_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l736_c7_779d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l736_c7_779d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l736_c7_779d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l739_c7_42ca_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l736_c7_779d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_779d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_779d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_42ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_779d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_779d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_779d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_42ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_779d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_779d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_779d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_42ca_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_779d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l736_c7_779d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l736_c7_779d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l736_c7_779d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l737_c3_1a99_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l737_c3_1a99_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l737_c3_1a99_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_2591_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_2591_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_2591_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l739_c7_42ca_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l739_c7_42ca_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l739_c7_42ca_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l739_c7_42ca_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l739_c7_42ca_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l739_c7_42ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_42ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_42ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_42ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_42ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_42ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_42ca_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_42ca_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_42ca_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_42ca_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l741_c30_03e3_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l741_c30_03e3_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l741_c30_03e3_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l741_c30_03e3_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l742_c26_61d8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c26_2722_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c26_2722_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c26_2722_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l742_c26_61d8_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l742_c26_61d8_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l742_c26_61d8_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l743_c22_7e8d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l743_c22_08cc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l743_c22_08cc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l743_c22_08cc_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l743_c22_7e8d_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l743_c22_7e8d_iffalse : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l743_c22_7e8d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l715_l739_l736_l728_l731_DUPLICATE_d602_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l728_l736_l739_l731_DUPLICATE_1d1c_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l728_l736_l739_l731_DUPLICATE_e109_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l728_l736_l739_l731_DUPLICATE_ad3e_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l732_l737_DUPLICATE_fcef_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5ddc_uxn_opcodes_h_l747_l710_DUPLICATE_4c61_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l741_c30_03e3_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l720_c3_b658 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l720_c3_b658;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c6_abb2_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l742_c26_61d8_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_1039_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_2591_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_b2b4_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c26_2722_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l729_c3_9404 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_848d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l729_c3_9404;
     VAR_MUX_uxn_opcodes_h_l742_c26_61d8_iffalse := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l734_c3_50b3 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_75c2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l734_c3_50b3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l743_c22_08cc_right := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l743_c22_7e8d_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_42ca_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l725_c3_ae28 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l725_c3_ae28;
     VAR_sp_relative_shift_uxn_opcodes_h_l741_c30_03e3_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c11_71ee_right := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l741_c30_03e3_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l728_c7_848d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l731_c7_75c2_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l736_c7_779d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l739_c7_42ca_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c6_abb2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c11_71ee_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_1039_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_b2b4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_2591_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c26_2722_left := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l743_c22_08cc_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l739_c7_42ca_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l737_c3_1a99_left := t16;
     VAR_MUX_uxn_opcodes_h_l743_c22_7e8d_iffalse := t16;
     VAR_t16_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l728_c7_848d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l736_c7_779d_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l731_c11_1039] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l731_c11_1039_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_1039_left;
     BIN_OP_EQ_uxn_opcodes_h_l731_c11_1039_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_1039_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_1039_return_output := BIN_OP_EQ_uxn_opcodes_h_l731_c11_1039_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l728_c11_71ee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l728_c11_71ee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c11_71ee_left;
     BIN_OP_EQ_uxn_opcodes_h_l728_c11_71ee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c11_71ee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c11_71ee_return_output := BIN_OP_EQ_uxn_opcodes_h_l728_c11_71ee_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l728_l736_l739_l731_DUPLICATE_e109 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l728_l736_l739_l731_DUPLICATE_e109_return_output := result.is_pc_updated;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l715_c2_63b9] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l715_c2_63b9_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l736_c11_b2b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l736_c11_b2b4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_b2b4_left;
     BIN_OP_EQ_uxn_opcodes_h_l736_c11_b2b4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_b2b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_b2b4_return_output := BIN_OP_EQ_uxn_opcodes_h_l736_c11_b2b4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l743_c22_08cc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l743_c22_08cc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l743_c22_08cc_left;
     BIN_OP_EQ_uxn_opcodes_h_l743_c22_08cc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l743_c22_08cc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l743_c22_08cc_return_output := BIN_OP_EQ_uxn_opcodes_h_l743_c22_08cc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l742_c26_2722] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l742_c26_2722_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c26_2722_left;
     BIN_OP_EQ_uxn_opcodes_h_l742_c26_2722_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c26_2722_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c26_2722_return_output := BIN_OP_EQ_uxn_opcodes_h_l742_c26_2722_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l728_l736_l739_l731_DUPLICATE_ad3e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l728_l736_l739_l731_DUPLICATE_ad3e_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l739_c11_2591] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l739_c11_2591_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_2591_left;
     BIN_OP_EQ_uxn_opcodes_h_l739_c11_2591_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_2591_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_2591_return_output := BIN_OP_EQ_uxn_opcodes_h_l739_c11_2591_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l715_c6_abb2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l715_c6_abb2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c6_abb2_left;
     BIN_OP_EQ_uxn_opcodes_h_l715_c6_abb2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c6_abb2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c6_abb2_return_output := BIN_OP_EQ_uxn_opcodes_h_l715_c6_abb2_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l741_c30_03e3] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l741_c30_03e3_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l741_c30_03e3_ins;
     sp_relative_shift_uxn_opcodes_h_l741_c30_03e3_x <= VAR_sp_relative_shift_uxn_opcodes_h_l741_c30_03e3_x;
     sp_relative_shift_uxn_opcodes_h_l741_c30_03e3_y <= VAR_sp_relative_shift_uxn_opcodes_h_l741_c30_03e3_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l741_c30_03e3_return_output := sp_relative_shift_uxn_opcodes_h_l741_c30_03e3_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l715_c2_63b9] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l715_c2_63b9_return_output := result.is_stack_index_flipped;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l715_c2_63b9] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l715_c2_63b9_return_output := result.is_vram_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l732_l737_DUPLICATE_fcef LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l732_l737_DUPLICATE_fcef_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l715_c2_63b9] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l715_c2_63b9_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l715_l739_l736_l728_l731_DUPLICATE_d602 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l715_l739_l736_l728_l731_DUPLICATE_d602_return_output := result.u16_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l728_l736_l739_l731_DUPLICATE_1d1c LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l728_l736_l739_l731_DUPLICATE_1d1c_return_output := result.sp_relative_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l731_c7_75c2] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l731_c7_75c2_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l715_c2_63b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c6_abb2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_63b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c6_abb2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_63b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c6_abb2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_63b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c6_abb2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_63b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c6_abb2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_63b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c6_abb2_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_63b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c6_abb2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_63b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c6_abb2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_63b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c6_abb2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c2_63b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c6_abb2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l715_c2_63b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c6_abb2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l728_c7_848d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c11_71ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_848d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c11_71ee_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_848d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c11_71ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_848d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c11_71ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_848d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c11_71ee_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l728_c7_848d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c11_71ee_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l728_c7_848d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l728_c11_71ee_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l731_c7_75c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_1039_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_75c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_1039_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_75c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_1039_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_75c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_1039_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_75c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_1039_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_75c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_1039_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l731_c7_75c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l731_c11_1039_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l736_c7_779d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_b2b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_779d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_b2b4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_779d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_b2b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_779d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_b2b4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l736_c7_779d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_b2b4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l736_c7_779d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l736_c11_b2b4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l739_c7_42ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_2591_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_42ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_2591_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_42ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_2591_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_42ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_2591_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l739_c7_42ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l739_c11_2591_return_output;
     VAR_MUX_uxn_opcodes_h_l742_c26_61d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l742_c26_2722_return_output;
     VAR_MUX_uxn_opcodes_h_l743_c22_7e8d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l743_c22_08cc_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l737_c3_1a99_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l732_l737_DUPLICATE_fcef_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l733_c3_9859_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l732_l737_DUPLICATE_fcef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_848d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l728_l736_l739_l731_DUPLICATE_1d1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_75c2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l728_l736_l739_l731_DUPLICATE_1d1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_779d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l728_l736_l739_l731_DUPLICATE_1d1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_42ca_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l728_l736_l739_l731_DUPLICATE_1d1c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l715_l739_l736_l728_l731_DUPLICATE_d602_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l728_c7_848d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l715_l739_l736_l728_l731_DUPLICATE_d602_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_75c2_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l715_l739_l736_l728_l731_DUPLICATE_d602_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l736_c7_779d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l715_l739_l736_l728_l731_DUPLICATE_d602_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l739_c7_42ca_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l715_l739_l736_l728_l731_DUPLICATE_d602_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_848d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l728_l736_l739_l731_DUPLICATE_ad3e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_75c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l728_l736_l739_l731_DUPLICATE_ad3e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_779d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l728_l736_l739_l731_DUPLICATE_ad3e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_42ca_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l728_l736_l739_l731_DUPLICATE_ad3e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_848d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l728_l736_l739_l731_DUPLICATE_e109_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_75c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l728_l736_l739_l731_DUPLICATE_e109_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_779d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l728_l736_l739_l731_DUPLICATE_e109_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_42ca_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l728_l736_l739_l731_DUPLICATE_e109_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l715_c2_63b9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l715_c2_63b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l715_c2_63b9_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l715_c2_63b9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_75c2_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l731_c7_75c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_42ca_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l741_c30_03e3_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l715_c2_63b9] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_63b9_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_63b9_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_63b9_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_63b9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l715_c2_63b9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_63b9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_63b9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_63b9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_63b9_return_output;

     -- MUX[uxn_opcodes_h_l742_c26_61d8] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l742_c26_61d8_cond <= VAR_MUX_uxn_opcodes_h_l742_c26_61d8_cond;
     MUX_uxn_opcodes_h_l742_c26_61d8_iftrue <= VAR_MUX_uxn_opcodes_h_l742_c26_61d8_iftrue;
     MUX_uxn_opcodes_h_l742_c26_61d8_iffalse <= VAR_MUX_uxn_opcodes_h_l742_c26_61d8_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l742_c26_61d8_return_output := MUX_uxn_opcodes_h_l742_c26_61d8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l739_c7_42ca] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_42ca_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_42ca_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_42ca_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_42ca_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_42ca_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_42ca_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_42ca_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_42ca_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l715_c2_63b9] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_63b9_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_63b9_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_63b9_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_63b9_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l733_c3_9859] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l733_c3_9859_x <= VAR_CONST_SL_8_uxn_opcodes_h_l733_c3_9859_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l733_c3_9859_return_output := CONST_SL_8_uxn_opcodes_h_l733_c3_9859_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l731_c7_75c2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_75c2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_75c2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_75c2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_75c2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_75c2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_75c2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_75c2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_75c2_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l737_c3_1a99] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l737_c3_1a99_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l737_c3_1a99_left;
     BIN_OP_OR_uxn_opcodes_h_l737_c3_1a99_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l737_c3_1a99_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l737_c3_1a99_return_output := BIN_OP_OR_uxn_opcodes_h_l737_c3_1a99_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l715_c2_63b9] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_63b9_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_63b9_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_63b9_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_63b9_return_output;

     -- n8_MUX[uxn_opcodes_h_l739_c7_42ca] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l739_c7_42ca_cond <= VAR_n8_MUX_uxn_opcodes_h_l739_c7_42ca_cond;
     n8_MUX_uxn_opcodes_h_l739_c7_42ca_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l739_c7_42ca_iftrue;
     n8_MUX_uxn_opcodes_h_l739_c7_42ca_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l739_c7_42ca_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l739_c7_42ca_return_output := n8_MUX_uxn_opcodes_h_l739_c7_42ca_return_output;

     -- MUX[uxn_opcodes_h_l743_c22_7e8d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l743_c22_7e8d_cond <= VAR_MUX_uxn_opcodes_h_l743_c22_7e8d_cond;
     MUX_uxn_opcodes_h_l743_c22_7e8d_iftrue <= VAR_MUX_uxn_opcodes_h_l743_c22_7e8d_iftrue;
     MUX_uxn_opcodes_h_l743_c22_7e8d_iffalse <= VAR_MUX_uxn_opcodes_h_l743_c22_7e8d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l743_c22_7e8d_return_output := MUX_uxn_opcodes_h_l743_c22_7e8d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l739_c7_42ca] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_42ca_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_42ca_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_42ca_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_42ca_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_42ca_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_42ca_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_42ca_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_42ca_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l736_c7_779d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l737_c3_1a99_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l731_c7_75c2_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l733_c3_9859_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_42ca_iftrue := VAR_MUX_uxn_opcodes_h_l742_c26_61d8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l739_c7_42ca_iftrue := VAR_MUX_uxn_opcodes_h_l743_c22_7e8d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l736_c7_779d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l739_c7_42ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_779d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l739_c7_42ca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_779d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l739_c7_42ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_848d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l731_c7_75c2_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l739_c7_42ca] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l739_c7_42ca_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l739_c7_42ca_cond;
     result_u16_value_MUX_uxn_opcodes_h_l739_c7_42ca_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l739_c7_42ca_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l739_c7_42ca_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l739_c7_42ca_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l739_c7_42ca_return_output := result_u16_value_MUX_uxn_opcodes_h_l739_c7_42ca_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l736_c7_779d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_779d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_779d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_779d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_779d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_779d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_779d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_779d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_779d_return_output;

     -- t16_MUX[uxn_opcodes_h_l736_c7_779d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l736_c7_779d_cond <= VAR_t16_MUX_uxn_opcodes_h_l736_c7_779d_cond;
     t16_MUX_uxn_opcodes_h_l736_c7_779d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l736_c7_779d_iftrue;
     t16_MUX_uxn_opcodes_h_l736_c7_779d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l736_c7_779d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l736_c7_779d_return_output := t16_MUX_uxn_opcodes_h_l736_c7_779d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l736_c7_779d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_779d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_779d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_779d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_779d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_779d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_779d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_779d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_779d_return_output;

     -- n8_MUX[uxn_opcodes_h_l736_c7_779d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l736_c7_779d_cond <= VAR_n8_MUX_uxn_opcodes_h_l736_c7_779d_cond;
     n8_MUX_uxn_opcodes_h_l736_c7_779d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l736_c7_779d_iftrue;
     n8_MUX_uxn_opcodes_h_l736_c7_779d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l736_c7_779d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l736_c7_779d_return_output := n8_MUX_uxn_opcodes_h_l736_c7_779d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l739_c7_42ca] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_42ca_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_42ca_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_42ca_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_42ca_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_42ca_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_42ca_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_42ca_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_42ca_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l728_c7_848d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_848d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_848d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_848d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_848d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_848d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_848d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_848d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_848d_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l731_c7_75c2_iffalse := VAR_n8_MUX_uxn_opcodes_h_l736_c7_779d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_75c2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l736_c7_779d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_779d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l739_c7_42ca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_75c2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l736_c7_779d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l728_c7_848d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l736_c7_779d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l739_c7_42ca_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l731_c7_75c2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l736_c7_779d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l731_c7_75c2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_75c2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_75c2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_75c2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_75c2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_75c2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_75c2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_75c2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_75c2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l731_c7_75c2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_75c2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_75c2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_75c2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_75c2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_75c2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_75c2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_75c2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_75c2_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l736_c7_779d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l736_c7_779d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l736_c7_779d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l736_c7_779d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l736_c7_779d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l736_c7_779d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l736_c7_779d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l736_c7_779d_return_output := result_u16_value_MUX_uxn_opcodes_h_l736_c7_779d_return_output;

     -- n8_MUX[uxn_opcodes_h_l731_c7_75c2] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l731_c7_75c2_cond <= VAR_n8_MUX_uxn_opcodes_h_l731_c7_75c2_cond;
     n8_MUX_uxn_opcodes_h_l731_c7_75c2_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l731_c7_75c2_iftrue;
     n8_MUX_uxn_opcodes_h_l731_c7_75c2_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l731_c7_75c2_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l731_c7_75c2_return_output := n8_MUX_uxn_opcodes_h_l731_c7_75c2_return_output;

     -- t16_MUX[uxn_opcodes_h_l731_c7_75c2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l731_c7_75c2_cond <= VAR_t16_MUX_uxn_opcodes_h_l731_c7_75c2_cond;
     t16_MUX_uxn_opcodes_h_l731_c7_75c2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l731_c7_75c2_iftrue;
     t16_MUX_uxn_opcodes_h_l731_c7_75c2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l731_c7_75c2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l731_c7_75c2_return_output := t16_MUX_uxn_opcodes_h_l731_c7_75c2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l736_c7_779d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_779d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_779d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_779d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_779d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_779d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_779d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_779d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_779d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l715_c2_63b9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_63b9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_63b9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_63b9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_63b9_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l728_c7_848d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l731_c7_75c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_848d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l731_c7_75c2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_75c2_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l736_c7_779d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_848d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l731_c7_75c2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_75c2_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l736_c7_779d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l728_c7_848d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l731_c7_75c2_return_output;
     -- t16_MUX[uxn_opcodes_h_l728_c7_848d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l728_c7_848d_cond <= VAR_t16_MUX_uxn_opcodes_h_l728_c7_848d_cond;
     t16_MUX_uxn_opcodes_h_l728_c7_848d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l728_c7_848d_iftrue;
     t16_MUX_uxn_opcodes_h_l728_c7_848d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l728_c7_848d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l728_c7_848d_return_output := t16_MUX_uxn_opcodes_h_l728_c7_848d_return_output;

     -- n8_MUX[uxn_opcodes_h_l728_c7_848d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l728_c7_848d_cond <= VAR_n8_MUX_uxn_opcodes_h_l728_c7_848d_cond;
     n8_MUX_uxn_opcodes_h_l728_c7_848d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l728_c7_848d_iftrue;
     n8_MUX_uxn_opcodes_h_l728_c7_848d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l728_c7_848d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l728_c7_848d_return_output := n8_MUX_uxn_opcodes_h_l728_c7_848d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l728_c7_848d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_848d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_848d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_848d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_848d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_848d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_848d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_848d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_848d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l731_c7_75c2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_75c2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_75c2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_75c2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_75c2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_75c2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_75c2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_75c2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_75c2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l728_c7_848d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_848d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_848d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_848d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_848d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_848d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_848d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_848d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_848d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l731_c7_75c2] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l731_c7_75c2_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_75c2_cond;
     result_u16_value_MUX_uxn_opcodes_h_l731_c7_75c2_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_75c2_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l731_c7_75c2_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_75c2_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_75c2_return_output := result_u16_value_MUX_uxn_opcodes_h_l731_c7_75c2_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse := VAR_n8_MUX_uxn_opcodes_h_l728_c7_848d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l728_c7_848d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_848d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l731_c7_75c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l728_c7_848d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l728_c7_848d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l731_c7_75c2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l728_c7_848d_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l728_c7_848d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_848d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_848d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_848d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_848d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_848d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_848d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_848d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_848d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l715_c2_63b9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_63b9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_63b9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_63b9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_63b9_return_output;

     -- t16_MUX[uxn_opcodes_h_l715_c2_63b9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l715_c2_63b9_cond <= VAR_t16_MUX_uxn_opcodes_h_l715_c2_63b9_cond;
     t16_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue;
     t16_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l715_c2_63b9_return_output := t16_MUX_uxn_opcodes_h_l715_c2_63b9_return_output;

     -- n8_MUX[uxn_opcodes_h_l715_c2_63b9] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l715_c2_63b9_cond <= VAR_n8_MUX_uxn_opcodes_h_l715_c2_63b9_cond;
     n8_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue;
     n8_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l715_c2_63b9_return_output := n8_MUX_uxn_opcodes_h_l715_c2_63b9_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l728_c7_848d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l728_c7_848d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l728_c7_848d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l728_c7_848d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l728_c7_848d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l728_c7_848d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l728_c7_848d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l728_c7_848d_return_output := result_u16_value_MUX_uxn_opcodes_h_l728_c7_848d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l715_c2_63b9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_63b9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_63b9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_63b9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_63b9_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l715_c2_63b9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l728_c7_848d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l728_c7_848d_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l715_c2_63b9_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l715_c2_63b9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_63b9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_63b9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_63b9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_63b9_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l715_c2_63b9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l715_c2_63b9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c2_63b9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c2_63b9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c2_63b9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c2_63b9_return_output := result_u16_value_MUX_uxn_opcodes_h_l715_c2_63b9_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5ddc_uxn_opcodes_h_l747_l710_DUPLICATE_4c61 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5ddc_uxn_opcodes_h_l747_l710_DUPLICATE_4c61_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5ddc(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l715_c2_63b9_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l715_c2_63b9_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l715_c2_63b9_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l715_c2_63b9_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l715_c2_63b9_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c2_63b9_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l715_c2_63b9_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l715_c2_63b9_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c2_63b9_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5ddc_uxn_opcodes_h_l747_l710_DUPLICATE_4c61_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5ddc_uxn_opcodes_h_l747_l710_DUPLICATE_4c61_return_output;
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
