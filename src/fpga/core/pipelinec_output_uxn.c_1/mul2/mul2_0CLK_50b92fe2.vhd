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
-- BIN_OP_EQ[uxn_opcodes_h_l2004_c6_37c0]
signal BIN_OP_EQ_uxn_opcodes_h_l2004_c6_37c0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2004_c6_37c0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2004_c6_37c0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2004_c2_b323]
signal n16_MUX_uxn_opcodes_h_l2004_c2_b323_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2004_c2_b323_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2004_c2_b323]
signal tmp16_MUX_uxn_opcodes_h_l2004_c2_b323_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2004_c2_b323_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2004_c2_b323]
signal t16_MUX_uxn_opcodes_h_l2004_c2_b323_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2004_c2_b323_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2004_c2_b323]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_b323_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_b323_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2004_c2_b323]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_b323_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_b323_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2004_c2_b323]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_b323_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_b323_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2004_c2_b323]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_b323_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_b323_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2004_c2_b323]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_b323_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_b323_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2004_c2_b323]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_b323_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_b323_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2004_c2_b323]
signal result_u8_value_MUX_uxn_opcodes_h_l2004_c2_b323_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2004_c2_b323_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2004_c2_b323]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_b323_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_b323_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2004_c2_b323]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_b323_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_b323_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2017_c11_aea5]
signal BIN_OP_EQ_uxn_opcodes_h_l2017_c11_aea5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2017_c11_aea5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2017_c11_aea5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2017_c7_94a3]
signal n16_MUX_uxn_opcodes_h_l2017_c7_94a3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2017_c7_94a3]
signal tmp16_MUX_uxn_opcodes_h_l2017_c7_94a3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2017_c7_94a3]
signal t16_MUX_uxn_opcodes_h_l2017_c7_94a3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2017_c7_94a3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_94a3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2017_c7_94a3]
signal result_u8_value_MUX_uxn_opcodes_h_l2017_c7_94a3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2017_c7_94a3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_94a3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2017_c7_94a3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_94a3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2017_c7_94a3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_94a3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2020_c11_a6ba]
signal BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a6ba_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a6ba_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a6ba_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2020_c7_fa98]
signal n16_MUX_uxn_opcodes_h_l2020_c7_fa98_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2020_c7_fa98]
signal tmp16_MUX_uxn_opcodes_h_l2020_c7_fa98_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2020_c7_fa98]
signal t16_MUX_uxn_opcodes_h_l2020_c7_fa98_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2020_c7_fa98]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fa98_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2020_c7_fa98]
signal result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fa98_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2020_c7_fa98]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fa98_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2020_c7_fa98]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fa98_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2020_c7_fa98]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fa98_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2025_c11_d641]
signal BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d641_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d641_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d641_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2025_c7_861a]
signal n16_MUX_uxn_opcodes_h_l2025_c7_861a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2025_c7_861a_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2025_c7_861a]
signal tmp16_MUX_uxn_opcodes_h_l2025_c7_861a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2025_c7_861a_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2025_c7_861a]
signal t16_MUX_uxn_opcodes_h_l2025_c7_861a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2025_c7_861a_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2025_c7_861a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_861a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_861a_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2025_c7_861a]
signal result_u8_value_MUX_uxn_opcodes_h_l2025_c7_861a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2025_c7_861a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2025_c7_861a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_861a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_861a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2025_c7_861a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_861a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_861a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2025_c7_861a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_861a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_861a_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2026_c3_611b]
signal BIN_OP_OR_uxn_opcodes_h_l2026_c3_611b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2026_c3_611b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2026_c3_611b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2029_c11_9782]
signal BIN_OP_EQ_uxn_opcodes_h_l2029_c11_9782_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2029_c11_9782_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2029_c11_9782_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2029_c7_80fe]
signal n16_MUX_uxn_opcodes_h_l2029_c7_80fe_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2029_c7_80fe_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2029_c7_80fe_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2029_c7_80fe]
signal tmp16_MUX_uxn_opcodes_h_l2029_c7_80fe_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2029_c7_80fe_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2029_c7_80fe_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2029_c7_80fe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_80fe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_80fe_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_80fe_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2029_c7_80fe]
signal result_u8_value_MUX_uxn_opcodes_h_l2029_c7_80fe_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2029_c7_80fe_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2029_c7_80fe_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2029_c7_80fe]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_80fe_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_80fe_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_80fe_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2029_c7_80fe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_80fe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_80fe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_80fe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2029_c7_80fe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_80fe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_80fe_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_80fe_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2033_c11_ef10]
signal BIN_OP_EQ_uxn_opcodes_h_l2033_c11_ef10_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2033_c11_ef10_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2033_c11_ef10_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2033_c7_32a4]
signal n16_MUX_uxn_opcodes_h_l2033_c7_32a4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2033_c7_32a4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2033_c7_32a4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2033_c7_32a4]
signal tmp16_MUX_uxn_opcodes_h_l2033_c7_32a4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2033_c7_32a4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2033_c7_32a4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2033_c7_32a4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_32a4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_32a4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_32a4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2033_c7_32a4]
signal result_u8_value_MUX_uxn_opcodes_h_l2033_c7_32a4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2033_c7_32a4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2033_c7_32a4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2033_c7_32a4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_32a4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_32a4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_32a4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2033_c7_32a4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_32a4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_32a4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_32a4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2033_c7_32a4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_32a4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_32a4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_32a4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2034_c3_1787]
signal BIN_OP_OR_uxn_opcodes_h_l2034_c3_1787_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2034_c3_1787_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2034_c3_1787_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2035_c11_6620]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_6620_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_6620_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_6620_return_output : unsigned(31 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2036_c30_f830]
signal sp_relative_shift_uxn_opcodes_h_l2036_c30_f830_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2036_c30_f830_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2036_c30_f830_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2036_c30_f830_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2041_c11_6dbe]
signal BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6dbe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6dbe_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6dbe_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2041_c7_ceb1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_ceb1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_ceb1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_ceb1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_ceb1_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2041_c7_ceb1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_ceb1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_ceb1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_ceb1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_ceb1_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2041_c7_ceb1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_ceb1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_ceb1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_ceb1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_ceb1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2041_c7_ceb1]
signal result_u8_value_MUX_uxn_opcodes_h_l2041_c7_ceb1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2041_c7_ceb1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2041_c7_ceb1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2041_c7_ceb1_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2044_c31_c19f]
signal CONST_SR_8_uxn_opcodes_h_l2044_c31_c19f_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2044_c31_c19f_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_78db
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_78db_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_78db_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_ee25( ref_toks_0 : opcode_result_t;
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
      base.is_ram_write := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.u8_value := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_vram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2004_c6_37c0
BIN_OP_EQ_uxn_opcodes_h_l2004_c6_37c0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2004_c6_37c0_left,
BIN_OP_EQ_uxn_opcodes_h_l2004_c6_37c0_right,
BIN_OP_EQ_uxn_opcodes_h_l2004_c6_37c0_return_output);

