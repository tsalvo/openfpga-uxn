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
-- BIN_OP_EQ[uxn_opcodes_h_l2004_c6_3cd9]
signal BIN_OP_EQ_uxn_opcodes_h_l2004_c6_3cd9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2004_c6_3cd9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2004_c6_3cd9_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2004_c2_51ee]
signal t16_MUX_uxn_opcodes_h_l2004_c2_51ee_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2004_c2_51ee]
signal tmp16_MUX_uxn_opcodes_h_l2004_c2_51ee_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2004_c2_51ee]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_51ee_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2004_c2_51ee]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_51ee_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2004_c2_51ee]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_51ee_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2004_c2_51ee]
signal result_u8_value_MUX_uxn_opcodes_h_l2004_c2_51ee_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2004_c2_51ee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_51ee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2004_c2_51ee]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_51ee_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2004_c2_51ee]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2004_c2_51ee]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2004_c2_51ee]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_51ee_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2004_c2_51ee]
signal n16_MUX_uxn_opcodes_h_l2004_c2_51ee_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2017_c11_3412]
signal BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3412_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3412_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3412_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2017_c7_7dc9]
signal t16_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2017_c7_7dc9]
signal tmp16_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2017_c7_7dc9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2017_c7_7dc9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2017_c7_7dc9]
signal result_u8_value_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2017_c7_7dc9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2017_c7_7dc9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2017_c7_7dc9]
signal n16_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2020_c11_cc03]
signal BIN_OP_EQ_uxn_opcodes_h_l2020_c11_cc03_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2020_c11_cc03_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2020_c11_cc03_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2020_c7_06ee]
signal t16_MUX_uxn_opcodes_h_l2020_c7_06ee_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2020_c7_06ee]
signal tmp16_MUX_uxn_opcodes_h_l2020_c7_06ee_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2020_c7_06ee]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_06ee_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2020_c7_06ee]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_06ee_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2020_c7_06ee]
signal result_u8_value_MUX_uxn_opcodes_h_l2020_c7_06ee_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2020_c7_06ee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_06ee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2020_c7_06ee]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_06ee_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2020_c7_06ee]
signal n16_MUX_uxn_opcodes_h_l2020_c7_06ee_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2025_c11_d71d]
signal BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d71d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d71d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d71d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2025_c7_9347]
signal t16_MUX_uxn_opcodes_h_l2025_c7_9347_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2025_c7_9347_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2025_c7_9347]
signal tmp16_MUX_uxn_opcodes_h_l2025_c7_9347_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2025_c7_9347_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2025_c7_9347]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_9347_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_9347_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2025_c7_9347]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_9347_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_9347_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2025_c7_9347]
signal result_u8_value_MUX_uxn_opcodes_h_l2025_c7_9347_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2025_c7_9347_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2025_c7_9347]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_9347_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_9347_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2025_c7_9347]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_9347_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_9347_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2025_c7_9347]
signal n16_MUX_uxn_opcodes_h_l2025_c7_9347_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2025_c7_9347_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2026_c3_526e]
signal BIN_OP_OR_uxn_opcodes_h_l2026_c3_526e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2026_c3_526e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2026_c3_526e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2029_c11_2fec]
signal BIN_OP_EQ_uxn_opcodes_h_l2029_c11_2fec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2029_c11_2fec_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2029_c11_2fec_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2029_c7_e933]
signal tmp16_MUX_uxn_opcodes_h_l2029_c7_e933_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2029_c7_e933_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2029_c7_e933_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2029_c7_e933_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2029_c7_e933]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e933_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e933_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e933_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e933_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2029_c7_e933]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e933_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e933_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e933_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e933_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2029_c7_e933]
signal result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e933_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e933_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e933_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e933_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2029_c7_e933]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e933_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e933_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e933_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e933_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2029_c7_e933]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e933_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e933_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e933_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e933_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2029_c7_e933]
signal n16_MUX_uxn_opcodes_h_l2029_c7_e933_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2029_c7_e933_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2029_c7_e933_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2029_c7_e933_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2033_c11_7f02]
signal BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7f02_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7f02_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7f02_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2033_c7_6107]
signal tmp16_MUX_uxn_opcodes_h_l2033_c7_6107_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2033_c7_6107_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2033_c7_6107_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2033_c7_6107_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2033_c7_6107]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_6107_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_6107_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_6107_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_6107_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2033_c7_6107]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_6107_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_6107_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_6107_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_6107_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2033_c7_6107]
signal result_u8_value_MUX_uxn_opcodes_h_l2033_c7_6107_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2033_c7_6107_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2033_c7_6107_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2033_c7_6107_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2033_c7_6107]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_6107_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_6107_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_6107_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_6107_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2033_c7_6107]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_6107_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_6107_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_6107_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_6107_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2033_c7_6107]
signal n16_MUX_uxn_opcodes_h_l2033_c7_6107_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2033_c7_6107_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2033_c7_6107_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2033_c7_6107_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2034_c3_85f6]
signal BIN_OP_OR_uxn_opcodes_h_l2034_c3_85f6_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2034_c3_85f6_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2034_c3_85f6_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2035_c11_63e2]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_63e2_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_63e2_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_63e2_return_output : unsigned(31 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2036_c30_06b6]
signal sp_relative_shift_uxn_opcodes_h_l2036_c30_06b6_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2036_c30_06b6_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2036_c30_06b6_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2036_c30_06b6_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2041_c11_6271]
signal BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6271_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6271_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6271_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2041_c7_80d5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_80d5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_80d5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_80d5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_80d5_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2041_c7_80d5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_80d5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_80d5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_80d5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_80d5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2041_c7_80d5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_80d5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_80d5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_80d5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_80d5_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2041_c7_80d5]
signal result_u8_value_MUX_uxn_opcodes_h_l2041_c7_80d5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2041_c7_80d5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2041_c7_80d5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2041_c7_80d5_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2044_c31_3592]
signal CONST_SR_8_uxn_opcodes_h_l2044_c31_3592_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2044_c31_3592_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_5ef0
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_5ef0_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_5ef0_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_71f0( ref_toks_0 : opcode_result_t;
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
      base.is_stack_index_flipped := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2004_c6_3cd9
BIN_OP_EQ_uxn_opcodes_h_l2004_c6_3cd9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2004_c6_3cd9_left,
BIN_OP_EQ_uxn_opcodes_h_l2004_c6_3cd9_right,
BIN_OP_EQ_uxn_opcodes_h_l2004_c6_3cd9_return_output);

