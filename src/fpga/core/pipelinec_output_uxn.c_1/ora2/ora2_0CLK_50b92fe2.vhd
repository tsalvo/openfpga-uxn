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
-- BIN_OP_EQ[uxn_opcodes_h_l1026_c6_c58e]
signal BIN_OP_EQ_uxn_opcodes_h_l1026_c6_c58e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1026_c6_c58e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1026_c6_c58e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1026_c2_87c7]
signal tmp16_MUX_uxn_opcodes_h_l1026_c2_87c7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1026_c2_87c7]
signal n16_MUX_uxn_opcodes_h_l1026_c2_87c7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1026_c2_87c7]
signal t16_MUX_uxn_opcodes_h_l1026_c2_87c7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1026_c2_87c7]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1026_c2_87c7]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_87c7_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1026_c2_87c7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_87c7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1026_c2_87c7]
signal result_u8_value_MUX_uxn_opcodes_h_l1026_c2_87c7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1026_c2_87c7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_87c7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1026_c2_87c7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_87c7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1026_c2_87c7]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1026_c2_87c7]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_87c7_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1026_c2_87c7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_87c7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1039_c11_0d39]
signal BIN_OP_EQ_uxn_opcodes_h_l1039_c11_0d39_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1039_c11_0d39_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1039_c11_0d39_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1039_c7_827b]
signal tmp16_MUX_uxn_opcodes_h_l1039_c7_827b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1039_c7_827b_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1039_c7_827b]
signal n16_MUX_uxn_opcodes_h_l1039_c7_827b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1039_c7_827b_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1039_c7_827b]
signal t16_MUX_uxn_opcodes_h_l1039_c7_827b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1039_c7_827b_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1039_c7_827b]
signal result_u8_value_MUX_uxn_opcodes_h_l1039_c7_827b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1039_c7_827b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1039_c7_827b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_827b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_827b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1039_c7_827b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_827b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_827b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1039_c7_827b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_827b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_827b_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1039_c7_827b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_827b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_827b_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1042_c11_7542]
signal BIN_OP_EQ_uxn_opcodes_h_l1042_c11_7542_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1042_c11_7542_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1042_c11_7542_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1042_c7_0859]
signal tmp16_MUX_uxn_opcodes_h_l1042_c7_0859_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1042_c7_0859_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1042_c7_0859]
signal n16_MUX_uxn_opcodes_h_l1042_c7_0859_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1042_c7_0859_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1042_c7_0859]
signal t16_MUX_uxn_opcodes_h_l1042_c7_0859_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1042_c7_0859_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1042_c7_0859]
signal result_u8_value_MUX_uxn_opcodes_h_l1042_c7_0859_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1042_c7_0859_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1042_c7_0859]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_0859_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_0859_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1042_c7_0859]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_0859_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_0859_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1042_c7_0859]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_0859_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_0859_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1042_c7_0859]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_0859_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_0859_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1047_c11_b52d]
signal BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b52d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b52d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b52d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1047_c7_6194]
signal tmp16_MUX_uxn_opcodes_h_l1047_c7_6194_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1047_c7_6194_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1047_c7_6194]
signal n16_MUX_uxn_opcodes_h_l1047_c7_6194_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1047_c7_6194_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1047_c7_6194]
signal t16_MUX_uxn_opcodes_h_l1047_c7_6194_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1047_c7_6194_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1047_c7_6194]
signal result_u8_value_MUX_uxn_opcodes_h_l1047_c7_6194_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1047_c7_6194_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1047_c7_6194]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_6194_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_6194_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1047_c7_6194]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_6194_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_6194_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1047_c7_6194]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_6194_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_6194_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1047_c7_6194]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_6194_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_6194_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1048_c3_b44f]
signal BIN_OP_OR_uxn_opcodes_h_l1048_c3_b44f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1048_c3_b44f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1048_c3_b44f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1051_c11_a82c]
signal BIN_OP_EQ_uxn_opcodes_h_l1051_c11_a82c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1051_c11_a82c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1051_c11_a82c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1051_c7_779e]
signal tmp16_MUX_uxn_opcodes_h_l1051_c7_779e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1051_c7_779e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1051_c7_779e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1051_c7_779e_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1051_c7_779e]
signal n16_MUX_uxn_opcodes_h_l1051_c7_779e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1051_c7_779e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1051_c7_779e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1051_c7_779e_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1051_c7_779e]
signal result_u8_value_MUX_uxn_opcodes_h_l1051_c7_779e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1051_c7_779e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1051_c7_779e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1051_c7_779e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1051_c7_779e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_779e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_779e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_779e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_779e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1051_c7_779e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_779e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_779e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_779e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_779e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1051_c7_779e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_779e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_779e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_779e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_779e_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1051_c7_779e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_779e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_779e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_779e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_779e_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1055_c11_039c]
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_039c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_039c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_039c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1055_c7_29bc]
signal tmp16_MUX_uxn_opcodes_h_l1055_c7_29bc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1055_c7_29bc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1055_c7_29bc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1055_c7_29bc]
signal n16_MUX_uxn_opcodes_h_l1055_c7_29bc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1055_c7_29bc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1055_c7_29bc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1055_c7_29bc]
signal result_u8_value_MUX_uxn_opcodes_h_l1055_c7_29bc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1055_c7_29bc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1055_c7_29bc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1055_c7_29bc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_29bc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_29bc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_29bc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1055_c7_29bc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_29bc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_29bc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_29bc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1055_c7_29bc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_29bc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_29bc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_29bc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1055_c7_29bc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_29bc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_29bc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_29bc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1056_c3_ff1f]
signal BIN_OP_OR_uxn_opcodes_h_l1056_c3_ff1f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1056_c3_ff1f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1056_c3_ff1f_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1057_c11_cdcd]
signal BIN_OP_OR_uxn_opcodes_h_l1057_c11_cdcd_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1057_c11_cdcd_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1057_c11_cdcd_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1058_c30_d8e0]
signal sp_relative_shift_uxn_opcodes_h_l1058_c30_d8e0_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1058_c30_d8e0_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1058_c30_d8e0_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1058_c30_d8e0_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1063_c11_eb38]
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_eb38_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_eb38_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_eb38_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1063_c7_b3c8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_b3c8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_b3c8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_b3c8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_b3c8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1063_c7_b3c8]
signal result_u8_value_MUX_uxn_opcodes_h_l1063_c7_b3c8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1063_c7_b3c8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1063_c7_b3c8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1063_c7_b3c8_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1063_c7_b3c8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_b3c8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_b3c8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_b3c8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_b3c8_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1063_c7_b3c8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_b3c8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_b3c8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_b3c8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_b3c8_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1066_c31_4f02]
signal CONST_SR_8_uxn_opcodes_h_l1066_c31_4f02_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1066_c31_4f02_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1044_l1053_DUPLICATE_c5c0
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1044_l1053_DUPLICATE_c5c0_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1044_l1053_DUPLICATE_c5c0_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_375c( ref_toks_0 : opcode_result_t;
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
      base.is_pc_updated := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.u8_value := ref_toks_4;
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
-- BIN_OP_EQ_uxn_opcodes_h_l1026_c6_c58e
BIN_OP_EQ_uxn_opcodes_h_l1026_c6_c58e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1026_c6_c58e_left,
BIN_OP_EQ_uxn_opcodes_h_l1026_c6_c58e_right,
BIN_OP_EQ_uxn_opcodes_h_l1026_c6_c58e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1026_c2_87c7
tmp16_MUX_uxn_opcodes_h_l1026_c2_87c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1026_c2_87c7_cond,
tmp16_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue,
tmp16_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse,
tmp16_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output);

