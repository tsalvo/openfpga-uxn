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
-- Submodules: 71
entity ora2_0CLK_50b92fe2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ora2_0CLK_50b92fe2;
architecture arch of ora2_0CLK_50b92fe2 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1026_c6_744b]
signal BIN_OP_EQ_uxn_opcodes_h_l1026_c6_744b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1026_c6_744b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1026_c6_744b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1026_c2_bdfd]
signal result_u8_value_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1026_c2_bdfd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1026_c2_bdfd]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1026_c2_bdfd]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1026_c2_bdfd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1026_c2_bdfd]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1026_c2_bdfd]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1026_c2_bdfd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1026_c2_bdfd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1026_c2_bdfd]
signal tmp16_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1026_c2_bdfd]
signal n16_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1026_c2_bdfd]
signal t16_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1039_c11_1304]
signal BIN_OP_EQ_uxn_opcodes_h_l1039_c11_1304_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1039_c11_1304_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1039_c11_1304_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1039_c7_85b3]
signal result_u8_value_MUX_uxn_opcodes_h_l1039_c7_85b3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1039_c7_85b3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_85b3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1039_c7_85b3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_85b3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1039_c7_85b3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_85b3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1039_c7_85b3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_85b3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1039_c7_85b3]
signal tmp16_MUX_uxn_opcodes_h_l1039_c7_85b3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1039_c7_85b3]
signal n16_MUX_uxn_opcodes_h_l1039_c7_85b3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1039_c7_85b3]
signal t16_MUX_uxn_opcodes_h_l1039_c7_85b3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1042_c11_af97]
signal BIN_OP_EQ_uxn_opcodes_h_l1042_c11_af97_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1042_c11_af97_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1042_c11_af97_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1042_c7_02f3]
signal result_u8_value_MUX_uxn_opcodes_h_l1042_c7_02f3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1042_c7_02f3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_02f3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1042_c7_02f3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_02f3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1042_c7_02f3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_02f3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1042_c7_02f3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_02f3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1042_c7_02f3]
signal tmp16_MUX_uxn_opcodes_h_l1042_c7_02f3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1042_c7_02f3]
signal n16_MUX_uxn_opcodes_h_l1042_c7_02f3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1042_c7_02f3]
signal t16_MUX_uxn_opcodes_h_l1042_c7_02f3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1047_c11_2ceb]
signal BIN_OP_EQ_uxn_opcodes_h_l1047_c11_2ceb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1047_c11_2ceb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1047_c11_2ceb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1047_c7_5935]
signal result_u8_value_MUX_uxn_opcodes_h_l1047_c7_5935_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1047_c7_5935_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1047_c7_5935]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_5935_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_5935_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1047_c7_5935]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_5935_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_5935_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1047_c7_5935]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_5935_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_5935_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1047_c7_5935]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_5935_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_5935_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1047_c7_5935]
signal tmp16_MUX_uxn_opcodes_h_l1047_c7_5935_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1047_c7_5935_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1047_c7_5935]
signal n16_MUX_uxn_opcodes_h_l1047_c7_5935_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1047_c7_5935_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1047_c7_5935]
signal t16_MUX_uxn_opcodes_h_l1047_c7_5935_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1047_c7_5935_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1048_c3_dec2]
signal BIN_OP_OR_uxn_opcodes_h_l1048_c3_dec2_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1048_c3_dec2_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1048_c3_dec2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1051_c11_cb83]
signal BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cb83_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cb83_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cb83_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1051_c7_806b]
signal result_u8_value_MUX_uxn_opcodes_h_l1051_c7_806b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1051_c7_806b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1051_c7_806b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1051_c7_806b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1051_c7_806b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_806b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_806b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_806b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_806b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1051_c7_806b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_806b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_806b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_806b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_806b_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1051_c7_806b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_806b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_806b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_806b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_806b_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1051_c7_806b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_806b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_806b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_806b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_806b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1051_c7_806b]
signal tmp16_MUX_uxn_opcodes_h_l1051_c7_806b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1051_c7_806b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1051_c7_806b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1051_c7_806b_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1051_c7_806b]
signal n16_MUX_uxn_opcodes_h_l1051_c7_806b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1051_c7_806b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1051_c7_806b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1051_c7_806b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1055_c11_5ee3]
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ee3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ee3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ee3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1055_c7_c9c7]
signal result_u8_value_MUX_uxn_opcodes_h_l1055_c7_c9c7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1055_c7_c9c7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1055_c7_c9c7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1055_c7_c9c7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c9c7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c9c7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c9c7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1055_c7_c9c7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_c9c7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_c9c7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_c9c7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1055_c7_c9c7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_c9c7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_c9c7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_c9c7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1055_c7_c9c7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c9c7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c9c7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c9c7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1055_c7_c9c7]
signal tmp16_MUX_uxn_opcodes_h_l1055_c7_c9c7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1055_c7_c9c7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1055_c7_c9c7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1055_c7_c9c7]
signal n16_MUX_uxn_opcodes_h_l1055_c7_c9c7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1055_c7_c9c7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1055_c7_c9c7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1056_c3_3888]
signal BIN_OP_OR_uxn_opcodes_h_l1056_c3_3888_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1056_c3_3888_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1056_c3_3888_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1057_c11_3b94]
signal BIN_OP_OR_uxn_opcodes_h_l1057_c11_3b94_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1057_c11_3b94_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1057_c11_3b94_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1058_c30_fee8]
signal sp_relative_shift_uxn_opcodes_h_l1058_c30_fee8_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1058_c30_fee8_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1058_c30_fee8_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1058_c30_fee8_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1063_c11_869d]
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_869d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_869d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_869d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1063_c7_da84]
signal result_u8_value_MUX_uxn_opcodes_h_l1063_c7_da84_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1063_c7_da84_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1063_c7_da84_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1063_c7_da84_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1063_c7_da84]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_da84_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_da84_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_da84_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_da84_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1063_c7_da84]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_da84_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_da84_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_da84_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_da84_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1063_c7_da84]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_da84_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_da84_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_da84_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_da84_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1066_c31_5ffc]
signal CONST_SR_8_uxn_opcodes_h_l1066_c31_5ffc_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1066_c31_5ffc_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1053_l1044_DUPLICATE_25a9
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1053_l1044_DUPLICATE_25a9_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1053_l1044_DUPLICATE_25a9_return_output : unsigned(15 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_243c( ref_toks_0 : opcode_result_t;
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
      base.u8_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_pc_updated := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1026_c6_744b
BIN_OP_EQ_uxn_opcodes_h_l1026_c6_744b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1026_c6_744b_left,
BIN_OP_EQ_uxn_opcodes_h_l1026_c6_744b_right,
BIN_OP_EQ_uxn_opcodes_h_l1026_c6_744b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1026_c2_bdfd
result_u8_value_MUX_uxn_opcodes_h_l1026_c2_bdfd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond,
result_u8_value_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_bdfd
result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_bdfd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_bdfd
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_bdfd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd
result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_bdfd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_bdfd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_bdfd
result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_bdfd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd
result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_bdfd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_bdfd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_bdfd
result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_bdfd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1026_c2_bdfd
tmp16_MUX_uxn_opcodes_h_l1026_c2_bdfd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond,
tmp16_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue,
tmp16_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse,
tmp16_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output);

-- n16_MUX_uxn_opcodes_h_l1026_c2_bdfd
n16_MUX_uxn_opcodes_h_l1026_c2_bdfd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond,
n16_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue,
n16_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse,
n16_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output);

