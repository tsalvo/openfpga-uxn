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
-- BIN_OP_EQ[uxn_opcodes_h_l2022_c6_38e9]
signal BIN_OP_EQ_uxn_opcodes_h_l2022_c6_38e9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2022_c6_38e9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2022_c6_38e9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2022_c2_7980]
signal n16_MUX_uxn_opcodes_h_l2022_c2_7980_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2022_c2_7980_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2022_c2_7980]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2022_c2_7980_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2022_c2_7980_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2022_c2_7980]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2022_c2_7980_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2022_c2_7980_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2022_c2_7980]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2022_c2_7980_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2022_c2_7980_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2022_c2_7980]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2022_c2_7980_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2022_c2_7980_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2022_c2_7980]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2022_c2_7980_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2022_c2_7980_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2022_c2_7980]
signal result_u8_value_MUX_uxn_opcodes_h_l2022_c2_7980_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2022_c2_7980_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2022_c2_7980]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2022_c2_7980_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2022_c2_7980_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2022_c2_7980]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2022_c2_7980_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2022_c2_7980_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2022_c2_7980]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2022_c2_7980_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2022_c2_7980_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2022_c2_7980]
signal tmp16_MUX_uxn_opcodes_h_l2022_c2_7980_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2022_c2_7980_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2022_c2_7980]
signal t16_MUX_uxn_opcodes_h_l2022_c2_7980_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2022_c2_7980_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2035_c11_dbfc]
signal BIN_OP_EQ_uxn_opcodes_h_l2035_c11_dbfc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2035_c11_dbfc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2035_c11_dbfc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2035_c7_d0d2]
signal n16_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2035_c7_d0d2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2035_c7_d0d2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2035_c7_d0d2]
signal result_u8_value_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2035_c7_d0d2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2035_c7_d0d2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2035_c7_d0d2]
signal tmp16_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2035_c7_d0d2]
signal t16_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2038_c11_ac90]
signal BIN_OP_EQ_uxn_opcodes_h_l2038_c11_ac90_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2038_c11_ac90_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2038_c11_ac90_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2038_c7_74f1]
signal n16_MUX_uxn_opcodes_h_l2038_c7_74f1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2038_c7_74f1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2038_c7_74f1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2038_c7_74f1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c7_74f1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2038_c7_74f1]
signal result_u8_value_MUX_uxn_opcodes_h_l2038_c7_74f1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2038_c7_74f1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2038_c7_74f1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2038_c7_74f1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c7_74f1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2038_c7_74f1]
signal tmp16_MUX_uxn_opcodes_h_l2038_c7_74f1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2038_c7_74f1]
signal t16_MUX_uxn_opcodes_h_l2038_c7_74f1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2043_c11_2f1d]
signal BIN_OP_EQ_uxn_opcodes_h_l2043_c11_2f1d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2043_c11_2f1d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2043_c11_2f1d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2043_c7_4830]
signal n16_MUX_uxn_opcodes_h_l2043_c7_4830_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2043_c7_4830_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2043_c7_4830]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_4830_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_4830_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2043_c7_4830]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_4830_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_4830_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2043_c7_4830]
signal result_u8_value_MUX_uxn_opcodes_h_l2043_c7_4830_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2043_c7_4830_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2043_c7_4830]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_4830_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_4830_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2043_c7_4830]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_4830_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_4830_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2043_c7_4830]
signal tmp16_MUX_uxn_opcodes_h_l2043_c7_4830_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2043_c7_4830_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2043_c7_4830]
signal t16_MUX_uxn_opcodes_h_l2043_c7_4830_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2043_c7_4830_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2044_c3_5d41]
signal BIN_OP_OR_uxn_opcodes_h_l2044_c3_5d41_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2044_c3_5d41_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2044_c3_5d41_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2047_c11_4fa8]
signal BIN_OP_EQ_uxn_opcodes_h_l2047_c11_4fa8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2047_c11_4fa8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2047_c11_4fa8_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2047_c7_e51f]
signal n16_MUX_uxn_opcodes_h_l2047_c7_e51f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2047_c7_e51f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2047_c7_e51f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2047_c7_e51f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_e51f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_e51f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_e51f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2047_c7_e51f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_e51f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_e51f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_e51f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2047_c7_e51f]
signal result_u8_value_MUX_uxn_opcodes_h_l2047_c7_e51f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2047_c7_e51f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2047_c7_e51f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2047_c7_e51f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_e51f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_e51f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_e51f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2047_c7_e51f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_e51f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_e51f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_e51f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2047_c7_e51f]
signal tmp16_MUX_uxn_opcodes_h_l2047_c7_e51f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2047_c7_e51f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2047_c7_e51f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2051_c11_fcfd]
signal BIN_OP_EQ_uxn_opcodes_h_l2051_c11_fcfd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2051_c11_fcfd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2051_c11_fcfd_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2051_c7_0e8b]
signal n16_MUX_uxn_opcodes_h_l2051_c7_0e8b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2051_c7_0e8b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2051_c7_0e8b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2051_c7_0e8b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_0e8b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_0e8b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_0e8b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2051_c7_0e8b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_0e8b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_0e8b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_0e8b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2051_c7_0e8b]
signal result_u8_value_MUX_uxn_opcodes_h_l2051_c7_0e8b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2051_c7_0e8b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2051_c7_0e8b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2051_c7_0e8b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_0e8b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_0e8b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_0e8b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2051_c7_0e8b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_0e8b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_0e8b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_0e8b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output : signed(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2051_c7_0e8b]
signal tmp16_MUX_uxn_opcodes_h_l2051_c7_0e8b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2051_c7_0e8b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2051_c7_0e8b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2052_c3_4acc]
signal BIN_OP_OR_uxn_opcodes_h_l2052_c3_4acc_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2052_c3_4acc_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2052_c3_4acc_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2053_c11_6c1e]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2053_c11_6c1e_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2053_c11_6c1e_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2053_c11_6c1e_return_output : unsigned(31 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2054_c30_f8a2]
signal sp_relative_shift_uxn_opcodes_h_l2054_c30_f8a2_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2054_c30_f8a2_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2054_c30_f8a2_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2054_c30_f8a2_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2059_c11_e5e1]
signal BIN_OP_EQ_uxn_opcodes_h_l2059_c11_e5e1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2059_c11_e5e1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2059_c11_e5e1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2059_c7_f147]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_f147_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_f147_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_f147_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_f147_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2059_c7_f147]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_f147_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_f147_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_f147_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_f147_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2059_c7_f147]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_f147_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_f147_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_f147_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_f147_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2059_c7_f147]
signal result_u8_value_MUX_uxn_opcodes_h_l2059_c7_f147_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2059_c7_f147_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2059_c7_f147_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2059_c7_f147_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2062_c31_623e]
signal CONST_SR_8_uxn_opcodes_h_l2062_c31_623e_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2062_c31_623e_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2040_l2049_DUPLICATE_da7b
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2040_l2049_DUPLICATE_da7b_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2040_l2049_DUPLICATE_da7b_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_c580( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.u8_value := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.is_pc_updated := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2022_c6_38e9
BIN_OP_EQ_uxn_opcodes_h_l2022_c6_38e9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2022_c6_38e9_left,
BIN_OP_EQ_uxn_opcodes_h_l2022_c6_38e9_right,
BIN_OP_EQ_uxn_opcodes_h_l2022_c6_38e9_return_output);

