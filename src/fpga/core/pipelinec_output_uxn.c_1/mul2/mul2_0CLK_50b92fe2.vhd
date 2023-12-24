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
entity mul2_0CLK_50b92fe2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end mul2_0CLK_50b92fe2;
architecture arch of mul2_0CLK_50b92fe2 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2021_c6_25a6]
signal BIN_OP_EQ_uxn_opcodes_h_l2021_c6_25a6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2021_c6_25a6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2021_c6_25a6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2021_c2_794b]
signal n16_MUX_uxn_opcodes_h_l2021_c2_794b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2021_c2_794b_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2021_c2_794b]
signal tmp16_MUX_uxn_opcodes_h_l2021_c2_794b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2021_c2_794b_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2021_c2_794b]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_794b_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_794b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2021_c2_794b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_794b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_794b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2021_c2_794b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_794b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_794b_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2021_c2_794b]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_794b_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_794b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2021_c2_794b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_794b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_794b_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2021_c2_794b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_794b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_794b_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2021_c2_794b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_794b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_794b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2021_c2_794b]
signal result_u8_value_MUX_uxn_opcodes_h_l2021_c2_794b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2021_c2_794b_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2021_c2_794b]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_794b_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_794b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2021_c2_794b]
signal t16_MUX_uxn_opcodes_h_l2021_c2_794b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2021_c2_794b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2034_c11_41ac]
signal BIN_OP_EQ_uxn_opcodes_h_l2034_c11_41ac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2034_c11_41ac_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2034_c11_41ac_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2034_c7_dca3]
signal n16_MUX_uxn_opcodes_h_l2034_c7_dca3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2034_c7_dca3]
signal tmp16_MUX_uxn_opcodes_h_l2034_c7_dca3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2034_c7_dca3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_dca3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2034_c7_dca3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_dca3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2034_c7_dca3]
signal result_u8_value_MUX_uxn_opcodes_h_l2034_c7_dca3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2034_c7_dca3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_dca3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2034_c7_dca3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_dca3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2034_c7_dca3]
signal t16_MUX_uxn_opcodes_h_l2034_c7_dca3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2037_c11_cc25]
signal BIN_OP_EQ_uxn_opcodes_h_l2037_c11_cc25_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2037_c11_cc25_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2037_c11_cc25_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2037_c7_b51c]
signal n16_MUX_uxn_opcodes_h_l2037_c7_b51c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2037_c7_b51c]
signal tmp16_MUX_uxn_opcodes_h_l2037_c7_b51c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2037_c7_b51c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b51c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2037_c7_b51c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b51c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2037_c7_b51c]
signal result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b51c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2037_c7_b51c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b51c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2037_c7_b51c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b51c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2037_c7_b51c]
signal t16_MUX_uxn_opcodes_h_l2037_c7_b51c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2042_c11_8a8e]
signal BIN_OP_EQ_uxn_opcodes_h_l2042_c11_8a8e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2042_c11_8a8e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2042_c11_8a8e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2042_c7_7799]
signal n16_MUX_uxn_opcodes_h_l2042_c7_7799_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2042_c7_7799_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2042_c7_7799]
signal tmp16_MUX_uxn_opcodes_h_l2042_c7_7799_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2042_c7_7799_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2042_c7_7799]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_7799_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_7799_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2042_c7_7799]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_7799_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_7799_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2042_c7_7799]
signal result_u8_value_MUX_uxn_opcodes_h_l2042_c7_7799_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2042_c7_7799_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2042_c7_7799]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_7799_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_7799_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2042_c7_7799]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_7799_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_7799_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2042_c7_7799]
signal t16_MUX_uxn_opcodes_h_l2042_c7_7799_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2042_c7_7799_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2043_c3_6b4e]
signal BIN_OP_OR_uxn_opcodes_h_l2043_c3_6b4e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2043_c3_6b4e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2043_c3_6b4e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2046_c11_5438]
signal BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5438_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5438_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5438_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2046_c7_0ebc]
signal n16_MUX_uxn_opcodes_h_l2046_c7_0ebc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2046_c7_0ebc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2046_c7_0ebc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2046_c7_0ebc]
signal tmp16_MUX_uxn_opcodes_h_l2046_c7_0ebc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2046_c7_0ebc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2046_c7_0ebc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2046_c7_0ebc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_0ebc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_0ebc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_0ebc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2046_c7_0ebc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_0ebc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_0ebc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_0ebc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2046_c7_0ebc]
signal result_u8_value_MUX_uxn_opcodes_h_l2046_c7_0ebc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2046_c7_0ebc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2046_c7_0ebc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2046_c7_0ebc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_0ebc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_0ebc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_0ebc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2046_c7_0ebc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_0ebc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_0ebc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_0ebc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2050_c11_df13]
signal BIN_OP_EQ_uxn_opcodes_h_l2050_c11_df13_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2050_c11_df13_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2050_c11_df13_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2050_c7_aef7]
signal n16_MUX_uxn_opcodes_h_l2050_c7_aef7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2050_c7_aef7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2050_c7_aef7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2050_c7_aef7]
signal tmp16_MUX_uxn_opcodes_h_l2050_c7_aef7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2050_c7_aef7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2050_c7_aef7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2050_c7_aef7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_aef7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_aef7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_aef7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2050_c7_aef7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_aef7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_aef7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_aef7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2050_c7_aef7]
signal result_u8_value_MUX_uxn_opcodes_h_l2050_c7_aef7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2050_c7_aef7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2050_c7_aef7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2050_c7_aef7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_aef7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_aef7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_aef7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2050_c7_aef7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_aef7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_aef7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_aef7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2051_c3_5c5b]
signal BIN_OP_OR_uxn_opcodes_h_l2051_c3_5c5b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2051_c3_5c5b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2051_c3_5c5b_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2052_c11_4e68]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2052_c11_4e68_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2052_c11_4e68_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2052_c11_4e68_return_output : unsigned(31 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2053_c30_b201]
signal sp_relative_shift_uxn_opcodes_h_l2053_c30_b201_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2053_c30_b201_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2053_c30_b201_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2053_c30_b201_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2058_c11_a6e7]
signal BIN_OP_EQ_uxn_opcodes_h_l2058_c11_a6e7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2058_c11_a6e7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2058_c11_a6e7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2058_c7_712c]
signal result_u8_value_MUX_uxn_opcodes_h_l2058_c7_712c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2058_c7_712c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2058_c7_712c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2058_c7_712c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2058_c7_712c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_712c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_712c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_712c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_712c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2058_c7_712c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_712c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_712c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_712c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_712c_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2058_c7_712c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_712c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_712c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_712c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_712c_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2061_c31_858c]
signal CONST_SR_8_uxn_opcodes_h_l2061_c31_858c_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2061_c31_858c_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2048_l2039_DUPLICATE_6804
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2048_l2039_DUPLICATE_6804_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2048_l2039_DUPLICATE_6804_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_a47b( ref_toks_0 : opcode_result_t;
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
      base.is_ram_write := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.u8_value := ref_toks_8;
      base.is_vram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2021_c6_25a6
BIN_OP_EQ_uxn_opcodes_h_l2021_c6_25a6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2021_c6_25a6_left,
BIN_OP_EQ_uxn_opcodes_h_l2021_c6_25a6_right,
BIN_OP_EQ_uxn_opcodes_h_l2021_c6_25a6_return_output);

