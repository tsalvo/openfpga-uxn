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
-- BIN_OP_EQ[uxn_opcodes_h_l2004_c6_bf27]
signal BIN_OP_EQ_uxn_opcodes_h_l2004_c6_bf27_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2004_c6_bf27_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2004_c6_bf27_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2004_c2_9ec3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2004_c2_9ec3]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2004_c2_9ec3]
signal result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2004_c2_9ec3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2004_c2_9ec3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2004_c2_9ec3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2004_c2_9ec3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2004_c2_9ec3]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2004_c2_9ec3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2004_c2_9ec3]
signal tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2004_c2_9ec3]
signal t16_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2004_c2_9ec3]
signal n16_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2017_c11_4d30]
signal BIN_OP_EQ_uxn_opcodes_h_l2017_c11_4d30_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2017_c11_4d30_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2017_c11_4d30_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2017_c7_b943]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b943_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b943_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2017_c7_b943]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b943_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b943_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2017_c7_b943]
signal result_u8_value_MUX_uxn_opcodes_h_l2017_c7_b943_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2017_c7_b943_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2017_c7_b943]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b943_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b943_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2017_c7_b943]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b943_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b943_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2017_c7_b943]
signal tmp16_MUX_uxn_opcodes_h_l2017_c7_b943_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2017_c7_b943_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2017_c7_b943]
signal t16_MUX_uxn_opcodes_h_l2017_c7_b943_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2017_c7_b943_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2017_c7_b943]
signal n16_MUX_uxn_opcodes_h_l2017_c7_b943_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2017_c7_b943_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2020_c11_8fa4]
signal BIN_OP_EQ_uxn_opcodes_h_l2020_c11_8fa4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2020_c11_8fa4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2020_c11_8fa4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2020_c7_be65]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_be65_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_be65_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2020_c7_be65]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_be65_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_be65_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2020_c7_be65]
signal result_u8_value_MUX_uxn_opcodes_h_l2020_c7_be65_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2020_c7_be65_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2020_c7_be65]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_be65_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_be65_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2020_c7_be65]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_be65_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_be65_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2020_c7_be65]
signal tmp16_MUX_uxn_opcodes_h_l2020_c7_be65_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2020_c7_be65_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2020_c7_be65]
signal t16_MUX_uxn_opcodes_h_l2020_c7_be65_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2020_c7_be65_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2020_c7_be65]
signal n16_MUX_uxn_opcodes_h_l2020_c7_be65_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2020_c7_be65_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2025_c11_a31e]
signal BIN_OP_EQ_uxn_opcodes_h_l2025_c11_a31e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2025_c11_a31e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2025_c11_a31e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2025_c7_e247]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_e247_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_e247_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2025_c7_e247]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_e247_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_e247_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2025_c7_e247]
signal result_u8_value_MUX_uxn_opcodes_h_l2025_c7_e247_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2025_c7_e247_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2025_c7_e247]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_e247_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_e247_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2025_c7_e247]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_e247_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_e247_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2025_c7_e247]
signal tmp16_MUX_uxn_opcodes_h_l2025_c7_e247_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2025_c7_e247_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2025_c7_e247]
signal t16_MUX_uxn_opcodes_h_l2025_c7_e247_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2025_c7_e247_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2025_c7_e247]
signal n16_MUX_uxn_opcodes_h_l2025_c7_e247_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2025_c7_e247_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2026_c3_9ff2]
signal BIN_OP_OR_uxn_opcodes_h_l2026_c3_9ff2_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2026_c3_9ff2_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2026_c3_9ff2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2029_c11_f6d8]
signal BIN_OP_EQ_uxn_opcodes_h_l2029_c11_f6d8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2029_c11_f6d8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2029_c11_f6d8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2029_c7_9a6a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_9a6a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_9a6a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_9a6a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2029_c7_9a6a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_9a6a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_9a6a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_9a6a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2029_c7_9a6a]
signal result_u8_value_MUX_uxn_opcodes_h_l2029_c7_9a6a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2029_c7_9a6a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2029_c7_9a6a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2029_c7_9a6a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_9a6a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_9a6a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_9a6a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2029_c7_9a6a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_9a6a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_9a6a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_9a6a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2029_c7_9a6a]
signal tmp16_MUX_uxn_opcodes_h_l2029_c7_9a6a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2029_c7_9a6a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2029_c7_9a6a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2029_c7_9a6a]
signal n16_MUX_uxn_opcodes_h_l2029_c7_9a6a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2029_c7_9a6a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2029_c7_9a6a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2033_c11_14ee]
signal BIN_OP_EQ_uxn_opcodes_h_l2033_c11_14ee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2033_c11_14ee_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2033_c11_14ee_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2033_c7_9000]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_9000_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_9000_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_9000_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_9000_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2033_c7_9000]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_9000_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_9000_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_9000_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_9000_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2033_c7_9000]
signal result_u8_value_MUX_uxn_opcodes_h_l2033_c7_9000_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2033_c7_9000_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2033_c7_9000_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2033_c7_9000_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2033_c7_9000]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_9000_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_9000_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_9000_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_9000_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2033_c7_9000]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_9000_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_9000_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_9000_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_9000_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2033_c7_9000]
signal tmp16_MUX_uxn_opcodes_h_l2033_c7_9000_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2033_c7_9000_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2033_c7_9000_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2033_c7_9000_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2033_c7_9000]
signal n16_MUX_uxn_opcodes_h_l2033_c7_9000_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2033_c7_9000_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2033_c7_9000_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2033_c7_9000_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2034_c3_3458]
signal BIN_OP_OR_uxn_opcodes_h_l2034_c3_3458_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2034_c3_3458_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2034_c3_3458_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2035_c11_ef0a]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_ef0a_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_ef0a_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_ef0a_return_output : unsigned(31 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2036_c30_0e64]
signal sp_relative_shift_uxn_opcodes_h_l2036_c30_0e64_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2036_c30_0e64_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2036_c30_0e64_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2036_c30_0e64_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2041_c11_892b]
signal BIN_OP_EQ_uxn_opcodes_h_l2041_c11_892b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2041_c11_892b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2041_c11_892b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2041_c7_7115]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7115_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7115_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7115_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7115_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2041_c7_7115]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7115_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7115_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7115_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7115_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2041_c7_7115]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7115_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7115_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7115_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7115_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2041_c7_7115]
signal result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7115_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7115_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7115_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7115_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2044_c31_562c]
signal CONST_SR_8_uxn_opcodes_h_l2044_c31_562c_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2044_c31_562c_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_c006
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_c006_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_c006_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_pc_updated := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2004_c6_bf27
BIN_OP_EQ_uxn_opcodes_h_l2004_c6_bf27 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2004_c6_bf27_left,
BIN_OP_EQ_uxn_opcodes_h_l2004_c6_bf27_right,
BIN_OP_EQ_uxn_opcodes_h_l2004_c6_bf27_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec3
result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3
result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec3
result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond,
result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3
result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec3
result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec3
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec3
result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec3
tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond,
tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue,
tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse,
tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output);