-- t16_MUX_uxn_opcodes_h_l2004_c2_51ee
t16_MUX_uxn_opcodes_h_l2004_c2_51ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2004_c2_51ee_cond,
t16_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue,
t16_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse,
t16_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2004_c2_51ee
tmp16_MUX_uxn_opcodes_h_l2004_c2_51ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2004_c2_51ee_cond,
tmp16_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue,
tmp16_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse,
tmp16_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_51ee
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_51ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_51ee_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_51ee
result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_51ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_51ee_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_51ee
result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_51ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_51ee_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2004_c2_51ee
result_u8_value_MUX_uxn_opcodes_h_l2004_c2_51ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2004_c2_51ee_cond,
result_u8_value_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_51ee
result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_51ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_51ee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_51ee
result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_51ee : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_51ee_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_51ee
result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_51ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_51ee
result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_51ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_51ee
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_51ee : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_51ee_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output);

-- n16_MUX_uxn_opcodes_h_l2004_c2_51ee
n16_MUX_uxn_opcodes_h_l2004_c2_51ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2004_c2_51ee_cond,
n16_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue,
n16_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse,
n16_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3412
BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3412 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3412_left,
BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3412_right,
BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3412_return_output);

-- t16_MUX_uxn_opcodes_h_l2017_c7_7dc9
t16_MUX_uxn_opcodes_h_l2017_c7_7dc9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond,
t16_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue,
t16_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse,
t16_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2017_c7_7dc9
tmp16_MUX_uxn_opcodes_h_l2017_c7_7dc9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond,
tmp16_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue,
tmp16_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse,
tmp16_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_7dc9
result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_7dc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_7dc9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_7dc9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2017_c7_7dc9
result_u8_value_MUX_uxn_opcodes_h_l2017_c7_7dc9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond,
result_u8_value_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_7dc9
result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_7dc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_7dc9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_7dc9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output);

-- n16_MUX_uxn_opcodes_h_l2017_c7_7dc9
n16_MUX_uxn_opcodes_h_l2017_c7_7dc9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond,
n16_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue,
n16_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse,
n16_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2020_c11_cc03
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_cc03 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_cc03_left,
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_cc03_right,
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_cc03_return_output);

-- t16_MUX_uxn_opcodes_h_l2020_c7_06ee
t16_MUX_uxn_opcodes_h_l2020_c7_06ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2020_c7_06ee_cond,
t16_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue,
t16_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse,
t16_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2020_c7_06ee
tmp16_MUX_uxn_opcodes_h_l2020_c7_06ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2020_c7_06ee_cond,
tmp16_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue,
tmp16_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse,
tmp16_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_06ee
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_06ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_06ee_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_06ee
result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_06ee : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_06ee_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2020_c7_06ee
result_u8_value_MUX_uxn_opcodes_h_l2020_c7_06ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2020_c7_06ee_cond,
result_u8_value_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_06ee
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_06ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_06ee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_06ee
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_06ee : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_06ee_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output);