-- n16_MUX_uxn_opcodes_h_l2021_c2_794b
n16_MUX_uxn_opcodes_h_l2021_c2_794b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2021_c2_794b_cond,
n16_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue,
n16_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse,
n16_MUX_uxn_opcodes_h_l2021_c2_794b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2021_c2_794b
tmp16_MUX_uxn_opcodes_h_l2021_c2_794b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2021_c2_794b_cond,
tmp16_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue,
tmp16_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse,
tmp16_MUX_uxn_opcodes_h_l2021_c2_794b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_794b
result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_794b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_794b_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_794b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_794b
result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_794b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_794b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_794b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_794b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_794b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_794b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_794b_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_794b
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_794b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_794b_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_794b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_794b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_794b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_794b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_794b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_794b
result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_794b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_794b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_794b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_794b
result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_794b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_794b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_794b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2021_c2_794b
result_u8_value_MUX_uxn_opcodes_h_l2021_c2_794b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2021_c2_794b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2021_c2_794b_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_794b
result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_794b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_794b_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_794b_return_output);

-- t16_MUX_uxn_opcodes_h_l2021_c2_794b
t16_MUX_uxn_opcodes_h_l2021_c2_794b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2021_c2_794b_cond,
t16_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue,
t16_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse,
t16_MUX_uxn_opcodes_h_l2021_c2_794b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2034_c11_41ac
BIN_OP_EQ_uxn_opcodes_h_l2034_c11_41ac : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2034_c11_41ac_left,
BIN_OP_EQ_uxn_opcodes_h_l2034_c11_41ac_right,
BIN_OP_EQ_uxn_opcodes_h_l2034_c11_41ac_return_output);

-- n16_MUX_uxn_opcodes_h_l2034_c7_dca3
n16_MUX_uxn_opcodes_h_l2034_c7_dca3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2034_c7_dca3_cond,
n16_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue,
n16_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse,
n16_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2034_c7_dca3
tmp16_MUX_uxn_opcodes_h_l2034_c7_dca3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2034_c7_dca3_cond,
tmp16_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue,
tmp16_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse,
tmp16_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_dca3
result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_dca3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_dca3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_dca3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_dca3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_dca3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2034_c7_dca3
result_u8_value_MUX_uxn_opcodes_h_l2034_c7_dca3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2034_c7_dca3_cond,
result_u8_value_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_dca3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_dca3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_dca3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_dca3
result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_dca3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_dca3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output);

-- t16_MUX_uxn_opcodes_h_l2034_c7_dca3
t16_MUX_uxn_opcodes_h_l2034_c7_dca3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2034_c7_dca3_cond,
t16_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue,
t16_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse,
t16_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2037_c11_cc25
BIN_OP_EQ_uxn_opcodes_h_l2037_c11_cc25 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2037_c11_cc25_left,
BIN_OP_EQ_uxn_opcodes_h_l2037_c11_cc25_right,
BIN_OP_EQ_uxn_opcodes_h_l2037_c11_cc25_return_output);