-- n16_MUX_uxn_opcodes_h_l2004_c2_b323
n16_MUX_uxn_opcodes_h_l2004_c2_b323 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2004_c2_b323_cond,
n16_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue,
n16_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse,
n16_MUX_uxn_opcodes_h_l2004_c2_b323_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2004_c2_b323
tmp16_MUX_uxn_opcodes_h_l2004_c2_b323 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2004_c2_b323_cond,
tmp16_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue,
tmp16_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse,
tmp16_MUX_uxn_opcodes_h_l2004_c2_b323_return_output);

-- t16_MUX_uxn_opcodes_h_l2004_c2_b323
t16_MUX_uxn_opcodes_h_l2004_c2_b323 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2004_c2_b323_cond,
t16_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue,
t16_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse,
t16_MUX_uxn_opcodes_h_l2004_c2_b323_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_b323
result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_b323 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_b323_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_b323_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_b323
result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_b323 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_b323_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_b323_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_b323
result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_b323 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_b323_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_b323_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_b323
result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_b323 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_b323_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_b323_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_b323
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_b323 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_b323_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_b323_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_b323
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_b323 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_b323_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_b323_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2004_c2_b323
result_u8_value_MUX_uxn_opcodes_h_l2004_c2_b323 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2004_c2_b323_cond,
result_u8_value_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2004_c2_b323_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_b323
result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_b323 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_b323_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_b323_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_b323
result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_b323 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_b323_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_b323_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2017_c11_aea5
BIN_OP_EQ_uxn_opcodes_h_l2017_c11_aea5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2017_c11_aea5_left,
BIN_OP_EQ_uxn_opcodes_h_l2017_c11_aea5_right,
BIN_OP_EQ_uxn_opcodes_h_l2017_c11_aea5_return_output);

-- n16_MUX_uxn_opcodes_h_l2017_c7_94a3
n16_MUX_uxn_opcodes_h_l2017_c7_94a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2017_c7_94a3_cond,
n16_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue,
n16_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse,
n16_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2017_c7_94a3
tmp16_MUX_uxn_opcodes_h_l2017_c7_94a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2017_c7_94a3_cond,
tmp16_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue,
tmp16_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse,
tmp16_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output);

-- t16_MUX_uxn_opcodes_h_l2017_c7_94a3
t16_MUX_uxn_opcodes_h_l2017_c7_94a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2017_c7_94a3_cond,
t16_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue,
t16_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse,
t16_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_94a3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_94a3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_94a3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2017_c7_94a3
result_u8_value_MUX_uxn_opcodes_h_l2017_c7_94a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2017_c7_94a3_cond,
result_u8_value_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_94a3
result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_94a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_94a3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_94a3
result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_94a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_94a3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_94a3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_94a3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_94a3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a6ba
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a6ba : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a6ba_left,
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a6ba_right,
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a6ba_return_output);

