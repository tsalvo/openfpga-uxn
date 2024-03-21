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
-- BIN_OP_EQ[uxn_opcodes_h_l1026_c6_523a]
signal BIN_OP_EQ_uxn_opcodes_h_l1026_c6_523a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1026_c6_523a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1026_c6_523a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1026_c2_c2cc]
signal n16_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1026_c2_c2cc]
signal t16_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1026_c2_c2cc]
signal tmp16_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1026_c2_c2cc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1026_c2_c2cc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1026_c2_c2cc]
signal result_u8_value_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1026_c2_c2cc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1026_c2_c2cc]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1026_c2_c2cc]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1026_c2_c2cc]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1026_c2_c2cc]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1026_c2_c2cc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1039_c11_6aa5]
signal BIN_OP_EQ_uxn_opcodes_h_l1039_c11_6aa5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1039_c11_6aa5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1039_c11_6aa5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1039_c7_7067]
signal n16_MUX_uxn_opcodes_h_l1039_c7_7067_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1039_c7_7067_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1039_c7_7067]
signal t16_MUX_uxn_opcodes_h_l1039_c7_7067_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1039_c7_7067_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1039_c7_7067]
signal tmp16_MUX_uxn_opcodes_h_l1039_c7_7067_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1039_c7_7067_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1039_c7_7067]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_7067_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_7067_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1039_c7_7067]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_7067_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_7067_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1039_c7_7067]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_7067_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_7067_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1039_c7_7067]
signal result_u8_value_MUX_uxn_opcodes_h_l1039_c7_7067_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1039_c7_7067_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1039_c7_7067]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_7067_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_7067_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1042_c11_5989]
signal BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5989_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5989_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5989_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1042_c7_6c92]
signal n16_MUX_uxn_opcodes_h_l1042_c7_6c92_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1042_c7_6c92]
signal t16_MUX_uxn_opcodes_h_l1042_c7_6c92_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1042_c7_6c92]
signal tmp16_MUX_uxn_opcodes_h_l1042_c7_6c92_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1042_c7_6c92]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_6c92_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1042_c7_6c92]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_6c92_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1042_c7_6c92]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_6c92_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1042_c7_6c92]
signal result_u8_value_MUX_uxn_opcodes_h_l1042_c7_6c92_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1042_c7_6c92]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_6c92_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1047_c11_1bd5]
signal BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1bd5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1bd5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1bd5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1047_c7_2680]
signal n16_MUX_uxn_opcodes_h_l1047_c7_2680_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1047_c7_2680_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1047_c7_2680]
signal t16_MUX_uxn_opcodes_h_l1047_c7_2680_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1047_c7_2680_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1047_c7_2680]
signal tmp16_MUX_uxn_opcodes_h_l1047_c7_2680_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1047_c7_2680_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1047_c7_2680]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_2680_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_2680_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1047_c7_2680]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_2680_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_2680_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1047_c7_2680]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_2680_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_2680_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1047_c7_2680]
signal result_u8_value_MUX_uxn_opcodes_h_l1047_c7_2680_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1047_c7_2680_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1047_c7_2680]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_2680_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_2680_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1048_c3_2a14]
signal BIN_OP_OR_uxn_opcodes_h_l1048_c3_2a14_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1048_c3_2a14_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1048_c3_2a14_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1051_c11_7cb9]
signal BIN_OP_EQ_uxn_opcodes_h_l1051_c11_7cb9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1051_c11_7cb9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1051_c11_7cb9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1051_c7_0abb]
signal n16_MUX_uxn_opcodes_h_l1051_c7_0abb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1051_c7_0abb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1051_c7_0abb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1051_c7_0abb]
signal tmp16_MUX_uxn_opcodes_h_l1051_c7_0abb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1051_c7_0abb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1051_c7_0abb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1051_c7_0abb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_0abb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_0abb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_0abb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1051_c7_0abb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_0abb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_0abb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_0abb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1051_c7_0abb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_0abb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_0abb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_0abb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1051_c7_0abb]
signal result_u8_value_MUX_uxn_opcodes_h_l1051_c7_0abb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1051_c7_0abb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1051_c7_0abb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1051_c7_0abb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_0abb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_0abb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_0abb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1055_c11_720a]
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_720a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_720a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c11_720a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1055_c7_f8ee]
signal n16_MUX_uxn_opcodes_h_l1055_c7_f8ee_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1055_c7_f8ee_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1055_c7_f8ee_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1055_c7_f8ee]
signal tmp16_MUX_uxn_opcodes_h_l1055_c7_f8ee_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1055_c7_f8ee_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1055_c7_f8ee_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1055_c7_f8ee]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_f8ee_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_f8ee_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_f8ee_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1055_c7_f8ee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_f8ee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_f8ee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_f8ee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1055_c7_f8ee]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_f8ee_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_f8ee_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_f8ee_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1055_c7_f8ee]
signal result_u8_value_MUX_uxn_opcodes_h_l1055_c7_f8ee_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1055_c7_f8ee_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1055_c7_f8ee_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1055_c7_f8ee]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_f8ee_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_f8ee_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_f8ee_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1056_c3_5aef]
signal BIN_OP_OR_uxn_opcodes_h_l1056_c3_5aef_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1056_c3_5aef_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1056_c3_5aef_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1057_c11_b838]
signal BIN_OP_OR_uxn_opcodes_h_l1057_c11_b838_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1057_c11_b838_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1057_c11_b838_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1058_c30_4d13]
signal sp_relative_shift_uxn_opcodes_h_l1058_c30_4d13_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1058_c30_4d13_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1058_c30_4d13_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1058_c30_4d13_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1063_c11_4d5e]
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4d5e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4d5e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4d5e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1063_c7_ad1f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_ad1f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_ad1f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_ad1f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_ad1f_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1063_c7_ad1f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_ad1f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_ad1f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_ad1f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_ad1f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1063_c7_ad1f]
signal result_u8_value_MUX_uxn_opcodes_h_l1063_c7_ad1f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1063_c7_ad1f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1063_c7_ad1f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1063_c7_ad1f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1063_c7_ad1f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_ad1f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_ad1f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_ad1f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_ad1f_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1066_c31_2f4c]
signal CONST_SR_8_uxn_opcodes_h_l1066_c31_2f4c_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1066_c31_2f4c_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1053_l1044_DUPLICATE_9ee3
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1053_l1044_DUPLICATE_9ee3_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1053_l1044_DUPLICATE_9ee3_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_a6df( ref_toks_0 : opcode_result_t;
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
      base.u8_value := ref_toks_3;
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
-- BIN_OP_EQ_uxn_opcodes_h_l1026_c6_523a
BIN_OP_EQ_uxn_opcodes_h_l1026_c6_523a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1026_c6_523a_left,
BIN_OP_EQ_uxn_opcodes_h_l1026_c6_523a_right,
BIN_OP_EQ_uxn_opcodes_h_l1026_c6_523a_return_output);