-- t16_MUX_uxn_opcodes_h_l1026_c2_bdfd
t16_MUX_uxn_opcodes_h_l1026_c2_bdfd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond,
t16_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue,
t16_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse,
t16_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1039_c11_1304
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_1304 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_1304_left,
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_1304_right,
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_1304_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1039_c7_85b3
result_u8_value_MUX_uxn_opcodes_h_l1039_c7_85b3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1039_c7_85b3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_85b3
result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_85b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_85b3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_85b3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_85b3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_85b3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_85b3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_85b3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_85b3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_85b3
result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_85b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_85b3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1039_c7_85b3
tmp16_MUX_uxn_opcodes_h_l1039_c7_85b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1039_c7_85b3_cond,
tmp16_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue,
tmp16_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse,
tmp16_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output);

-- n16_MUX_uxn_opcodes_h_l1039_c7_85b3
n16_MUX_uxn_opcodes_h_l1039_c7_85b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1039_c7_85b3_cond,
n16_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue,
n16_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse,
n16_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output);

-- t16_MUX_uxn_opcodes_h_l1039_c7_85b3
t16_MUX_uxn_opcodes_h_l1039_c7_85b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1039_c7_85b3_cond,
t16_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue,
t16_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse,
t16_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1042_c11_af97
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_af97 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_af97_left,
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_af97_right,
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_af97_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1042_c7_02f3
result_u8_value_MUX_uxn_opcodes_h_l1042_c7_02f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1042_c7_02f3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_02f3
result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_02f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_02f3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_02f3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_02f3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_02f3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_02f3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_02f3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_02f3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_02f3
result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_02f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_02f3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1042_c7_02f3
tmp16_MUX_uxn_opcodes_h_l1042_c7_02f3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1042_c7_02f3_cond,
tmp16_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue,
tmp16_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse,
tmp16_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output);