-- n16_MUX_uxn_opcodes_h_l2022_c2_7980
n16_MUX_uxn_opcodes_h_l2022_c2_7980 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2022_c2_7980_cond,
n16_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue,
n16_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse,
n16_MUX_uxn_opcodes_h_l2022_c2_7980_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2022_c2_7980
result_is_opc_done_MUX_uxn_opcodes_h_l2022_c2_7980 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2022_c2_7980_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2022_c2_7980_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2022_c2_7980
result_is_vram_write_MUX_uxn_opcodes_h_l2022_c2_7980 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2022_c2_7980_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2022_c2_7980_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2022_c2_7980
result_is_ram_write_MUX_uxn_opcodes_h_l2022_c2_7980 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2022_c2_7980_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2022_c2_7980_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2022_c2_7980
result_is_stack_write_MUX_uxn_opcodes_h_l2022_c2_7980 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2022_c2_7980_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2022_c2_7980_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2022_c2_7980
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2022_c2_7980 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2022_c2_7980_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2022_c2_7980_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2022_c2_7980
result_u8_value_MUX_uxn_opcodes_h_l2022_c2_7980 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2022_c2_7980_cond,
result_u8_value_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2022_c2_7980_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2022_c2_7980
result_sp_relative_shift_MUX_uxn_opcodes_h_l2022_c2_7980 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2022_c2_7980_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2022_c2_7980_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2022_c2_7980
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2022_c2_7980 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2022_c2_7980_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2022_c2_7980_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2022_c2_7980
result_is_pc_updated_MUX_uxn_opcodes_h_l2022_c2_7980 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2022_c2_7980_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2022_c2_7980_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2022_c2_7980
tmp16_MUX_uxn_opcodes_h_l2022_c2_7980 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2022_c2_7980_cond,
tmp16_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue,
tmp16_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse,
tmp16_MUX_uxn_opcodes_h_l2022_c2_7980_return_output);

-- t16_MUX_uxn_opcodes_h_l2022_c2_7980
t16_MUX_uxn_opcodes_h_l2022_c2_7980 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2022_c2_7980_cond,
t16_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue,
t16_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse,
t16_MUX_uxn_opcodes_h_l2022_c2_7980_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2035_c11_dbfc
BIN_OP_EQ_uxn_opcodes_h_l2035_c11_dbfc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2035_c11_dbfc_left,
BIN_OP_EQ_uxn_opcodes_h_l2035_c11_dbfc_right,
BIN_OP_EQ_uxn_opcodes_h_l2035_c11_dbfc_return_output);

-- n16_MUX_uxn_opcodes_h_l2035_c7_d0d2
n16_MUX_uxn_opcodes_h_l2035_c7_d0d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond,
n16_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue,
n16_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse,
n16_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_d0d2
result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_d0d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2035_c7_d0d2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2035_c7_d0d2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2035_c7_d0d2
result_u8_value_MUX_uxn_opcodes_h_l2035_c7_d0d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_d0d2
result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_d0d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2035_c7_d0d2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2035_c7_d0d2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2035_c7_d0d2
tmp16_MUX_uxn_opcodes_h_l2035_c7_d0d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond,
tmp16_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue,
tmp16_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse,
tmp16_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output);

-- t16_MUX_uxn_opcodes_h_l2035_c7_d0d2
t16_MUX_uxn_opcodes_h_l2035_c7_d0d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond,
t16_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue,
t16_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse,
t16_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2038_c11_ac90
BIN_OP_EQ_uxn_opcodes_h_l2038_c11_ac90 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2038_c11_ac90_left,
BIN_OP_EQ_uxn_opcodes_h_l2038_c11_ac90_right,
BIN_OP_EQ_uxn_opcodes_h_l2038_c11_ac90_return_output);