-- n16_MUX_uxn_opcodes_h_l1026_c2_c2cc
n16_MUX_uxn_opcodes_h_l1026_c2_c2cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond,
n16_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue,
n16_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse,
n16_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output);

-- t16_MUX_uxn_opcodes_h_l1026_c2_c2cc
t16_MUX_uxn_opcodes_h_l1026_c2_c2cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond,
t16_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue,
t16_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse,
t16_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1026_c2_c2cc
tmp16_MUX_uxn_opcodes_h_l1026_c2_c2cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond,
tmp16_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue,
tmp16_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse,
tmp16_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_c2cc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_c2cc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_c2cc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_c2cc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1026_c2_c2cc
result_u8_value_MUX_uxn_opcodes_h_l1026_c2_c2cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond,
result_u8_value_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_c2cc
result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_c2cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc
result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_c2cc
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_c2cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_c2cc
result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_c2cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc
result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_c2cc
result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_c2cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1039_c11_6aa5
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_6aa5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_6aa5_left,
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_6aa5_right,
BIN_OP_EQ_uxn_opcodes_h_l1039_c11_6aa5_return_output);

-- n16_MUX_uxn_opcodes_h_l1039_c7_7067
n16_MUX_uxn_opcodes_h_l1039_c7_7067 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1039_c7_7067_cond,
n16_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue,
n16_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse,
n16_MUX_uxn_opcodes_h_l1039_c7_7067_return_output);

-- t16_MUX_uxn_opcodes_h_l1039_c7_7067
t16_MUX_uxn_opcodes_h_l1039_c7_7067 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1039_c7_7067_cond,
t16_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue,
t16_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse,
t16_MUX_uxn_opcodes_h_l1039_c7_7067_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1039_c7_7067
tmp16_MUX_uxn_opcodes_h_l1039_c7_7067 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1039_c7_7067_cond,
tmp16_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue,
tmp16_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse,
tmp16_MUX_uxn_opcodes_h_l1039_c7_7067_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_7067
result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_7067 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_7067_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_7067_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_7067
result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_7067 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_7067_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_7067_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_7067
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_7067 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_7067_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_7067_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1039_c7_7067
result_u8_value_MUX_uxn_opcodes_h_l1039_c7_7067 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1039_c7_7067_cond,
result_u8_value_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1039_c7_7067_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_7067
result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_7067 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_7067_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_7067_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5989
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5989 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5989_left,
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5989_right,
BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5989_return_output);

-- n16_MUX_uxn_opcodes_h_l1042_c7_6c92
n16_MUX_uxn_opcodes_h_l1042_c7_6c92 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1042_c7_6c92_cond,
n16_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue,
n16_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse,
n16_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output);

-- t16_MUX_uxn_opcodes_h_l1042_c7_6c92
t16_MUX_uxn_opcodes_h_l1042_c7_6c92 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1042_c7_6c92_cond,
t16_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue,
t16_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse,
t16_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1042_c7_6c92
tmp16_MUX_uxn_opcodes_h_l1042_c7_6c92 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1042_c7_6c92_cond,
tmp16_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue,
tmp16_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse,
tmp16_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_6c92
result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_6c92 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_6c92_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_6c92
result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_6c92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_6c92_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_6c92
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_6c92 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_6c92_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1042_c7_6c92
result_u8_value_MUX_uxn_opcodes_h_l1042_c7_6c92 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1042_c7_6c92_cond,
result_u8_value_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_6c92
result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_6c92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_6c92_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1bd5
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1bd5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1bd5_left,
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1bd5_right,
BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1bd5_return_output);