-- n16_MUX_uxn_opcodes_h_l1042_c7_02f3
n16_MUX_uxn_opcodes_h_l1042_c7_02f3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1042_c7_02f3_cond,
n16_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue,
n16_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse,
n16_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output);

-- t16_MUX_uxn_opcodes_h_l1042_c7_02f3
t16_MUX_uxn_opcodes_h_l1042_c7_02f3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1042_c7_02f3_cond,
t16_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue,
t16_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse,
t16_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1047_c11_2ceb
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_2ceb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_2ceb_left,
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_2ceb_right,
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_2ceb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1047_c7_5935
result_u8_value_MUX_uxn_opcodes_h_l1047_c7_5935 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1047_c7_5935_cond,
result_u8_value_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1047_c7_5935_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_5935
result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_5935 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_5935_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_5935_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_5935
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_5935 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_5935_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_5935_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_5935
result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_5935 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_5935_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_5935_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_5935
result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_5935 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_5935_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_5935_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1047_c7_5935
tmp16_MUX_uxn_opcodes_h_l1047_c7_5935 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1047_c7_5935_cond,
tmp16_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue,
tmp16_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse,
tmp16_MUX_uxn_opcodes_h_l1047_c7_5935_return_output);

-- n16_MUX_uxn_opcodes_h_l1047_c7_5935
n16_MUX_uxn_opcodes_h_l1047_c7_5935 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1047_c7_5935_cond,
n16_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue,
n16_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse,
n16_MUX_uxn_opcodes_h_l1047_c7_5935_return_output);

-- t16_MUX_uxn_opcodes_h_l1047_c7_5935
t16_MUX_uxn_opcodes_h_l1047_c7_5935 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1047_c7_5935_cond,
t16_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue,
t16_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse,
t16_MUX_uxn_opcodes_h_l1047_c7_5935_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1048_c3_dec2
BIN_OP_OR_uxn_opcodes_h_l1048_c3_dec2 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1048_c3_dec2_left,
BIN_OP_OR_uxn_opcodes_h_l1048_c3_dec2_right,
BIN_OP_OR_uxn_opcodes_h_l1048_c3_dec2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cb83
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cb83 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cb83_left,
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cb83_right,
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cb83_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1051_c7_806b
result_u8_value_MUX_uxn_opcodes_h_l1051_c7_806b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1051_c7_806b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1051_c7_806b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1051_c7_806b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1051_c7_806b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_806b
result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_806b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_806b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_806b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_806b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_806b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_806b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_806b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_806b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_806b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_806b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_806b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_806b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_806b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_806b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_806b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_806b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_806b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_806b
result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_806b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_806b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_806b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_806b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_806b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1051_c7_806b
tmp16_MUX_uxn_opcodes_h_l1051_c7_806b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1051_c7_806b_cond,
tmp16_MUX_uxn_opcodes_h_l1051_c7_806b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1051_c7_806b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1051_c7_806b_return_output);

-- n16_MUX_uxn_opcodes_h_l1051_c7_806b
n16_MUX_uxn_opcodes_h_l1051_c7_806b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1051_c7_806b_cond,
n16_MUX_uxn_opcodes_h_l1051_c7_806b_iftrue,
n16_MUX_uxn_opcodes_h_l1051_c7_806b_iffalse,
n16_MUX_uxn_opcodes_h_l1051_c7_806b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ee3
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ee3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ee3_left,
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ee3_right,
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ee3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1055_c7_c9c7
result_u8_value_MUX_uxn_opcodes_h_l1055_c7_c9c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1055_c7_c9c7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1055_c7_c9c7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1055_c7_c9c7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c9c7
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c9c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c9c7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c9c7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c9c7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_c9c7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_c9c7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_c9c7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_c9c7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_c9c7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_c9c7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_c9c7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_c9c7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_c9c7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_c9c7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c9c7
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c9c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c9c7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c9c7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c9c7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1055_c7_c9c7
tmp16_MUX_uxn_opcodes_h_l1055_c7_c9c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1055_c7_c9c7_cond,
tmp16_MUX_uxn_opcodes_h_l1055_c7_c9c7_iftrue,
tmp16_MUX_uxn_opcodes_h_l1055_c7_c9c7_iffalse,
tmp16_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output);