-- n16_MUX_uxn_opcodes_h_l2020_c7_fa98
n16_MUX_uxn_opcodes_h_l2020_c7_fa98 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2020_c7_fa98_cond,
n16_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue,
n16_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse,
n16_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2020_c7_fa98
tmp16_MUX_uxn_opcodes_h_l2020_c7_fa98 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2020_c7_fa98_cond,
tmp16_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue,
tmp16_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse,
tmp16_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output);

-- t16_MUX_uxn_opcodes_h_l2020_c7_fa98
t16_MUX_uxn_opcodes_h_l2020_c7_fa98 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2020_c7_fa98_cond,
t16_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue,
t16_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse,
t16_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fa98
result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fa98 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fa98_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fa98
result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fa98 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fa98_cond,
result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fa98
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fa98 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fa98_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fa98
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fa98 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fa98_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fa98
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fa98 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fa98_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d641
BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d641 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d641_left,
BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d641_right,
BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d641_return_output);

-- n16_MUX_uxn_opcodes_h_l2025_c7_861a
n16_MUX_uxn_opcodes_h_l2025_c7_861a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2025_c7_861a_cond,
n16_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue,
n16_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse,
n16_MUX_uxn_opcodes_h_l2025_c7_861a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2025_c7_861a
tmp16_MUX_uxn_opcodes_h_l2025_c7_861a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2025_c7_861a_cond,
tmp16_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue,
tmp16_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse,
tmp16_MUX_uxn_opcodes_h_l2025_c7_861a_return_output);

-- t16_MUX_uxn_opcodes_h_l2025_c7_861a
t16_MUX_uxn_opcodes_h_l2025_c7_861a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2025_c7_861a_cond,
t16_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue,
t16_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse,
t16_MUX_uxn_opcodes_h_l2025_c7_861a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_861a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_861a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_861a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_861a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2025_c7_861a
result_u8_value_MUX_uxn_opcodes_h_l2025_c7_861a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2025_c7_861a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2025_c7_861a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_861a
result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_861a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_861a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_861a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_861a
result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_861a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_861a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_861a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_861a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_861a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_861a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_861a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2026_c3_611b
BIN_OP_OR_uxn_opcodes_h_l2026_c3_611b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2026_c3_611b_left,
BIN_OP_OR_uxn_opcodes_h_l2026_c3_611b_right,
BIN_OP_OR_uxn_opcodes_h_l2026_c3_611b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2029_c11_9782
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_9782 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_9782_left,
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_9782_right,
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_9782_return_output);

-- n16_MUX_uxn_opcodes_h_l2029_c7_80fe
n16_MUX_uxn_opcodes_h_l2029_c7_80fe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2029_c7_80fe_cond,
n16_MUX_uxn_opcodes_h_l2029_c7_80fe_iftrue,
n16_MUX_uxn_opcodes_h_l2029_c7_80fe_iffalse,
n16_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2029_c7_80fe
tmp16_MUX_uxn_opcodes_h_l2029_c7_80fe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2029_c7_80fe_cond,
tmp16_MUX_uxn_opcodes_h_l2029_c7_80fe_iftrue,
tmp16_MUX_uxn_opcodes_h_l2029_c7_80fe_iffalse,
tmp16_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_80fe
result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_80fe : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_80fe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_80fe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_80fe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2029_c7_80fe
result_u8_value_MUX_uxn_opcodes_h_l2029_c7_80fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2029_c7_80fe_cond,
result_u8_value_MUX_uxn_opcodes_h_l2029_c7_80fe_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2029_c7_80fe_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_80fe
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_80fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_80fe_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_80fe_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_80fe_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_80fe
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_80fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_80fe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_80fe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_80fe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_80fe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_80fe : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_80fe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_80fe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_80fe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2033_c11_ef10
BIN_OP_EQ_uxn_opcodes_h_l2033_c11_ef10 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2033_c11_ef10_left,
BIN_OP_EQ_uxn_opcodes_h_l2033_c11_ef10_right,
BIN_OP_EQ_uxn_opcodes_h_l2033_c11_ef10_return_output);