-- n16_MUX_uxn_opcodes_h_l1026_c2_87c7
n16_MUX_uxn_opcodes_h_l1026_c2_87c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1026_c2_87c7_cond,
n16_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue,
n16_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse,
n16_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output);

-- t16_MUX_uxn_opcodes_h_l1026_c2_87c7
t16_MUX_uxn_opcodes_h_l1026_c2_87c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1026_c2_87c7_cond,
t16_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue,
t16_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse,
t16_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_87c7
result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_87c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_87c7
result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_87c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_87c7_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_87c7
result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_87c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_87c7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1026_c2_87c7
result_u8_value_MUX_uxn_opcodes_h_l1026_c2_87c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1026_c2_87c7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_87c7
result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_87c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_87c7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_87c7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_87c7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_87c7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_87c7
result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_87c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_87c7
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_87c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_87c7_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_87c7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_87c7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_87c7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1039_c11_0d39
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_0d39 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_0d39_left,
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_0d39_right,
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_0d39_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1039_c7_827b
tmp16_MUX_uxn_opcodes_h_l1039_c7_827b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1039_c7_827b_cond,
tmp16_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1039_c7_827b_return_output);

-- n16_MUX_uxn_opcodes_h_l1039_c7_827b
n16_MUX_uxn_opcodes_h_l1039_c7_827b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1039_c7_827b_cond,
n16_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue,
n16_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse,
n16_MUX_uxn_opcodes_h_l1039_c7_827b_return_output);

-- t16_MUX_uxn_opcodes_h_l1039_c7_827b
t16_MUX_uxn_opcodes_h_l1039_c7_827b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1039_c7_827b_cond,
t16_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue,
t16_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse,
t16_MUX_uxn_opcodes_h_l1039_c7_827b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1039_c7_827b
result_u8_value_MUX_uxn_opcodes_h_l1039_c7_827b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1039_c7_827b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1039_c7_827b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_827b
result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_827b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_827b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_827b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_827b
result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_827b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_827b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_827b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_827b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_827b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_827b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_827b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_827b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_827b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_827b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_827b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1042_c11_7542
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_7542 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_7542_left,
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_7542_right,
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_7542_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1042_c7_0859
tmp16_MUX_uxn_opcodes_h_l1042_c7_0859 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1042_c7_0859_cond,
tmp16_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue,
tmp16_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse,
tmp16_MUX_uxn_opcodes_h_l1042_c7_0859_return_output);

-- n16_MUX_uxn_opcodes_h_l1042_c7_0859
n16_MUX_uxn_opcodes_h_l1042_c7_0859 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1042_c7_0859_cond,
n16_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue,
n16_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse,
n16_MUX_uxn_opcodes_h_l1042_c7_0859_return_output);