-- n16_MUX_uxn_opcodes_h_l1055_c7_c9c7
n16_MUX_uxn_opcodes_h_l1055_c7_c9c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1055_c7_c9c7_cond,
n16_MUX_uxn_opcodes_h_l1055_c7_c9c7_iftrue,
n16_MUX_uxn_opcodes_h_l1055_c7_c9c7_iffalse,
n16_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1056_c3_3888
BIN_OP_OR_uxn_opcodes_h_l1056_c3_3888 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1056_c3_3888_left,
BIN_OP_OR_uxn_opcodes_h_l1056_c3_3888_right,
BIN_OP_OR_uxn_opcodes_h_l1056_c3_3888_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1057_c11_3b94
BIN_OP_OR_uxn_opcodes_h_l1057_c11_3b94 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1057_c11_3b94_left,
BIN_OP_OR_uxn_opcodes_h_l1057_c11_3b94_right,
BIN_OP_OR_uxn_opcodes_h_l1057_c11_3b94_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1058_c30_fee8
sp_relative_shift_uxn_opcodes_h_l1058_c30_fee8 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1058_c30_fee8_ins,
sp_relative_shift_uxn_opcodes_h_l1058_c30_fee8_x,
sp_relative_shift_uxn_opcodes_h_l1058_c30_fee8_y,
sp_relative_shift_uxn_opcodes_h_l1058_c30_fee8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1063_c11_869d
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_869d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_869d_left,
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_869d_right,
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_869d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1063_c7_da84
result_u8_value_MUX_uxn_opcodes_h_l1063_c7_da84 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1063_c7_da84_cond,
result_u8_value_MUX_uxn_opcodes_h_l1063_c7_da84_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1063_c7_da84_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1063_c7_da84_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_da84
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_da84 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_da84_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_da84_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_da84_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_da84_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_da84
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_da84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_da84_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_da84_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_da84_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_da84_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_da84
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_da84 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_da84_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_da84_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_da84_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_da84_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1066_c31_5ffc
CONST_SR_8_uxn_opcodes_h_l1066_c31_5ffc : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1066_c31_5ffc_x,
CONST_SR_8_uxn_opcodes_h_l1066_c31_5ffc_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1053_l1044_DUPLICATE_25a9
CONST_SL_8_uint16_t_uxn_opcodes_h_l1053_l1044_DUPLICATE_25a9 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1053_l1044_DUPLICATE_25a9_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1053_l1044_DUPLICATE_25a9_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1026_c6_744b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output,
 tmp16_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output,
 n16_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output,
 t16_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1039_c11_1304_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output,
 tmp16_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output,
 n16_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output,
 t16_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1042_c11_af97_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output,
 tmp16_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output,
 n16_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output,
 t16_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1047_c11_2ceb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1047_c7_5935_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_5935_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_5935_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_5935_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_5935_return_output,
 tmp16_MUX_uxn_opcodes_h_l1047_c7_5935_return_output,
 n16_MUX_uxn_opcodes_h_l1047_c7_5935_return_output,
 t16_MUX_uxn_opcodes_h_l1047_c7_5935_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1048_c3_dec2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cb83_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1051_c7_806b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_806b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_806b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_806b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_806b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1051_c7_806b_return_output,
 n16_MUX_uxn_opcodes_h_l1051_c7_806b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ee3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output,
 tmp16_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output,
 n16_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1056_c3_3888_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1057_c11_3b94_return_output,
 sp_relative_shift_uxn_opcodes_h_l1058_c30_fee8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1063_c11_869d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1063_c7_da84_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_da84_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_da84_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_da84_return_output,
 CONST_SR_8_uxn_opcodes_h_l1066_c31_5ffc_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1053_l1044_DUPLICATE_25a9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_744b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_744b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_744b_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1026_c2_bdfd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1026_c2_bdfd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1036_c3_e0f4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1026_c2_bdfd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1026_c2_bdfd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1031_c3_9eb6 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_1304_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_1304_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_1304_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1039_c7_85b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_85b3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1040_c3_6cf4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_85b3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_85b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_85b3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1039_c7_85b3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1039_c7_85b3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1039_c7_85b3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_af97_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_af97_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_af97_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1047_c7_5935_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c7_02f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_5935_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_02f3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1045_c3_76b3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_5935_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_02f3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_5935_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_02f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_5935_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_02f3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1047_c7_5935_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1042_c7_02f3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1047_c7_5935_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1042_c7_02f3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1047_c7_5935_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1042_c7_02f3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_2ceb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_2ceb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_2ceb_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1051_c7_806b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1047_c7_5935_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_806b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_5935_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1049_c3_25b9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_806b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_5935_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_806b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_5935_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_806b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_5935_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_806b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1047_c7_5935_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1051_c7_806b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1047_c7_5935_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1047_c7_5935_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1048_c3_dec2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1048_c3_dec2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1048_c3_dec2_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cb83_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cb83_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cb83_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1051_c7_806b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1051_c7_806b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1051_c7_806b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_806b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_806b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_806b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_806b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_806b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_806b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_806b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_806b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_806b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_806b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_806b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_806b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_806b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_806b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_806b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1051_c7_806b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1051_c7_806b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1051_c7_806b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ee3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ee3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ee3_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_c9c7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_c9c7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_da84_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_c9c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c9c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c9c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c9c7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_c9c7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1060_c3_bef7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_c9c7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_da84_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_c9c7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_c9c7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_c9c7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_da84_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_c9c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c9c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c9c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_da84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c9c7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_c9c7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_c9c7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_c9c7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1055_c7_c9c7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1055_c7_c9c7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1055_c7_c9c7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c3_3888_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c3_3888_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c3_3888_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1057_c11_3b94_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1057_c11_3b94_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1057_c11_3b94_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1058_c30_fee8_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1058_c30_fee8_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1058_c30_fee8_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1058_c30_fee8_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1061_c21_0fd3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_869d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_869d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_869d_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_da84_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_da84_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_da84_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_da84_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1064_c3_8934 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_da84_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_da84_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_da84_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_da84_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_da84_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_da84_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1065_c3_0eb0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_da84_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_da84_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1066_c31_5ffc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1066_c31_5ffc_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1066_c21_fec6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1026_l1063_l1051_l1047_l1042_l1039_DUPLICATE_eed3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1055_l1051_l1047_l1042_l1039_DUPLICATE_2ed1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1063_l1051_l1047_l1042_l1039_DUPLICATE_c308_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1063_l1055_l1051_l1047_l1042_l1039_DUPLICATE_7d76_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1043_l1052_l1048_l1056_DUPLICATE_bfa1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1053_l1044_DUPLICATE_25a9_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1053_l1044_DUPLICATE_25a9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1063_l1051_DUPLICATE_bd37_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l1070_l1022_DUPLICATE_341f_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_af97_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_744b_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1031_c3_9eb6 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1031_c3_9eb6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_869d_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ee3_right := to_unsigned(5, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1058_c30_fee8_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1065_c3_0eb0 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_da84_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1065_c3_0eb0;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_da84_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1058_c30_fee8_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_2ceb_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1049_c3_25b9 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1049_c3_25b9;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cb83_right := to_unsigned(4, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1040_c3_6cf4 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1040_c3_6cf4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_1304_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1036_c3_e0f4 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1036_c3_e0f4;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1064_c3_8934 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_da84_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1064_c3_8934;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1060_c3_bef7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_c9c7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1060_c3_bef7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1045_c3_76b3 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1045_c3_76b3;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c9c7_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1058_c30_fee8_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c3_3888_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1055_c7_c9c7_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_744b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_1304_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_af97_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_2ceb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cb83_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ee3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_869d_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1048_c3_dec2_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1057_c11_3b94_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1066_c31_5ffc_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_806b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_c9c7_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1055_l1051_l1047_l1042_l1039_DUPLICATE_2ed1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1055_l1051_l1047_l1042_l1039_DUPLICATE_2ed1_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1063_l1051_DUPLICATE_bd37 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1063_l1051_DUPLICATE_bd37_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1047_c11_2ceb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1047_c11_2ceb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_2ceb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1047_c11_2ceb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_2ceb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_2ceb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1047_c11_2ceb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1063_c11_869d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1063_c11_869d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_869d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1063_c11_869d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_869d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_869d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1063_c11_869d_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1026_c2_bdfd] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1026_c2_bdfd_return_output := result.is_pc_updated;

     -- sp_relative_shift[uxn_opcodes_h_l1058_c30_fee8] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1058_c30_fee8_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1058_c30_fee8_ins;
     sp_relative_shift_uxn_opcodes_h_l1058_c30_fee8_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1058_c30_fee8_x;
     sp_relative_shift_uxn_opcodes_h_l1058_c30_fee8_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1058_c30_fee8_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1058_c30_fee8_return_output := sp_relative_shift_uxn_opcodes_h_l1058_c30_fee8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1051_c11_cb83] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cb83_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cb83_left;
     BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cb83_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cb83_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cb83_return_output := BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cb83_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1063_l1055_l1051_l1047_l1042_l1039_DUPLICATE_7d76 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1063_l1055_l1051_l1047_l1042_l1039_DUPLICATE_7d76_return_output := result.is_opc_done;

     -- CONST_SR_8[uxn_opcodes_h_l1066_c31_5ffc] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1066_c31_5ffc_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1066_c31_5ffc_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1066_c31_5ffc_return_output := CONST_SR_8_uxn_opcodes_h_l1066_c31_5ffc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1055_c11_5ee3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ee3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ee3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ee3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ee3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ee3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ee3_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1026_c2_bdfd] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1026_c2_bdfd_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1026_c6_744b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1026_c6_744b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_744b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1026_c6_744b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_744b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_744b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1026_c6_744b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1042_c11_af97] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1042_c11_af97_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_af97_left;
     BIN_OP_EQ_uxn_opcodes_h_l1042_c11_af97_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_af97_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_af97_return_output := BIN_OP_EQ_uxn_opcodes_h_l1042_c11_af97_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1026_c2_bdfd] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1026_c2_bdfd_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1063_l1051_l1047_l1042_l1039_DUPLICATE_c308 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1063_l1051_l1047_l1042_l1039_DUPLICATE_c308_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1026_l1063_l1051_l1047_l1042_l1039_DUPLICATE_eed3 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1026_l1063_l1051_l1047_l1042_l1039_DUPLICATE_eed3_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1039_c11_1304] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1039_c11_1304_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_1304_left;
     BIN_OP_EQ_uxn_opcodes_h_l1039_c11_1304_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_1304_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_1304_return_output := BIN_OP_EQ_uxn_opcodes_h_l1039_c11_1304_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1026_c2_bdfd] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1026_c2_bdfd_return_output := result.is_vram_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1043_l1052_l1048_l1056_DUPLICATE_bfa1 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1043_l1052_l1048_l1056_DUPLICATE_bfa1_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_744b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_744b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_744b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_744b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_744b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_744b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_744b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_744b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_744b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_744b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_744b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_744b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1039_c7_85b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_1304_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_85b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_1304_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_85b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_1304_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_85b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_1304_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_85b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_1304_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1039_c7_85b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_1304_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1039_c7_85b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_1304_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1039_c7_85b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_1304_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1042_c7_02f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_af97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_02f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_af97_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_02f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_af97_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_02f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_af97_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_02f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_af97_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c7_02f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_af97_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1042_c7_02f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_af97_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1042_c7_02f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_af97_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1047_c7_5935_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_2ceb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_5935_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_2ceb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_5935_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_2ceb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_5935_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_2ceb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_5935_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_2ceb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1047_c7_5935_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_2ceb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1047_c7_5935_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_2ceb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1047_c7_5935_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_2ceb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1051_c7_806b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cb83_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_806b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cb83_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_806b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cb83_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_806b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cb83_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_806b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cb83_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1051_c7_806b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cb83_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_806b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_cb83_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1055_c7_c9c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ee3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c9c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ee3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c9c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ee3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_c9c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ee3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_c9c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ee3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_c9c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ee3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_c9c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_5ee3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_da84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_869d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_da84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_869d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_da84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_869d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_da84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_869d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1048_c3_dec2_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1043_l1052_l1048_l1056_DUPLICATE_bfa1_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c3_3888_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1043_l1052_l1048_l1056_DUPLICATE_bfa1_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1053_l1044_DUPLICATE_25a9_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1043_l1052_l1048_l1056_DUPLICATE_bfa1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1063_l1051_l1047_l1042_l1039_DUPLICATE_c308_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1063_l1051_l1047_l1042_l1039_DUPLICATE_c308_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1063_l1051_l1047_l1042_l1039_DUPLICATE_c308_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_806b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1063_l1051_l1047_l1042_l1039_DUPLICATE_c308_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_da84_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1063_l1051_l1047_l1042_l1039_DUPLICATE_c308_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1063_l1055_l1051_l1047_l1042_l1039_DUPLICATE_7d76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1063_l1055_l1051_l1047_l1042_l1039_DUPLICATE_7d76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1063_l1055_l1051_l1047_l1042_l1039_DUPLICATE_7d76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_806b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1063_l1055_l1051_l1047_l1042_l1039_DUPLICATE_7d76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c9c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1063_l1055_l1051_l1047_l1042_l1039_DUPLICATE_7d76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_da84_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1063_l1055_l1051_l1047_l1042_l1039_DUPLICATE_7d76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1055_l1051_l1047_l1042_l1039_DUPLICATE_2ed1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1055_l1051_l1047_l1042_l1039_DUPLICATE_2ed1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1055_l1051_l1047_l1042_l1039_DUPLICATE_2ed1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_806b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1055_l1051_l1047_l1042_l1039_DUPLICATE_2ed1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c9c7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1055_l1051_l1047_l1042_l1039_DUPLICATE_2ed1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_806b_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1063_l1051_DUPLICATE_bd37_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_da84_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1063_l1051_DUPLICATE_bd37_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1026_l1063_l1051_l1047_l1042_l1039_DUPLICATE_eed3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1026_l1063_l1051_l1047_l1042_l1039_DUPLICATE_eed3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1026_l1063_l1051_l1047_l1042_l1039_DUPLICATE_eed3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1026_l1063_l1051_l1047_l1042_l1039_DUPLICATE_eed3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1051_c7_806b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1026_l1063_l1051_l1047_l1042_l1039_DUPLICATE_eed3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_da84_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1026_l1063_l1051_l1047_l1042_l1039_DUPLICATE_eed3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1026_c2_bdfd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1026_c2_bdfd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1026_c2_bdfd_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1026_c2_bdfd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_c9c7_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1058_c30_fee8_return_output;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1053_l1044_DUPLICATE_25a9 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1053_l1044_DUPLICATE_25a9_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1053_l1044_DUPLICATE_25a9_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1053_l1044_DUPLICATE_25a9_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1053_l1044_DUPLICATE_25a9_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1026_c2_bdfd] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1066_c21_fec6] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1066_c21_fec6_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1066_c31_5ffc_return_output);

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1026_c2_bdfd] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1048_c3_dec2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1048_c3_dec2_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1048_c3_dec2_left;
     BIN_OP_OR_uxn_opcodes_h_l1048_c3_dec2_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1048_c3_dec2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1048_c3_dec2_return_output := BIN_OP_OR_uxn_opcodes_h_l1048_c3_dec2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1063_c7_da84] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_da84_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_da84_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_da84_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_da84_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_da84_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_da84_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_da84_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_da84_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1063_c7_da84] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_da84_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_da84_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_da84_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_da84_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_da84_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_da84_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_da84_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_da84_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1055_c7_c9c7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c9c7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c9c7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c9c7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c9c7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c9c7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c9c7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1056_c3_3888] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1056_c3_3888_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c3_3888_left;
     BIN_OP_OR_uxn_opcodes_h_l1056_c3_3888_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c3_3888_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c3_3888_return_output := BIN_OP_OR_uxn_opcodes_h_l1056_c3_3888_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1026_c2_bdfd] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1063_c7_da84] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_da84_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_da84_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_da84_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_da84_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_da84_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_da84_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_da84_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_da84_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1026_c2_bdfd] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1048_c3_dec2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1057_c11_3b94_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c3_3888_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1055_c7_c9c7_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c3_3888_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_da84_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1066_c21_fec6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1051_c7_806b_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1053_l1044_DUPLICATE_25a9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1053_l1044_DUPLICATE_25a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c9c7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_da84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_806b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_c9c7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_da84_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_c9c7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_da84_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1055_c7_c9c7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_c9c7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_c9c7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_c9c7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_c9c7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_c9c7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_c9c7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1051_c7_806b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_806b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_806b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_806b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_806b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_806b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_806b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_806b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_806b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1055_c7_c9c7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1055_c7_c9c7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1055_c7_c9c7_cond;
     n16_MUX_uxn_opcodes_h_l1055_c7_c9c7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1055_c7_c9c7_iftrue;
     n16_MUX_uxn_opcodes_h_l1055_c7_c9c7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1055_c7_c9c7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output := n16_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1055_c7_c9c7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c9c7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c9c7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c9c7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c9c7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c9c7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c9c7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output;

     -- t16_MUX[uxn_opcodes_h_l1047_c7_5935] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1047_c7_5935_cond <= VAR_t16_MUX_uxn_opcodes_h_l1047_c7_5935_cond;
     t16_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue;
     t16_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1047_c7_5935_return_output := t16_MUX_uxn_opcodes_h_l1047_c7_5935_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1057_c11_3b94] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1057_c11_3b94_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1057_c11_3b94_left;
     BIN_OP_OR_uxn_opcodes_h_l1057_c11_3b94_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1057_c11_3b94_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1057_c11_3b94_return_output := BIN_OP_OR_uxn_opcodes_h_l1057_c11_3b94_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1063_c7_da84] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1063_c7_da84_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_da84_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1063_c7_da84_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_da84_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1063_c7_da84_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_da84_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_da84_return_output := result_u8_value_MUX_uxn_opcodes_h_l1063_c7_da84_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1055_c7_c9c7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_c9c7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_c9c7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_c9c7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_c9c7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_c9c7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_c9c7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_c9c7_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1057_c11_3b94_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1051_c7_806b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_806b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_806b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_806b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_806b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_c9c7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_da84_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1047_c7_5935_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1051_c7_806b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_806b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_806b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_806b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_806b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_806b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_806b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_806b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_806b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1047_c7_5935] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_5935_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_5935_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_5935_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_5935_return_output;

     -- t16_MUX[uxn_opcodes_h_l1042_c7_02f3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1042_c7_02f3_cond <= VAR_t16_MUX_uxn_opcodes_h_l1042_c7_02f3_cond;
     t16_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue;
     t16_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output := t16_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1051_c7_806b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_806b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_806b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_806b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_806b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_806b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_806b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_806b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_806b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1055_c7_c9c7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1055_c7_c9c7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_c9c7_cond;
     tmp16_MUX_uxn_opcodes_h_l1055_c7_c9c7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_c9c7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1055_c7_c9c7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_c9c7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output := tmp16_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1051_c7_806b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_806b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_806b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_806b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_806b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_806b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_806b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_806b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_806b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1061_c21_0fd3] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1061_c21_0fd3_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1057_c11_3b94_return_output);

     -- n16_MUX[uxn_opcodes_h_l1051_c7_806b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1051_c7_806b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1051_c7_806b_cond;
     n16_MUX_uxn_opcodes_h_l1051_c7_806b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1051_c7_806b_iftrue;
     n16_MUX_uxn_opcodes_h_l1051_c7_806b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1051_c7_806b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1051_c7_806b_return_output := n16_MUX_uxn_opcodes_h_l1051_c7_806b_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_c9c7_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1061_c21_0fd3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1051_c7_806b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_806b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_5935_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_806b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_806b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_806b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1051_c7_806b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1051_c7_806b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_806b_cond;
     tmp16_MUX_uxn_opcodes_h_l1051_c7_806b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_806b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1051_c7_806b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_806b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_806b_return_output := tmp16_MUX_uxn_opcodes_h_l1051_c7_806b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1047_c7_5935] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_5935_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_5935_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_5935_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_5935_return_output;

     -- n16_MUX[uxn_opcodes_h_l1047_c7_5935] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1047_c7_5935_cond <= VAR_n16_MUX_uxn_opcodes_h_l1047_c7_5935_cond;
     n16_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue;
     n16_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1047_c7_5935_return_output := n16_MUX_uxn_opcodes_h_l1047_c7_5935_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1047_c7_5935] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_5935_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_5935_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_5935_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_5935_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1042_c7_02f3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_02f3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_02f3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1047_c7_5935] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_5935_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_5935_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_5935_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_5935_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1055_c7_c9c7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1055_c7_c9c7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_c9c7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1055_c7_c9c7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_c9c7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1055_c7_c9c7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_c9c7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output;

     -- t16_MUX[uxn_opcodes_h_l1039_c7_85b3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1039_c7_85b3_cond <= VAR_t16_MUX_uxn_opcodes_h_l1039_c7_85b3_cond;
     t16_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue;
     t16_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output := t16_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1047_c7_5935_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_5935_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_5935_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_5935_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1051_c7_806b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_c9c7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_806b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1042_c7_02f3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_02f3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_02f3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1042_c7_02f3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_02f3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_02f3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1051_c7_806b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1051_c7_806b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1051_c7_806b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1051_c7_806b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1051_c7_806b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1051_c7_806b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1051_c7_806b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1051_c7_806b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1051_c7_806b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1039_c7_85b3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_85b3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_85b3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output;

     -- t16_MUX[uxn_opcodes_h_l1026_c2_bdfd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond <= VAR_t16_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond;
     t16_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue;
     t16_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output := t16_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1042_c7_02f3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_02f3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_02f3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1042_c7_02f3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1042_c7_02f3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1042_c7_02f3_cond;
     n16_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue;
     n16_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output := n16_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1047_c7_5935] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1047_c7_5935_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1047_c7_5935_cond;
     tmp16_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1047_c7_5935_return_output := tmp16_MUX_uxn_opcodes_h_l1047_c7_5935_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1051_c7_806b_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1047_c7_5935_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1047_c7_5935] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1047_c7_5935_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1047_c7_5935_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1047_c7_5935_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1047_c7_5935_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1047_c7_5935_return_output := result_u8_value_MUX_uxn_opcodes_h_l1047_c7_5935_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1039_c7_85b3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_85b3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_85b3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1039_c7_85b3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_85b3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_85b3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1039_c7_85b3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1039_c7_85b3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1039_c7_85b3_cond;
     n16_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue;
     n16_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output := n16_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1042_c7_02f3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1042_c7_02f3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1042_c7_02f3_cond;
     tmp16_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output := tmp16_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1026_c2_bdfd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1039_c7_85b3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_85b3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_85b3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1047_c7_5935_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output;
     -- n16_MUX[uxn_opcodes_h_l1026_c2_bdfd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond <= VAR_n16_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond;
     n16_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue;
     n16_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output := n16_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1026_c2_bdfd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1042_c7_02f3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1042_c7_02f3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c7_02f3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c7_02f3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c7_02f3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1026_c2_bdfd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1039_c7_85b3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1039_c7_85b3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1039_c7_85b3_cond;
     tmp16_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output := tmp16_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1026_c2_bdfd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c7_02f3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1026_c2_bdfd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond;
     tmp16_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output := tmp16_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1039_c7_85b3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1039_c7_85b3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1039_c7_85b3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1039_c7_85b3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1039_c7_85b3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1039_c7_85b3_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1026_c2_bdfd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c2_bdfd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c2_bdfd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c2_bdfd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output := result_u8_value_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l1070_l1022_DUPLICATE_341f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l1070_l1022_DUPLICATE_341f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_243c(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_bdfd_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l1070_l1022_DUPLICATE_341f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_243c_uxn_opcodes_h_l1070_l1022_DUPLICATE_341f_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