-- n16_MUX_uxn_opcodes_h_l2038_c7_74f1
n16_MUX_uxn_opcodes_h_l2038_c7_74f1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2038_c7_74f1_cond,
n16_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue,
n16_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse,
n16_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2038_c7_74f1
result_is_opc_done_MUX_uxn_opcodes_h_l2038_c7_74f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2038_c7_74f1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c7_74f1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c7_74f1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c7_74f1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2038_c7_74f1
result_u8_value_MUX_uxn_opcodes_h_l2038_c7_74f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2038_c7_74f1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2038_c7_74f1
result_is_stack_write_MUX_uxn_opcodes_h_l2038_c7_74f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2038_c7_74f1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c7_74f1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c7_74f1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c7_74f1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2038_c7_74f1
tmp16_MUX_uxn_opcodes_h_l2038_c7_74f1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2038_c7_74f1_cond,
tmp16_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue,
tmp16_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse,
tmp16_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output);

-- t16_MUX_uxn_opcodes_h_l2038_c7_74f1
t16_MUX_uxn_opcodes_h_l2038_c7_74f1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2038_c7_74f1_cond,
t16_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue,
t16_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse,
t16_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2043_c11_2f1d
BIN_OP_EQ_uxn_opcodes_h_l2043_c11_2f1d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2043_c11_2f1d_left,
BIN_OP_EQ_uxn_opcodes_h_l2043_c11_2f1d_right,
BIN_OP_EQ_uxn_opcodes_h_l2043_c11_2f1d_return_output);

-- n16_MUX_uxn_opcodes_h_l2043_c7_4830
n16_MUX_uxn_opcodes_h_l2043_c7_4830 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2043_c7_4830_cond,
n16_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue,
n16_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse,
n16_MUX_uxn_opcodes_h_l2043_c7_4830_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_4830
result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_4830 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_4830_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_4830_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_4830
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_4830 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_4830_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_4830_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2043_c7_4830
result_u8_value_MUX_uxn_opcodes_h_l2043_c7_4830 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2043_c7_4830_cond,
result_u8_value_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2043_c7_4830_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_4830
result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_4830 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_4830_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_4830_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_4830
result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_4830 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_4830_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_4830_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2043_c7_4830
tmp16_MUX_uxn_opcodes_h_l2043_c7_4830 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2043_c7_4830_cond,
tmp16_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue,
tmp16_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse,
tmp16_MUX_uxn_opcodes_h_l2043_c7_4830_return_output);

-- t16_MUX_uxn_opcodes_h_l2043_c7_4830
t16_MUX_uxn_opcodes_h_l2043_c7_4830 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2043_c7_4830_cond,
t16_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue,
t16_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse,
t16_MUX_uxn_opcodes_h_l2043_c7_4830_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2044_c3_5d41
BIN_OP_OR_uxn_opcodes_h_l2044_c3_5d41 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2044_c3_5d41_left,
BIN_OP_OR_uxn_opcodes_h_l2044_c3_5d41_right,
BIN_OP_OR_uxn_opcodes_h_l2044_c3_5d41_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2047_c11_4fa8
BIN_OP_EQ_uxn_opcodes_h_l2047_c11_4fa8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2047_c11_4fa8_left,
BIN_OP_EQ_uxn_opcodes_h_l2047_c11_4fa8_right,
BIN_OP_EQ_uxn_opcodes_h_l2047_c11_4fa8_return_output);

-- n16_MUX_uxn_opcodes_h_l2047_c7_e51f
n16_MUX_uxn_opcodes_h_l2047_c7_e51f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2047_c7_e51f_cond,
n16_MUX_uxn_opcodes_h_l2047_c7_e51f_iftrue,
n16_MUX_uxn_opcodes_h_l2047_c7_e51f_iffalse,
n16_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_e51f
result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_e51f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_e51f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_e51f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_e51f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_e51f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_e51f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_e51f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_e51f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_e51f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2047_c7_e51f
result_u8_value_MUX_uxn_opcodes_h_l2047_c7_e51f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2047_c7_e51f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2047_c7_e51f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2047_c7_e51f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_e51f
result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_e51f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_e51f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_e51f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_e51f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_e51f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_e51f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_e51f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_e51f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_e51f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2047_c7_e51f
tmp16_MUX_uxn_opcodes_h_l2047_c7_e51f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2047_c7_e51f_cond,
tmp16_MUX_uxn_opcodes_h_l2047_c7_e51f_iftrue,
tmp16_MUX_uxn_opcodes_h_l2047_c7_e51f_iffalse,
tmp16_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2051_c11_fcfd
BIN_OP_EQ_uxn_opcodes_h_l2051_c11_fcfd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2051_c11_fcfd_left,
BIN_OP_EQ_uxn_opcodes_h_l2051_c11_fcfd_right,
BIN_OP_EQ_uxn_opcodes_h_l2051_c11_fcfd_return_output);