-- t16_MUX_uxn_opcodes_h_l2004_c2_9ec3
t16_MUX_uxn_opcodes_h_l2004_c2_9ec3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond,
t16_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue,
t16_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse,
t16_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output);

-- n16_MUX_uxn_opcodes_h_l2004_c2_9ec3
n16_MUX_uxn_opcodes_h_l2004_c2_9ec3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond,
n16_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue,
n16_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse,
n16_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2017_c11_4d30
BIN_OP_EQ_uxn_opcodes_h_l2017_c11_4d30 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2017_c11_4d30_left,
BIN_OP_EQ_uxn_opcodes_h_l2017_c11_4d30_right,
BIN_OP_EQ_uxn_opcodes_h_l2017_c11_4d30_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b943
result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b943 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b943_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b943_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b943
result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b943 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b943_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b943_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2017_c7_b943
result_u8_value_MUX_uxn_opcodes_h_l2017_c7_b943 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2017_c7_b943_cond,
result_u8_value_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2017_c7_b943_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b943
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b943 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b943_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b943_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b943
result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b943 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b943_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b943_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2017_c7_b943
tmp16_MUX_uxn_opcodes_h_l2017_c7_b943 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2017_c7_b943_cond,
tmp16_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue,
tmp16_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse,
tmp16_MUX_uxn_opcodes_h_l2017_c7_b943_return_output);

-- t16_MUX_uxn_opcodes_h_l2017_c7_b943
t16_MUX_uxn_opcodes_h_l2017_c7_b943 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2017_c7_b943_cond,
t16_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue,
t16_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse,
t16_MUX_uxn_opcodes_h_l2017_c7_b943_return_output);

-- n16_MUX_uxn_opcodes_h_l2017_c7_b943
n16_MUX_uxn_opcodes_h_l2017_c7_b943 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2017_c7_b943_cond,
n16_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue,
n16_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse,
n16_MUX_uxn_opcodes_h_l2017_c7_b943_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2020_c11_8fa4
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_8fa4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_8fa4_left,
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_8fa4_right,
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_8fa4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_be65
result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_be65 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_be65_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_be65_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_be65
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_be65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_be65_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_be65_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2020_c7_be65
result_u8_value_MUX_uxn_opcodes_h_l2020_c7_be65 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2020_c7_be65_cond,
result_u8_value_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2020_c7_be65_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_be65
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_be65 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_be65_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_be65_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_be65
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_be65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_be65_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_be65_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2020_c7_be65
tmp16_MUX_uxn_opcodes_h_l2020_c7_be65 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2020_c7_be65_cond,
tmp16_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue,
tmp16_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse,
tmp16_MUX_uxn_opcodes_h_l2020_c7_be65_return_output);

-- t16_MUX_uxn_opcodes_h_l2020_c7_be65
t16_MUX_uxn_opcodes_h_l2020_c7_be65 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2020_c7_be65_cond,
t16_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue,
t16_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse,
t16_MUX_uxn_opcodes_h_l2020_c7_be65_return_output);