-- t16_MUX_uxn_opcodes_h_l1042_c7_0859
t16_MUX_uxn_opcodes_h_l1042_c7_0859 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1042_c7_0859_cond,
t16_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue,
t16_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse,
t16_MUX_uxn_opcodes_h_l1042_c7_0859_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1042_c7_0859
result_u8_value_MUX_uxn_opcodes_h_l1042_c7_0859 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1042_c7_0859_cond,
result_u8_value_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1042_c7_0859_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_0859
result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_0859 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_0859_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_0859_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_0859
result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_0859 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_0859_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_0859_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_0859
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_0859 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_0859_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_0859_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_0859
result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_0859 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_0859_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_0859_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b52d
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b52d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b52d_left,
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b52d_right,
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b52d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1047_c7_6194
tmp16_MUX_uxn_opcodes_h_l1047_c7_6194 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1047_c7_6194_cond,
tmp16_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue,
tmp16_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse,
tmp16_MUX_uxn_opcodes_h_l1047_c7_6194_return_output);

-- n16_MUX_uxn_opcodes_h_l1047_c7_6194
n16_MUX_uxn_opcodes_h_l1047_c7_6194 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1047_c7_6194_cond,
n16_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue,
n16_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse,
n16_MUX_uxn_opcodes_h_l1047_c7_6194_return_output);

-- t16_MUX_uxn_opcodes_h_l1047_c7_6194
t16_MUX_uxn_opcodes_h_l1047_c7_6194 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1047_c7_6194_cond,
t16_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue,
t16_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse,
t16_MUX_uxn_opcodes_h_l1047_c7_6194_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1047_c7_6194
result_u8_value_MUX_uxn_opcodes_h_l1047_c7_6194 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1047_c7_6194_cond,
result_u8_value_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1047_c7_6194_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_6194
result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_6194 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_6194_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_6194_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_6194
result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_6194 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_6194_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_6194_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_6194
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_6194 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_6194_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_6194_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_6194
result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_6194 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_6194_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_6194_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1048_c3_b44f
BIN_OP_OR_uxn_opcodes_h_l1048_c3_b44f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1048_c3_b44f_left,
BIN_OP_OR_uxn_opcodes_h_l1048_c3_b44f_right,
BIN_OP_OR_uxn_opcodes_h_l1048_c3_b44f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1051_c11_a82c
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_a82c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_a82c_left,
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_a82c_right,
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_a82c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1051_c7_779e
tmp16_MUX_uxn_opcodes_h_l1051_c7_779e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1051_c7_779e_cond,
tmp16_MUX_uxn_opcodes_h_l1051_c7_779e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1051_c7_779e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1051_c7_779e_return_output);

-- n16_MUX_uxn_opcodes_h_l1051_c7_779e
n16_MUX_uxn_opcodes_h_l1051_c7_779e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1051_c7_779e_cond,
n16_MUX_uxn_opcodes_h_l1051_c7_779e_iftrue,
n16_MUX_uxn_opcodes_h_l1051_c7_779e_iffalse,
n16_MUX_uxn_opcodes_h_l1051_c7_779e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1051_c7_779e
result_u8_value_MUX_uxn_opcodes_h_l1051_c7_779e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1051_c7_779e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1051_c7_779e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1051_c7_779e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1051_c7_779e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_779e
result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_779e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_779e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_779e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_779e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_779e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_779e
result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_779e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_779e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_779e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_779e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_779e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_779e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_779e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_779e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_779e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_779e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_779e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_779e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_779e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_779e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_779e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_779e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_779e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1055_c11_039c
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_039c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_039c_left,
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_039c_right,
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_039c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1055_c7_29bc
tmp16_MUX_uxn_opcodes_h_l1055_c7_29bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1055_c7_29bc_cond,
tmp16_MUX_uxn_opcodes_h_l1055_c7_29bc_iftrue,
tmp16_MUX_uxn_opcodes_h_l1055_c7_29bc_iffalse,
tmp16_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output);