-- n16_MUX_uxn_opcodes_h_l2033_c7_32a4
n16_MUX_uxn_opcodes_h_l2033_c7_32a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2033_c7_32a4_cond,
n16_MUX_uxn_opcodes_h_l2033_c7_32a4_iftrue,
n16_MUX_uxn_opcodes_h_l2033_c7_32a4_iffalse,
n16_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2033_c7_32a4
tmp16_MUX_uxn_opcodes_h_l2033_c7_32a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2033_c7_32a4_cond,
tmp16_MUX_uxn_opcodes_h_l2033_c7_32a4_iftrue,
tmp16_MUX_uxn_opcodes_h_l2033_c7_32a4_iffalse,
tmp16_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_32a4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_32a4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_32a4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_32a4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_32a4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2033_c7_32a4
result_u8_value_MUX_uxn_opcodes_h_l2033_c7_32a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2033_c7_32a4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2033_c7_32a4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2033_c7_32a4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_32a4
result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_32a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_32a4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_32a4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_32a4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_32a4
result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_32a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_32a4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_32a4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_32a4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_32a4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_32a4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_32a4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_32a4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_32a4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2034_c3_1787
BIN_OP_OR_uxn_opcodes_h_l2034_c3_1787 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2034_c3_1787_left,
BIN_OP_OR_uxn_opcodes_h_l2034_c3_1787_right,
BIN_OP_OR_uxn_opcodes_h_l2034_c3_1787_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_6620
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_6620 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_6620_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_6620_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_6620_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2036_c30_f830
sp_relative_shift_uxn_opcodes_h_l2036_c30_f830 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2036_c30_f830_ins,
sp_relative_shift_uxn_opcodes_h_l2036_c30_f830_x,
sp_relative_shift_uxn_opcodes_h_l2036_c30_f830_y,
sp_relative_shift_uxn_opcodes_h_l2036_c30_f830_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6dbe
BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6dbe : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6dbe_left,
BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6dbe_right,
BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6dbe_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_ceb1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_ceb1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_ceb1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_ceb1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_ceb1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_ceb1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_ceb1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_ceb1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_ceb1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_ceb1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_ceb1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_ceb1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_ceb1
result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_ceb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_ceb1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_ceb1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_ceb1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_ceb1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2041_c7_ceb1
result_u8_value_MUX_uxn_opcodes_h_l2041_c7_ceb1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2041_c7_ceb1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2041_c7_ceb1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2041_c7_ceb1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2041_c7_ceb1_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2044_c31_c19f
CONST_SR_8_uxn_opcodes_h_l2044_c31_c19f : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2044_c31_c19f_x,
CONST_SR_8_uxn_opcodes_h_l2044_c31_c19f_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_78db
CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_78db : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_78db_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_78db_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2004_c6_37c0_return_output,
 n16_MUX_uxn_opcodes_h_l2004_c2_b323_return_output,
 tmp16_MUX_uxn_opcodes_h_l2004_c2_b323_return_output,
 t16_MUX_uxn_opcodes_h_l2004_c2_b323_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_b323_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_b323_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_b323_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_b323_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_b323_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_b323_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2004_c2_b323_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_b323_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_b323_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2017_c11_aea5_return_output,
 n16_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output,
 tmp16_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output,
 t16_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a6ba_return_output,
 n16_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output,
 tmp16_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output,
 t16_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d641_return_output,
 n16_MUX_uxn_opcodes_h_l2025_c7_861a_return_output,
 tmp16_MUX_uxn_opcodes_h_l2025_c7_861a_return_output,
 t16_MUX_uxn_opcodes_h_l2025_c7_861a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_861a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2025_c7_861a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_861a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_861a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_861a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2026_c3_611b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2029_c11_9782_return_output,
 n16_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output,
 tmp16_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2033_c11_ef10_return_output,
 n16_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output,
 tmp16_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2034_c3_1787_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_6620_return_output,
 sp_relative_shift_uxn_opcodes_h_l2036_c30_f830_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6dbe_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_ceb1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_ceb1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_ceb1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2041_c7_ceb1_return_output,
 CONST_SR_8_uxn_opcodes_h_l2044_c31_c19f_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_78db_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_37c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_37c0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_37c0_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2004_c2_b323_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2004_c2_b323_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_b323_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_b323_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2004_c2_b323_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2004_c2_b323_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2009_c3_2f86 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_b323_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_b323_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2004_c2_b323_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_b323_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_b323_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_b323_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_b323_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_b323_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_b323_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2014_c3_a245 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_b323_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_b323_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2004_c2_b323_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_b323_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_b323_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_b323_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_b323_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2004_c2_b323_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_b323_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_b323_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2004_c2_b323_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_b323_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_b323_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_aea5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_aea5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_aea5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2017_c7_94a3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_94a3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2017_c7_94a3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_94a3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_94a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_94a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_94a3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2018_c3_d205 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_94a3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a6ba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a6ba_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a6ba_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2025_c7_861a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2020_c7_fa98_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_861a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_fa98_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2025_c7_861a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2020_c7_fa98_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_861a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fa98_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_861a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fa98_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_861a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fa98_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_861a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fa98_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2023_c3_2e48 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_861a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fa98_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d641_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d641_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d641_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2025_c7_861a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_861a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2025_c7_861a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_861a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_861a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_861a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_861a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2027_c3_5080 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_861a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_611b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_611b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_611b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_9782_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_9782_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_9782_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2029_c7_80fe_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2029_c7_80fe_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2029_c7_80fe_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_80fe_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_80fe_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_80fe_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_80fe_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_80fe_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_80fe_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_80fe_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_80fe_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_80fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_80fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_80fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_80fe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_80fe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_80fe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_80fe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_80fe_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_80fe_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_80fe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_ef10_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_ef10_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_ef10_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2033_c7_32a4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2033_c7_32a4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2033_c7_32a4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_32a4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l2035_c3_1bbf : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_32a4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_32a4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_32a4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_32a4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_ceb1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_32a4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_32a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_32a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_ceb1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_32a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_32a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_32a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_32a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_32a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_32a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_ceb1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_32a4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_32a4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2038_c3_71b5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_32a4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_ceb1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_32a4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_1787_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_1787_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_1787_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_6620_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_6620_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_6620_return_output : unsigned(31 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_f830_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_f830_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_f830_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_f830_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2039_c21_1f47_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6dbe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6dbe_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6dbe_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_ceb1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2042_c3_b0d8 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_ceb1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_ceb1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_ceb1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2043_c3_aba3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_ceb1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_ceb1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_ceb1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_ceb1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_ceb1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_ceb1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_ceb1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_ceb1_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2044_c31_c19f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2044_c31_c19f_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2044_c21_cdbe_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2017_l2004_l2041_l2029_l2025_l2020_DUPLICATE_1821_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2017_l2041_l2029_l2025_l2020_DUPLICATE_1a0b_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2017_l2033_l2029_l2025_l2020_DUPLICATE_972b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2017_l2041_l2033_l2029_l2025_l2020_DUPLICATE_3793_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2030_l2034_l2026_l2021_DUPLICATE_d840_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_78db_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_78db_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2041_l2029_DUPLICATE_b07d_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l2048_l2000_DUPLICATE_f533_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_aea5_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2014_c3_a245 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2014_c3_a245;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6dbe_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2018_c3_d205 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2018_c3_d205;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_37c0_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2009_c3_2f86 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2009_c3_2f86;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d641_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2043_c3_aba3 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_ceb1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2043_c3_aba3;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_32a4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_9782_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_f830_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_ceb1_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a6ba_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2023_c3_2e48 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2023_c3_2e48;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2042_c3_b0d8 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_ceb1_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2042_c3_b0d8;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2027_c3_5080 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2027_c3_5080;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2038_c3_71b5 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_32a4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2038_c3_71b5;
     VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_f830_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_ef10_right := to_unsigned(5, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_f830_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_1787_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2033_c7_32a4_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_37c0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_aea5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a6ba_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d641_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_9782_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_ef10_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6dbe_left := VAR_phase;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_6620_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_611b_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2044_c31_c19f_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_80fe_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_32a4_iffalse := tmp16;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2017_l2004_l2041_l2029_l2025_l2020_DUPLICATE_1821 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2017_l2004_l2041_l2029_l2025_l2020_DUPLICATE_1821_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2017_c11_aea5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2017_c11_aea5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_aea5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2017_c11_aea5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_aea5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_aea5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2017_c11_aea5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2029_c11_9782] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2029_c11_9782_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_9782_left;
     BIN_OP_EQ_uxn_opcodes_h_l2029_c11_9782_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_9782_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_9782_return_output := BIN_OP_EQ_uxn_opcodes_h_l2029_c11_9782_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2004_c2_b323] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2004_c2_b323_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2017_l2041_l2033_l2029_l2025_l2020_DUPLICATE_3793 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2017_l2041_l2033_l2029_l2025_l2020_DUPLICATE_3793_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l2036_c30_f830] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2036_c30_f830_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_f830_ins;
     sp_relative_shift_uxn_opcodes_h_l2036_c30_f830_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_f830_x;
     sp_relative_shift_uxn_opcodes_h_l2036_c30_f830_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_f830_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_f830_return_output := sp_relative_shift_uxn_opcodes_h_l2036_c30_f830_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2020_c11_a6ba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a6ba_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a6ba_left;
     BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a6ba_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a6ba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a6ba_return_output := BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a6ba_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2025_c11_d641] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d641_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d641_left;
     BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d641_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d641_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d641_return_output := BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d641_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2004_c2_b323] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2004_c2_b323_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2041_c11_6dbe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6dbe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6dbe_left;
     BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6dbe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6dbe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6dbe_return_output := BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6dbe_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2041_l2029_DUPLICATE_b07d LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2041_l2029_DUPLICATE_b07d_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2030_l2034_l2026_l2021_DUPLICATE_d840 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2030_l2034_l2026_l2021_DUPLICATE_d840_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2017_l2033_l2029_l2025_l2020_DUPLICATE_972b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2017_l2033_l2029_l2025_l2020_DUPLICATE_972b_return_output := result.is_stack_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2004_c2_b323] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2004_c2_b323_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2004_c6_37c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2004_c6_37c0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_37c0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2004_c6_37c0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_37c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_37c0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2004_c6_37c0_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2044_c31_c19f] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2044_c31_c19f_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2044_c31_c19f_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2044_c31_c19f_return_output := CONST_SR_8_uxn_opcodes_h_l2044_c31_c19f_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2004_c2_b323] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2004_c2_b323_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2033_c11_ef10] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2033_c11_ef10_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_ef10_left;
     BIN_OP_EQ_uxn_opcodes_h_l2033_c11_ef10_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_ef10_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_ef10_return_output := BIN_OP_EQ_uxn_opcodes_h_l2033_c11_ef10_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2017_l2041_l2029_l2025_l2020_DUPLICATE_1a0b LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2017_l2041_l2029_l2025_l2020_DUPLICATE_1a0b_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2004_c2_b323_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_37c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_b323_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_37c0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_b323_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_37c0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_b323_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_37c0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_b323_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_37c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_b323_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_37c0_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_b323_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_37c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_b323_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_37c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_b323_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_37c0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_b323_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_37c0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2004_c2_b323_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_37c0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_b323_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_37c0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2017_c7_94a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_aea5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_94a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_aea5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_94a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_aea5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_94a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_aea5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_94a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_aea5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_94a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_aea5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2017_c7_94a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_aea5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_94a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_aea5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2020_c7_fa98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a6ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fa98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a6ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fa98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a6ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fa98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a6ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fa98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a6ba_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fa98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a6ba_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2020_c7_fa98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a6ba_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_fa98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_a6ba_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2025_c7_861a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d641_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_861a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d641_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_861a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d641_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_861a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d641_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_861a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d641_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_861a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d641_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2025_c7_861a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d641_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_861a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_d641_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2029_c7_80fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_9782_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_80fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_9782_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_80fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_9782_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_80fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_9782_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_80fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_9782_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_80fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_9782_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_80fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_9782_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2033_c7_32a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_ef10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_32a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_ef10_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_32a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_ef10_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_32a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_ef10_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_32a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_ef10_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_32a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_ef10_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_32a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_ef10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_ceb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6dbe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_ceb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6dbe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_ceb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6dbe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_ceb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_6dbe_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_611b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2030_l2034_l2026_l2021_DUPLICATE_d840_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_1787_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2030_l2034_l2026_l2021_DUPLICATE_d840_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_78db_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2030_l2034_l2026_l2021_DUPLICATE_d840_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2017_l2041_l2029_l2025_l2020_DUPLICATE_1a0b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2017_l2041_l2029_l2025_l2020_DUPLICATE_1a0b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2017_l2041_l2029_l2025_l2020_DUPLICATE_1a0b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_80fe_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2017_l2041_l2029_l2025_l2020_DUPLICATE_1a0b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_ceb1_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2017_l2041_l2029_l2025_l2020_DUPLICATE_1a0b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2017_l2041_l2033_l2029_l2025_l2020_DUPLICATE_3793_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2017_l2041_l2033_l2029_l2025_l2020_DUPLICATE_3793_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2017_l2041_l2033_l2029_l2025_l2020_DUPLICATE_3793_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_80fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2017_l2041_l2033_l2029_l2025_l2020_DUPLICATE_3793_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_32a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2017_l2041_l2033_l2029_l2025_l2020_DUPLICATE_3793_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_ceb1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2017_l2041_l2033_l2029_l2025_l2020_DUPLICATE_3793_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2017_l2033_l2029_l2025_l2020_DUPLICATE_972b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2017_l2033_l2029_l2025_l2020_DUPLICATE_972b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2017_l2033_l2029_l2025_l2020_DUPLICATE_972b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_80fe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2017_l2033_l2029_l2025_l2020_DUPLICATE_972b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_32a4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2017_l2033_l2029_l2025_l2020_DUPLICATE_972b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_80fe_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2041_l2029_DUPLICATE_b07d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_ceb1_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2041_l2029_DUPLICATE_b07d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2017_l2004_l2041_l2029_l2025_l2020_DUPLICATE_1821_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2017_l2004_l2041_l2029_l2025_l2020_DUPLICATE_1821_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2017_l2004_l2041_l2029_l2025_l2020_DUPLICATE_1821_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2017_l2004_l2041_l2029_l2025_l2020_DUPLICATE_1821_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_80fe_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2017_l2004_l2041_l2029_l2025_l2020_DUPLICATE_1821_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_ceb1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2017_l2004_l2041_l2029_l2025_l2020_DUPLICATE_1821_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2004_c2_b323_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2004_c2_b323_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2004_c2_b323_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2004_c2_b323_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_32a4_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_f830_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2004_c2_b323] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_b323_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_b323_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_b323_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_b323_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2041_c7_ceb1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_ceb1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_ceb1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_ceb1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_ceb1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_ceb1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_ceb1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_ceb1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_ceb1_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2004_c2_b323] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_b323_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_b323_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_b323_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_b323_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2034_c3_1787] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2034_c3_1787_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_1787_left;
     BIN_OP_OR_uxn_opcodes_h_l2034_c3_1787_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_1787_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_1787_return_output := BIN_OP_OR_uxn_opcodes_h_l2034_c3_1787_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2044_c21_cdbe] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2044_c21_cdbe_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2044_c31_c19f_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2033_c7_32a4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_32a4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_32a4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_32a4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_32a4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_32a4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_32a4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2041_c7_ceb1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_ceb1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_ceb1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_ceb1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_ceb1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_ceb1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_ceb1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_ceb1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_ceb1_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_78db LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_78db_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_78db_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_78db_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_78db_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2026_c3_611b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2026_c3_611b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_611b_left;
     BIN_OP_OR_uxn_opcodes_h_l2026_c3_611b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_611b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_611b_return_output := BIN_OP_OR_uxn_opcodes_h_l2026_c3_611b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2004_c2_b323] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_b323_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_b323_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_b323_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_b323_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2041_c7_ceb1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_ceb1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_ceb1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_ceb1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_ceb1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_ceb1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_ceb1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_ceb1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_ceb1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2004_c2_b323] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_b323_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_b323_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_b323_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_b323_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_611b_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_6620_right := VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_1787_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2033_c7_32a4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_1787_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_ceb1_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2044_c21_cdbe_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2029_c7_80fe_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_78db_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_78db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_32a4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_ceb1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_80fe_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_32a4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_ceb1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_32a4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_ceb1_return_output;
     -- t16_MUX[uxn_opcodes_h_l2025_c7_861a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2025_c7_861a_cond <= VAR_t16_MUX_uxn_opcodes_h_l2025_c7_861a_cond;
     t16_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue;
     t16_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2025_c7_861a_return_output := t16_MUX_uxn_opcodes_h_l2025_c7_861a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2029_c7_80fe] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_80fe_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_80fe_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_80fe_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_80fe_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_80fe_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_80fe_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2033_c7_32a4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_32a4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_32a4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_32a4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_32a4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_32a4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_32a4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2033_c7_32a4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_32a4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_32a4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_32a4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_32a4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_32a4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_32a4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2041_c7_ceb1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2041_c7_ceb1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_ceb1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2041_c7_ceb1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_ceb1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2041_c7_ceb1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_ceb1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_ceb1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2041_c7_ceb1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2033_c7_32a4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_32a4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_32a4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_32a4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_32a4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_32a4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_32a4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output;

     -- n16_MUX[uxn_opcodes_h_l2033_c7_32a4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2033_c7_32a4_cond <= VAR_n16_MUX_uxn_opcodes_h_l2033_c7_32a4_cond;
     n16_MUX_uxn_opcodes_h_l2033_c7_32a4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2033_c7_32a4_iftrue;
     n16_MUX_uxn_opcodes_h_l2033_c7_32a4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2033_c7_32a4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output := n16_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2035_c11_6620] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_6620_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_6620_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_6620_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_6620_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_6620_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_6620_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l2035_c3_1bbf := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_6620_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l2029_c7_80fe_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_80fe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_80fe_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_80fe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_32a4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_ceb1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2025_c7_861a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_32a4_iftrue := VAR_tmp16_uxn_opcodes_h_l2035_c3_1bbf;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2029_c7_80fe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_80fe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_80fe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_80fe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_80fe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_80fe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_80fe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2033_c7_32a4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2033_c7_32a4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_32a4_cond;
     tmp16_MUX_uxn_opcodes_h_l2033_c7_32a4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_32a4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2033_c7_32a4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_32a4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output := tmp16_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2029_c7_80fe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_80fe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_80fe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_80fe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_80fe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_80fe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_80fe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2039_c21_1f47] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2039_c21_1f47_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l2035_c3_1bbf);

     -- n16_MUX[uxn_opcodes_h_l2029_c7_80fe] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2029_c7_80fe_cond <= VAR_n16_MUX_uxn_opcodes_h_l2029_c7_80fe_cond;
     n16_MUX_uxn_opcodes_h_l2029_c7_80fe_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2029_c7_80fe_iftrue;
     n16_MUX_uxn_opcodes_h_l2029_c7_80fe_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2029_c7_80fe_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output := n16_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2025_c7_861a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_861a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_861a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_861a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_861a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2029_c7_80fe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_80fe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_80fe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_80fe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_80fe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_80fe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_80fe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output;

     -- t16_MUX[uxn_opcodes_h_l2020_c7_fa98] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2020_c7_fa98_cond <= VAR_t16_MUX_uxn_opcodes_h_l2020_c7_fa98_cond;
     t16_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue;
     t16_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output := t16_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_32a4_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2039_c21_1f47_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_861a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_80fe_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2025_c7_861a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_861a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_861a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_861a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_861a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2025_c7_861a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_861a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_861a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_861a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_861a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2029_c7_80fe] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2029_c7_80fe_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_80fe_cond;
     tmp16_MUX_uxn_opcodes_h_l2029_c7_80fe_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_80fe_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2029_c7_80fe_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_80fe_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output := tmp16_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output;

     -- t16_MUX[uxn_opcodes_h_l2017_c7_94a3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2017_c7_94a3_cond <= VAR_t16_MUX_uxn_opcodes_h_l2017_c7_94a3_cond;
     t16_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue;
     t16_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output := t16_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output;

     -- n16_MUX[uxn_opcodes_h_l2025_c7_861a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2025_c7_861a_cond <= VAR_n16_MUX_uxn_opcodes_h_l2025_c7_861a_cond;
     n16_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue;
     n16_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2025_c7_861a_return_output := n16_MUX_uxn_opcodes_h_l2025_c7_861a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2033_c7_32a4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2033_c7_32a4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_32a4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2033_c7_32a4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_32a4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2033_c7_32a4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_32a4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2025_c7_861a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_861a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_861a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_861a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_861a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2020_c7_fa98] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fa98_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fa98_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2025_c7_861a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_861a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_861a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_861a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_80fe_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_32a4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output;
     -- n16_MUX[uxn_opcodes_h_l2020_c7_fa98] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2020_c7_fa98_cond <= VAR_n16_MUX_uxn_opcodes_h_l2020_c7_fa98_cond;
     n16_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue;
     n16_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output := n16_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output;

     -- t16_MUX[uxn_opcodes_h_l2004_c2_b323] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2004_c2_b323_cond <= VAR_t16_MUX_uxn_opcodes_h_l2004_c2_b323_cond;
     t16_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue;
     t16_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2004_c2_b323_return_output := t16_MUX_uxn_opcodes_h_l2004_c2_b323_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2017_c7_94a3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_94a3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_94a3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2020_c7_fa98] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fa98_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fa98_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2029_c7_80fe] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2029_c7_80fe_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_80fe_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2029_c7_80fe_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_80fe_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2029_c7_80fe_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_80fe_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output := result_u8_value_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2020_c7_fa98] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fa98_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fa98_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2025_c7_861a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2025_c7_861a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_861a_cond;
     tmp16_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_861a_return_output := tmp16_MUX_uxn_opcodes_h_l2025_c7_861a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2020_c7_fa98] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fa98_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fa98_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_80fe_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2004_c2_b323_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_861a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2017_c7_94a3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_94a3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_94a3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2025_c7_861a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2025_c7_861a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_861a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_861a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_861a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_861a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2025_c7_861a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2004_c2_b323] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_b323_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_b323_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_b323_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_b323_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2020_c7_fa98] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2020_c7_fa98_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_fa98_cond;
     tmp16_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output := tmp16_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output;

     -- n16_MUX[uxn_opcodes_h_l2017_c7_94a3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2017_c7_94a3_cond <= VAR_n16_MUX_uxn_opcodes_h_l2017_c7_94a3_cond;
     n16_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue;
     n16_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output := n16_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2017_c7_94a3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_94a3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_94a3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2017_c7_94a3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_94a3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_94a3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_861a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2004_c2_b323] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_b323_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_b323_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_b323_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_b323_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2004_c2_b323] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_b323_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_b323_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_b323_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_b323_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2020_c7_fa98] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fa98_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fa98_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fa98_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fa98_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output := result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2017_c7_94a3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2017_c7_94a3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_94a3_cond;
     tmp16_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output := tmp16_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output;

     -- n16_MUX[uxn_opcodes_h_l2004_c2_b323] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2004_c2_b323_cond <= VAR_n16_MUX_uxn_opcodes_h_l2004_c2_b323_cond;
     n16_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue;
     n16_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2004_c2_b323_return_output := n16_MUX_uxn_opcodes_h_l2004_c2_b323_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2004_c2_b323] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_b323_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_b323_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_b323_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_b323_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2004_c2_b323_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fa98_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2017_c7_94a3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2017_c7_94a3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_94a3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_94a3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_94a3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output := result_u8_value_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2004_c2_b323] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2004_c2_b323_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_b323_cond;
     tmp16_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_b323_return_output := tmp16_MUX_uxn_opcodes_h_l2004_c2_b323_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_94a3_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_b323_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2004_c2_b323] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2004_c2_b323_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_b323_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_b323_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_b323_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_b323_return_output := result_u8_value_MUX_uxn_opcodes_h_l2004_c2_b323_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l2048_l2000_DUPLICATE_f533 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l2048_l2000_DUPLICATE_f533_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_ee25(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_b323_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_b323_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_b323_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_b323_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_b323_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_b323_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_b323_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_b323_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_b323_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l2048_l2000_DUPLICATE_f533_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l2048_l2000_DUPLICATE_f533_return_output;
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