-- n16_MUX_uxn_opcodes_h_l2020_c7_be65
n16_MUX_uxn_opcodes_h_l2020_c7_be65 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2020_c7_be65_cond,
n16_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue,
n16_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse,
n16_MUX_uxn_opcodes_h_l2020_c7_be65_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2025_c11_a31e
BIN_OP_EQ_uxn_opcodes_h_l2025_c11_a31e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2025_c11_a31e_left,
BIN_OP_EQ_uxn_opcodes_h_l2025_c11_a31e_right,
BIN_OP_EQ_uxn_opcodes_h_l2025_c11_a31e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_e247
result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_e247 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_e247_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_e247_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_e247
result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_e247 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_e247_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_e247_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2025_c7_e247
result_u8_value_MUX_uxn_opcodes_h_l2025_c7_e247 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2025_c7_e247_cond,
result_u8_value_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2025_c7_e247_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_e247
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_e247 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_e247_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_e247_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_e247
result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_e247 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_e247_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_e247_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2025_c7_e247
tmp16_MUX_uxn_opcodes_h_l2025_c7_e247 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2025_c7_e247_cond,
tmp16_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue,
tmp16_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse,
tmp16_MUX_uxn_opcodes_h_l2025_c7_e247_return_output);

-- t16_MUX_uxn_opcodes_h_l2025_c7_e247
t16_MUX_uxn_opcodes_h_l2025_c7_e247 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2025_c7_e247_cond,
t16_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue,
t16_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse,
t16_MUX_uxn_opcodes_h_l2025_c7_e247_return_output);

-- n16_MUX_uxn_opcodes_h_l2025_c7_e247
n16_MUX_uxn_opcodes_h_l2025_c7_e247 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2025_c7_e247_cond,
n16_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue,
n16_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse,
n16_MUX_uxn_opcodes_h_l2025_c7_e247_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2026_c3_9ff2
BIN_OP_OR_uxn_opcodes_h_l2026_c3_9ff2 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2026_c3_9ff2_left,
BIN_OP_OR_uxn_opcodes_h_l2026_c3_9ff2_right,
BIN_OP_OR_uxn_opcodes_h_l2026_c3_9ff2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2029_c11_f6d8
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_f6d8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_f6d8_left,
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_f6d8_right,
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_f6d8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_9a6a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_9a6a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_9a6a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_9a6a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_9a6a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_9a6a
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_9a6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_9a6a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_9a6a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_9a6a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2029_c7_9a6a
result_u8_value_MUX_uxn_opcodes_h_l2029_c7_9a6a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2029_c7_9a6a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2029_c7_9a6a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2029_c7_9a6a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_9a6a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_9a6a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_9a6a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_9a6a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_9a6a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_9a6a
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_9a6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_9a6a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_9a6a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_9a6a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2029_c7_9a6a
tmp16_MUX_uxn_opcodes_h_l2029_c7_9a6a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2029_c7_9a6a_cond,
tmp16_MUX_uxn_opcodes_h_l2029_c7_9a6a_iftrue,
tmp16_MUX_uxn_opcodes_h_l2029_c7_9a6a_iffalse,
tmp16_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output);

-- n16_MUX_uxn_opcodes_h_l2029_c7_9a6a
n16_MUX_uxn_opcodes_h_l2029_c7_9a6a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2029_c7_9a6a_cond,
n16_MUX_uxn_opcodes_h_l2029_c7_9a6a_iftrue,
n16_MUX_uxn_opcodes_h_l2029_c7_9a6a_iffalse,
n16_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2033_c11_14ee
BIN_OP_EQ_uxn_opcodes_h_l2033_c11_14ee : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2033_c11_14ee_left,
BIN_OP_EQ_uxn_opcodes_h_l2033_c11_14ee_right,
BIN_OP_EQ_uxn_opcodes_h_l2033_c11_14ee_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_9000
result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_9000 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_9000_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_9000_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_9000_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_9000_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_9000
result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_9000 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_9000_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_9000_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_9000_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_9000_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2033_c7_9000
result_u8_value_MUX_uxn_opcodes_h_l2033_c7_9000 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2033_c7_9000_cond,
result_u8_value_MUX_uxn_opcodes_h_l2033_c7_9000_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2033_c7_9000_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2033_c7_9000_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_9000
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_9000 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_9000_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_9000_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_9000_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_9000_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_9000
result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_9000 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_9000_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_9000_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_9000_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_9000_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2033_c7_9000
tmp16_MUX_uxn_opcodes_h_l2033_c7_9000 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2033_c7_9000_cond,
tmp16_MUX_uxn_opcodes_h_l2033_c7_9000_iftrue,
tmp16_MUX_uxn_opcodes_h_l2033_c7_9000_iffalse,
tmp16_MUX_uxn_opcodes_h_l2033_c7_9000_return_output);