-- n16_MUX_uxn_opcodes_h_l2020_c7_06ee
n16_MUX_uxn_opcodes_h_l2020_c7_06ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2020_c7_06ee_cond,
n16_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue,
n16_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse,
n16_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d71d
BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d71d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d71d_left,
BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d71d_right,
BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d71d_return_output);

-- t16_MUX_uxn_opcodes_h_l2025_c7_9347
t16_MUX_uxn_opcodes_h_l2025_c7_9347 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2025_c7_9347_cond,
t16_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue,
t16_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse,
t16_MUX_uxn_opcodes_h_l2025_c7_9347_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2025_c7_9347
tmp16_MUX_uxn_opcodes_h_l2025_c7_9347 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2025_c7_9347_cond,
tmp16_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue,
tmp16_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse,
tmp16_MUX_uxn_opcodes_h_l2025_c7_9347_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_9347
result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_9347 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_9347_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_9347_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_9347
result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_9347 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_9347_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_9347_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2025_c7_9347
result_u8_value_MUX_uxn_opcodes_h_l2025_c7_9347 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2025_c7_9347_cond,
result_u8_value_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2025_c7_9347_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_9347
result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_9347 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_9347_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_9347_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_9347
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_9347 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_9347_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_9347_return_output);

-- n16_MUX_uxn_opcodes_h_l2025_c7_9347
n16_MUX_uxn_opcodes_h_l2025_c7_9347 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2025_c7_9347_cond,
n16_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue,
n16_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse,
n16_MUX_uxn_opcodes_h_l2025_c7_9347_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2026_c3_526e
BIN_OP_OR_uxn_opcodes_h_l2026_c3_526e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2026_c3_526e_left,
BIN_OP_OR_uxn_opcodes_h_l2026_c3_526e_right,
BIN_OP_OR_uxn_opcodes_h_l2026_c3_526e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2029_c11_2fec
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_2fec : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_2fec_left,
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_2fec_right,
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_2fec_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2029_c7_e933
tmp16_MUX_uxn_opcodes_h_l2029_c7_e933 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2029_c7_e933_cond,
tmp16_MUX_uxn_opcodes_h_l2029_c7_e933_iftrue,
tmp16_MUX_uxn_opcodes_h_l2029_c7_e933_iffalse,
tmp16_MUX_uxn_opcodes_h_l2029_c7_e933_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e933
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e933 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e933_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e933_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e933_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e933_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e933
result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e933 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e933_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e933_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e933_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e933_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e933
result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e933 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e933_cond,
result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e933_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e933_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e933_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e933
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e933 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e933_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e933_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e933_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e933_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e933
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e933 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e933_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e933_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e933_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e933_return_output);

-- n16_MUX_uxn_opcodes_h_l2029_c7_e933
n16_MUX_uxn_opcodes_h_l2029_c7_e933 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2029_c7_e933_cond,
n16_MUX_uxn_opcodes_h_l2029_c7_e933_iftrue,
n16_MUX_uxn_opcodes_h_l2029_c7_e933_iffalse,
n16_MUX_uxn_opcodes_h_l2029_c7_e933_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7f02
BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7f02 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7f02_left,
BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7f02_right,
BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7f02_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2033_c7_6107
tmp16_MUX_uxn_opcodes_h_l2033_c7_6107 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2033_c7_6107_cond,
tmp16_MUX_uxn_opcodes_h_l2033_c7_6107_iftrue,
tmp16_MUX_uxn_opcodes_h_l2033_c7_6107_iffalse,
tmp16_MUX_uxn_opcodes_h_l2033_c7_6107_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_6107
result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_6107 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_6107_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_6107_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_6107_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_6107_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_6107
result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_6107 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_6107_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_6107_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_6107_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_6107_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2033_c7_6107
result_u8_value_MUX_uxn_opcodes_h_l2033_c7_6107 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2033_c7_6107_cond,
result_u8_value_MUX_uxn_opcodes_h_l2033_c7_6107_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2033_c7_6107_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2033_c7_6107_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_6107
result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_6107 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_6107_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_6107_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_6107_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_6107_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_6107
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_6107 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_6107_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_6107_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_6107_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_6107_return_output);