-- n16_MUX_uxn_opcodes_h_l1055_c7_29bc
n16_MUX_uxn_opcodes_h_l1055_c7_29bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1055_c7_29bc_cond,
n16_MUX_uxn_opcodes_h_l1055_c7_29bc_iftrue,
n16_MUX_uxn_opcodes_h_l1055_c7_29bc_iffalse,
n16_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1055_c7_29bc
result_u8_value_MUX_uxn_opcodes_h_l1055_c7_29bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1055_c7_29bc_cond,
result_u8_value_MUX_uxn_opcodes_h_l1055_c7_29bc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1055_c7_29bc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_29bc
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_29bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_29bc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_29bc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_29bc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_29bc
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_29bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_29bc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_29bc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_29bc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_29bc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_29bc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_29bc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_29bc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_29bc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_29bc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_29bc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_29bc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_29bc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_29bc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1056_c3_ff1f
BIN_OP_OR_uxn_opcodes_h_l1056_c3_ff1f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1056_c3_ff1f_left,
BIN_OP_OR_uxn_opcodes_h_l1056_c3_ff1f_right,
BIN_OP_OR_uxn_opcodes_h_l1056_c3_ff1f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1057_c11_cdcd
BIN_OP_OR_uxn_opcodes_h_l1057_c11_cdcd : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1057_c11_cdcd_left,
BIN_OP_OR_uxn_opcodes_h_l1057_c11_cdcd_right,
BIN_OP_OR_uxn_opcodes_h_l1057_c11_cdcd_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1058_c30_d8e0
sp_relative_shift_uxn_opcodes_h_l1058_c30_d8e0 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1058_c30_d8e0_ins,
sp_relative_shift_uxn_opcodes_h_l1058_c30_d8e0_x,
sp_relative_shift_uxn_opcodes_h_l1058_c30_d8e0_y,
sp_relative_shift_uxn_opcodes_h_l1058_c30_d8e0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1063_c11_eb38
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_eb38 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_eb38_left,
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_eb38_right,
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_eb38_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_b3c8
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_b3c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_b3c8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_b3c8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_b3c8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_b3c8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1063_c7_b3c8
result_u8_value_MUX_uxn_opcodes_h_l1063_c7_b3c8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1063_c7_b3c8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1063_c7_b3c8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1063_c7_b3c8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1063_c7_b3c8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_b3c8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_b3c8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_b3c8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_b3c8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_b3c8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_b3c8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_b3c8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_b3c8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_b3c8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_b3c8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_b3c8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_b3c8_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1066_c31_4f02
CONST_SR_8_uxn_opcodes_h_l1066_c31_4f02 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1066_c31_4f02_x,
CONST_SR_8_uxn_opcodes_h_l1066_c31_4f02_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1044_l1053_DUPLICATE_c5c0
CONST_SL_8_uint16_t_uxn_opcodes_h_l1044_l1053_DUPLICATE_c5c0 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1044_l1053_DUPLICATE_c5c0_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1044_l1053_DUPLICATE_c5c0_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1026_c6_c58e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output,
 n16_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output,
 t16_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1039_c11_0d39_return_output,
 tmp16_MUX_uxn_opcodes_h_l1039_c7_827b_return_output,
 n16_MUX_uxn_opcodes_h_l1039_c7_827b_return_output,
 t16_MUX_uxn_opcodes_h_l1039_c7_827b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1039_c7_827b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_827b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_827b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_827b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_827b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1042_c11_7542_return_output,
 tmp16_MUX_uxn_opcodes_h_l1042_c7_0859_return_output,
 n16_MUX_uxn_opcodes_h_l1042_c7_0859_return_output,
 t16_MUX_uxn_opcodes_h_l1042_c7_0859_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1042_c7_0859_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_0859_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_0859_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_0859_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_0859_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b52d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1047_c7_6194_return_output,
 n16_MUX_uxn_opcodes_h_l1047_c7_6194_return_output,
 t16_MUX_uxn_opcodes_h_l1047_c7_6194_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1047_c7_6194_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_6194_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_6194_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_6194_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_6194_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1048_c3_b44f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1051_c11_a82c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1051_c7_779e_return_output,
 n16_MUX_uxn_opcodes_h_l1051_c7_779e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1051_c7_779e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_779e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_779e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_779e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_779e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1055_c11_039c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output,
 n16_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1056_c3_ff1f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1057_c11_cdcd_return_output,
 sp_relative_shift_uxn_opcodes_h_l1058_c30_d8e0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1063_c11_eb38_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_b3c8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1063_c7_b3c8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_b3c8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_b3c8_return_output,
 CONST_SR_8_uxn_opcodes_h_l1066_c31_4f02_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1044_l1053_DUPLICATE_c5c0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_c58e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_c58e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_c58e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1039_c7_827b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1026_c2_87c7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1039_c7_827b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1026_c2_87c7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1039_c7_827b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1026_c2_87c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1026_c2_87c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1026_c2_87c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_87c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_827b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_87c7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1039_c7_827b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c2_87c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_827b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_87c7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1036_c3_c4f2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_827b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_87c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1026_c2_87c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1026_c2_87c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_87c7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1031_c3_bba0 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_827b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_87c7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_0d39_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_0d39_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_0d39_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1042_c7_0859_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1039_c7_827b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1042_c7_0859_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1039_c7_827b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1042_c7_0859_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1039_c7_827b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c7_0859_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1039_c7_827b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_0859_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_827b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_0859_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_827b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1040_c3_1ffa : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_0859_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_827b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_0859_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_827b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_7542_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_7542_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_7542_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1047_c7_6194_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1042_c7_0859_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1047_c7_6194_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1042_c7_0859_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1047_c7_6194_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1042_c7_0859_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1047_c7_6194_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c7_0859_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_6194_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_0859_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_6194_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_0859_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1045_c3_7795 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_6194_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_0859_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_6194_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_0859_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b52d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b52d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b52d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_779e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1047_c7_6194_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1051_c7_779e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1047_c7_6194_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1047_c7_6194_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1051_c7_779e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1047_c7_6194_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_779e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_6194_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_779e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_6194_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1049_c3_f6a7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_779e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_6194_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_779e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_6194_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1048_c3_b44f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1048_c3_b44f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1048_c3_b44f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_a82c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_a82c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_a82c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_779e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_779e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_779e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1051_c7_779e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1051_c7_779e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1051_c7_779e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1051_c7_779e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1051_c7_779e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1051_c7_779e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_779e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_779e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_779e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_779e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_779e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_779e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_779e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_779e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_779e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_779e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_779e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_779e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_039c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_039c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_039c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_29bc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_29bc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_29bc_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1055_c7_29bc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1055_c7_29bc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1055_c7_29bc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_29bc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_29bc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_b3c8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_29bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_29bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_29bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_b3c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_29bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_29bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_29bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_29bc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_29bc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1060_c3_3566 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_29bc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_b3c8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_29bc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_29bc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_29bc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_b3c8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_29bc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c3_ff1f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c3_ff1f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c3_ff1f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1057_c11_cdcd_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1057_c11_cdcd_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1057_c11_cdcd_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1058_c30_d8e0_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1058_c30_d8e0_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1058_c30_d8e0_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1058_c30_d8e0_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1061_c21_77fd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_eb38_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_eb38_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_eb38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_b3c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_b3c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_b3c8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_b3c8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_b3c8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_b3c8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_b3c8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1065_c3_bb50 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_b3c8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_b3c8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_b3c8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1064_c3_a53e : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_b3c8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_b3c8_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1066_c31_4f02_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1066_c31_4f02_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1066_c21_886d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1042_l1039_l1026_l1063_l1051_l1047_DUPLICATE_1ab6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1042_l1039_l1063_l1055_l1051_l1047_DUPLICATE_205f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1042_l1039_l1055_l1051_l1047_DUPLICATE_f682_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1042_l1039_l1063_l1051_l1047_DUPLICATE_4799_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1043_l1048_l1052_l1056_DUPLICATE_6e47_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1044_l1053_DUPLICATE_c5c0_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1044_l1053_DUPLICATE_c5c0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1063_l1051_DUPLICATE_1ec9_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l1070_l1022_DUPLICATE_c639_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_b3c8_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_c58e_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_039c_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1040_c3_1ffa := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1040_c3_1ffa;
     VAR_sp_relative_shift_uxn_opcodes_h_l1058_c30_d8e0_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1060_c3_3566 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_29bc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1060_c3_3566;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_eb38_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1049_c3_f6a7 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1049_c3_f6a7;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_0d39_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_7542_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_a82c_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1058_c30_d8e0_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1045_c3_7795 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1045_c3_7795;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1065_c3_bb50 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_b3c8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1065_c3_bb50;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1064_c3_a53e := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_b3c8_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1064_c3_a53e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1036_c3_c4f2 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1036_c3_c4f2;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1031_c3_bba0 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1031_c3_bba0;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_29bc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b52d_right := to_unsigned(3, 2);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1058_c30_d8e0_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c3_ff1f_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1055_c7_29bc_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_c58e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_0d39_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_7542_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b52d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_a82c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_039c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_eb38_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1048_c3_b44f_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1057_c11_cdcd_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1066_c31_4f02_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_779e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_29bc_iffalse := tmp16;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1042_l1039_l1026_l1063_l1051_l1047_DUPLICATE_1ab6 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1042_l1039_l1026_l1063_l1051_l1047_DUPLICATE_1ab6_return_output := result.u8_value;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1026_c2_87c7] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1026_c2_87c7_return_output := result.is_pc_updated;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1026_c2_87c7] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1026_c2_87c7_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1026_c6_c58e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1026_c6_c58e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_c58e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1026_c6_c58e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_c58e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_c58e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1026_c6_c58e_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1058_c30_d8e0] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1058_c30_d8e0_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1058_c30_d8e0_ins;
     sp_relative_shift_uxn_opcodes_h_l1058_c30_d8e0_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1058_c30_d8e0_x;
     sp_relative_shift_uxn_opcodes_h_l1058_c30_d8e0_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1058_c30_d8e0_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1058_c30_d8e0_return_output := sp_relative_shift_uxn_opcodes_h_l1058_c30_d8e0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1063_c11_eb38] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1063_c11_eb38_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_eb38_left;
     BIN_OP_EQ_uxn_opcodes_h_l1063_c11_eb38_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_eb38_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_eb38_return_output := BIN_OP_EQ_uxn_opcodes_h_l1063_c11_eb38_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1042_c11_7542] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1042_c11_7542_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_7542_left;
     BIN_OP_EQ_uxn_opcodes_h_l1042_c11_7542_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_7542_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_7542_return_output := BIN_OP_EQ_uxn_opcodes_h_l1042_c11_7542_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1043_l1048_l1052_l1056_DUPLICATE_6e47 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1043_l1048_l1052_l1056_DUPLICATE_6e47_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1026_c2_87c7] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1026_c2_87c7_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1051_c11_a82c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1051_c11_a82c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_a82c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1051_c11_a82c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_a82c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_a82c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1051_c11_a82c_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1042_l1039_l1063_l1051_l1047_DUPLICATE_4799 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1042_l1039_l1063_l1051_l1047_DUPLICATE_4799_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1047_c11_b52d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b52d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b52d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b52d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b52d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b52d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b52d_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1066_c31_4f02] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1066_c31_4f02_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1066_c31_4f02_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1066_c31_4f02_return_output := CONST_SR_8_uxn_opcodes_h_l1066_c31_4f02_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1042_l1039_l1063_l1055_l1051_l1047_DUPLICATE_205f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1042_l1039_l1063_l1055_l1051_l1047_DUPLICATE_205f_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1063_l1051_DUPLICATE_1ec9 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1063_l1051_DUPLICATE_1ec9_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1055_c11_039c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1055_c11_039c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_039c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1055_c11_039c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_039c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_039c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1055_c11_039c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1042_l1039_l1055_l1051_l1047_DUPLICATE_f682 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1042_l1039_l1055_l1051_l1047_DUPLICATE_f682_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1039_c11_0d39] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1039_c11_0d39_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_0d39_left;
     BIN_OP_EQ_uxn_opcodes_h_l1039_c11_0d39_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_0d39_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_0d39_return_output := BIN_OP_EQ_uxn_opcodes_h_l1039_c11_0d39_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1026_c2_87c7] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1026_c2_87c7_return_output := result.is_vram_write;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1026_c2_87c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_c58e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_87c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_c58e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_87c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_c58e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_c58e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_87c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_c58e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_87c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_c58e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_c58e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_87c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_c58e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_87c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_c58e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c2_87c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_c58e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1026_c2_87c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_c58e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1026_c2_87c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_c58e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1039_c7_827b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_0d39_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_827b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_0d39_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_827b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_0d39_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_827b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_0d39_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_827b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_0d39_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1039_c7_827b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_0d39_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1039_c7_827b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_0d39_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1039_c7_827b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_0d39_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1042_c7_0859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_7542_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_0859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_7542_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_0859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_7542_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_0859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_7542_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_0859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_7542_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c7_0859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_7542_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1042_c7_0859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_7542_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1042_c7_0859_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_7542_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1047_c7_6194_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b52d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_6194_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b52d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_6194_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b52d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_6194_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b52d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_6194_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b52d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1047_c7_6194_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b52d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1047_c7_6194_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b52d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1047_c7_6194_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_b52d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1051_c7_779e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_a82c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_779e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_a82c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_779e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_a82c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_779e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_a82c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_779e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_a82c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1051_c7_779e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_a82c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_779e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_a82c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1055_c7_29bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_039c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_29bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_039c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_29bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_039c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_29bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_039c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_29bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_039c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_29bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_039c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_29bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_039c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_b3c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_eb38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_b3c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_eb38_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_b3c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_eb38_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_b3c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_eb38_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1048_c3_b44f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1043_l1048_l1052_l1056_DUPLICATE_6e47_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c3_ff1f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1043_l1048_l1052_l1056_DUPLICATE_6e47_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1044_l1053_DUPLICATE_c5c0_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1043_l1048_l1052_l1056_DUPLICATE_6e47_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1042_l1039_l1063_l1051_l1047_DUPLICATE_4799_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1042_l1039_l1063_l1051_l1047_DUPLICATE_4799_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1042_l1039_l1063_l1051_l1047_DUPLICATE_4799_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_779e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1042_l1039_l1063_l1051_l1047_DUPLICATE_4799_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_b3c8_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1042_l1039_l1063_l1051_l1047_DUPLICATE_4799_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1042_l1039_l1063_l1055_l1051_l1047_DUPLICATE_205f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1042_l1039_l1063_l1055_l1051_l1047_DUPLICATE_205f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1042_l1039_l1063_l1055_l1051_l1047_DUPLICATE_205f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_779e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1042_l1039_l1063_l1055_l1051_l1047_DUPLICATE_205f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_29bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1042_l1039_l1063_l1055_l1051_l1047_DUPLICATE_205f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_b3c8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1042_l1039_l1063_l1055_l1051_l1047_DUPLICATE_205f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1042_l1039_l1055_l1051_l1047_DUPLICATE_f682_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1042_l1039_l1055_l1051_l1047_DUPLICATE_f682_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1042_l1039_l1055_l1051_l1047_DUPLICATE_f682_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_779e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1042_l1039_l1055_l1051_l1047_DUPLICATE_f682_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_29bc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1042_l1039_l1055_l1051_l1047_DUPLICATE_f682_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_779e_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1063_l1051_DUPLICATE_1ec9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_b3c8_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1063_l1051_DUPLICATE_1ec9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1042_l1039_l1026_l1063_l1051_l1047_DUPLICATE_1ab6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1042_l1039_l1026_l1063_l1051_l1047_DUPLICATE_1ab6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1042_l1039_l1026_l1063_l1051_l1047_DUPLICATE_1ab6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1042_l1039_l1026_l1063_l1051_l1047_DUPLICATE_1ab6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1051_c7_779e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1042_l1039_l1026_l1063_l1051_l1047_DUPLICATE_1ab6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_b3c8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1042_l1039_l1026_l1063_l1051_l1047_DUPLICATE_1ab6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1026_c2_87c7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1026_c2_87c7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1026_c2_87c7_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1026_c2_87c7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_29bc_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1058_c30_d8e0_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1026_c2_87c7] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_87c7_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_87c7_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1026_c2_87c7] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1044_l1053_DUPLICATE_c5c0 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1044_l1053_DUPLICATE_c5c0_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1044_l1053_DUPLICATE_c5c0_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1044_l1053_DUPLICATE_c5c0_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1044_l1053_DUPLICATE_c5c0_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1026_c2_87c7] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1063_c7_b3c8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_b3c8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_b3c8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_b3c8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_b3c8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_b3c8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_b3c8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_b3c8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_b3c8_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1056_c3_ff1f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1056_c3_ff1f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c3_ff1f_left;
     BIN_OP_OR_uxn_opcodes_h_l1056_c3_ff1f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c3_ff1f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c3_ff1f_return_output := BIN_OP_OR_uxn_opcodes_h_l1056_c3_ff1f_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1066_c21_886d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1066_c21_886d_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1066_c31_4f02_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l1048_c3_b44f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1048_c3_b44f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1048_c3_b44f_left;
     BIN_OP_OR_uxn_opcodes_h_l1048_c3_b44f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1048_c3_b44f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1048_c3_b44f_return_output := BIN_OP_OR_uxn_opcodes_h_l1048_c3_b44f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1026_c2_87c7] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_87c7_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_87c7_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1063_c7_b3c8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_b3c8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_b3c8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_b3c8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_b3c8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_b3c8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_b3c8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_b3c8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_b3c8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1063_c7_b3c8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_b3c8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_b3c8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_b3c8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_b3c8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_b3c8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_b3c8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_b3c8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_b3c8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1055_c7_29bc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_29bc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_29bc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_29bc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_29bc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_29bc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_29bc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1048_c3_b44f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1057_c11_cdcd_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c3_ff1f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1055_c7_29bc_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c3_ff1f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_b3c8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1066_c21_886d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1051_c7_779e_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1044_l1053_DUPLICATE_c5c0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1044_l1053_DUPLICATE_c5c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_29bc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_b3c8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_779e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_29bc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_b3c8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_29bc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_b3c8_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1057_c11_cdcd] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1057_c11_cdcd_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1057_c11_cdcd_left;
     BIN_OP_OR_uxn_opcodes_h_l1057_c11_cdcd_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1057_c11_cdcd_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1057_c11_cdcd_return_output := BIN_OP_OR_uxn_opcodes_h_l1057_c11_cdcd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1055_c7_29bc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_29bc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_29bc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_29bc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_29bc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_29bc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_29bc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output;

     -- n16_MUX[uxn_opcodes_h_l1055_c7_29bc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1055_c7_29bc_cond <= VAR_n16_MUX_uxn_opcodes_h_l1055_c7_29bc_cond;
     n16_MUX_uxn_opcodes_h_l1055_c7_29bc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1055_c7_29bc_iftrue;
     n16_MUX_uxn_opcodes_h_l1055_c7_29bc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1055_c7_29bc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output := n16_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1055_c7_29bc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_29bc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_29bc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_29bc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_29bc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_29bc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_29bc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1063_c7_b3c8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1063_c7_b3c8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_b3c8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1063_c7_b3c8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_b3c8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1063_c7_b3c8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_b3c8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_b3c8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1063_c7_b3c8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1055_c7_29bc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_29bc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_29bc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_29bc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_29bc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_29bc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_29bc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1051_c7_779e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_779e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_779e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_779e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_779e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_779e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_779e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_779e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_779e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1047_c7_6194] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1047_c7_6194_cond <= VAR_t16_MUX_uxn_opcodes_h_l1047_c7_6194_cond;
     t16_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue;
     t16_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1047_c7_6194_return_output := t16_MUX_uxn_opcodes_h_l1047_c7_6194_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_29bc_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1057_c11_cdcd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1051_c7_779e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_779e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_779e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_779e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_779e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_29bc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_b3c8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1047_c7_6194_return_output;
     -- t16_MUX[uxn_opcodes_h_l1042_c7_0859] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1042_c7_0859_cond <= VAR_t16_MUX_uxn_opcodes_h_l1042_c7_0859_cond;
     t16_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue;
     t16_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1042_c7_0859_return_output := t16_MUX_uxn_opcodes_h_l1042_c7_0859_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1051_c7_779e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_779e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_779e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_779e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_779e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_779e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_779e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_779e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_779e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1051_c7_779e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1051_c7_779e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1051_c7_779e_cond;
     n16_MUX_uxn_opcodes_h_l1051_c7_779e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1051_c7_779e_iftrue;
     n16_MUX_uxn_opcodes_h_l1051_c7_779e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1051_c7_779e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1051_c7_779e_return_output := n16_MUX_uxn_opcodes_h_l1051_c7_779e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1047_c7_6194] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_6194_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_6194_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_6194_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_6194_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1051_c7_779e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_779e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_779e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_779e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_779e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_779e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_779e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_779e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_779e_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1061_c21_77fd] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1061_c21_77fd_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1057_c11_cdcd_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1051_c7_779e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_779e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_779e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_779e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_779e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_779e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_779e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_779e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_779e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1055_c7_29bc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1055_c7_29bc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_29bc_cond;
     tmp16_MUX_uxn_opcodes_h_l1055_c7_29bc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_29bc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1055_c7_29bc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_29bc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output := tmp16_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_29bc_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1061_c21_77fd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1051_c7_779e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_779e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_6194_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_779e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_779e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1042_c7_0859_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_779e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1047_c7_6194] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_6194_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_6194_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_6194_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_6194_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1047_c7_6194] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_6194_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_6194_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_6194_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_6194_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1042_c7_0859] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_0859_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_0859_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_0859_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_0859_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1051_c7_779e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1051_c7_779e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_779e_cond;
     tmp16_MUX_uxn_opcodes_h_l1051_c7_779e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_779e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1051_c7_779e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_779e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_779e_return_output := tmp16_MUX_uxn_opcodes_h_l1051_c7_779e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1047_c7_6194] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1047_c7_6194_cond <= VAR_n16_MUX_uxn_opcodes_h_l1047_c7_6194_cond;
     n16_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue;
     n16_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1047_c7_6194_return_output := n16_MUX_uxn_opcodes_h_l1047_c7_6194_return_output;

     -- t16_MUX[uxn_opcodes_h_l1039_c7_827b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1039_c7_827b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1039_c7_827b_cond;
     t16_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue;
     t16_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1039_c7_827b_return_output := t16_MUX_uxn_opcodes_h_l1039_c7_827b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1047_c7_6194] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_6194_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_6194_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_6194_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_6194_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1055_c7_29bc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1055_c7_29bc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_29bc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1055_c7_29bc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_29bc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1055_c7_29bc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_29bc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output := result_u8_value_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1047_c7_6194_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_6194_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_0859_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_6194_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_6194_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1051_c7_779e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_29bc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1039_c7_827b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_779e_return_output;
     -- t16_MUX[uxn_opcodes_h_l1026_c2_87c7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1026_c2_87c7_cond <= VAR_t16_MUX_uxn_opcodes_h_l1026_c2_87c7_cond;
     t16_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue;
     t16_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output := t16_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1042_c7_0859] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_0859_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_0859_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_0859_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_0859_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1047_c7_6194] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1047_c7_6194_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1047_c7_6194_cond;
     tmp16_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1047_c7_6194_return_output := tmp16_MUX_uxn_opcodes_h_l1047_c7_6194_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1051_c7_779e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1051_c7_779e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1051_c7_779e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1051_c7_779e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1051_c7_779e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1051_c7_779e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1051_c7_779e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1051_c7_779e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1051_c7_779e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1039_c7_827b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_827b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_827b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_827b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_827b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1042_c7_0859] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1042_c7_0859_cond <= VAR_n16_MUX_uxn_opcodes_h_l1042_c7_0859_cond;
     n16_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue;
     n16_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1042_c7_0859_return_output := n16_MUX_uxn_opcodes_h_l1042_c7_0859_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1042_c7_0859] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_0859_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_0859_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_0859_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_0859_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1042_c7_0859] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_0859_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_0859_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_0859_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_0859_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1042_c7_0859_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_0859_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_827b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_0859_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_0859_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1051_c7_779e_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1047_c7_6194_return_output;
     -- n16_MUX[uxn_opcodes_h_l1039_c7_827b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1039_c7_827b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1039_c7_827b_cond;
     n16_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue;
     n16_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1039_c7_827b_return_output := n16_MUX_uxn_opcodes_h_l1039_c7_827b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1039_c7_827b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_827b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_827b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_827b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_827b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1039_c7_827b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_827b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_827b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_827b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_827b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1039_c7_827b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_827b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_827b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_827b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_827b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1047_c7_6194] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1047_c7_6194_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1047_c7_6194_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1047_c7_6194_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1047_c7_6194_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1047_c7_6194_return_output := result_u8_value_MUX_uxn_opcodes_h_l1047_c7_6194_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1026_c2_87c7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_87c7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_87c7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1042_c7_0859] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1042_c7_0859_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1042_c7_0859_cond;
     tmp16_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1042_c7_0859_return_output := tmp16_MUX_uxn_opcodes_h_l1042_c7_0859_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1039_c7_827b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_827b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_827b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_827b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1047_c7_6194_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1042_c7_0859_return_output;
     -- n16_MUX[uxn_opcodes_h_l1026_c2_87c7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1026_c2_87c7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1026_c2_87c7_cond;
     n16_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue;
     n16_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output := n16_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1039_c7_827b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1039_c7_827b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1039_c7_827b_cond;
     tmp16_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1039_c7_827b_return_output := tmp16_MUX_uxn_opcodes_h_l1039_c7_827b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1026_c2_87c7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_87c7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_87c7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1026_c2_87c7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_87c7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_87c7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1042_c7_0859] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1042_c7_0859_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c7_0859_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c7_0859_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c7_0859_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c7_0859_return_output := result_u8_value_MUX_uxn_opcodes_h_l1042_c7_0859_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1026_c2_87c7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_87c7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_87c7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c7_0859_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1039_c7_827b_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1026_c2_87c7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1026_c2_87c7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1026_c2_87c7_cond;
     tmp16_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output := tmp16_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1039_c7_827b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1039_c7_827b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1039_c7_827b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1039_c7_827b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1039_c7_827b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1039_c7_827b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1039_c7_827b_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1039_c7_827b_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1026_c2_87c7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1026_c2_87c7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c2_87c7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c2_87c7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c2_87c7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l1070_l1022_DUPLICATE_c639 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l1070_l1022_DUPLICATE_c639_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_375c(
     result,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_87c7_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l1070_l1022_DUPLICATE_c639_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l1070_l1022_DUPLICATE_c639_return_output;
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