-- n16_MUX_uxn_opcodes_h_l2033_c7_9000
n16_MUX_uxn_opcodes_h_l2033_c7_9000 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2033_c7_9000_cond,
n16_MUX_uxn_opcodes_h_l2033_c7_9000_iftrue,
n16_MUX_uxn_opcodes_h_l2033_c7_9000_iffalse,
n16_MUX_uxn_opcodes_h_l2033_c7_9000_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2034_c3_3458
BIN_OP_OR_uxn_opcodes_h_l2034_c3_3458 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2034_c3_3458_left,
BIN_OP_OR_uxn_opcodes_h_l2034_c3_3458_right,
BIN_OP_OR_uxn_opcodes_h_l2034_c3_3458_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_ef0a
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_ef0a : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_ef0a_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_ef0a_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_ef0a_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2036_c30_0e64
sp_relative_shift_uxn_opcodes_h_l2036_c30_0e64 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2036_c30_0e64_ins,
sp_relative_shift_uxn_opcodes_h_l2036_c30_0e64_x,
sp_relative_shift_uxn_opcodes_h_l2036_c30_0e64_y,
sp_relative_shift_uxn_opcodes_h_l2036_c30_0e64_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2041_c11_892b
BIN_OP_EQ_uxn_opcodes_h_l2041_c11_892b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2041_c11_892b_left,
BIN_OP_EQ_uxn_opcodes_h_l2041_c11_892b_right,
BIN_OP_EQ_uxn_opcodes_h_l2041_c11_892b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7115
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7115 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7115_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7115_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7115_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7115_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7115
result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7115 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7115_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7115_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7115_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7115_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7115
result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7115 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7115_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7115_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7115_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7115_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7115
result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7115 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7115_cond,
result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7115_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7115_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7115_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2044_c31_562c
CONST_SR_8_uxn_opcodes_h_l2044_c31_562c : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2044_c31_562c_x,
CONST_SR_8_uxn_opcodes_h_l2044_c31_562c_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_c006
CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_c006 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_c006_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_c006_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2004_c6_bf27_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output,
 tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output,
 t16_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output,
 n16_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2017_c11_4d30_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b943_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b943_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2017_c7_b943_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b943_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b943_return_output,
 tmp16_MUX_uxn_opcodes_h_l2017_c7_b943_return_output,
 t16_MUX_uxn_opcodes_h_l2017_c7_b943_return_output,
 n16_MUX_uxn_opcodes_h_l2017_c7_b943_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2020_c11_8fa4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_be65_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_be65_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2020_c7_be65_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_be65_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_be65_return_output,
 tmp16_MUX_uxn_opcodes_h_l2020_c7_be65_return_output,
 t16_MUX_uxn_opcodes_h_l2020_c7_be65_return_output,
 n16_MUX_uxn_opcodes_h_l2020_c7_be65_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2025_c11_a31e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_e247_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_e247_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2025_c7_e247_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_e247_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_e247_return_output,
 tmp16_MUX_uxn_opcodes_h_l2025_c7_e247_return_output,
 t16_MUX_uxn_opcodes_h_l2025_c7_e247_return_output,
 n16_MUX_uxn_opcodes_h_l2025_c7_e247_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2026_c3_9ff2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2029_c11_f6d8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output,
 tmp16_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output,
 n16_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2033_c11_14ee_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_9000_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_9000_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2033_c7_9000_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_9000_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_9000_return_output,
 tmp16_MUX_uxn_opcodes_h_l2033_c7_9000_return_output,
 n16_MUX_uxn_opcodes_h_l2033_c7_9000_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2034_c3_3458_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_ef0a_return_output,
 sp_relative_shift_uxn_opcodes_h_l2036_c30_0e64_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2041_c11_892b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7115_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7115_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7115_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7115_return_output,
 CONST_SR_8_uxn_opcodes_h_l2044_c31_562c_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_c006_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_bf27_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_bf27_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_bf27_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2004_c2_9ec3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2004_c2_9ec3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_b943_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2004_c2_9ec3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2009_c3_a6e1 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b943_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b943_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2014_c3_55c6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b943_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2004_c2_9ec3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b943_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_b943_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2017_c7_b943_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2017_c7_b943_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_4d30_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_4d30_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_4d30_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_be65_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b943_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_be65_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b943_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_be65_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_b943_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2018_c3_bcdc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_be65_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b943_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_be65_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b943_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_be65_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_b943_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2020_c7_be65_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2017_c7_b943_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2020_c7_be65_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2017_c7_b943_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_8fa4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_8fa4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_8fa4_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_e247_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_be65_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_e247_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_be65_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_e247_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_be65_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2023_c3_2ceb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_e247_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_be65_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_e247_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_be65_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_e247_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_be65_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2025_c7_e247_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2020_c7_be65_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2025_c7_e247_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2020_c7_be65_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_a31e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_a31e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_a31e_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_e247_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_e247_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_e247_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2027_c3_82df : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_e247_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_e247_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_e247_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2025_c7_e247_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2025_c7_e247_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_9ff2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_9ff2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_9ff2_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_f6d8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_f6d8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_f6d8_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_9a6a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_9a6a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_9000_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_9a6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_9a6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_9a6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_9000_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_9a6a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_9a6a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_9a6a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_9000_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_9a6a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_9a6a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_9a6a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_9000_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_9a6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_9a6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_9a6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_9000_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_9a6a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_9a6a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_9a6a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_9000_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_9a6a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2029_c7_9a6a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2029_c7_9a6a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2033_c7_9000_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2029_c7_9a6a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_14ee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_14ee_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_14ee_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_9000_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_9000_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7115_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_9000_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_9000_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_9000_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_9000_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_9000_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_9000_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7115_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_9000_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_9000_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2038_c3_b9f3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_9000_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7115_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_9000_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_9000_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_9000_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7115_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_9000_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_9000_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l2035_c3_3956 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_9000_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_9000_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2033_c7_9000_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2033_c7_9000_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2033_c7_9000_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_3458_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_3458_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_3458_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_ef0a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_ef0a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_ef0a_return_output : unsigned(31 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_0e64_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_0e64_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_0e64_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_0e64_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2039_c21_67e0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_892b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_892b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_892b_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7115_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2043_c3_4b21 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7115_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7115_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7115_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2042_c3_5dbd : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7115_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7115_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7115_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7115_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7115_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7115_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7115_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7115_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2044_c31_562c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2044_c31_562c_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2044_c21_3a19_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2020_l2017_l2004_l2041_l2029_l2025_DUPLICATE_2109_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2020_l2017_l2041_l2029_l2025_DUPLICATE_c466_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2020_l2017_l2033_l2029_l2025_DUPLICATE_f3dd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2020_l2017_l2041_l2033_l2029_l2025_DUPLICATE_6825_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2030_l2034_l2021_l2026_DUPLICATE_7816_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_c006_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_c006_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2029_l2041_DUPLICATE_1976_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l2048_l2000_DUPLICATE_3897_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_8fa4_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2018_c3_bcdc := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2018_c3_bcdc;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2014_c3_55c6 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2014_c3_55c6;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7115_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2023_c3_2ceb := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2023_c3_2ceb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_a31e_right := to_unsigned(3, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_0e64_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_14ee_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2038_c3_b9f3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_9000_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2038_c3_b9f3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2027_c3_82df := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2027_c3_82df;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_bf27_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2042_c3_5dbd := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7115_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2042_c3_5dbd;
     VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_0e64_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2009_c3_a6e1 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2009_c3_a6e1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_892b_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_f6d8_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_4d30_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2043_c3_4b21 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7115_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2043_c3_4b21;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_9000_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_0e64_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_3458_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2033_c7_9000_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_bf27_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_4d30_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_8fa4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_a31e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_f6d8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_14ee_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_892b_left := VAR_phase;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_ef0a_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_9ff2_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2044_c31_562c_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_9a6a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_9000_iffalse := tmp16;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2020_l2017_l2041_l2029_l2025_DUPLICATE_c466 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2020_l2017_l2041_l2029_l2025_DUPLICATE_c466_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2041_c11_892b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2041_c11_892b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_892b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2041_c11_892b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_892b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_892b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2041_c11_892b_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2030_l2034_l2021_l2026_DUPLICATE_7816 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2030_l2034_l2021_l2026_DUPLICATE_7816_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2020_l2017_l2041_l2033_l2029_l2025_DUPLICATE_6825 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2020_l2017_l2041_l2033_l2029_l2025_DUPLICATE_6825_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2025_c11_a31e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2025_c11_a31e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_a31e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2025_c11_a31e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_a31e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_a31e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2025_c11_a31e_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2020_l2017_l2004_l2041_l2029_l2025_DUPLICATE_2109 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2020_l2017_l2004_l2041_l2029_l2025_DUPLICATE_2109_return_output := result.u8_value;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2004_c2_9ec3] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2004_c2_9ec3_return_output := result.is_stack_index_flipped;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2004_c2_9ec3] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2004_c2_9ec3_return_output := result.is_vram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2004_c2_9ec3] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2004_c2_9ec3_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2029_c11_f6d8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2029_c11_f6d8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_f6d8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2029_c11_f6d8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_f6d8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_f6d8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2029_c11_f6d8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2020_l2017_l2033_l2029_l2025_DUPLICATE_f3dd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2020_l2017_l2033_l2029_l2025_DUPLICATE_f3dd_return_output := result.is_stack_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2004_c2_9ec3] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2004_c2_9ec3_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2029_l2041_DUPLICATE_1976 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2029_l2041_DUPLICATE_1976_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2033_c11_14ee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2033_c11_14ee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_14ee_left;
     BIN_OP_EQ_uxn_opcodes_h_l2033_c11_14ee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_14ee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_14ee_return_output := BIN_OP_EQ_uxn_opcodes_h_l2033_c11_14ee_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2004_c6_bf27] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2004_c6_bf27_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_bf27_left;
     BIN_OP_EQ_uxn_opcodes_h_l2004_c6_bf27_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_bf27_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_bf27_return_output := BIN_OP_EQ_uxn_opcodes_h_l2004_c6_bf27_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2020_c11_8fa4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2020_c11_8fa4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_8fa4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2020_c11_8fa4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_8fa4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_8fa4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2020_c11_8fa4_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2044_c31_562c] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2044_c31_562c_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2044_c31_562c_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2044_c31_562c_return_output := CONST_SR_8_uxn_opcodes_h_l2044_c31_562c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2017_c11_4d30] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2017_c11_4d30_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_4d30_left;
     BIN_OP_EQ_uxn_opcodes_h_l2017_c11_4d30_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_4d30_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_4d30_return_output := BIN_OP_EQ_uxn_opcodes_h_l2017_c11_4d30_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2036_c30_0e64] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2036_c30_0e64_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_0e64_ins;
     sp_relative_shift_uxn_opcodes_h_l2036_c30_0e64_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_0e64_x;
     sp_relative_shift_uxn_opcodes_h_l2036_c30_0e64_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_0e64_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_0e64_return_output := sp_relative_shift_uxn_opcodes_h_l2036_c30_0e64_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_bf27_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_bf27_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_bf27_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_bf27_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_bf27_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_bf27_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_bf27_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_bf27_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_bf27_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_bf27_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_bf27_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_bf27_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2017_c7_b943_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_4d30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b943_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_4d30_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b943_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_4d30_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b943_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_4d30_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b943_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_4d30_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_b943_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_4d30_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2017_c7_b943_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_4d30_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_b943_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_4d30_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2020_c7_be65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_8fa4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_be65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_8fa4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_be65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_8fa4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_be65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_8fa4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_be65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_8fa4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_be65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_8fa4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2020_c7_be65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_8fa4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_be65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_8fa4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2025_c7_e247_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_a31e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_e247_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_a31e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_e247_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_a31e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_e247_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_a31e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_e247_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_a31e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_e247_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_a31e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2025_c7_e247_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_a31e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_e247_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_a31e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2029_c7_9a6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_f6d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_9a6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_f6d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_9a6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_f6d8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_9a6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_f6d8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_9a6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_f6d8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_9a6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_f6d8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_9a6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_f6d8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2033_c7_9000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_14ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_9000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_14ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_9000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_14ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_9000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_14ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_9000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_14ee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_9000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_14ee_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_9000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_14ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7115_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_892b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7115_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_892b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7115_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_892b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7115_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_892b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_9ff2_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2030_l2034_l2021_l2026_DUPLICATE_7816_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_3458_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2030_l2034_l2021_l2026_DUPLICATE_7816_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_c006_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2030_l2034_l2021_l2026_DUPLICATE_7816_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2020_l2017_l2041_l2029_l2025_DUPLICATE_c466_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2020_l2017_l2041_l2029_l2025_DUPLICATE_c466_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2020_l2017_l2041_l2029_l2025_DUPLICATE_c466_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_9a6a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2020_l2017_l2041_l2029_l2025_DUPLICATE_c466_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7115_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2020_l2017_l2041_l2029_l2025_DUPLICATE_c466_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2020_l2017_l2041_l2033_l2029_l2025_DUPLICATE_6825_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2020_l2017_l2041_l2033_l2029_l2025_DUPLICATE_6825_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2020_l2017_l2041_l2033_l2029_l2025_DUPLICATE_6825_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_9a6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2020_l2017_l2041_l2033_l2029_l2025_DUPLICATE_6825_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_9000_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2020_l2017_l2041_l2033_l2029_l2025_DUPLICATE_6825_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7115_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2020_l2017_l2041_l2033_l2029_l2025_DUPLICATE_6825_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2020_l2017_l2033_l2029_l2025_DUPLICATE_f3dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2020_l2017_l2033_l2029_l2025_DUPLICATE_f3dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2020_l2017_l2033_l2029_l2025_DUPLICATE_f3dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_9a6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2020_l2017_l2033_l2029_l2025_DUPLICATE_f3dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_9000_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2020_l2017_l2033_l2029_l2025_DUPLICATE_f3dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_9a6a_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2029_l2041_DUPLICATE_1976_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7115_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2029_l2041_DUPLICATE_1976_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2020_l2017_l2004_l2041_l2029_l2025_DUPLICATE_2109_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2020_l2017_l2004_l2041_l2029_l2025_DUPLICATE_2109_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2020_l2017_l2004_l2041_l2029_l2025_DUPLICATE_2109_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2020_l2017_l2004_l2041_l2029_l2025_DUPLICATE_2109_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_9a6a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2020_l2017_l2004_l2041_l2029_l2025_DUPLICATE_2109_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7115_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2020_l2017_l2004_l2041_l2029_l2025_DUPLICATE_2109_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2004_c2_9ec3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2004_c2_9ec3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2004_c2_9ec3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2004_c2_9ec3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_9000_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_0e64_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l2004_c2_9ec3] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2041_c7_7115] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7115_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7115_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7115_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7115_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7115_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7115_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7115_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7115_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2044_c21_3a19] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2044_c21_3a19_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2044_c31_562c_return_output);

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2004_c2_9ec3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2034_c3_3458] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2034_c3_3458_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_3458_left;
     BIN_OP_OR_uxn_opcodes_h_l2034_c3_3458_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_3458_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_3458_return_output := BIN_OP_OR_uxn_opcodes_h_l2034_c3_3458_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2041_c7_7115] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7115_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7115_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7115_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7115_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7115_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7115_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7115_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7115_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2004_c2_9ec3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_c006 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_c006_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_c006_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_c006_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_c006_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2033_c7_9000] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_9000_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_9000_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_9000_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_9000_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_9000_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_9000_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_9000_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_9000_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2026_c3_9ff2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2026_c3_9ff2_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_9ff2_left;
     BIN_OP_OR_uxn_opcodes_h_l2026_c3_9ff2_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_9ff2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_9ff2_return_output := BIN_OP_OR_uxn_opcodes_h_l2026_c3_9ff2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2041_c7_7115] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7115_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7115_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7115_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7115_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7115_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7115_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7115_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7115_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2004_c2_9ec3] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_9ff2_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_ef0a_right := VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_3458_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2033_c7_9000_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_3458_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7115_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2044_c21_3a19_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2029_c7_9a6a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_c006_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_c006_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_9000_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7115_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_9a6a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_9000_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_9000_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7115_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_9000_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7115_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2029_c7_9a6a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_9a6a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_9a6a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_9a6a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_9a6a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_9a6a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_9a6a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2033_c7_9000] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_9000_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_9000_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_9000_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_9000_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_9000_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_9000_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_9000_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_9000_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2033_c7_9000] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_9000_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_9000_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_9000_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_9000_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_9000_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_9000_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_9000_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_9000_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2033_c7_9000] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_9000_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_9000_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_9000_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_9000_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_9000_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_9000_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_9000_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_9000_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2041_c7_7115] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7115_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7115_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7115_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7115_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7115_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7115_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7115_return_output := result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7115_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2035_c11_ef0a] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_ef0a_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_ef0a_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_ef0a_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_ef0a_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_ef0a_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_ef0a_return_output;

     -- n16_MUX[uxn_opcodes_h_l2033_c7_9000] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2033_c7_9000_cond <= VAR_n16_MUX_uxn_opcodes_h_l2033_c7_9000_cond;
     n16_MUX_uxn_opcodes_h_l2033_c7_9000_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2033_c7_9000_iftrue;
     n16_MUX_uxn_opcodes_h_l2033_c7_9000_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2033_c7_9000_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2033_c7_9000_return_output := n16_MUX_uxn_opcodes_h_l2033_c7_9000_return_output;

     -- t16_MUX[uxn_opcodes_h_l2025_c7_e247] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2025_c7_e247_cond <= VAR_t16_MUX_uxn_opcodes_h_l2025_c7_e247_cond;
     t16_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue;
     t16_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2025_c7_e247_return_output := t16_MUX_uxn_opcodes_h_l2025_c7_e247_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l2035_c3_3956 := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_ef0a_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l2029_c7_9a6a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2033_c7_9000_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_9a6a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_9000_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_9a6a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_9000_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_9a6a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_9000_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_9000_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7115_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2025_c7_e247_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_9000_iftrue := VAR_tmp16_uxn_opcodes_h_l2035_c3_3956;
     -- n16_MUX[uxn_opcodes_h_l2029_c7_9a6a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2029_c7_9a6a_cond <= VAR_n16_MUX_uxn_opcodes_h_l2029_c7_9a6a_cond;
     n16_MUX_uxn_opcodes_h_l2029_c7_9a6a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2029_c7_9a6a_iftrue;
     n16_MUX_uxn_opcodes_h_l2029_c7_9a6a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2029_c7_9a6a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output := n16_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2029_c7_9a6a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_9a6a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_9a6a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_9a6a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_9a6a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_9a6a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_9a6a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output;

     -- t16_MUX[uxn_opcodes_h_l2020_c7_be65] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2020_c7_be65_cond <= VAR_t16_MUX_uxn_opcodes_h_l2020_c7_be65_cond;
     t16_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue;
     t16_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2020_c7_be65_return_output := t16_MUX_uxn_opcodes_h_l2020_c7_be65_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2029_c7_9a6a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_9a6a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_9a6a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_9a6a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_9a6a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_9a6a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_9a6a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2025_c7_e247] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_e247_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_e247_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_e247_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_e247_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2039_c21_67e0] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2039_c21_67e0_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l2035_c3_3956);

     -- tmp16_MUX[uxn_opcodes_h_l2033_c7_9000] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2033_c7_9000_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_9000_cond;
     tmp16_MUX_uxn_opcodes_h_l2033_c7_9000_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_9000_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2033_c7_9000_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_9000_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_9000_return_output := tmp16_MUX_uxn_opcodes_h_l2033_c7_9000_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2029_c7_9a6a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_9a6a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_9a6a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_9a6a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_9a6a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_9a6a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_9a6a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_9000_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2039_c21_67e0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_e247_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2020_c7_be65_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_9a6a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_9000_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2025_c7_e247] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_e247_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_e247_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_e247_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_e247_return_output;

     -- n16_MUX[uxn_opcodes_h_l2025_c7_e247] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2025_c7_e247_cond <= VAR_n16_MUX_uxn_opcodes_h_l2025_c7_e247_cond;
     n16_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue;
     n16_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2025_c7_e247_return_output := n16_MUX_uxn_opcodes_h_l2025_c7_e247_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2025_c7_e247] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_e247_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_e247_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_e247_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_e247_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2025_c7_e247] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_e247_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_e247_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_e247_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_e247_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2029_c7_9a6a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2029_c7_9a6a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_9a6a_cond;
     tmp16_MUX_uxn_opcodes_h_l2029_c7_9a6a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_9a6a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2029_c7_9a6a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_9a6a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output := tmp16_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output;

     -- t16_MUX[uxn_opcodes_h_l2017_c7_b943] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2017_c7_b943_cond <= VAR_t16_MUX_uxn_opcodes_h_l2017_c7_b943_cond;
     t16_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue;
     t16_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2017_c7_b943_return_output := t16_MUX_uxn_opcodes_h_l2017_c7_b943_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2033_c7_9000] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2033_c7_9000_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_9000_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2033_c7_9000_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_9000_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2033_c7_9000_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_9000_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_9000_return_output := result_u8_value_MUX_uxn_opcodes_h_l2033_c7_9000_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2020_c7_be65] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_be65_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_be65_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_be65_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_be65_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2025_c7_e247_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_e247_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_be65_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_e247_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_e247_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_9a6a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_9000_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2017_c7_b943_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2025_c7_e247] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2025_c7_e247_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_e247_cond;
     tmp16_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_e247_return_output := tmp16_MUX_uxn_opcodes_h_l2025_c7_e247_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2020_c7_be65] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_be65_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_be65_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_be65_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_be65_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2020_c7_be65] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_be65_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_be65_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_be65_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_be65_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2017_c7_b943] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b943_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b943_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b943_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b943_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2029_c7_9a6a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2029_c7_9a6a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_9a6a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2029_c7_9a6a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_9a6a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2029_c7_9a6a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_9a6a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output;

     -- n16_MUX[uxn_opcodes_h_l2020_c7_be65] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2020_c7_be65_cond <= VAR_n16_MUX_uxn_opcodes_h_l2020_c7_be65_cond;
     n16_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue;
     n16_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2020_c7_be65_return_output := n16_MUX_uxn_opcodes_h_l2020_c7_be65_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2020_c7_be65] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_be65_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_be65_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_be65_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_be65_return_output;

     -- t16_MUX[uxn_opcodes_h_l2004_c2_9ec3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond <= VAR_t16_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond;
     t16_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue;
     t16_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output := t16_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2020_c7_be65_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_be65_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_b943_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_be65_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_be65_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_9a6a_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_e247_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2017_c7_b943] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b943_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b943_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b943_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b943_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2025_c7_e247] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2025_c7_e247_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_e247_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_e247_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_e247_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_e247_return_output := result_u8_value_MUX_uxn_opcodes_h_l2025_c7_e247_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2004_c2_9ec3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2020_c7_be65] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2020_c7_be65_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_be65_cond;
     tmp16_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_be65_return_output := tmp16_MUX_uxn_opcodes_h_l2020_c7_be65_return_output;

     -- n16_MUX[uxn_opcodes_h_l2017_c7_b943] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2017_c7_b943_cond <= VAR_n16_MUX_uxn_opcodes_h_l2017_c7_b943_cond;
     n16_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue;
     n16_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2017_c7_b943_return_output := n16_MUX_uxn_opcodes_h_l2017_c7_b943_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2017_c7_b943] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b943_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b943_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b943_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b943_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2017_c7_b943] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b943_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b943_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b943_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b943_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2017_c7_b943_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_b943_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_b943_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_b943_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_e247_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_be65_return_output;
     -- n16_MUX[uxn_opcodes_h_l2004_c2_9ec3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond <= VAR_n16_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond;
     n16_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue;
     n16_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output := n16_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2004_c2_9ec3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2004_c2_9ec3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2004_c2_9ec3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2017_c7_b943] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2017_c7_b943_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_b943_cond;
     tmp16_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_b943_return_output := tmp16_MUX_uxn_opcodes_h_l2017_c7_b943_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2020_c7_be65] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2020_c7_be65_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_be65_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_be65_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_be65_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_be65_return_output := result_u8_value_MUX_uxn_opcodes_h_l2020_c7_be65_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_be65_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_b943_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2017_c7_b943] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2017_c7_b943_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_b943_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_b943_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_b943_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_b943_return_output := result_u8_value_MUX_uxn_opcodes_h_l2017_c7_b943_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2004_c2_9ec3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond;
     tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output := tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_b943_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2004_c2_9ec3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output := result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l2048_l2000_DUPLICATE_3897 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l2048_l2000_DUPLICATE_3897_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec3_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l2048_l2000_DUPLICATE_3897_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l2048_l2000_DUPLICATE_3897_return_output;
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