-- n16_MUX_uxn_opcodes_h_l2033_c7_6107
n16_MUX_uxn_opcodes_h_l2033_c7_6107 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2033_c7_6107_cond,
n16_MUX_uxn_opcodes_h_l2033_c7_6107_iftrue,
n16_MUX_uxn_opcodes_h_l2033_c7_6107_iffalse,
n16_MUX_uxn_opcodes_h_l2033_c7_6107_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2034_c3_85f6
BIN_OP_OR_uxn_opcodes_h_l2034_c3_85f6 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2034_c3_85f6_left,
BIN_OP_OR_uxn_opcodes_h_l2034_c3_85f6_right,
BIN_OP_OR_uxn_opcodes_h_l2034_c3_85f6_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_63e2
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_63e2 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_63e2_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_63e2_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_63e2_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2036_c30_06b6
sp_relative_shift_uxn_opcodes_h_l2036_c30_06b6 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2036_c30_06b6_ins,
sp_relative_shift_uxn_opcodes_h_l2036_c30_06b6_x,
sp_relative_shift_uxn_opcodes_h_l2036_c30_06b6_y,
sp_relative_shift_uxn_opcodes_h_l2036_c30_06b6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6271
BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6271 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6271_left,
BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6271_right,
BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6271_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_80d5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_80d5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_80d5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_80d5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_80d5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_80d5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_80d5
result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_80d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_80d5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_80d5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_80d5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_80d5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_80d5
result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_80d5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_80d5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_80d5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_80d5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_80d5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2041_c7_80d5
result_u8_value_MUX_uxn_opcodes_h_l2041_c7_80d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2041_c7_80d5_cond,
result_u8_value_MUX_uxn_opcodes_h_l2041_c7_80d5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2041_c7_80d5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2041_c7_80d5_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2044_c31_3592
CONST_SR_8_uxn_opcodes_h_l2044_c31_3592 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2044_c31_3592_x,
CONST_SR_8_uxn_opcodes_h_l2044_c31_3592_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_5ef0
CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_5ef0 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_5ef0_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_5ef0_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2004_c6_3cd9_return_output,
 t16_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output,
 tmp16_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output,
 n16_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3412_return_output,
 t16_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output,
 tmp16_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output,
 n16_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2020_c11_cc03_return_output,
 t16_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output,
 tmp16_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output,
 n16_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d71d_return_output,
 t16_MUX_uxn_opcodes_h_l2025_c7_9347_return_output,
 tmp16_MUX_uxn_opcodes_h_l2025_c7_9347_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_9347_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_9347_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2025_c7_9347_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_9347_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_9347_return_output,
 n16_MUX_uxn_opcodes_h_l2025_c7_9347_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2026_c3_526e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2029_c11_2fec_return_output,
 tmp16_MUX_uxn_opcodes_h_l2029_c7_e933_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e933_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e933_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e933_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e933_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e933_return_output,
 n16_MUX_uxn_opcodes_h_l2029_c7_e933_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7f02_return_output,
 tmp16_MUX_uxn_opcodes_h_l2033_c7_6107_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_6107_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_6107_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2033_c7_6107_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_6107_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_6107_return_output,
 n16_MUX_uxn_opcodes_h_l2033_c7_6107_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2034_c3_85f6_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_63e2_return_output,
 sp_relative_shift_uxn_opcodes_h_l2036_c30_06b6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6271_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_80d5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_80d5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_80d5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2041_c7_80d5_return_output,
 CONST_SR_8_uxn_opcodes_h_l2044_c31_3592_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_5ef0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_3cd9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_3cd9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_3cd9_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2004_c2_51ee_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_51ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2004_c2_51ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_51ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2004_c2_51ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_51ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_51ee_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_51ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_51ee_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2009_c3_80a0 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_51ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2004_c2_51ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2004_c2_51ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2014_c3_621c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_51ee_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2004_c2_51ee_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3412_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3412_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3412_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2018_c3_6139 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_cc03_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_cc03_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_cc03_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2025_c7_9347_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2020_c7_06ee_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_9347_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_06ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_9347_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_06ee_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_9347_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_06ee_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_9347_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_06ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_9347_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_06ee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2023_c3_74d1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_9347_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_06ee_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2025_c7_9347_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2020_c7_06ee_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d71d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d71d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d71d_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2025_c7_9347_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_e933_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_9347_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e933_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_9347_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e933_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_9347_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e933_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_9347_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e933_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_9347_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2027_c3_f9d3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e933_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_9347_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2029_c7_e933_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2025_c7_9347_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_526e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_526e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_526e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_2fec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_2fec_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_2fec_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_e933_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_e933_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_6107_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_e933_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e933_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e933_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_6107_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e933_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e933_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e933_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_6107_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e933_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e933_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e933_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_6107_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e933_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e933_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e933_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_6107_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e933_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e933_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e933_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_6107_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e933_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2029_c7_e933_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2029_c7_e933_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2033_c7_6107_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2029_c7_e933_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7f02_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7f02_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7f02_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_6107_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l2035_c3_a013 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_6107_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_6107_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_6107_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_6107_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_6107_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_6107_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_6107_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_80d5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_6107_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_6107_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_6107_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_80d5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_6107_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_6107_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_6107_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_80d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_6107_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_6107_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2038_c3_2a60 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_6107_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_80d5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_6107_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2033_c7_6107_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2033_c7_6107_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2033_c7_6107_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_85f6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_85f6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_85f6_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_63e2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_63e2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_63e2_return_output : unsigned(31 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_06b6_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_06b6_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_06b6_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_06b6_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2039_c21_d11c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6271_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6271_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6271_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_80d5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2043_c3_53b1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_80d5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_80d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_80d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_80d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_80d5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_80d5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2042_c3_93d3 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_80d5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_80d5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_80d5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_80d5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_80d5_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2044_c31_3592_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2044_c31_3592_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2044_c21_b40a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2020_l2017_l2004_l2041_l2029_l2025_DUPLICATE_bf82_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2020_l2017_l2033_l2029_l2025_DUPLICATE_91f7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2020_l2017_l2041_l2029_l2025_DUPLICATE_f5c6_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2020_l2017_l2041_l2033_l2029_l2025_DUPLICATE_afe4_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2021_l2030_l2034_l2026_DUPLICATE_b049_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_5ef0_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_5ef0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2029_l2041_DUPLICATE_36cc_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l2000_l2048_DUPLICATE_a734_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2014_c3_621c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2014_c3_621c;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2018_c3_6139 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2018_c3_6139;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2038_c3_2a60 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_6107_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2038_c3_2a60;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3412_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d71d_right := to_unsigned(3, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_80d5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_3cd9_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_06b6_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7f02_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6271_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2027_c3_f9d3 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2027_c3_f9d3;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2042_c3_93d3 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_80d5_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2042_c3_93d3;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_2fec_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_6107_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2023_c3_74d1 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2023_c3_74d1;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2043_c3_53b1 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_80d5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2043_c3_53b1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_cc03_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_06b6_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2009_c3_80a0 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2009_c3_80a0;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_06b6_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_85f6_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2033_c7_6107_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_3cd9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3412_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_cc03_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d71d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_2fec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7f02_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6271_left := VAR_phase;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_63e2_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_526e_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2044_c31_3592_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_e933_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_6107_iffalse := tmp16;
     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2004_c2_51ee] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2004_c2_51ee_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2041_c11_6271] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6271_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6271_left;
     BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6271_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6271_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6271_return_output := BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6271_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2020_c11_cc03] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2020_c11_cc03_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_cc03_left;
     BIN_OP_EQ_uxn_opcodes_h_l2020_c11_cc03_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_cc03_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_cc03_return_output := BIN_OP_EQ_uxn_opcodes_h_l2020_c11_cc03_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2020_l2017_l2004_l2041_l2029_l2025_DUPLICATE_bf82 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2020_l2017_l2004_l2041_l2029_l2025_DUPLICATE_bf82_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2004_c6_3cd9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2004_c6_3cd9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_3cd9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2004_c6_3cd9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_3cd9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_3cd9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2004_c6_3cd9_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2044_c31_3592] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2044_c31_3592_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2044_c31_3592_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2044_c31_3592_return_output := CONST_SR_8_uxn_opcodes_h_l2044_c31_3592_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2029_c11_2fec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2029_c11_2fec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_2fec_left;
     BIN_OP_EQ_uxn_opcodes_h_l2029_c11_2fec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_2fec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_2fec_return_output := BIN_OP_EQ_uxn_opcodes_h_l2029_c11_2fec_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2025_c11_d71d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d71d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d71d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d71d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d71d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d71d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d71d_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2020_l2017_l2041_l2029_l2025_DUPLICATE_f5c6 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2020_l2017_l2041_l2029_l2025_DUPLICATE_f5c6_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2020_l2017_l2041_l2033_l2029_l2025_DUPLICATE_afe4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2020_l2017_l2041_l2033_l2029_l2025_DUPLICATE_afe4_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2020_l2017_l2033_l2029_l2025_DUPLICATE_91f7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2020_l2017_l2033_l2029_l2025_DUPLICATE_91f7_return_output := result.is_stack_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2004_c2_51ee] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2004_c2_51ee_return_output := result.is_stack_index_flipped;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2004_c2_51ee] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2004_c2_51ee_return_output := result.is_ram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2004_c2_51ee] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2004_c2_51ee_return_output := result.is_pc_updated;

     -- sp_relative_shift[uxn_opcodes_h_l2036_c30_06b6] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2036_c30_06b6_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_06b6_ins;
     sp_relative_shift_uxn_opcodes_h_l2036_c30_06b6_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_06b6_x;
     sp_relative_shift_uxn_opcodes_h_l2036_c30_06b6_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_06b6_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_06b6_return_output := sp_relative_shift_uxn_opcodes_h_l2036_c30_06b6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2033_c11_7f02] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7f02_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7f02_left;
     BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7f02_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7f02_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7f02_return_output := BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7f02_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2029_l2041_DUPLICATE_36cc LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2029_l2041_DUPLICATE_36cc_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2017_c11_3412] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3412_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3412_left;
     BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3412_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3412_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3412_return_output := BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3412_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2021_l2030_l2034_l2026_DUPLICATE_b049 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2021_l2030_l2034_l2026_DUPLICATE_b049_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2004_c2_51ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_3cd9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_51ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_3cd9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_51ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_3cd9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_3cd9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_51ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_3cd9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_51ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_3cd9_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_3cd9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_51ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_3cd9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_51ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_3cd9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_51ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_3cd9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2004_c2_51ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_3cd9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_51ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_3cd9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3412_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3412_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3412_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3412_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3412_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3412_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3412_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_3412_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2020_c7_06ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_cc03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_06ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_cc03_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_06ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_cc03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_06ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_cc03_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_06ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_cc03_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_06ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_cc03_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2020_c7_06ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_cc03_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_06ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_cc03_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2025_c7_9347_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d71d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_9347_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d71d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_9347_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d71d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_9347_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d71d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_9347_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d71d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_9347_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d71d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2025_c7_9347_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d71d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_9347_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d71d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2029_c7_e933_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_2fec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e933_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_2fec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e933_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_2fec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e933_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_2fec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e933_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_2fec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e933_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_2fec_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_e933_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_2fec_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2033_c7_6107_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7f02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_6107_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7f02_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_6107_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7f02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_6107_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7f02_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_6107_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7f02_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_6107_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7f02_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_6107_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_7f02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_80d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6271_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_80d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6271_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_80d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6271_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_80d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6271_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_526e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2021_l2030_l2034_l2026_DUPLICATE_b049_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_85f6_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2021_l2030_l2034_l2026_DUPLICATE_b049_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_5ef0_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2021_l2030_l2034_l2026_DUPLICATE_b049_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2020_l2017_l2041_l2029_l2025_DUPLICATE_f5c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2020_l2017_l2041_l2029_l2025_DUPLICATE_f5c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2020_l2017_l2041_l2029_l2025_DUPLICATE_f5c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e933_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2020_l2017_l2041_l2029_l2025_DUPLICATE_f5c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_80d5_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2020_l2017_l2041_l2029_l2025_DUPLICATE_f5c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2020_l2017_l2041_l2033_l2029_l2025_DUPLICATE_afe4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2020_l2017_l2041_l2033_l2029_l2025_DUPLICATE_afe4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2020_l2017_l2041_l2033_l2029_l2025_DUPLICATE_afe4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e933_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2020_l2017_l2041_l2033_l2029_l2025_DUPLICATE_afe4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_6107_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2020_l2017_l2041_l2033_l2029_l2025_DUPLICATE_afe4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_80d5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2020_l2017_l2041_l2033_l2029_l2025_DUPLICATE_afe4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2020_l2017_l2033_l2029_l2025_DUPLICATE_91f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2020_l2017_l2033_l2029_l2025_DUPLICATE_91f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2020_l2017_l2033_l2029_l2025_DUPLICATE_91f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e933_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2020_l2017_l2033_l2029_l2025_DUPLICATE_91f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_6107_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2020_l2017_l2033_l2029_l2025_DUPLICATE_91f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e933_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2029_l2041_DUPLICATE_36cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_80d5_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2029_l2041_DUPLICATE_36cc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2020_l2017_l2004_l2041_l2029_l2025_DUPLICATE_bf82_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2020_l2017_l2004_l2041_l2029_l2025_DUPLICATE_bf82_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2020_l2017_l2004_l2041_l2029_l2025_DUPLICATE_bf82_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2020_l2017_l2004_l2041_l2029_l2025_DUPLICATE_bf82_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e933_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2020_l2017_l2004_l2041_l2029_l2025_DUPLICATE_bf82_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_80d5_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2020_l2017_l2004_l2041_l2029_l2025_DUPLICATE_bf82_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2004_c2_51ee_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2004_c2_51ee_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2004_c2_51ee_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2004_c2_51ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_6107_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_06b6_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2004_c2_51ee] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_51ee_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_51ee_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2026_c3_526e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2026_c3_526e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_526e_left;
     BIN_OP_OR_uxn_opcodes_h_l2026_c3_526e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_526e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_526e_return_output := BIN_OP_OR_uxn_opcodes_h_l2026_c3_526e_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2044_c21_b40a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2044_c21_b40a_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2044_c31_3592_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2041_c7_80d5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_80d5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_80d5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_80d5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_80d5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_80d5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_80d5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_80d5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_80d5_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2004_c2_51ee] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_5ef0 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_5ef0_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_5ef0_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_5ef0_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_5ef0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2041_c7_80d5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_80d5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_80d5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_80d5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_80d5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_80d5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_80d5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_80d5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_80d5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2041_c7_80d5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_80d5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_80d5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_80d5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_80d5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_80d5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_80d5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_80d5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_80d5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2033_c7_6107] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_6107_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_6107_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_6107_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_6107_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_6107_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_6107_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_6107_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_6107_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2034_c3_85f6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2034_c3_85f6_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_85f6_left;
     BIN_OP_OR_uxn_opcodes_h_l2034_c3_85f6_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_85f6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_85f6_return_output := BIN_OP_OR_uxn_opcodes_h_l2034_c3_85f6_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2004_c2_51ee] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_51ee_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_51ee_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2004_c2_51ee] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_526e_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_63e2_right := VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_85f6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2033_c7_6107_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_85f6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_80d5_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2044_c21_b40a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2029_c7_e933_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_5ef0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_5ef0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_6107_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_80d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e933_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_6107_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_6107_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_80d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_6107_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_80d5_return_output;
     -- t16_MUX[uxn_opcodes_h_l2025_c7_9347] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2025_c7_9347_cond <= VAR_t16_MUX_uxn_opcodes_h_l2025_c7_9347_cond;
     t16_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue;
     t16_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2025_c7_9347_return_output := t16_MUX_uxn_opcodes_h_l2025_c7_9347_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2035_c11_63e2] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_63e2_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_63e2_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_63e2_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_63e2_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_63e2_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_63e2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2033_c7_6107] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_6107_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_6107_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_6107_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_6107_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_6107_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_6107_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_6107_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_6107_return_output;

     -- n16_MUX[uxn_opcodes_h_l2033_c7_6107] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2033_c7_6107_cond <= VAR_n16_MUX_uxn_opcodes_h_l2033_c7_6107_cond;
     n16_MUX_uxn_opcodes_h_l2033_c7_6107_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2033_c7_6107_iftrue;
     n16_MUX_uxn_opcodes_h_l2033_c7_6107_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2033_c7_6107_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2033_c7_6107_return_output := n16_MUX_uxn_opcodes_h_l2033_c7_6107_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2041_c7_80d5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2041_c7_80d5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_80d5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2041_c7_80d5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_80d5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2041_c7_80d5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_80d5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_80d5_return_output := result_u8_value_MUX_uxn_opcodes_h_l2041_c7_80d5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2033_c7_6107] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_6107_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_6107_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_6107_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_6107_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_6107_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_6107_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_6107_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_6107_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2033_c7_6107] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_6107_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_6107_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_6107_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_6107_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_6107_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_6107_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_6107_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_6107_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2029_c7_e933] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e933_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e933_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e933_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e933_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e933_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e933_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e933_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e933_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l2035_c3_a013 := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_63e2_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l2029_c7_e933_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2033_c7_6107_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e933_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_6107_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_e933_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e933_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_6107_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e933_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_6107_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_6107_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_80d5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2025_c7_9347_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_6107_iftrue := VAR_tmp16_uxn_opcodes_h_l2035_c3_a013;
     -- t16_MUX[uxn_opcodes_h_l2020_c7_06ee] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2020_c7_06ee_cond <= VAR_t16_MUX_uxn_opcodes_h_l2020_c7_06ee_cond;
     t16_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue;
     t16_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output := t16_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2033_c7_6107] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2033_c7_6107_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_6107_cond;
     tmp16_MUX_uxn_opcodes_h_l2033_c7_6107_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_6107_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2033_c7_6107_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_6107_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_6107_return_output := tmp16_MUX_uxn_opcodes_h_l2033_c7_6107_return_output;

     -- n16_MUX[uxn_opcodes_h_l2029_c7_e933] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2029_c7_e933_cond <= VAR_n16_MUX_uxn_opcodes_h_l2029_c7_e933_cond;
     n16_MUX_uxn_opcodes_h_l2029_c7_e933_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2029_c7_e933_iftrue;
     n16_MUX_uxn_opcodes_h_l2029_c7_e933_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2029_c7_e933_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2029_c7_e933_return_output := n16_MUX_uxn_opcodes_h_l2029_c7_e933_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2025_c7_9347] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_9347_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_9347_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_9347_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_9347_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2029_c7_e933] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e933_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e933_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e933_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e933_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e933_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e933_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e933_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e933_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2029_c7_e933] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e933_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e933_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e933_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e933_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e933_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e933_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e933_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e933_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2039_c21_d11c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2039_c21_d11c_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l2035_c3_a013);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2029_c7_e933] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e933_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e933_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e933_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e933_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e933_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e933_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e933_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e933_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_6107_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2039_c21_d11c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2029_c7_e933_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_e933_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_9347_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_e933_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_e933_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_e933_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_6107_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2033_c7_6107] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2033_c7_6107_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_6107_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2033_c7_6107_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_6107_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2033_c7_6107_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_6107_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_6107_return_output := result_u8_value_MUX_uxn_opcodes_h_l2033_c7_6107_return_output;

     -- n16_MUX[uxn_opcodes_h_l2025_c7_9347] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2025_c7_9347_cond <= VAR_n16_MUX_uxn_opcodes_h_l2025_c7_9347_cond;
     n16_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue;
     n16_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2025_c7_9347_return_output := n16_MUX_uxn_opcodes_h_l2025_c7_9347_return_output;

     -- t16_MUX[uxn_opcodes_h_l2017_c7_7dc9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond <= VAR_t16_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond;
     t16_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue;
     t16_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output := t16_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2029_c7_e933] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2029_c7_e933_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_e933_cond;
     tmp16_MUX_uxn_opcodes_h_l2029_c7_e933_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_e933_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2029_c7_e933_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_e933_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_e933_return_output := tmp16_MUX_uxn_opcodes_h_l2029_c7_e933_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2020_c7_06ee] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_06ee_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_06ee_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2025_c7_9347] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_9347_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_9347_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_9347_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_9347_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2025_c7_9347] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_9347_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_9347_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_9347_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_9347_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2025_c7_9347] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_9347_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_9347_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_9347_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_9347_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2025_c7_9347_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_9347_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_9347_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_9347_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e933_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_6107_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_e933_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2017_c7_7dc9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output;

     -- n16_MUX[uxn_opcodes_h_l2020_c7_06ee] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2020_c7_06ee_cond <= VAR_n16_MUX_uxn_opcodes_h_l2020_c7_06ee_cond;
     n16_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue;
     n16_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output := n16_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2020_c7_06ee] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_06ee_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_06ee_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output;

     -- t16_MUX[uxn_opcodes_h_l2004_c2_51ee] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2004_c2_51ee_cond <= VAR_t16_MUX_uxn_opcodes_h_l2004_c2_51ee_cond;
     t16_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue;
     t16_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output := t16_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2020_c7_06ee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_06ee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_06ee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2025_c7_9347] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2025_c7_9347_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_9347_cond;
     tmp16_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_9347_return_output := tmp16_MUX_uxn_opcodes_h_l2025_c7_9347_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2029_c7_e933] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e933_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e933_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e933_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e933_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e933_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e933_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e933_return_output := result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e933_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2020_c7_06ee] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_06ee_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_06ee_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_e933_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_9347_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2017_c7_7dc9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2020_c7_06ee] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2020_c7_06ee_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_06ee_cond;
     tmp16_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output := tmp16_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output;

     -- n16_MUX[uxn_opcodes_h_l2017_c7_7dc9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond <= VAR_n16_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond;
     n16_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue;
     n16_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output := n16_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2017_c7_7dc9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2025_c7_9347] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2025_c7_9347_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_9347_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_9347_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_9347_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_9347_return_output := result_u8_value_MUX_uxn_opcodes_h_l2025_c7_9347_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2004_c2_51ee] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_51ee_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_51ee_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2017_c7_7dc9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_9347_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2004_c2_51ee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_51ee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_51ee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2004_c2_51ee] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_51ee_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_51ee_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2004_c2_51ee] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_51ee_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_51ee_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2020_c7_06ee] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2020_c7_06ee_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_06ee_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_06ee_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_06ee_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output := result_u8_value_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output;

     -- n16_MUX[uxn_opcodes_h_l2004_c2_51ee] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2004_c2_51ee_cond <= VAR_n16_MUX_uxn_opcodes_h_l2004_c2_51ee_cond;
     n16_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue;
     n16_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output := n16_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2017_c7_7dc9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond;
     tmp16_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output := tmp16_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_06ee_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2017_c7_7dc9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_7dc9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_7dc9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_7dc9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output := result_u8_value_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2004_c2_51ee] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2004_c2_51ee_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_51ee_cond;
     tmp16_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output := tmp16_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_7dc9_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2004_c2_51ee] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2004_c2_51ee_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_51ee_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_51ee_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_51ee_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output := result_u8_value_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l2000_l2048_DUPLICATE_a734 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l2000_l2048_DUPLICATE_a734_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_71f0(
     result,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_51ee_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l2000_l2048_DUPLICATE_a734_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l2000_l2048_DUPLICATE_a734_return_output;
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