-- n16_MUX_uxn_opcodes_h_l1047_c7_2680
n16_MUX_uxn_opcodes_h_l1047_c7_2680 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1047_c7_2680_cond,
n16_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue,
n16_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse,
n16_MUX_uxn_opcodes_h_l1047_c7_2680_return_output);

-- t16_MUX_uxn_opcodes_h_l1047_c7_2680
t16_MUX_uxn_opcodes_h_l1047_c7_2680 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1047_c7_2680_cond,
t16_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue,
t16_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse,
t16_MUX_uxn_opcodes_h_l1047_c7_2680_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1047_c7_2680
tmp16_MUX_uxn_opcodes_h_l1047_c7_2680 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1047_c7_2680_cond,
tmp16_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue,
tmp16_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse,
tmp16_MUX_uxn_opcodes_h_l1047_c7_2680_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_2680
result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_2680 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_2680_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_2680_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_2680
result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_2680 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_2680_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_2680_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_2680
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_2680 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_2680_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_2680_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1047_c7_2680
result_u8_value_MUX_uxn_opcodes_h_l1047_c7_2680 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1047_c7_2680_cond,
result_u8_value_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1047_c7_2680_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_2680
result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_2680 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_2680_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_2680_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1048_c3_2a14
BIN_OP_OR_uxn_opcodes_h_l1048_c3_2a14 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1048_c3_2a14_left,
BIN_OP_OR_uxn_opcodes_h_l1048_c3_2a14_right,
BIN_OP_OR_uxn_opcodes_h_l1048_c3_2a14_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1051_c11_7cb9
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_7cb9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_7cb9_left,
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_7cb9_right,
BIN_OP_EQ_uxn_opcodes_h_l1051_c11_7cb9_return_output);

-- n16_MUX_uxn_opcodes_h_l1051_c7_0abb
n16_MUX_uxn_opcodes_h_l1051_c7_0abb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1051_c7_0abb_cond,
n16_MUX_uxn_opcodes_h_l1051_c7_0abb_iftrue,
n16_MUX_uxn_opcodes_h_l1051_c7_0abb_iffalse,
n16_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1051_c7_0abb
tmp16_MUX_uxn_opcodes_h_l1051_c7_0abb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1051_c7_0abb_cond,
tmp16_MUX_uxn_opcodes_h_l1051_c7_0abb_iftrue,
tmp16_MUX_uxn_opcodes_h_l1051_c7_0abb_iffalse,
tmp16_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_0abb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_0abb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_0abb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_0abb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_0abb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_0abb
result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_0abb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_0abb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_0abb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_0abb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_0abb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_0abb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_0abb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_0abb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_0abb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1051_c7_0abb
result_u8_value_MUX_uxn_opcodes_h_l1051_c7_0abb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1051_c7_0abb_cond,
result_u8_value_MUX_uxn_opcodes_h_l1051_c7_0abb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1051_c7_0abb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_0abb
result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_0abb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_0abb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_0abb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_0abb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1055_c11_720a
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_720a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_720a_left,
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_720a_right,
BIN_OP_EQ_uxn_opcodes_h_l1055_c11_720a_return_output);