-- n16_MUX_uxn_opcodes_h_l2037_c7_b51c
n16_MUX_uxn_opcodes_h_l2037_c7_b51c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2037_c7_b51c_cond,
n16_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue,
n16_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse,
n16_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2037_c7_b51c
tmp16_MUX_uxn_opcodes_h_l2037_c7_b51c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2037_c7_b51c_cond,
tmp16_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue,
tmp16_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse,
tmp16_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b51c
result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b51c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b51c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b51c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b51c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b51c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b51c
result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b51c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b51c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b51c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b51c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b51c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b51c
result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b51c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b51c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output);

-- t16_MUX_uxn_opcodes_h_l2037_c7_b51c
t16_MUX_uxn_opcodes_h_l2037_c7_b51c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2037_c7_b51c_cond,
t16_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue,
t16_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse,
t16_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2042_c11_8a8e
BIN_OP_EQ_uxn_opcodes_h_l2042_c11_8a8e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2042_c11_8a8e_left,
BIN_OP_EQ_uxn_opcodes_h_l2042_c11_8a8e_right,
BIN_OP_EQ_uxn_opcodes_h_l2042_c11_8a8e_return_output);

-- n16_MUX_uxn_opcodes_h_l2042_c7_7799
n16_MUX_uxn_opcodes_h_l2042_c7_7799 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2042_c7_7799_cond,
n16_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue,
n16_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse,
n16_MUX_uxn_opcodes_h_l2042_c7_7799_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2042_c7_7799
tmp16_MUX_uxn_opcodes_h_l2042_c7_7799 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2042_c7_7799_cond,
tmp16_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue,
tmp16_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse,
tmp16_MUX_uxn_opcodes_h_l2042_c7_7799_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_7799
result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_7799 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_7799_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_7799_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_7799
result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_7799 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_7799_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_7799_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2042_c7_7799
result_u8_value_MUX_uxn_opcodes_h_l2042_c7_7799 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2042_c7_7799_cond,
result_u8_value_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2042_c7_7799_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_7799
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_7799 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_7799_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_7799_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_7799
result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_7799 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_7799_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_7799_return_output);

-- t16_MUX_uxn_opcodes_h_l2042_c7_7799
t16_MUX_uxn_opcodes_h_l2042_c7_7799 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2042_c7_7799_cond,
t16_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue,
t16_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse,
t16_MUX_uxn_opcodes_h_l2042_c7_7799_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2043_c3_6b4e
BIN_OP_OR_uxn_opcodes_h_l2043_c3_6b4e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2043_c3_6b4e_left,
BIN_OP_OR_uxn_opcodes_h_l2043_c3_6b4e_right,
BIN_OP_OR_uxn_opcodes_h_l2043_c3_6b4e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5438
BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5438 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5438_left,
BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5438_right,
BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5438_return_output);

-- n16_MUX_uxn_opcodes_h_l2046_c7_0ebc
n16_MUX_uxn_opcodes_h_l2046_c7_0ebc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2046_c7_0ebc_cond,
n16_MUX_uxn_opcodes_h_l2046_c7_0ebc_iftrue,
n16_MUX_uxn_opcodes_h_l2046_c7_0ebc_iffalse,
n16_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2046_c7_0ebc
tmp16_MUX_uxn_opcodes_h_l2046_c7_0ebc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2046_c7_0ebc_cond,
tmp16_MUX_uxn_opcodes_h_l2046_c7_0ebc_iftrue,
tmp16_MUX_uxn_opcodes_h_l2046_c7_0ebc_iffalse,
tmp16_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_0ebc
result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_0ebc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_0ebc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_0ebc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_0ebc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_0ebc
result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_0ebc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_0ebc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_0ebc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_0ebc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2046_c7_0ebc
result_u8_value_MUX_uxn_opcodes_h_l2046_c7_0ebc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2046_c7_0ebc_cond,
result_u8_value_MUX_uxn_opcodes_h_l2046_c7_0ebc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2046_c7_0ebc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_0ebc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_0ebc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_0ebc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_0ebc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_0ebc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_0ebc
result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_0ebc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_0ebc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_0ebc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_0ebc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2050_c11_df13
BIN_OP_EQ_uxn_opcodes_h_l2050_c11_df13 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2050_c11_df13_left,
BIN_OP_EQ_uxn_opcodes_h_l2050_c11_df13_right,
BIN_OP_EQ_uxn_opcodes_h_l2050_c11_df13_return_output);