-- n16_MUX_uxn_opcodes_h_l2051_c7_0e8b
n16_MUX_uxn_opcodes_h_l2051_c7_0e8b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2051_c7_0e8b_cond,
n16_MUX_uxn_opcodes_h_l2051_c7_0e8b_iftrue,
n16_MUX_uxn_opcodes_h_l2051_c7_0e8b_iffalse,
n16_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_0e8b
result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_0e8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_0e8b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_0e8b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_0e8b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_0e8b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_0e8b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_0e8b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_0e8b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_0e8b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2051_c7_0e8b
result_u8_value_MUX_uxn_opcodes_h_l2051_c7_0e8b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2051_c7_0e8b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2051_c7_0e8b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2051_c7_0e8b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_0e8b
result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_0e8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_0e8b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_0e8b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_0e8b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_0e8b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_0e8b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_0e8b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_0e8b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_0e8b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2051_c7_0e8b
tmp16_MUX_uxn_opcodes_h_l2051_c7_0e8b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2051_c7_0e8b_cond,
tmp16_MUX_uxn_opcodes_h_l2051_c7_0e8b_iftrue,
tmp16_MUX_uxn_opcodes_h_l2051_c7_0e8b_iffalse,
tmp16_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2052_c3_4acc
BIN_OP_OR_uxn_opcodes_h_l2052_c3_4acc : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2052_c3_4acc_left,
BIN_OP_OR_uxn_opcodes_h_l2052_c3_4acc_right,
BIN_OP_OR_uxn_opcodes_h_l2052_c3_4acc_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2053_c11_6c1e
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2053_c11_6c1e : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2053_c11_6c1e_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2053_c11_6c1e_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2053_c11_6c1e_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2054_c30_f8a2
sp_relative_shift_uxn_opcodes_h_l2054_c30_f8a2 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2054_c30_f8a2_ins,
sp_relative_shift_uxn_opcodes_h_l2054_c30_f8a2_x,
sp_relative_shift_uxn_opcodes_h_l2054_c30_f8a2_y,
sp_relative_shift_uxn_opcodes_h_l2054_c30_f8a2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2059_c11_e5e1
BIN_OP_EQ_uxn_opcodes_h_l2059_c11_e5e1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2059_c11_e5e1_left,
BIN_OP_EQ_uxn_opcodes_h_l2059_c11_e5e1_right,
BIN_OP_EQ_uxn_opcodes_h_l2059_c11_e5e1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_f147
result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_f147 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_f147_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_f147_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_f147_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_f147_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_f147
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_f147 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_f147_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_f147_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_f147_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_f147_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_f147
result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_f147 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_f147_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_f147_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_f147_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_f147_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2059_c7_f147
result_u8_value_MUX_uxn_opcodes_h_l2059_c7_f147 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2059_c7_f147_cond,
result_u8_value_MUX_uxn_opcodes_h_l2059_c7_f147_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2059_c7_f147_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2059_c7_f147_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2062_c31_623e
CONST_SR_8_uxn_opcodes_h_l2062_c31_623e : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2062_c31_623e_x,
CONST_SR_8_uxn_opcodes_h_l2062_c31_623e_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2040_l2049_DUPLICATE_da7b
CONST_SL_8_uint16_t_uxn_opcodes_h_l2040_l2049_DUPLICATE_da7b : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2040_l2049_DUPLICATE_da7b_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2040_l2049_DUPLICATE_da7b_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2022_c6_38e9_return_output,
 n16_MUX_uxn_opcodes_h_l2022_c2_7980_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2022_c2_7980_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2022_c2_7980_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2022_c2_7980_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2022_c2_7980_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2022_c2_7980_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2022_c2_7980_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2022_c2_7980_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2022_c2_7980_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2022_c2_7980_return_output,
 tmp16_MUX_uxn_opcodes_h_l2022_c2_7980_return_output,
 t16_MUX_uxn_opcodes_h_l2022_c2_7980_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2035_c11_dbfc_return_output,
 n16_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output,
 tmp16_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output,
 t16_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2038_c11_ac90_return_output,
 n16_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output,
 tmp16_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output,
 t16_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2043_c11_2f1d_return_output,
 n16_MUX_uxn_opcodes_h_l2043_c7_4830_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_4830_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_4830_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2043_c7_4830_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_4830_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_4830_return_output,
 tmp16_MUX_uxn_opcodes_h_l2043_c7_4830_return_output,
 t16_MUX_uxn_opcodes_h_l2043_c7_4830_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2044_c3_5d41_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2047_c11_4fa8_return_output,
 n16_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output,
 tmp16_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2051_c11_fcfd_return_output,
 n16_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output,
 tmp16_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2052_c3_4acc_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2053_c11_6c1e_return_output,
 sp_relative_shift_uxn_opcodes_h_l2054_c30_f8a2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2059_c11_e5e1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_f147_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_f147_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_f147_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2059_c7_f147_return_output,
 CONST_SR_8_uxn_opcodes_h_l2062_c31_623e_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2040_l2049_DUPLICATE_da7b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c6_38e9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c6_38e9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c6_38e9_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2022_c2_7980_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2022_c2_7980_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2022_c2_7980_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2022_c2_7980_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2022_c2_7980_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2022_c2_7980_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2022_c2_7980_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2022_c2_7980_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2022_c2_7980_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2022_c2_7980_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2022_c2_7980_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2022_c2_7980_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2032_c3_b948 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2022_c2_7980_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2022_c2_7980_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2022_c2_7980_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2022_c2_7980_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2027_c3_268f : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2022_c2_7980_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2022_c2_7980_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2022_c2_7980_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2022_c2_7980_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2022_c2_7980_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2022_c2_7980_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2022_c2_7980_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2022_c2_7980_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2022_c2_7980_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2022_c2_7980_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2022_c2_7980_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2022_c2_7980_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_dbfc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_dbfc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_dbfc_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2036_c3_0eda : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_ac90_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_ac90_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_ac90_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2043_c7_4830_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2038_c7_74f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_4830_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2038_c7_74f1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2041_c3_0fe3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_4830_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c7_74f1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c7_4830_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2038_c7_74f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_4830_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2038_c7_74f1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_4830_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c7_74f1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2043_c7_4830_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2038_c7_74f1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2043_c7_4830_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2038_c7_74f1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_2f1d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_2f1d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_2f1d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2043_c7_4830_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_4830_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2045_c3_3838 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_4830_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c7_4830_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_4830_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_4830_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2043_c7_4830_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2043_c7_4830_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2044_c3_5d41_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2044_c3_5d41_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2044_c3_5d41_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_4fa8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_4fa8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_4fa8_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2047_c7_e51f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2047_c7_e51f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2047_c7_e51f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_e51f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_e51f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_e51f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_e51f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_e51f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_e51f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2047_c7_e51f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2047_c7_e51f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2047_c7_e51f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_e51f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_e51f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_e51f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_e51f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_e51f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_e51f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2047_c7_e51f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2047_c7_e51f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2047_c7_e51f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_fcfd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_fcfd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_fcfd_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2051_c7_0e8b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2051_c7_0e8b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2051_c7_0e8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_0e8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_0e8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_f147_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_0e8b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_0e8b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2056_c3_ebe8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_0e8b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_f147_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_0e8b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2051_c7_0e8b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2051_c7_0e8b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2059_c7_f147_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2051_c7_0e8b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_0e8b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_0e8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_0e8b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_0e8b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_0e8b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_f147_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_0e8b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2051_c7_0e8b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l2053_c3_71d1 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2051_c7_0e8b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2051_c7_0e8b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2052_c3_4acc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2052_c3_4acc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2052_c3_4acc_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2053_c11_6c1e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2053_c11_6c1e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2053_c11_6c1e_return_output : unsigned(31 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2054_c30_f8a2_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2054_c30_f8a2_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2054_c30_f8a2_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2054_c30_f8a2_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2057_c21_2e12_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_e5e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_e5e1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_e5e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_f147_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_f147_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_f147_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_f147_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2061_c3_2af0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_f147_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_f147_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_f147_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2060_c3_dd12 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_f147_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_f147_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2059_c7_f147_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2059_c7_f147_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2059_c7_f147_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2062_c31_623e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2062_c31_623e_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2062_c21_3d8c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2022_l2059_l2047_l2043_l2038_l2035_DUPLICATE_98e7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2059_l2051_l2047_l2043_l2038_l2035_DUPLICATE_0651_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2051_l2047_l2043_l2038_l2035_DUPLICATE_d20d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2059_l2047_l2043_l2038_l2035_DUPLICATE_e239_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2039_l2052_l2044_l2048_DUPLICATE_b806_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2040_l2049_DUPLICATE_da7b_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2040_l2049_DUPLICATE_da7b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2059_l2047_DUPLICATE_bd55_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l2066_l2018_DUPLICATE_69e5_return_output : opcode_result_t;
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
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2045_c3_3838 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2045_c3_3838;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2060_c3_dd12 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_f147_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2060_c3_dd12;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2061_c3_2af0 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_f147_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2061_c3_2af0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_dbfc_right := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2032_c3_b948 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2032_c3_b948;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2056_c3_ebe8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_0e8b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2056_c3_ebe8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_e5e1_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_2f1d_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c6_38e9_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2041_c3_0fe3 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2041_c3_0fe3;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2054_c30_f8a2_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_ac90_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2027_c3_268f := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2027_c3_268f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_fcfd_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_0e8b_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2054_c30_f8a2_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2036_c3_0eda := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2036_c3_0eda;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_f147_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_4fa8_right := to_unsigned(4, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2054_c30_f8a2_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2052_c3_4acc_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2051_c7_0e8b_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c6_38e9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_dbfc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_ac90_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_2f1d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_4fa8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_fcfd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_e5e1_left := VAR_phase;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2053_c11_6c1e_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2044_c3_5d41_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2062_c31_623e_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2047_c7_e51f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2051_c7_0e8b_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2059_c11_e5e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2059_c11_e5e1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_e5e1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2059_c11_e5e1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_e5e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_e5e1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2059_c11_e5e1_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2051_l2047_l2043_l2038_l2035_DUPLICATE_d20d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2051_l2047_l2043_l2038_l2035_DUPLICATE_d20d_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2047_c11_4fa8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2047_c11_4fa8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_4fa8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2047_c11_4fa8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_4fa8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_4fa8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2047_c11_4fa8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2043_c11_2f1d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2043_c11_2f1d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_2f1d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2043_c11_2f1d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_2f1d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_2f1d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2043_c11_2f1d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2035_c11_dbfc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2035_c11_dbfc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_dbfc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2035_c11_dbfc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_dbfc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_dbfc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2035_c11_dbfc_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2022_c2_7980] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2022_c2_7980_return_output := result.is_stack_index_flipped;

     -- sp_relative_shift[uxn_opcodes_h_l2054_c30_f8a2] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2054_c30_f8a2_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2054_c30_f8a2_ins;
     sp_relative_shift_uxn_opcodes_h_l2054_c30_f8a2_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2054_c30_f8a2_x;
     sp_relative_shift_uxn_opcodes_h_l2054_c30_f8a2_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2054_c30_f8a2_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2054_c30_f8a2_return_output := sp_relative_shift_uxn_opcodes_h_l2054_c30_f8a2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2038_c11_ac90] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2038_c11_ac90_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_ac90_left;
     BIN_OP_EQ_uxn_opcodes_h_l2038_c11_ac90_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_ac90_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_ac90_return_output := BIN_OP_EQ_uxn_opcodes_h_l2038_c11_ac90_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2022_c2_7980] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2022_c2_7980_return_output := result.is_ram_write;

     -- CONST_SR_8[uxn_opcodes_h_l2062_c31_623e] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2062_c31_623e_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2062_c31_623e_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2062_c31_623e_return_output := CONST_SR_8_uxn_opcodes_h_l2062_c31_623e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2022_c6_38e9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2022_c6_38e9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c6_38e9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2022_c6_38e9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c6_38e9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c6_38e9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2022_c6_38e9_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2039_l2052_l2044_l2048_DUPLICATE_b806 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2039_l2052_l2044_l2048_DUPLICATE_b806_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2051_c11_fcfd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2051_c11_fcfd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_fcfd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2051_c11_fcfd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_fcfd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_fcfd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2051_c11_fcfd_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2022_c2_7980] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2022_c2_7980_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2059_l2047_DUPLICATE_bd55 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2059_l2047_DUPLICATE_bd55_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2059_l2047_l2043_l2038_l2035_DUPLICATE_e239 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2059_l2047_l2043_l2038_l2035_DUPLICATE_e239_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2059_l2051_l2047_l2043_l2038_l2035_DUPLICATE_0651 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2059_l2051_l2047_l2043_l2038_l2035_DUPLICATE_0651_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2022_l2059_l2047_l2043_l2038_l2035_DUPLICATE_98e7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2022_l2059_l2047_l2043_l2038_l2035_DUPLICATE_98e7_return_output := result.u8_value;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2022_c2_7980] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2022_c2_7980_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2022_c2_7980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c6_38e9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2022_c2_7980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c6_38e9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2022_c2_7980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c6_38e9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2022_c2_7980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c6_38e9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2022_c2_7980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c6_38e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2022_c2_7980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c6_38e9_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2022_c2_7980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c6_38e9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2022_c2_7980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c6_38e9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2022_c2_7980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c6_38e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2022_c2_7980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c6_38e9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2022_c2_7980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c6_38e9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2022_c2_7980_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c6_38e9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_dbfc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_dbfc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_dbfc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_dbfc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_dbfc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_dbfc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_dbfc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2035_c11_dbfc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2038_c7_74f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_ac90_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2038_c7_74f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_ac90_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2038_c7_74f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_ac90_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c7_74f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_ac90_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c7_74f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_ac90_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2038_c7_74f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_ac90_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2038_c7_74f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_ac90_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2038_c7_74f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c11_ac90_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2043_c7_4830_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_2f1d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_4830_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_2f1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_4830_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_2f1d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_4830_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_2f1d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_4830_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_2f1d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c7_4830_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_2f1d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2043_c7_4830_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_2f1d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2043_c7_4830_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c11_2f1d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2047_c7_e51f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_4fa8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_e51f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_4fa8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_e51f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_4fa8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_e51f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_4fa8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_e51f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_4fa8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2047_c7_e51f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_4fa8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2047_c7_e51f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_4fa8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2051_c7_0e8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_fcfd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_0e8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_fcfd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_0e8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_fcfd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_0e8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_fcfd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_0e8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_fcfd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2051_c7_0e8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_fcfd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2051_c7_0e8b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_fcfd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_f147_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_e5e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_f147_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_e5e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_f147_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_e5e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2059_c7_f147_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_e5e1_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2044_c3_5d41_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2039_l2052_l2044_l2048_DUPLICATE_b806_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2052_c3_4acc_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2039_l2052_l2044_l2048_DUPLICATE_b806_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2040_l2049_DUPLICATE_da7b_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2039_l2052_l2044_l2048_DUPLICATE_b806_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2059_l2047_l2043_l2038_l2035_DUPLICATE_e239_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2059_l2047_l2043_l2038_l2035_DUPLICATE_e239_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2059_l2047_l2043_l2038_l2035_DUPLICATE_e239_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_e51f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2059_l2047_l2043_l2038_l2035_DUPLICATE_e239_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_f147_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2059_l2047_l2043_l2038_l2035_DUPLICATE_e239_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2059_l2051_l2047_l2043_l2038_l2035_DUPLICATE_0651_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2059_l2051_l2047_l2043_l2038_l2035_DUPLICATE_0651_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2059_l2051_l2047_l2043_l2038_l2035_DUPLICATE_0651_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_e51f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2059_l2051_l2047_l2043_l2038_l2035_DUPLICATE_0651_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_0e8b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2059_l2051_l2047_l2043_l2038_l2035_DUPLICATE_0651_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_f147_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2059_l2051_l2047_l2043_l2038_l2035_DUPLICATE_0651_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2051_l2047_l2043_l2038_l2035_DUPLICATE_d20d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2051_l2047_l2043_l2038_l2035_DUPLICATE_d20d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2051_l2047_l2043_l2038_l2035_DUPLICATE_d20d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_e51f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2051_l2047_l2043_l2038_l2035_DUPLICATE_d20d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_0e8b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2051_l2047_l2043_l2038_l2035_DUPLICATE_d20d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_e51f_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2059_l2047_DUPLICATE_bd55_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_f147_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2059_l2047_DUPLICATE_bd55_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2022_l2059_l2047_l2043_l2038_l2035_DUPLICATE_98e7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2022_l2059_l2047_l2043_l2038_l2035_DUPLICATE_98e7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2022_l2059_l2047_l2043_l2038_l2035_DUPLICATE_98e7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2022_l2059_l2047_l2043_l2038_l2035_DUPLICATE_98e7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2047_c7_e51f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2022_l2059_l2047_l2043_l2038_l2035_DUPLICATE_98e7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2059_c7_f147_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2022_l2059_l2047_l2043_l2038_l2035_DUPLICATE_98e7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2022_c2_7980_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2022_c2_7980_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2022_c2_7980_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2022_c2_7980_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_0e8b_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2054_c30_f8a2_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2059_c7_f147] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_f147_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_f147_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_f147_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_f147_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_f147_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_f147_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_f147_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_f147_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2059_c7_f147] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_f147_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_f147_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_f147_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_f147_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_f147_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_f147_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_f147_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_f147_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2022_c2_7980] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2022_c2_7980_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2022_c2_7980_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2022_c2_7980_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2022_c2_7980_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2062_c21_3d8c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2062_c21_3d8c_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2062_c31_623e_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2059_c7_f147] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_f147_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_f147_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_f147_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_f147_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_f147_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_f147_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_f147_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_f147_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2051_c7_0e8b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_0e8b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_0e8b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_0e8b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_0e8b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_0e8b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_0e8b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2022_c2_7980] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2022_c2_7980_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2022_c2_7980_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2022_c2_7980_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2022_c2_7980_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2022_c2_7980] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2022_c2_7980_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2022_c2_7980_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2022_c2_7980_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2022_c2_7980_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2044_c3_5d41] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2044_c3_5d41_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2044_c3_5d41_left;
     BIN_OP_OR_uxn_opcodes_h_l2044_c3_5d41_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2044_c3_5d41_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2044_c3_5d41_return_output := BIN_OP_OR_uxn_opcodes_h_l2044_c3_5d41_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2040_l2049_DUPLICATE_da7b LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2040_l2049_DUPLICATE_da7b_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2040_l2049_DUPLICATE_da7b_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2040_l2049_DUPLICATE_da7b_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2040_l2049_DUPLICATE_da7b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2022_c2_7980] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2022_c2_7980_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2022_c2_7980_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2022_c2_7980_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2022_c2_7980_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2052_c3_4acc] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2052_c3_4acc_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2052_c3_4acc_left;
     BIN_OP_OR_uxn_opcodes_h_l2052_c3_4acc_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2052_c3_4acc_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2052_c3_4acc_return_output := BIN_OP_OR_uxn_opcodes_h_l2052_c3_4acc_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2044_c3_5d41_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2053_c11_6c1e_right := VAR_BIN_OP_OR_uxn_opcodes_h_l2052_c3_4acc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2051_c7_0e8b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2052_c3_4acc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2059_c7_f147_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2062_c21_3d8c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2047_c7_e51f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2040_l2049_DUPLICATE_da7b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2040_l2049_DUPLICATE_da7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_0e8b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_f147_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_e51f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_0e8b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_f147_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_0e8b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_f147_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2051_c7_0e8b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_0e8b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_0e8b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_0e8b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_0e8b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_0e8b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_0e8b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2051_c7_0e8b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2051_c7_0e8b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2051_c7_0e8b_cond;
     n16_MUX_uxn_opcodes_h_l2051_c7_0e8b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2051_c7_0e8b_iftrue;
     n16_MUX_uxn_opcodes_h_l2051_c7_0e8b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2051_c7_0e8b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output := n16_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2047_c7_e51f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_e51f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_e51f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_e51f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_e51f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_e51f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_e51f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output;

     -- t16_MUX[uxn_opcodes_h_l2043_c7_4830] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2043_c7_4830_cond <= VAR_t16_MUX_uxn_opcodes_h_l2043_c7_4830_cond;
     t16_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue;
     t16_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2043_c7_4830_return_output := t16_MUX_uxn_opcodes_h_l2043_c7_4830_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2051_c7_0e8b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_0e8b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_0e8b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_0e8b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_0e8b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_0e8b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_0e8b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2053_c11_6c1e] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2053_c11_6c1e_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2053_c11_6c1e_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2053_c11_6c1e_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2053_c11_6c1e_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2053_c11_6c1e_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2053_c11_6c1e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2051_c7_0e8b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_0e8b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_0e8b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_0e8b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_0e8b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_0e8b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_0e8b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2059_c7_f147] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2059_c7_f147_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2059_c7_f147_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2059_c7_f147_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2059_c7_f147_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2059_c7_f147_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2059_c7_f147_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2059_c7_f147_return_output := result_u8_value_MUX_uxn_opcodes_h_l2059_c7_f147_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l2053_c3_71d1 := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2053_c11_6c1e_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l2047_c7_e51f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_e51f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_e51f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_e51f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2051_c7_0e8b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2059_c7_f147_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2043_c7_4830_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2051_c7_0e8b_iftrue := VAR_tmp16_uxn_opcodes_h_l2053_c3_71d1;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2043_c7_4830] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_4830_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_4830_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_4830_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_4830_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2047_c7_e51f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_e51f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_e51f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_e51f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_e51f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_e51f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_e51f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output;

     -- t16_MUX[uxn_opcodes_h_l2038_c7_74f1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2038_c7_74f1_cond <= VAR_t16_MUX_uxn_opcodes_h_l2038_c7_74f1_cond;
     t16_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue;
     t16_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output := t16_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2047_c7_e51f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_e51f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_e51f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_e51f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_e51f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_e51f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_e51f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2047_c7_e51f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_e51f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_e51f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_e51f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_e51f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_e51f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_e51f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2057_c21_2e12] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2057_c21_2e12_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l2053_c3_71d1);

     -- tmp16_MUX[uxn_opcodes_h_l2051_c7_0e8b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2051_c7_0e8b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2051_c7_0e8b_cond;
     tmp16_MUX_uxn_opcodes_h_l2051_c7_0e8b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2051_c7_0e8b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2051_c7_0e8b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2051_c7_0e8b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output := tmp16_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2047_c7_e51f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2047_c7_e51f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2047_c7_e51f_cond;
     n16_MUX_uxn_opcodes_h_l2047_c7_e51f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2047_c7_e51f_iftrue;
     n16_MUX_uxn_opcodes_h_l2047_c7_e51f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2047_c7_e51f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output := n16_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2051_c7_0e8b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2057_c21_2e12_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c7_4830_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2047_c7_e51f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2043_c7_4830] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_4830_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_4830_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_4830_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_4830_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2051_c7_0e8b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2051_c7_0e8b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2051_c7_0e8b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2051_c7_0e8b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2051_c7_0e8b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2051_c7_0e8b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2051_c7_0e8b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output;

     -- t16_MUX[uxn_opcodes_h_l2035_c7_d0d2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond <= VAR_t16_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond;
     t16_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue;
     t16_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output := t16_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2038_c7_74f1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2038_c7_74f1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2038_c7_74f1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2047_c7_e51f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2047_c7_e51f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2047_c7_e51f_cond;
     tmp16_MUX_uxn_opcodes_h_l2047_c7_e51f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2047_c7_e51f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2047_c7_e51f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2047_c7_e51f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output := tmp16_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2043_c7_4830] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_4830_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_4830_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_4830_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_4830_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2043_c7_4830] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_4830_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_4830_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_4830_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_4830_return_output;

     -- n16_MUX[uxn_opcodes_h_l2043_c7_4830] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2043_c7_4830_cond <= VAR_n16_MUX_uxn_opcodes_h_l2043_c7_4830_cond;
     n16_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue;
     n16_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2043_c7_4830_return_output := n16_MUX_uxn_opcodes_h_l2043_c7_4830_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2043_c7_4830_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c7_4830_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c7_4830_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c7_4830_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2047_c7_e51f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2051_c7_0e8b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output;
     -- n16_MUX[uxn_opcodes_h_l2038_c7_74f1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2038_c7_74f1_cond <= VAR_n16_MUX_uxn_opcodes_h_l2038_c7_74f1_cond;
     n16_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue;
     n16_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output := n16_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2038_c7_74f1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c7_74f1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c7_74f1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2038_c7_74f1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c7_74f1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c7_74f1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2038_c7_74f1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2038_c7_74f1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2038_c7_74f1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2047_c7_e51f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2047_c7_e51f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2047_c7_e51f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2047_c7_e51f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2047_c7_e51f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2047_c7_e51f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2047_c7_e51f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output;

     -- t16_MUX[uxn_opcodes_h_l2022_c2_7980] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2022_c2_7980_cond <= VAR_t16_MUX_uxn_opcodes_h_l2022_c2_7980_cond;
     t16_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue;
     t16_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2022_c2_7980_return_output := t16_MUX_uxn_opcodes_h_l2022_c2_7980_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2035_c7_d0d2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2043_c7_4830] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2043_c7_4830_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2043_c7_4830_cond;
     tmp16_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2043_c7_4830_return_output := tmp16_MUX_uxn_opcodes_h_l2043_c7_4830_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2047_c7_e51f_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2022_c2_7980_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2043_c7_4830_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2035_c7_d0d2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2035_c7_d0d2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2043_c7_4830] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2043_c7_4830_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c7_4830_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c7_4830_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c7_4830_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c7_4830_return_output := result_u8_value_MUX_uxn_opcodes_h_l2043_c7_4830_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2022_c2_7980] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2022_c2_7980_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2022_c2_7980_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2022_c2_7980_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2022_c2_7980_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2035_c7_d0d2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output;

     -- n16_MUX[uxn_opcodes_h_l2035_c7_d0d2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond <= VAR_n16_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond;
     n16_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue;
     n16_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output := n16_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2038_c7_74f1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2038_c7_74f1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2038_c7_74f1_cond;
     tmp16_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output := tmp16_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2043_c7_4830_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2035_c7_d0d2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond;
     tmp16_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output := tmp16_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2022_c2_7980] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2022_c2_7980_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2022_c2_7980_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2022_c2_7980_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2022_c2_7980_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2022_c2_7980] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2022_c2_7980_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2022_c2_7980_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2022_c2_7980_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2022_c2_7980_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2022_c2_7980] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2022_c2_7980_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2022_c2_7980_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2022_c2_7980_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2022_c2_7980_return_output;

     -- n16_MUX[uxn_opcodes_h_l2022_c2_7980] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2022_c2_7980_cond <= VAR_n16_MUX_uxn_opcodes_h_l2022_c2_7980_cond;
     n16_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue;
     n16_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2022_c2_7980_return_output := n16_MUX_uxn_opcodes_h_l2022_c2_7980_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2038_c7_74f1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2038_c7_74f1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2038_c7_74f1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2038_c7_74f1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2038_c7_74f1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2022_c2_7980_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2038_c7_74f1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2022_c2_7980] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2022_c2_7980_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2022_c2_7980_cond;
     tmp16_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2022_c2_7980_return_output := tmp16_MUX_uxn_opcodes_h_l2022_c2_7980_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2035_c7_d0d2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2035_c7_d0d2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2035_c7_d0d2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2035_c7_d0d2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2035_c7_d0d2_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2022_c2_7980_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2022_c2_7980] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2022_c2_7980_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2022_c2_7980_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2022_c2_7980_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2022_c2_7980_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2022_c2_7980_return_output := result_u8_value_MUX_uxn_opcodes_h_l2022_c2_7980_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l2066_l2018_DUPLICATE_69e5 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l2066_l2018_DUPLICATE_69e5_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c580(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2022_c2_7980_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2022_c2_7980_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2022_c2_7980_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2022_c2_7980_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2022_c2_7980_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2022_c2_7980_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2022_c2_7980_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2022_c2_7980_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2022_c2_7980_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l2066_l2018_DUPLICATE_69e5_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l2066_l2018_DUPLICATE_69e5_return_output;
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