-- n16_MUX_uxn_opcodes_h_l1055_c7_f8ee
n16_MUX_uxn_opcodes_h_l1055_c7_f8ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1055_c7_f8ee_cond,
n16_MUX_uxn_opcodes_h_l1055_c7_f8ee_iftrue,
n16_MUX_uxn_opcodes_h_l1055_c7_f8ee_iffalse,
n16_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1055_c7_f8ee
tmp16_MUX_uxn_opcodes_h_l1055_c7_f8ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1055_c7_f8ee_cond,
tmp16_MUX_uxn_opcodes_h_l1055_c7_f8ee_iftrue,
tmp16_MUX_uxn_opcodes_h_l1055_c7_f8ee_iffalse,
tmp16_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_f8ee
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_f8ee : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_f8ee_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_f8ee_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_f8ee_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_f8ee
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_f8ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_f8ee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_f8ee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_f8ee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_f8ee
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_f8ee : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_f8ee_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_f8ee_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_f8ee_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1055_c7_f8ee
result_u8_value_MUX_uxn_opcodes_h_l1055_c7_f8ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1055_c7_f8ee_cond,
result_u8_value_MUX_uxn_opcodes_h_l1055_c7_f8ee_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1055_c7_f8ee_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_f8ee
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_f8ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_f8ee_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_f8ee_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_f8ee_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1056_c3_5aef
BIN_OP_OR_uxn_opcodes_h_l1056_c3_5aef : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1056_c3_5aef_left,
BIN_OP_OR_uxn_opcodes_h_l1056_c3_5aef_right,
BIN_OP_OR_uxn_opcodes_h_l1056_c3_5aef_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1057_c11_b838
BIN_OP_OR_uxn_opcodes_h_l1057_c11_b838 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1057_c11_b838_left,
BIN_OP_OR_uxn_opcodes_h_l1057_c11_b838_right,
BIN_OP_OR_uxn_opcodes_h_l1057_c11_b838_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1058_c30_4d13
sp_relative_shift_uxn_opcodes_h_l1058_c30_4d13 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1058_c30_4d13_ins,
sp_relative_shift_uxn_opcodes_h_l1058_c30_4d13_x,
sp_relative_shift_uxn_opcodes_h_l1058_c30_4d13_y,
sp_relative_shift_uxn_opcodes_h_l1058_c30_4d13_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4d5e
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4d5e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4d5e_left,
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4d5e_right,
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4d5e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_ad1f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_ad1f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_ad1f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_ad1f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_ad1f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_ad1f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_ad1f
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_ad1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_ad1f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_ad1f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_ad1f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_ad1f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1063_c7_ad1f
result_u8_value_MUX_uxn_opcodes_h_l1063_c7_ad1f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1063_c7_ad1f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1063_c7_ad1f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1063_c7_ad1f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1063_c7_ad1f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_ad1f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_ad1f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_ad1f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_ad1f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_ad1f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_ad1f_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1066_c31_2f4c
CONST_SR_8_uxn_opcodes_h_l1066_c31_2f4c : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1066_c31_2f4c_x,
CONST_SR_8_uxn_opcodes_h_l1066_c31_2f4c_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1053_l1044_DUPLICATE_9ee3
CONST_SL_8_uint16_t_uxn_opcodes_h_l1053_l1044_DUPLICATE_9ee3 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1053_l1044_DUPLICATE_9ee3_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1053_l1044_DUPLICATE_9ee3_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1026_c6_523a_return_output,
 n16_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output,
 t16_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output,
 tmp16_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1039_c11_6aa5_return_output,
 n16_MUX_uxn_opcodes_h_l1039_c7_7067_return_output,
 t16_MUX_uxn_opcodes_h_l1039_c7_7067_return_output,
 tmp16_MUX_uxn_opcodes_h_l1039_c7_7067_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_7067_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_7067_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_7067_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1039_c7_7067_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_7067_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5989_return_output,
 n16_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output,
 t16_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output,
 tmp16_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1bd5_return_output,
 n16_MUX_uxn_opcodes_h_l1047_c7_2680_return_output,
 t16_MUX_uxn_opcodes_h_l1047_c7_2680_return_output,
 tmp16_MUX_uxn_opcodes_h_l1047_c7_2680_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_2680_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_2680_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_2680_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1047_c7_2680_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_2680_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1048_c3_2a14_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1051_c11_7cb9_return_output,
 n16_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output,
 tmp16_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1055_c11_720a_return_output,
 n16_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output,
 tmp16_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1056_c3_5aef_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1057_c11_b838_return_output,
 sp_relative_shift_uxn_opcodes_h_l1058_c30_4d13_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4d5e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_ad1f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_ad1f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1063_c7_ad1f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_ad1f_return_output,
 CONST_SR_8_uxn_opcodes_h_l1066_c31_2f4c_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1053_l1044_DUPLICATE_9ee3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_523a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_523a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_523a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1039_c7_7067_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1039_c7_7067_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1039_c7_7067_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1031_c3_3bfc : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_7067_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1036_c3_4d06 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_7067_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1039_c7_7067_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_7067_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1026_c2_c2cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1026_c2_c2cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1026_c2_c2cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1026_c2_c2cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_7067_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_6aa5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_6aa5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_6aa5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1039_c7_7067_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1039_c7_7067_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1039_c7_7067_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_7067_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_7067_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1040_c3_6f82 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_7067_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1039_c7_7067_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_7067_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5989_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5989_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5989_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1047_c7_2680_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1042_c7_6c92_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1047_c7_2680_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1042_c7_6c92_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1047_c7_2680_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1042_c7_6c92_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_2680_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_6c92_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_2680_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_6c92_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1045_c3_3c6d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_2680_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_6c92_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1047_c7_2680_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c7_6c92_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_2680_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_6c92_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1bd5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1bd5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1bd5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1047_c7_2680_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1047_c7_2680_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1047_c7_2680_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_2680_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_2680_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1049_c3_688b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_2680_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1047_c7_2680_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_2680_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1048_c3_2a14_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1048_c3_2a14_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1048_c3_2a14_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_7cb9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_7cb9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_7cb9_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1051_c7_0abb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1051_c7_0abb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1051_c7_0abb_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_0abb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_0abb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_0abb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_0abb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_0abb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_0abb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_0abb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_0abb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_0abb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_0abb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_0abb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_0abb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1051_c7_0abb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1051_c7_0abb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1051_c7_0abb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_0abb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_0abb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_0abb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_720a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_720a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_720a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1055_c7_f8ee_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1055_c7_f8ee_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1055_c7_f8ee_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_f8ee_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_f8ee_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_f8ee_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_f8ee_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_f8ee_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_ad1f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_f8ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_f8ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_f8ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_ad1f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_f8ee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_f8ee_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1060_c3_24bd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_f8ee_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_ad1f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_f8ee_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_f8ee_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_f8ee_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_ad1f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_f8ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_f8ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_f8ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_f8ee_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c3_5aef_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c3_5aef_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c3_5aef_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1057_c11_b838_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1057_c11_b838_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1057_c11_b838_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1058_c30_4d13_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1058_c30_4d13_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1058_c30_4d13_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1058_c30_4d13_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1061_c21_4291_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4d5e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4d5e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4d5e_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_ad1f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1064_c3_9ddb : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_ad1f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_ad1f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_ad1f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_ad1f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_ad1f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_ad1f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_ad1f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_ad1f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_ad1f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1065_c3_f25b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_ad1f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_ad1f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1066_c31_2f4c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1066_c31_2f4c_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1066_c21_326a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1051_l1047_l1042_l1039_l1026_l1063_DUPLICATE_d585_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1051_l1047_l1042_l1039_l1063_DUPLICATE_ecd5_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1051_l1047_l1042_l1039_l1063_l1055_DUPLICATE_4f95_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1051_l1047_l1042_l1039_l1055_DUPLICATE_3d09_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1043_l1048_l1052_l1056_DUPLICATE_b252_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1053_l1044_DUPLICATE_9ee3_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1053_l1044_DUPLICATE_9ee3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1063_l1051_DUPLICATE_9495_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l1070_l1022_DUPLICATE_fbbb_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1045_c3_3c6d := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1045_c3_3c6d;
     VAR_sp_relative_shift_uxn_opcodes_h_l1058_c30_4d13_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1060_c3_24bd := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_f8ee_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1060_c3_24bd;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_523a_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_720a_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_7cb9_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1040_c3_6f82 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1040_c3_6f82;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_f8ee_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_ad1f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_6aa5_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1049_c3_688b := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1049_c3_688b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1036_c3_4d06 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1036_c3_4d06;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1064_c3_9ddb := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_ad1f_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1064_c3_9ddb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5989_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1031_c3_3bfc := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1031_c3_3bfc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1bd5_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4d5e_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1058_c30_4d13_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1065_c3_f25b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_ad1f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1065_c3_f25b;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1058_c30_4d13_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c3_5aef_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1055_c7_f8ee_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_523a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_6aa5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5989_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1bd5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_7cb9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_720a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4d5e_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1048_c3_2a14_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1057_c11_b838_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1066_c31_2f4c_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_0abb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_f8ee_iffalse := tmp16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1043_l1048_l1052_l1056_DUPLICATE_b252 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1043_l1048_l1052_l1056_DUPLICATE_b252_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1063_l1051_DUPLICATE_9495 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1063_l1051_DUPLICATE_9495_return_output := result.stack_address_sp_offset;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1026_c2_c2cc] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1026_c2_c2cc_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1047_c11_1bd5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1bd5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1bd5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1bd5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1bd5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1bd5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1bd5_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1051_l1047_l1042_l1039_l1026_l1063_DUPLICATE_d585 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1051_l1047_l1042_l1039_l1026_l1063_DUPLICATE_d585_return_output := result.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1051_l1047_l1042_l1039_l1063_DUPLICATE_ecd5 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1051_l1047_l1042_l1039_l1063_DUPLICATE_ecd5_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1042_c11_5989] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5989_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5989_left;
     BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5989_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5989_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5989_return_output := BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5989_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1026_c6_523a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1026_c6_523a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_523a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1026_c6_523a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_523a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_523a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1026_c6_523a_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1066_c31_2f4c] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1066_c31_2f4c_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1066_c31_2f4c_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1066_c31_2f4c_return_output := CONST_SR_8_uxn_opcodes_h_l1066_c31_2f4c_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1026_c2_c2cc] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1026_c2_c2cc_return_output := result.is_ram_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1026_c2_c2cc] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1026_c2_c2cc_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1051_l1047_l1042_l1039_l1055_DUPLICATE_3d09 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1051_l1047_l1042_l1039_l1055_DUPLICATE_3d09_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1051_c11_7cb9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1051_c11_7cb9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_7cb9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1051_c11_7cb9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_7cb9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_7cb9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1051_c11_7cb9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1051_l1047_l1042_l1039_l1063_l1055_DUPLICATE_4f95 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1051_l1047_l1042_l1039_l1063_l1055_DUPLICATE_4f95_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1055_c11_720a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1055_c11_720a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_720a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1055_c11_720a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_720a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_720a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1055_c11_720a_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1058_c30_4d13] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1058_c30_4d13_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1058_c30_4d13_ins;
     sp_relative_shift_uxn_opcodes_h_l1058_c30_4d13_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1058_c30_4d13_x;
     sp_relative_shift_uxn_opcodes_h_l1058_c30_4d13_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1058_c30_4d13_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1058_c30_4d13_return_output := sp_relative_shift_uxn_opcodes_h_l1058_c30_4d13_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1026_c2_c2cc] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1026_c2_c2cc_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1039_c11_6aa5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1039_c11_6aa5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_6aa5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1039_c11_6aa5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_6aa5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_6aa5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1039_c11_6aa5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1063_c11_4d5e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4d5e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4d5e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4d5e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4d5e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4d5e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4d5e_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_523a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_523a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_523a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_523a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_523a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_523a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_523a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_523a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_523a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_523a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_523a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1026_c6_523a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1039_c7_7067_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_6aa5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_7067_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_6aa5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_7067_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_6aa5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_7067_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_6aa5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_7067_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_6aa5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1039_c7_7067_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_6aa5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1039_c7_7067_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_6aa5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1039_c7_7067_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1039_c11_6aa5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1042_c7_6c92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5989_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_6c92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5989_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_6c92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5989_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_6c92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5989_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_6c92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5989_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c7_6c92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5989_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1042_c7_6c92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5989_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1042_c7_6c92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1042_c11_5989_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1047_c7_2680_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1bd5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_2680_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1bd5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_2680_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1bd5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_2680_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1bd5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_2680_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1bd5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1047_c7_2680_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1bd5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1047_c7_2680_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1bd5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1047_c7_2680_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1047_c11_1bd5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1051_c7_0abb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_7cb9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_0abb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_7cb9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_0abb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_7cb9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_0abb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_7cb9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_0abb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_7cb9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1051_c7_0abb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_7cb9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_0abb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1051_c11_7cb9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1055_c7_f8ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_720a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_f8ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_720a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_f8ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_720a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_f8ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_720a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_f8ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_720a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_f8ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_720a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_f8ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c11_720a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_ad1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4d5e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_ad1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4d5e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_ad1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4d5e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_ad1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_4d5e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1048_c3_2a14_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1043_l1048_l1052_l1056_DUPLICATE_b252_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c3_5aef_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1043_l1048_l1052_l1056_DUPLICATE_b252_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1053_l1044_DUPLICATE_9ee3_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1043_l1048_l1052_l1056_DUPLICATE_b252_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1051_l1047_l1042_l1039_l1063_DUPLICATE_ecd5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1051_l1047_l1042_l1039_l1063_DUPLICATE_ecd5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1051_l1047_l1042_l1039_l1063_DUPLICATE_ecd5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_0abb_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1051_l1047_l1042_l1039_l1063_DUPLICATE_ecd5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_ad1f_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1051_l1047_l1042_l1039_l1063_DUPLICATE_ecd5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1051_l1047_l1042_l1039_l1063_l1055_DUPLICATE_4f95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1051_l1047_l1042_l1039_l1063_l1055_DUPLICATE_4f95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1051_l1047_l1042_l1039_l1063_l1055_DUPLICATE_4f95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_0abb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1051_l1047_l1042_l1039_l1063_l1055_DUPLICATE_4f95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_f8ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1051_l1047_l1042_l1039_l1063_l1055_DUPLICATE_4f95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_ad1f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1051_l1047_l1042_l1039_l1063_l1055_DUPLICATE_4f95_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1051_l1047_l1042_l1039_l1055_DUPLICATE_3d09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1051_l1047_l1042_l1039_l1055_DUPLICATE_3d09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1051_l1047_l1042_l1039_l1055_DUPLICATE_3d09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_0abb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1051_l1047_l1042_l1039_l1055_DUPLICATE_3d09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_f8ee_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1051_l1047_l1042_l1039_l1055_DUPLICATE_3d09_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_0abb_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1063_l1051_DUPLICATE_9495_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_ad1f_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1063_l1051_DUPLICATE_9495_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1051_l1047_l1042_l1039_l1026_l1063_DUPLICATE_d585_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1051_l1047_l1042_l1039_l1026_l1063_DUPLICATE_d585_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1051_l1047_l1042_l1039_l1026_l1063_DUPLICATE_d585_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1051_l1047_l1042_l1039_l1026_l1063_DUPLICATE_d585_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1051_c7_0abb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1051_l1047_l1042_l1039_l1026_l1063_DUPLICATE_d585_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_ad1f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1051_l1047_l1042_l1039_l1026_l1063_DUPLICATE_d585_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1026_c2_c2cc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1026_c2_c2cc_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1026_c2_c2cc_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1026_c2_c2cc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_f8ee_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1058_c30_4d13_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1063_c7_ad1f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_ad1f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_ad1f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_ad1f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_ad1f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_ad1f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_ad1f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_ad1f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_ad1f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1063_c7_ad1f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_ad1f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_ad1f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_ad1f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_ad1f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_ad1f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_ad1f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_ad1f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_ad1f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1026_c2_c2cc] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1066_c21_326a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1066_c21_326a_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1066_c31_2f4c_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1063_c7_ad1f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_ad1f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_ad1f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_ad1f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_ad1f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_ad1f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_ad1f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_ad1f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_ad1f_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1026_c2_c2cc] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1026_c2_c2cc] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1053_l1044_DUPLICATE_9ee3 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1053_l1044_DUPLICATE_9ee3_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1053_l1044_DUPLICATE_9ee3_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1053_l1044_DUPLICATE_9ee3_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1053_l1044_DUPLICATE_9ee3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1055_c7_f8ee] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_f8ee_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_f8ee_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_f8ee_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_f8ee_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_f8ee_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_f8ee_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1026_c2_c2cc] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1048_c3_2a14] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1048_c3_2a14_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1048_c3_2a14_left;
     BIN_OP_OR_uxn_opcodes_h_l1048_c3_2a14_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1048_c3_2a14_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1048_c3_2a14_return_output := BIN_OP_OR_uxn_opcodes_h_l1048_c3_2a14_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1056_c3_5aef] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1056_c3_5aef_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c3_5aef_left;
     BIN_OP_OR_uxn_opcodes_h_l1056_c3_5aef_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c3_5aef_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c3_5aef_return_output := BIN_OP_OR_uxn_opcodes_h_l1056_c3_5aef_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1048_c3_2a14_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1057_c11_b838_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c3_5aef_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1055_c7_f8ee_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1056_c3_5aef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_ad1f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1066_c21_326a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1051_c7_0abb_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1053_l1044_DUPLICATE_9ee3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1053_l1044_DUPLICATE_9ee3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_f8ee_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_ad1f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_0abb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_f8ee_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_ad1f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_f8ee_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_ad1f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1055_c7_f8ee] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_f8ee_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_f8ee_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_f8ee_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_f8ee_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_f8ee_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_f8ee_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output;

     -- n16_MUX[uxn_opcodes_h_l1055_c7_f8ee] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1055_c7_f8ee_cond <= VAR_n16_MUX_uxn_opcodes_h_l1055_c7_f8ee_cond;
     n16_MUX_uxn_opcodes_h_l1055_c7_f8ee_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1055_c7_f8ee_iftrue;
     n16_MUX_uxn_opcodes_h_l1055_c7_f8ee_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1055_c7_f8ee_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output := n16_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1055_c7_f8ee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_f8ee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_f8ee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_f8ee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_f8ee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_f8ee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_f8ee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1051_c7_0abb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_0abb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_0abb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_0abb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_0abb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_0abb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_0abb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1055_c7_f8ee] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_f8ee_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_f8ee_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_f8ee_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_f8ee_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_f8ee_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_f8ee_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1057_c11_b838] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1057_c11_b838_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1057_c11_b838_left;
     BIN_OP_OR_uxn_opcodes_h_l1057_c11_b838_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1057_c11_b838_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1057_c11_b838_return_output := BIN_OP_OR_uxn_opcodes_h_l1057_c11_b838_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1063_c7_ad1f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1063_c7_ad1f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_ad1f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1063_c7_ad1f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_ad1f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1063_c7_ad1f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_ad1f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_ad1f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1063_c7_ad1f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1047_c7_2680] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1047_c7_2680_cond <= VAR_t16_MUX_uxn_opcodes_h_l1047_c7_2680_cond;
     t16_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue;
     t16_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1047_c7_2680_return_output := t16_MUX_uxn_opcodes_h_l1047_c7_2680_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_f8ee_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1057_c11_b838_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1051_c7_0abb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_0abb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_0abb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_0abb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_f8ee_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1063_c7_ad1f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1047_c7_2680_return_output;
     -- t16_MUX[uxn_opcodes_h_l1042_c7_6c92] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1042_c7_6c92_cond <= VAR_t16_MUX_uxn_opcodes_h_l1042_c7_6c92_cond;
     t16_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue;
     t16_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output := t16_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1051_c7_0abb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_0abb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_0abb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_0abb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_0abb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_0abb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_0abb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1061_c21_4291] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1061_c21_4291_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1057_c11_b838_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1047_c7_2680] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_2680_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_2680_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_2680_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_2680_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1051_c7_0abb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_0abb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_0abb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_0abb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_0abb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_0abb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_0abb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output;

     -- n16_MUX[uxn_opcodes_h_l1051_c7_0abb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1051_c7_0abb_cond <= VAR_n16_MUX_uxn_opcodes_h_l1051_c7_0abb_cond;
     n16_MUX_uxn_opcodes_h_l1051_c7_0abb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1051_c7_0abb_iftrue;
     n16_MUX_uxn_opcodes_h_l1051_c7_0abb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1051_c7_0abb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output := n16_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1055_c7_f8ee] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1055_c7_f8ee_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_f8ee_cond;
     tmp16_MUX_uxn_opcodes_h_l1055_c7_f8ee_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_f8ee_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1055_c7_f8ee_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_f8ee_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output := tmp16_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1051_c7_0abb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_0abb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_0abb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_0abb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_0abb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_0abb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_0abb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_f8ee_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1061_c21_4291_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1047_c7_2680_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_0abb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1047_c7_2680] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_2680_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_2680_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_2680_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_2680_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1055_c7_f8ee] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1055_c7_f8ee_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_f8ee_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1055_c7_f8ee_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_f8ee_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1055_c7_f8ee_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_f8ee_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output := result_u8_value_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output;

     -- t16_MUX[uxn_opcodes_h_l1039_c7_7067] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1039_c7_7067_cond <= VAR_t16_MUX_uxn_opcodes_h_l1039_c7_7067_cond;
     t16_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue;
     t16_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1039_c7_7067_return_output := t16_MUX_uxn_opcodes_h_l1039_c7_7067_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1051_c7_0abb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1051_c7_0abb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_0abb_cond;
     tmp16_MUX_uxn_opcodes_h_l1051_c7_0abb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_0abb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1051_c7_0abb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_0abb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output := tmp16_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1042_c7_6c92] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_6c92_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_6c92_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output;

     -- n16_MUX[uxn_opcodes_h_l1047_c7_2680] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1047_c7_2680_cond <= VAR_n16_MUX_uxn_opcodes_h_l1047_c7_2680_cond;
     n16_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue;
     n16_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1047_c7_2680_return_output := n16_MUX_uxn_opcodes_h_l1047_c7_2680_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1047_c7_2680] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_2680_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_2680_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_2680_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_2680_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1047_c7_2680] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_2680_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_2680_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_2680_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_2680_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1047_c7_2680_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1047_c7_2680_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1047_c7_2680_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1047_c7_2680_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1051_c7_0abb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1055_c7_f8ee_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1039_c7_7067_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1047_c7_2680] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1047_c7_2680_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1047_c7_2680_cond;
     tmp16_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1047_c7_2680_return_output := tmp16_MUX_uxn_opcodes_h_l1047_c7_2680_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1051_c7_0abb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1051_c7_0abb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1051_c7_0abb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1051_c7_0abb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1051_c7_0abb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1051_c7_0abb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1051_c7_0abb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output := result_u8_value_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1042_c7_6c92] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_6c92_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_6c92_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output;

     -- n16_MUX[uxn_opcodes_h_l1042_c7_6c92] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1042_c7_6c92_cond <= VAR_n16_MUX_uxn_opcodes_h_l1042_c7_6c92_cond;
     n16_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue;
     n16_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output := n16_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output;

     -- t16_MUX[uxn_opcodes_h_l1026_c2_c2cc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond <= VAR_t16_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond;
     t16_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue;
     t16_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output := t16_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1042_c7_6c92] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_6c92_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_6c92_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1042_c7_6c92] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_6c92_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_6c92_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1039_c7_7067] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_7067_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_7067_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_7067_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_7067_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1039_c7_7067_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1051_c7_0abb_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1047_c7_2680_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1039_c7_7067] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_7067_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_7067_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_7067_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_7067_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1026_c2_c2cc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1047_c7_2680] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1047_c7_2680_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1047_c7_2680_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1047_c7_2680_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1047_c7_2680_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1047_c7_2680_return_output := result_u8_value_MUX_uxn_opcodes_h_l1047_c7_2680_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1042_c7_6c92] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1042_c7_6c92_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1042_c7_6c92_cond;
     tmp16_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output := tmp16_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output;

     -- n16_MUX[uxn_opcodes_h_l1039_c7_7067] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1039_c7_7067_cond <= VAR_n16_MUX_uxn_opcodes_h_l1039_c7_7067_cond;
     n16_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue;
     n16_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1039_c7_7067_return_output := n16_MUX_uxn_opcodes_h_l1039_c7_7067_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1039_c7_7067] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_7067_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_7067_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_7067_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_7067_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1039_c7_7067] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_7067_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_7067_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_7067_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_7067_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1039_c7_7067_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1039_c7_7067_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1039_c7_7067_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1039_c7_7067_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1047_c7_2680_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1039_c7_7067] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1039_c7_7067_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1039_c7_7067_cond;
     tmp16_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1039_c7_7067_return_output := tmp16_MUX_uxn_opcodes_h_l1039_c7_7067_return_output;

     -- n16_MUX[uxn_opcodes_h_l1026_c2_c2cc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond <= VAR_n16_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond;
     n16_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue;
     n16_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output := n16_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1026_c2_c2cc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1026_c2_c2cc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1042_c7_6c92] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1042_c7_6c92_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c7_6c92_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c7_6c92_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c7_6c92_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output := result_u8_value_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1026_c2_c2cc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1042_c7_6c92_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1039_c7_7067_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1026_c2_c2cc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond;
     tmp16_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output := tmp16_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1039_c7_7067] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1039_c7_7067_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1039_c7_7067_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1039_c7_7067_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1039_c7_7067_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1039_c7_7067_return_output := result_u8_value_MUX_uxn_opcodes_h_l1039_c7_7067_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1039_c7_7067_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1026_c2_c2cc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c2_c2cc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c2_c2cc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c2_c2cc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output := result_u8_value_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l1070_l1022_DUPLICATE_fbbb LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l1070_l1022_DUPLICATE_fbbb_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a6df(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1026_c2_c2cc_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l1070_l1022_DUPLICATE_fbbb_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a6df_uxn_opcodes_h_l1070_l1022_DUPLICATE_fbbb_return_output;
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