-- n16_MUX_uxn_opcodes_h_l2050_c7_aef7
n16_MUX_uxn_opcodes_h_l2050_c7_aef7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2050_c7_aef7_cond,
n16_MUX_uxn_opcodes_h_l2050_c7_aef7_iftrue,
n16_MUX_uxn_opcodes_h_l2050_c7_aef7_iffalse,
n16_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2050_c7_aef7
tmp16_MUX_uxn_opcodes_h_l2050_c7_aef7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2050_c7_aef7_cond,
tmp16_MUX_uxn_opcodes_h_l2050_c7_aef7_iftrue,
tmp16_MUX_uxn_opcodes_h_l2050_c7_aef7_iffalse,
tmp16_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_aef7
result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_aef7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_aef7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_aef7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_aef7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_aef7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_aef7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_aef7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_aef7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_aef7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2050_c7_aef7
result_u8_value_MUX_uxn_opcodes_h_l2050_c7_aef7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2050_c7_aef7_cond,
result_u8_value_MUX_uxn_opcodes_h_l2050_c7_aef7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2050_c7_aef7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_aef7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_aef7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_aef7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_aef7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_aef7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_aef7
result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_aef7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_aef7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_aef7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_aef7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2051_c3_5c5b
BIN_OP_OR_uxn_opcodes_h_l2051_c3_5c5b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2051_c3_5c5b_left,
BIN_OP_OR_uxn_opcodes_h_l2051_c3_5c5b_right,
BIN_OP_OR_uxn_opcodes_h_l2051_c3_5c5b_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2052_c11_4e68
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2052_c11_4e68 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2052_c11_4e68_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2052_c11_4e68_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2052_c11_4e68_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2053_c30_b201
sp_relative_shift_uxn_opcodes_h_l2053_c30_b201 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2053_c30_b201_ins,
sp_relative_shift_uxn_opcodes_h_l2053_c30_b201_x,
sp_relative_shift_uxn_opcodes_h_l2053_c30_b201_y,
sp_relative_shift_uxn_opcodes_h_l2053_c30_b201_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2058_c11_a6e7
BIN_OP_EQ_uxn_opcodes_h_l2058_c11_a6e7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2058_c11_a6e7_left,
BIN_OP_EQ_uxn_opcodes_h_l2058_c11_a6e7_right,
BIN_OP_EQ_uxn_opcodes_h_l2058_c11_a6e7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2058_c7_712c
result_u8_value_MUX_uxn_opcodes_h_l2058_c7_712c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2058_c7_712c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2058_c7_712c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2058_c7_712c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2058_c7_712c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_712c
result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_712c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_712c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_712c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_712c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_712c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_712c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_712c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_712c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_712c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_712c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_712c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_712c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_712c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_712c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_712c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_712c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_712c_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2061_c31_858c
CONST_SR_8_uxn_opcodes_h_l2061_c31_858c : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2061_c31_858c_x,
CONST_SR_8_uxn_opcodes_h_l2061_c31_858c_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2048_l2039_DUPLICATE_6804
CONST_SL_8_uint16_t_uxn_opcodes_h_l2048_l2039_DUPLICATE_6804 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2048_l2039_DUPLICATE_6804_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2048_l2039_DUPLICATE_6804_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2021_c6_25a6_return_output,
 n16_MUX_uxn_opcodes_h_l2021_c2_794b_return_output,
 tmp16_MUX_uxn_opcodes_h_l2021_c2_794b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_794b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_794b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_794b_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_794b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_794b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_794b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_794b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2021_c2_794b_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_794b_return_output,
 t16_MUX_uxn_opcodes_h_l2021_c2_794b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2034_c11_41ac_return_output,
 n16_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output,
 tmp16_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output,
 t16_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2037_c11_cc25_return_output,
 n16_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output,
 tmp16_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output,
 t16_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2042_c11_8a8e_return_output,
 n16_MUX_uxn_opcodes_h_l2042_c7_7799_return_output,
 tmp16_MUX_uxn_opcodes_h_l2042_c7_7799_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_7799_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_7799_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2042_c7_7799_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_7799_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_7799_return_output,
 t16_MUX_uxn_opcodes_h_l2042_c7_7799_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2043_c3_6b4e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5438_return_output,
 n16_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output,
 tmp16_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2050_c11_df13_return_output,
 n16_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output,
 tmp16_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2051_c3_5c5b_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2052_c11_4e68_return_output,
 sp_relative_shift_uxn_opcodes_h_l2053_c30_b201_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2058_c11_a6e7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2058_c7_712c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_712c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_712c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_712c_return_output,
 CONST_SR_8_uxn_opcodes_h_l2061_c31_858c_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2048_l2039_DUPLICATE_6804_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c6_25a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c6_25a6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c6_25a6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2021_c2_794b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2021_c2_794b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2021_c2_794b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2021_c2_794b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2021_c2_794b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_794b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_794b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_794b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_794b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2026_c3_0a9d : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_794b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_794b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2021_c2_794b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_794b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_794b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2031_c3_8e98 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_794b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_794b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_794b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_794b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2021_c2_794b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_794b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_794b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c2_794b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c2_794b_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2021_c2_794b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_794b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_794b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2021_c2_794b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2021_c2_794b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_41ac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_41ac_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_41ac_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2034_c7_dca3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_dca3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_dca3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_dca3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_dca3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2035_c3_bc33 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_dca3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_dca3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2034_c7_dca3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_cc25_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_cc25_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_cc25_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2042_c7_7799_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2037_c7_b51c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2042_c7_7799_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2037_c7_b51c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_7799_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b51c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_7799_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b51c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_7799_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b51c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2040_c3_792a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_7799_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b51c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_7799_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b51c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2042_c7_7799_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2037_c7_b51c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_8a8e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_8a8e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_8a8e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2042_c7_7799_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2042_c7_7799_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_7799_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_7799_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_7799_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2044_c3_5d9a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_7799_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_7799_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2042_c7_7799_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2043_c3_6b4e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2043_c3_6b4e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2043_c3_6b4e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5438_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5438_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5438_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2046_c7_0ebc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2046_c7_0ebc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2046_c7_0ebc_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2046_c7_0ebc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2046_c7_0ebc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2046_c7_0ebc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_0ebc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_0ebc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_0ebc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_0ebc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_0ebc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_0ebc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2046_c7_0ebc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2046_c7_0ebc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2046_c7_0ebc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_0ebc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_0ebc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_0ebc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_0ebc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_0ebc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_0ebc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_df13_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_df13_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_df13_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2050_c7_aef7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2050_c7_aef7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2050_c7_aef7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2050_c7_aef7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l2052_c3_36c2 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2050_c7_aef7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2050_c7_aef7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_aef7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_aef7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_712c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_aef7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_aef7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_aef7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_712c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_aef7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2050_c7_aef7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2050_c7_aef7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2058_c7_712c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2050_c7_aef7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_aef7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2055_c3_1ed3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_aef7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_712c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_aef7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_aef7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_aef7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_aef7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2051_c3_5c5b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2051_c3_5c5b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2051_c3_5c5b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2052_c11_4e68_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2052_c11_4e68_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2052_c11_4e68_return_output : unsigned(31 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2053_c30_b201_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2053_c30_b201_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2053_c30_b201_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2053_c30_b201_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2056_c21_9ebe_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_a6e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_a6e7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_a6e7_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2058_c7_712c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2058_c7_712c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2058_c7_712c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_712c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_712c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_712c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_712c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2059_c3_a76b : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_712c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_712c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_712c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2060_c3_fa57 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_712c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_712c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2061_c31_858c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2061_c31_858c_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2061_c21_a234_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2037_l2034_l2021_l2058_l2046_l2042_DUPLICATE_eedf_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2037_l2034_l2058_l2050_l2046_l2042_DUPLICATE_89bc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2037_l2034_l2058_l2046_l2042_DUPLICATE_5e68_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2037_l2034_l2050_l2046_l2042_DUPLICATE_0346_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2047_l2051_l2038_l2043_DUPLICATE_3efd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2048_l2039_DUPLICATE_6804_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2048_l2039_DUPLICATE_6804_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2046_l2058_DUPLICATE_4960_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l2017_l2065_DUPLICATE_31ac_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_a6e7_right := to_unsigned(6, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2055_c3_1ed3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_aef7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2055_c3_1ed3;
     VAR_sp_relative_shift_uxn_opcodes_h_l2053_c30_b201_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_41ac_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2060_c3_fa57 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_712c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2060_c3_fa57;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2031_c3_8e98 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2031_c3_8e98;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_712c_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2059_c3_a76b := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_712c_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2059_c3_a76b;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2026_c3_0a9d := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2026_c3_0a9d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2044_c3_5d9a := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2044_c3_5d9a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2035_c3_bc33 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2035_c3_bc33;
     VAR_sp_relative_shift_uxn_opcodes_h_l2053_c30_b201_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_df13_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2040_c3_792a := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2040_c3_792a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_cc25_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_8a8e_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c6_25a6_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_aef7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5438_right := to_unsigned(4, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2053_c30_b201_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2051_c3_5c5b_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2050_c7_aef7_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c6_25a6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_41ac_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_cc25_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_8a8e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5438_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_df13_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_a6e7_left := VAR_phase;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2052_c11_4e68_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2043_c3_6b4e_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2061_c31_858c_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2046_c7_0ebc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2050_c7_aef7_iffalse := tmp16;
     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2046_l2058_DUPLICATE_4960 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2046_l2058_DUPLICATE_4960_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2042_c11_8a8e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2042_c11_8a8e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_8a8e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2042_c11_8a8e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_8a8e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_8a8e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2042_c11_8a8e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2021_c6_25a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2021_c6_25a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c6_25a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2021_c6_25a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c6_25a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c6_25a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2021_c6_25a6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2037_c11_cc25] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2037_c11_cc25_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_cc25_left;
     BIN_OP_EQ_uxn_opcodes_h_l2037_c11_cc25_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_cc25_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_cc25_return_output := BIN_OP_EQ_uxn_opcodes_h_l2037_c11_cc25_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2047_l2051_l2038_l2043_DUPLICATE_3efd LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2047_l2051_l2038_l2043_DUPLICATE_3efd_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2021_c2_794b] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2021_c2_794b_return_output := result.is_vram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2021_c2_794b] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2021_c2_794b_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2037_l2034_l2058_l2050_l2046_l2042_DUPLICATE_89bc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2037_l2034_l2058_l2050_l2046_l2042_DUPLICATE_89bc_return_output := result.is_opc_done;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2021_c2_794b] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2021_c2_794b_return_output := result.is_ram_write;

     -- sp_relative_shift[uxn_opcodes_h_l2053_c30_b201] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2053_c30_b201_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2053_c30_b201_ins;
     sp_relative_shift_uxn_opcodes_h_l2053_c30_b201_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2053_c30_b201_x;
     sp_relative_shift_uxn_opcodes_h_l2053_c30_b201_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2053_c30_b201_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2053_c30_b201_return_output := sp_relative_shift_uxn_opcodes_h_l2053_c30_b201_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2061_c31_858c] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2061_c31_858c_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2061_c31_858c_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2061_c31_858c_return_output := CONST_SR_8_uxn_opcodes_h_l2061_c31_858c_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2037_l2034_l2058_l2046_l2042_DUPLICATE_5e68 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2037_l2034_l2058_l2046_l2042_DUPLICATE_5e68_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2037_l2034_l2050_l2046_l2042_DUPLICATE_0346 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2037_l2034_l2050_l2046_l2042_DUPLICATE_0346_return_output := result.is_stack_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2021_c2_794b] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2021_c2_794b_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2050_c11_df13] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2050_c11_df13_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_df13_left;
     BIN_OP_EQ_uxn_opcodes_h_l2050_c11_df13_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_df13_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_df13_return_output := BIN_OP_EQ_uxn_opcodes_h_l2050_c11_df13_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2058_c11_a6e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2058_c11_a6e7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_a6e7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2058_c11_a6e7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_a6e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_a6e7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2058_c11_a6e7_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2037_l2034_l2021_l2058_l2046_l2042_DUPLICATE_eedf LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2037_l2034_l2021_l2058_l2046_l2042_DUPLICATE_eedf_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2034_c11_41ac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2034_c11_41ac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_41ac_left;
     BIN_OP_EQ_uxn_opcodes_h_l2034_c11_41ac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_41ac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_41ac_return_output := BIN_OP_EQ_uxn_opcodes_h_l2034_c11_41ac_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2046_c11_5438] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5438_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5438_left;
     BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5438_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5438_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5438_return_output := BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5438_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2021_c2_794b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c6_25a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_794b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c6_25a6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_794b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c6_25a6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_794b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c6_25a6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_794b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c6_25a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_794b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c6_25a6_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_794b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c6_25a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_794b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c6_25a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_794b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c6_25a6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c2_794b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c6_25a6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2021_c2_794b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c6_25a6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2021_c2_794b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2021_c6_25a6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2034_c7_dca3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_41ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_dca3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_41ac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_dca3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_41ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_dca3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_41ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_dca3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_41ac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_dca3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_41ac_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2034_c7_dca3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_41ac_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_dca3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2034_c11_41ac_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2037_c7_b51c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_cc25_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b51c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_cc25_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b51c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_cc25_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b51c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_cc25_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b51c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_cc25_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b51c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_cc25_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2037_c7_b51c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_cc25_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2037_c7_b51c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_cc25_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2042_c7_7799_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_8a8e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_7799_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_8a8e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_7799_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_8a8e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_7799_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_8a8e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_7799_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_8a8e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_7799_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_8a8e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2042_c7_7799_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_8a8e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2042_c7_7799_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2042_c11_8a8e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2046_c7_0ebc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5438_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_0ebc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5438_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_0ebc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5438_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_0ebc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5438_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_0ebc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5438_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2046_c7_0ebc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5438_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2046_c7_0ebc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2046_c11_5438_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2050_c7_aef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_df13_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_aef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_df13_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_aef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_df13_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_aef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_df13_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_aef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_df13_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2050_c7_aef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_df13_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2050_c7_aef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2050_c11_df13_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_712c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_a6e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_712c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_a6e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_712c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_a6e7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2058_c7_712c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_a6e7_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2043_c3_6b4e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2047_l2051_l2038_l2043_DUPLICATE_3efd_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2051_c3_5c5b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2047_l2051_l2038_l2043_DUPLICATE_3efd_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2048_l2039_DUPLICATE_6804_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2047_l2051_l2038_l2043_DUPLICATE_3efd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2037_l2034_l2058_l2046_l2042_DUPLICATE_5e68_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2037_l2034_l2058_l2046_l2042_DUPLICATE_5e68_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2037_l2034_l2058_l2046_l2042_DUPLICATE_5e68_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_0ebc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2037_l2034_l2058_l2046_l2042_DUPLICATE_5e68_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_712c_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2037_l2034_l2058_l2046_l2042_DUPLICATE_5e68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2037_l2034_l2058_l2050_l2046_l2042_DUPLICATE_89bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2037_l2034_l2058_l2050_l2046_l2042_DUPLICATE_89bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2037_l2034_l2058_l2050_l2046_l2042_DUPLICATE_89bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_0ebc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2037_l2034_l2058_l2050_l2046_l2042_DUPLICATE_89bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_aef7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2037_l2034_l2058_l2050_l2046_l2042_DUPLICATE_89bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_712c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2037_l2034_l2058_l2050_l2046_l2042_DUPLICATE_89bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2037_l2034_l2050_l2046_l2042_DUPLICATE_0346_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2037_l2034_l2050_l2046_l2042_DUPLICATE_0346_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2037_l2034_l2050_l2046_l2042_DUPLICATE_0346_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_0ebc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2037_l2034_l2050_l2046_l2042_DUPLICATE_0346_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_aef7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2037_l2034_l2050_l2046_l2042_DUPLICATE_0346_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_0ebc_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2046_l2058_DUPLICATE_4960_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_712c_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2046_l2058_DUPLICATE_4960_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2037_l2034_l2021_l2058_l2046_l2042_DUPLICATE_eedf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2037_l2034_l2021_l2058_l2046_l2042_DUPLICATE_eedf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2037_l2034_l2021_l2058_l2046_l2042_DUPLICATE_eedf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2037_l2034_l2021_l2058_l2046_l2042_DUPLICATE_eedf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2046_c7_0ebc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2037_l2034_l2021_l2058_l2046_l2042_DUPLICATE_eedf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2058_c7_712c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2037_l2034_l2021_l2058_l2046_l2042_DUPLICATE_eedf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2021_c2_794b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2021_c2_794b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2021_c2_794b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2021_c2_794b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_aef7_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2053_c30_b201_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2058_c7_712c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_712c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_712c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_712c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_712c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_712c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_712c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_712c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_712c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2043_c3_6b4e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2043_c3_6b4e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2043_c3_6b4e_left;
     BIN_OP_OR_uxn_opcodes_h_l2043_c3_6b4e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2043_c3_6b4e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2043_c3_6b4e_return_output := BIN_OP_OR_uxn_opcodes_h_l2043_c3_6b4e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2021_c2_794b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_794b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_794b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_794b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_794b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2051_c3_5c5b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2051_c3_5c5b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2051_c3_5c5b_left;
     BIN_OP_OR_uxn_opcodes_h_l2051_c3_5c5b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2051_c3_5c5b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2051_c3_5c5b_return_output := BIN_OP_OR_uxn_opcodes_h_l2051_c3_5c5b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2061_c21_a234] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2061_c21_a234_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2061_c31_858c_return_output);

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2021_c2_794b] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_794b_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_794b_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_794b_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_794b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2050_c7_aef7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_aef7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_aef7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_aef7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_aef7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_aef7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_aef7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2048_l2039_DUPLICATE_6804 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2048_l2039_DUPLICATE_6804_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2048_l2039_DUPLICATE_6804_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2048_l2039_DUPLICATE_6804_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2048_l2039_DUPLICATE_6804_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2021_c2_794b] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_794b_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_794b_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_794b_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_794b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2058_c7_712c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_712c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_712c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_712c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_712c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_712c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_712c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_712c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_712c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2058_c7_712c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_712c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_712c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_712c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_712c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_712c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_712c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_712c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_712c_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2021_c2_794b] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_794b_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_794b_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_794b_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_794b_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2043_c3_6b4e_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2052_c11_4e68_right := VAR_BIN_OP_OR_uxn_opcodes_h_l2051_c3_5c5b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2050_c7_aef7_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2051_c3_5c5b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2058_c7_712c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2061_c21_a234_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2046_c7_0ebc_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2048_l2039_DUPLICATE_6804_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2048_l2039_DUPLICATE_6804_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_aef7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_712c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_0ebc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_aef7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_712c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_aef7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_712c_return_output;
     -- n16_MUX[uxn_opcodes_h_l2050_c7_aef7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2050_c7_aef7_cond <= VAR_n16_MUX_uxn_opcodes_h_l2050_c7_aef7_cond;
     n16_MUX_uxn_opcodes_h_l2050_c7_aef7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2050_c7_aef7_iftrue;
     n16_MUX_uxn_opcodes_h_l2050_c7_aef7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2050_c7_aef7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output := n16_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2050_c7_aef7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_aef7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_aef7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_aef7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_aef7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_aef7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_aef7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2050_c7_aef7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_aef7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_aef7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_aef7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_aef7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_aef7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_aef7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2058_c7_712c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2058_c7_712c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2058_c7_712c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2058_c7_712c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2058_c7_712c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2058_c7_712c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2058_c7_712c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2058_c7_712c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2058_c7_712c_return_output;

     -- t16_MUX[uxn_opcodes_h_l2042_c7_7799] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2042_c7_7799_cond <= VAR_t16_MUX_uxn_opcodes_h_l2042_c7_7799_cond;
     t16_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue;
     t16_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2042_c7_7799_return_output := t16_MUX_uxn_opcodes_h_l2042_c7_7799_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2050_c7_aef7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_aef7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_aef7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_aef7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_aef7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_aef7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_aef7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2046_c7_0ebc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_0ebc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_0ebc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_0ebc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_0ebc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_0ebc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_0ebc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2052_c11_4e68] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2052_c11_4e68_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2052_c11_4e68_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2052_c11_4e68_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2052_c11_4e68_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2052_c11_4e68_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2052_c11_4e68_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l2052_c3_36c2 := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2052_c11_4e68_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l2046_c7_0ebc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_0ebc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_0ebc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_0ebc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2050_c7_aef7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2058_c7_712c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2042_c7_7799_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2050_c7_aef7_iftrue := VAR_tmp16_uxn_opcodes_h_l2052_c3_36c2;
     -- t16_MUX[uxn_opcodes_h_l2037_c7_b51c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2037_c7_b51c_cond <= VAR_t16_MUX_uxn_opcodes_h_l2037_c7_b51c_cond;
     t16_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue;
     t16_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output := t16_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2046_c7_0ebc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_0ebc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_0ebc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_0ebc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_0ebc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_0ebc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_0ebc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2046_c7_0ebc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_0ebc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_0ebc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_0ebc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_0ebc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_0ebc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_0ebc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2050_c7_aef7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2050_c7_aef7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2050_c7_aef7_cond;
     tmp16_MUX_uxn_opcodes_h_l2050_c7_aef7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2050_c7_aef7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2050_c7_aef7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2050_c7_aef7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output := tmp16_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2056_c21_9ebe] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2056_c21_9ebe_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l2052_c3_36c2);

     -- n16_MUX[uxn_opcodes_h_l2046_c7_0ebc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2046_c7_0ebc_cond <= VAR_n16_MUX_uxn_opcodes_h_l2046_c7_0ebc_cond;
     n16_MUX_uxn_opcodes_h_l2046_c7_0ebc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2046_c7_0ebc_iftrue;
     n16_MUX_uxn_opcodes_h_l2046_c7_0ebc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2046_c7_0ebc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output := n16_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2042_c7_7799] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_7799_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_7799_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_7799_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_7799_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2046_c7_0ebc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_0ebc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_0ebc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_0ebc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_0ebc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_0ebc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_0ebc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2050_c7_aef7_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2056_c21_9ebe_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2042_c7_7799_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2046_c7_0ebc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output;
     -- n16_MUX[uxn_opcodes_h_l2042_c7_7799] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2042_c7_7799_cond <= VAR_n16_MUX_uxn_opcodes_h_l2042_c7_7799_cond;
     n16_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue;
     n16_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2042_c7_7799_return_output := n16_MUX_uxn_opcodes_h_l2042_c7_7799_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2050_c7_aef7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2050_c7_aef7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2050_c7_aef7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2050_c7_aef7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2050_c7_aef7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2050_c7_aef7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2050_c7_aef7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output := result_u8_value_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2042_c7_7799] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_7799_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_7799_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_7799_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_7799_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2046_c7_0ebc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2046_c7_0ebc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2046_c7_0ebc_cond;
     tmp16_MUX_uxn_opcodes_h_l2046_c7_0ebc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2046_c7_0ebc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2046_c7_0ebc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2046_c7_0ebc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output := tmp16_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output;

     -- t16_MUX[uxn_opcodes_h_l2034_c7_dca3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2034_c7_dca3_cond <= VAR_t16_MUX_uxn_opcodes_h_l2034_c7_dca3_cond;
     t16_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue;
     t16_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output := t16_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2042_c7_7799] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_7799_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_7799_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_7799_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_7799_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2042_c7_7799] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_7799_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_7799_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_7799_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_7799_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2037_c7_b51c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b51c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b51c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2042_c7_7799_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2042_c7_7799_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2042_c7_7799_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2042_c7_7799_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2046_c7_0ebc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2050_c7_aef7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output;
     -- t16_MUX[uxn_opcodes_h_l2021_c2_794b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2021_c2_794b_cond <= VAR_t16_MUX_uxn_opcodes_h_l2021_c2_794b_cond;
     t16_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue;
     t16_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2021_c2_794b_return_output := t16_MUX_uxn_opcodes_h_l2021_c2_794b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2037_c7_b51c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b51c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b51c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2037_c7_b51c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2037_c7_b51c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2037_c7_b51c_cond;
     n16_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue;
     n16_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output := n16_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2037_c7_b51c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b51c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b51c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2037_c7_b51c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b51c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b51c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2046_c7_0ebc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2046_c7_0ebc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2046_c7_0ebc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2046_c7_0ebc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2046_c7_0ebc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2046_c7_0ebc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2046_c7_0ebc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output := result_u8_value_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2034_c7_dca3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_dca3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_dca3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2042_c7_7799] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2042_c7_7799_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2042_c7_7799_cond;
     tmp16_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2042_c7_7799_return_output := tmp16_MUX_uxn_opcodes_h_l2042_c7_7799_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2046_c7_0ebc_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2021_c2_794b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2042_c7_7799_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2021_c2_794b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_794b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_794b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_794b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_794b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2037_c7_b51c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2037_c7_b51c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2037_c7_b51c_cond;
     tmp16_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output := tmp16_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2034_c7_dca3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2034_c7_dca3_cond <= VAR_n16_MUX_uxn_opcodes_h_l2034_c7_dca3_cond;
     n16_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue;
     n16_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output := n16_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2042_c7_7799] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2042_c7_7799_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_7799_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_7799_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_7799_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_7799_return_output := result_u8_value_MUX_uxn_opcodes_h_l2042_c7_7799_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2034_c7_dca3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_dca3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_dca3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2034_c7_dca3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_dca3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_dca3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2034_c7_dca3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_dca3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_dca3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2042_c7_7799_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2021_c2_794b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_794b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_794b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_794b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_794b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2021_c2_794b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_794b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_794b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_794b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_794b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2037_c7_b51c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b51c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b51c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b51c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b51c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2034_c7_dca3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2034_c7_dca3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_dca3_cond;
     tmp16_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output := tmp16_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output;

     -- n16_MUX[uxn_opcodes_h_l2021_c2_794b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2021_c2_794b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2021_c2_794b_cond;
     n16_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue;
     n16_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2021_c2_794b_return_output := n16_MUX_uxn_opcodes_h_l2021_c2_794b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2021_c2_794b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_794b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_794b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_794b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_794b_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2021_c2_794b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b51c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2021_c2_794b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2021_c2_794b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2021_c2_794b_cond;
     tmp16_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2021_c2_794b_return_output := tmp16_MUX_uxn_opcodes_h_l2021_c2_794b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2034_c7_dca3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2034_c7_dca3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_dca3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_dca3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_dca3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output := result_u8_value_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2034_c7_dca3_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2021_c2_794b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2021_c2_794b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2021_c2_794b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c2_794b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c2_794b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c2_794b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c2_794b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2021_c2_794b_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l2017_l2065_DUPLICATE_31ac LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l2017_l2065_DUPLICATE_31ac_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a47b(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2021_c2_794b_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2021_c2_794b_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2021_c2_794b_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2021_c2_794b_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2021_c2_794b_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2021_c2_794b_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2021_c2_794b_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2021_c2_794b_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2021_c2_794b_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l2017_l2065_DUPLICATE_31ac_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l2017_l2065_DUPLICATE_31ac_return_output;
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
