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
-- BIN_OP_EQ[uxn_opcodes_h_l2004_c6_1498]
signal BIN_OP_EQ_uxn_opcodes_h_l2004_c6_1498_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2004_c6_1498_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2004_c6_1498_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2004_c2_0221]
signal t16_MUX_uxn_opcodes_h_l2004_c2_0221_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2004_c2_0221_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2004_c2_0221]
signal tmp16_MUX_uxn_opcodes_h_l2004_c2_0221_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2004_c2_0221_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2004_c2_0221]
signal n16_MUX_uxn_opcodes_h_l2004_c2_0221_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2004_c2_0221_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2004_c2_0221]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_0221_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_0221_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2004_c2_0221]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_0221_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_0221_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2004_c2_0221]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_0221_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_0221_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2004_c2_0221]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_0221_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_0221_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2004_c2_0221]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_0221_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_0221_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2004_c2_0221]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_0221_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_0221_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2004_c2_0221]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_0221_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_0221_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2004_c2_0221]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_0221_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_0221_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2004_c2_0221]
signal result_u8_value_MUX_uxn_opcodes_h_l2004_c2_0221_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2004_c2_0221_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2017_c11_e53c]
signal BIN_OP_EQ_uxn_opcodes_h_l2017_c11_e53c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2017_c11_e53c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2017_c11_e53c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2017_c7_9bf8]
signal t16_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2017_c7_9bf8]
signal tmp16_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2017_c7_9bf8]
signal n16_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2017_c7_9bf8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2017_c7_9bf8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2017_c7_9bf8]
signal result_u8_value_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2017_c7_9bf8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2017_c7_9bf8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2020_c11_82f9]
signal BIN_OP_EQ_uxn_opcodes_h_l2020_c11_82f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2020_c11_82f9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2020_c11_82f9_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2020_c7_fabd]
signal t16_MUX_uxn_opcodes_h_l2020_c7_fabd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2020_c7_fabd]
signal tmp16_MUX_uxn_opcodes_h_l2020_c7_fabd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2020_c7_fabd]
signal n16_MUX_uxn_opcodes_h_l2020_c7_fabd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2020_c7_fabd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fabd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2020_c7_fabd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fabd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2020_c7_fabd]
signal result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fabd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2020_c7_fabd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fabd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2020_c7_fabd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fabd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2025_c11_cf7e]
signal BIN_OP_EQ_uxn_opcodes_h_l2025_c11_cf7e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2025_c11_cf7e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2025_c11_cf7e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2025_c7_94b0]
signal t16_MUX_uxn_opcodes_h_l2025_c7_94b0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2025_c7_94b0]
signal tmp16_MUX_uxn_opcodes_h_l2025_c7_94b0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2025_c7_94b0]
signal n16_MUX_uxn_opcodes_h_l2025_c7_94b0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2025_c7_94b0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_94b0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2025_c7_94b0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_94b0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2025_c7_94b0]
signal result_u8_value_MUX_uxn_opcodes_h_l2025_c7_94b0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2025_c7_94b0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_94b0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2025_c7_94b0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_94b0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2026_c3_d0cc]
signal BIN_OP_OR_uxn_opcodes_h_l2026_c3_d0cc_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2026_c3_d0cc_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2026_c3_d0cc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2029_c11_a21a]
signal BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a21a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a21a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a21a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2029_c7_fb06]
signal tmp16_MUX_uxn_opcodes_h_l2029_c7_fb06_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2029_c7_fb06_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2029_c7_fb06_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2029_c7_fb06]
signal n16_MUX_uxn_opcodes_h_l2029_c7_fb06_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2029_c7_fb06_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2029_c7_fb06_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2029_c7_fb06]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_fb06_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_fb06_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_fb06_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2029_c7_fb06]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_fb06_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_fb06_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_fb06_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2029_c7_fb06]
signal result_u8_value_MUX_uxn_opcodes_h_l2029_c7_fb06_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2029_c7_fb06_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2029_c7_fb06_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2029_c7_fb06]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_fb06_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_fb06_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_fb06_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2029_c7_fb06]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_fb06_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_fb06_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_fb06_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2033_c11_128b]
signal BIN_OP_EQ_uxn_opcodes_h_l2033_c11_128b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2033_c11_128b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2033_c11_128b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2033_c7_bb1d]
signal tmp16_MUX_uxn_opcodes_h_l2033_c7_bb1d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2033_c7_bb1d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2033_c7_bb1d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2033_c7_bb1d]
signal n16_MUX_uxn_opcodes_h_l2033_c7_bb1d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2033_c7_bb1d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2033_c7_bb1d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2033_c7_bb1d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_bb1d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_bb1d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_bb1d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2033_c7_bb1d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_bb1d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_bb1d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_bb1d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2033_c7_bb1d]
signal result_u8_value_MUX_uxn_opcodes_h_l2033_c7_bb1d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2033_c7_bb1d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2033_c7_bb1d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2033_c7_bb1d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_bb1d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_bb1d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_bb1d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2033_c7_bb1d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_bb1d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_bb1d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_bb1d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2034_c3_cdb4]
signal BIN_OP_OR_uxn_opcodes_h_l2034_c3_cdb4_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2034_c3_cdb4_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2034_c3_cdb4_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2035_c11_82d5]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_82d5_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_82d5_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_82d5_return_output : unsigned(31 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2036_c30_96ef]
signal sp_relative_shift_uxn_opcodes_h_l2036_c30_96ef_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2036_c30_96ef_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2036_c30_96ef_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2036_c30_96ef_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2041_c11_3da3]
signal BIN_OP_EQ_uxn_opcodes_h_l2041_c11_3da3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2041_c11_3da3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2041_c11_3da3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2041_c7_c018]
signal result_u8_value_MUX_uxn_opcodes_h_l2041_c7_c018_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2041_c7_c018_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2041_c7_c018_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2041_c7_c018_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2041_c7_c018]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_c018_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_c018_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_c018_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_c018_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2041_c7_c018]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_c018_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_c018_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_c018_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_c018_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2041_c7_c018]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_c018_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_c018_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_c018_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_c018_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2044_c31_23eb]
signal CONST_SR_8_uxn_opcodes_h_l2044_c31_23eb_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2044_c31_23eb_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_d826
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_d826_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_d826_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_8b52( ref_toks_0 : opcode_result_t;
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
      base.is_pc_updated := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.is_vram_write := ref_toks_8;
      base.u8_value := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2004_c6_1498
BIN_OP_EQ_uxn_opcodes_h_l2004_c6_1498 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2004_c6_1498_left,
BIN_OP_EQ_uxn_opcodes_h_l2004_c6_1498_right,
BIN_OP_EQ_uxn_opcodes_h_l2004_c6_1498_return_output);

-- t16_MUX_uxn_opcodes_h_l2004_c2_0221
t16_MUX_uxn_opcodes_h_l2004_c2_0221 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2004_c2_0221_cond,
t16_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue,
t16_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse,
t16_MUX_uxn_opcodes_h_l2004_c2_0221_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2004_c2_0221
tmp16_MUX_uxn_opcodes_h_l2004_c2_0221 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2004_c2_0221_cond,
tmp16_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue,
tmp16_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse,
tmp16_MUX_uxn_opcodes_h_l2004_c2_0221_return_output);

-- n16_MUX_uxn_opcodes_h_l2004_c2_0221
n16_MUX_uxn_opcodes_h_l2004_c2_0221 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2004_c2_0221_cond,
n16_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue,
n16_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse,
n16_MUX_uxn_opcodes_h_l2004_c2_0221_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_0221
result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_0221 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_0221_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_0221_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_0221
result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_0221 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_0221_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_0221_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_0221
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_0221 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_0221_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_0221_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_0221
result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_0221 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_0221_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_0221_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_0221
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_0221 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_0221_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_0221_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_0221
result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_0221 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_0221_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_0221_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_0221
result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_0221 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_0221_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_0221_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_0221
result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_0221 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_0221_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_0221_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2004_c2_0221
result_u8_value_MUX_uxn_opcodes_h_l2004_c2_0221 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2004_c2_0221_cond,
result_u8_value_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2004_c2_0221_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2017_c11_e53c
BIN_OP_EQ_uxn_opcodes_h_l2017_c11_e53c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2017_c11_e53c_left,
BIN_OP_EQ_uxn_opcodes_h_l2017_c11_e53c_right,
BIN_OP_EQ_uxn_opcodes_h_l2017_c11_e53c_return_output);

-- t16_MUX_uxn_opcodes_h_l2017_c7_9bf8
t16_MUX_uxn_opcodes_h_l2017_c7_9bf8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond,
t16_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue,
t16_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse,
t16_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2017_c7_9bf8
tmp16_MUX_uxn_opcodes_h_l2017_c7_9bf8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond,
tmp16_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue,
tmp16_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse,
tmp16_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output);

-- n16_MUX_uxn_opcodes_h_l2017_c7_9bf8
n16_MUX_uxn_opcodes_h_l2017_c7_9bf8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond,
n16_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue,
n16_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse,
n16_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_9bf8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_9bf8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_9bf8
result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_9bf8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2017_c7_9bf8
result_u8_value_MUX_uxn_opcodes_h_l2017_c7_9bf8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_9bf8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_9bf8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_9bf8
result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_9bf8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2020_c11_82f9
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_82f9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_82f9_left,
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_82f9_right,
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_82f9_return_output);

-- t16_MUX_uxn_opcodes_h_l2020_c7_fabd
t16_MUX_uxn_opcodes_h_l2020_c7_fabd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2020_c7_fabd_cond,
t16_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue,
t16_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse,
t16_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2020_c7_fabd
tmp16_MUX_uxn_opcodes_h_l2020_c7_fabd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2020_c7_fabd_cond,
tmp16_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue,
tmp16_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse,
tmp16_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output);

-- n16_MUX_uxn_opcodes_h_l2020_c7_fabd
n16_MUX_uxn_opcodes_h_l2020_c7_fabd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2020_c7_fabd_cond,
n16_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue,
n16_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse,
n16_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fabd
result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fabd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fabd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fabd
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fabd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fabd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fabd
result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fabd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fabd_cond,
result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fabd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fabd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fabd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fabd
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fabd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fabd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2025_c11_cf7e
BIN_OP_EQ_uxn_opcodes_h_l2025_c11_cf7e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2025_c11_cf7e_left,
BIN_OP_EQ_uxn_opcodes_h_l2025_c11_cf7e_right,
BIN_OP_EQ_uxn_opcodes_h_l2025_c11_cf7e_return_output);

-- t16_MUX_uxn_opcodes_h_l2025_c7_94b0
t16_MUX_uxn_opcodes_h_l2025_c7_94b0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2025_c7_94b0_cond,
t16_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue,
t16_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse,
t16_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2025_c7_94b0
tmp16_MUX_uxn_opcodes_h_l2025_c7_94b0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2025_c7_94b0_cond,
tmp16_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue,
tmp16_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse,
tmp16_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output);

-- n16_MUX_uxn_opcodes_h_l2025_c7_94b0
n16_MUX_uxn_opcodes_h_l2025_c7_94b0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2025_c7_94b0_cond,
n16_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue,
n16_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse,
n16_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_94b0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_94b0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_94b0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_94b0
result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_94b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_94b0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2025_c7_94b0
result_u8_value_MUX_uxn_opcodes_h_l2025_c7_94b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2025_c7_94b0_cond,
result_u8_value_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_94b0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_94b0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_94b0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_94b0
result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_94b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_94b0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2026_c3_d0cc
BIN_OP_OR_uxn_opcodes_h_l2026_c3_d0cc : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2026_c3_d0cc_left,
BIN_OP_OR_uxn_opcodes_h_l2026_c3_d0cc_right,
BIN_OP_OR_uxn_opcodes_h_l2026_c3_d0cc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a21a
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a21a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a21a_left,
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a21a_right,
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a21a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2029_c7_fb06
tmp16_MUX_uxn_opcodes_h_l2029_c7_fb06 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2029_c7_fb06_cond,
tmp16_MUX_uxn_opcodes_h_l2029_c7_fb06_iftrue,
tmp16_MUX_uxn_opcodes_h_l2029_c7_fb06_iffalse,
tmp16_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output);

-- n16_MUX_uxn_opcodes_h_l2029_c7_fb06
n16_MUX_uxn_opcodes_h_l2029_c7_fb06 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2029_c7_fb06_cond,
n16_MUX_uxn_opcodes_h_l2029_c7_fb06_iftrue,
n16_MUX_uxn_opcodes_h_l2029_c7_fb06_iffalse,
n16_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_fb06
result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_fb06 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_fb06_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_fb06_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_fb06_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_fb06
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_fb06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_fb06_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_fb06_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_fb06_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2029_c7_fb06
result_u8_value_MUX_uxn_opcodes_h_l2029_c7_fb06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2029_c7_fb06_cond,
result_u8_value_MUX_uxn_opcodes_h_l2029_c7_fb06_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2029_c7_fb06_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_fb06
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_fb06 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_fb06_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_fb06_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_fb06_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_fb06
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_fb06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_fb06_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_fb06_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_fb06_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2033_c11_128b
BIN_OP_EQ_uxn_opcodes_h_l2033_c11_128b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2033_c11_128b_left,
BIN_OP_EQ_uxn_opcodes_h_l2033_c11_128b_right,
BIN_OP_EQ_uxn_opcodes_h_l2033_c11_128b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2033_c7_bb1d
tmp16_MUX_uxn_opcodes_h_l2033_c7_bb1d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2033_c7_bb1d_cond,
tmp16_MUX_uxn_opcodes_h_l2033_c7_bb1d_iftrue,
tmp16_MUX_uxn_opcodes_h_l2033_c7_bb1d_iffalse,
tmp16_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output);

-- n16_MUX_uxn_opcodes_h_l2033_c7_bb1d
n16_MUX_uxn_opcodes_h_l2033_c7_bb1d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2033_c7_bb1d_cond,
n16_MUX_uxn_opcodes_h_l2033_c7_bb1d_iftrue,
n16_MUX_uxn_opcodes_h_l2033_c7_bb1d_iffalse,
n16_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_bb1d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_bb1d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_bb1d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_bb1d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_bb1d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_bb1d
result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_bb1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_bb1d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_bb1d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_bb1d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2033_c7_bb1d
result_u8_value_MUX_uxn_opcodes_h_l2033_c7_bb1d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2033_c7_bb1d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2033_c7_bb1d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2033_c7_bb1d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_bb1d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_bb1d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_bb1d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_bb1d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_bb1d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_bb1d
result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_bb1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_bb1d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_bb1d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_bb1d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2034_c3_cdb4
BIN_OP_OR_uxn_opcodes_h_l2034_c3_cdb4 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2034_c3_cdb4_left,
BIN_OP_OR_uxn_opcodes_h_l2034_c3_cdb4_right,
BIN_OP_OR_uxn_opcodes_h_l2034_c3_cdb4_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_82d5
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_82d5 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_82d5_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_82d5_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_82d5_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2036_c30_96ef
sp_relative_shift_uxn_opcodes_h_l2036_c30_96ef : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2036_c30_96ef_ins,
sp_relative_shift_uxn_opcodes_h_l2036_c30_96ef_x,
sp_relative_shift_uxn_opcodes_h_l2036_c30_96ef_y,
sp_relative_shift_uxn_opcodes_h_l2036_c30_96ef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2041_c11_3da3
BIN_OP_EQ_uxn_opcodes_h_l2041_c11_3da3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2041_c11_3da3_left,
BIN_OP_EQ_uxn_opcodes_h_l2041_c11_3da3_right,
BIN_OP_EQ_uxn_opcodes_h_l2041_c11_3da3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2041_c7_c018
result_u8_value_MUX_uxn_opcodes_h_l2041_c7_c018 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2041_c7_c018_cond,
result_u8_value_MUX_uxn_opcodes_h_l2041_c7_c018_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2041_c7_c018_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2041_c7_c018_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_c018
result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_c018 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_c018_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_c018_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_c018_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_c018_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_c018
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_c018 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_c018_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_c018_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_c018_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_c018_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_c018
result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_c018 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_c018_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_c018_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_c018_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_c018_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2044_c31_23eb
CONST_SR_8_uxn_opcodes_h_l2044_c31_23eb : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2044_c31_23eb_x,
CONST_SR_8_uxn_opcodes_h_l2044_c31_23eb_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_d826
CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_d826 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_d826_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_d826_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2004_c6_1498_return_output,
 t16_MUX_uxn_opcodes_h_l2004_c2_0221_return_output,
 tmp16_MUX_uxn_opcodes_h_l2004_c2_0221_return_output,
 n16_MUX_uxn_opcodes_h_l2004_c2_0221_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_0221_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_0221_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_0221_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_0221_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_0221_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_0221_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_0221_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_0221_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2004_c2_0221_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2017_c11_e53c_return_output,
 t16_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output,
 tmp16_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output,
 n16_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2020_c11_82f9_return_output,
 t16_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output,
 tmp16_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output,
 n16_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2025_c11_cf7e_return_output,
 t16_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output,
 tmp16_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output,
 n16_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2026_c3_d0cc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a21a_return_output,
 tmp16_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output,
 n16_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2033_c11_128b_return_output,
 tmp16_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output,
 n16_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2034_c3_cdb4_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_82d5_return_output,
 sp_relative_shift_uxn_opcodes_h_l2036_c30_96ef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2041_c11_3da3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2041_c7_c018_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_c018_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_c018_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_c018_return_output,
 CONST_SR_8_uxn_opcodes_h_l2044_c31_23eb_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_d826_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_1498_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_1498_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_1498_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2004_c2_0221_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2004_c2_0221_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_0221_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_0221_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2004_c2_0221_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2004_c2_0221_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2009_c3_af12 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_0221_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_0221_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2004_c2_0221_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_0221_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_0221_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2004_c2_0221_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_0221_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_0221_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_0221_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_0221_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2014_c3_ed6c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_0221_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_0221_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_0221_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_0221_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2004_c2_0221_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_0221_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_0221_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2004_c2_0221_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_0221_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_0221_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_0221_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_0221_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_e53c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_e53c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_e53c_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2018_c3_3525 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_82f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_82f9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_82f9_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2020_c7_fabd_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_fabd_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2020_c7_fabd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fabd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fabd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fabd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2023_c3_cb10 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fabd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fabd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_cf7e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_cf7e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_cf7e_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2025_c7_94b0_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_94b0_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2025_c7_94b0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_94b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_94b0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_94b0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2027_c3_8cbb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_94b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_94b0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_d0cc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_d0cc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_d0cc_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a21a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a21a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a21a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_fb06_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_fb06_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_fb06_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2029_c7_fb06_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2029_c7_fb06_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2029_c7_fb06_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_fb06_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_fb06_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_fb06_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_fb06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_fb06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_fb06_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_fb06_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_fb06_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_fb06_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_fb06_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_fb06_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_fb06_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_fb06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_fb06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_fb06_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_128b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_128b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_128b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_bb1d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l2035_c3_e5be : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_bb1d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_bb1d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2033_c7_bb1d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2033_c7_bb1d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2033_c7_bb1d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_bb1d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_bb1d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_c018_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_bb1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_bb1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_bb1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_bb1d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_bb1d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_bb1d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_c018_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_bb1d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_bb1d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2038_c3_6f24 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_bb1d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_c018_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_bb1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_bb1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_bb1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_c018_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_bb1d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_cdb4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_cdb4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_cdb4_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_82d5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_82d5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_82d5_return_output : unsigned(31 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_96ef_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_96ef_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_96ef_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_96ef_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2039_c21_c72b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_3da3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_3da3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_3da3_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_c018_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_c018_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_c018_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_c018_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2042_c3_4d8e : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_c018_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_c018_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_c018_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2043_c3_206a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_c018_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_c018_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_c018_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_c018_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_c018_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2044_c31_23eb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2044_c31_23eb_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2044_c21_e4a2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2004_l2041_DUPLICATE_9992_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2041_DUPLICATE_b444_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2033_DUPLICATE_e1f3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2041_l2033_DUPLICATE_43d5_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2021_l2030_l2034_l2026_DUPLICATE_9aaf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_d826_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_d826_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2041_l2029_DUPLICATE_ecd1_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l2048_l2000_DUPLICATE_4da0_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2014_c3_ed6c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2014_c3_ed6c;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_bb1d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_cf7e_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2042_c3_4d8e := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_c018_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2042_c3_4d8e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2043_c3_206a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_c018_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2043_c3_206a;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_1498_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2027_c3_8cbb := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2027_c3_8cbb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_e53c_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2023_c3_cb10 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2023_c3_cb10;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_3da3_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2018_c3_3525 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2018_c3_3525;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_c018_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_82f9_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_96ef_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2038_c3_6f24 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_bb1d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2038_c3_6f24;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_128b_right := to_unsigned(5, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2009_c3_af12 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2009_c3_af12;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a21a_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_96ef_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_96ef_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_cdb4_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2033_c7_bb1d_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_1498_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_e53c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_82f9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_cf7e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a21a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_128b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_3da3_left := VAR_phase;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_82d5_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_d0cc_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2044_c31_23eb_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_fb06_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_bb1d_iffalse := tmp16;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2004_l2041_DUPLICATE_9992 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2004_l2041_DUPLICATE_9992_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2025_c11_cf7e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2025_c11_cf7e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_cf7e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2025_c11_cf7e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_cf7e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_cf7e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2025_c11_cf7e_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2004_c2_0221] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2004_c2_0221_return_output := result.is_pc_updated;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2004_c2_0221] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2004_c2_0221_return_output := result.is_vram_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2021_l2030_l2034_l2026_DUPLICATE_9aaf LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2021_l2030_l2034_l2026_DUPLICATE_9aaf_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2004_c2_0221] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2004_c2_0221_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2033_DUPLICATE_e1f3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2033_DUPLICATE_e1f3_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2041_c11_3da3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2041_c11_3da3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_3da3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2041_c11_3da3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_3da3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_3da3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2041_c11_3da3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2020_c11_82f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2020_c11_82f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_82f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2020_c11_82f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_82f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_82f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2020_c11_82f9_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2004_c2_0221] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2004_c2_0221_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2029_c11_a21a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a21a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a21a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a21a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a21a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a21a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a21a_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2036_c30_96ef] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2036_c30_96ef_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_96ef_ins;
     sp_relative_shift_uxn_opcodes_h_l2036_c30_96ef_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_96ef_x;
     sp_relative_shift_uxn_opcodes_h_l2036_c30_96ef_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_96ef_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_96ef_return_output := sp_relative_shift_uxn_opcodes_h_l2036_c30_96ef_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2044_c31_23eb] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2044_c31_23eb_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2044_c31_23eb_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2044_c31_23eb_return_output := CONST_SR_8_uxn_opcodes_h_l2044_c31_23eb_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2041_l2033_DUPLICATE_43d5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2041_l2033_DUPLICATE_43d5_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2004_c6_1498] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2004_c6_1498_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_1498_left;
     BIN_OP_EQ_uxn_opcodes_h_l2004_c6_1498_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_1498_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_1498_return_output := BIN_OP_EQ_uxn_opcodes_h_l2004_c6_1498_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2033_c11_128b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2033_c11_128b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_128b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2033_c11_128b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_128b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_128b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2033_c11_128b_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2041_l2029_DUPLICATE_ecd1 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2041_l2029_DUPLICATE_ecd1_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2041_DUPLICATE_b444 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2041_DUPLICATE_b444_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2017_c11_e53c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2017_c11_e53c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_e53c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2017_c11_e53c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_e53c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_e53c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2017_c11_e53c_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2004_c2_0221_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_1498_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_0221_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_1498_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_0221_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_1498_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_0221_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_1498_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_0221_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_1498_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_0221_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_1498_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_0221_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_1498_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_0221_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_1498_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_0221_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_1498_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_0221_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_1498_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2004_c2_0221_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_1498_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_0221_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_1498_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_e53c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_e53c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_e53c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_e53c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_e53c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_e53c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_e53c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_e53c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2020_c7_fabd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_82f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fabd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_82f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fabd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_82f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fabd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_82f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fabd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_82f9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fabd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_82f9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2020_c7_fabd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_82f9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_fabd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_82f9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2025_c7_94b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_cf7e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_94b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_cf7e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_94b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_cf7e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_94b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_cf7e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_94b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_cf7e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_94b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_cf7e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2025_c7_94b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_cf7e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_94b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_cf7e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2029_c7_fb06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a21a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_fb06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a21a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_fb06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a21a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_fb06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a21a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_fb06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a21a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_fb06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a21a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_fb06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_a21a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2033_c7_bb1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_128b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_bb1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_128b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_bb1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_128b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_bb1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_128b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_bb1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_128b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_bb1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_128b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_bb1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_128b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_c018_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_3da3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_c018_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_3da3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_c018_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_3da3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_c018_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_3da3_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_d0cc_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2021_l2030_l2034_l2026_DUPLICATE_9aaf_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_cdb4_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2021_l2030_l2034_l2026_DUPLICATE_9aaf_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_d826_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2021_l2030_l2034_l2026_DUPLICATE_9aaf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2041_DUPLICATE_b444_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2041_DUPLICATE_b444_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2041_DUPLICATE_b444_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_fb06_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2041_DUPLICATE_b444_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_c018_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2041_DUPLICATE_b444_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2041_l2033_DUPLICATE_43d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2041_l2033_DUPLICATE_43d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2041_l2033_DUPLICATE_43d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_fb06_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2041_l2033_DUPLICATE_43d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_bb1d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2041_l2033_DUPLICATE_43d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_c018_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2041_l2033_DUPLICATE_43d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2033_DUPLICATE_e1f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2033_DUPLICATE_e1f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2033_DUPLICATE_e1f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_fb06_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2033_DUPLICATE_e1f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_bb1d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2033_DUPLICATE_e1f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_fb06_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2041_l2029_DUPLICATE_ecd1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_c018_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2041_l2029_DUPLICATE_ecd1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2004_l2041_DUPLICATE_9992_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2004_l2041_DUPLICATE_9992_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2004_l2041_DUPLICATE_9992_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2004_l2041_DUPLICATE_9992_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_fb06_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2004_l2041_DUPLICATE_9992_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_c018_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2029_l2025_l2020_l2017_l2004_l2041_DUPLICATE_9992_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2004_c2_0221_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2004_c2_0221_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2004_c2_0221_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2004_c2_0221_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_bb1d_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_96ef_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2004_c2_0221] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_0221_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_0221_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_0221_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_0221_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2026_c3_d0cc] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2026_c3_d0cc_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_d0cc_left;
     BIN_OP_OR_uxn_opcodes_h_l2026_c3_d0cc_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_d0cc_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_d0cc_return_output := BIN_OP_OR_uxn_opcodes_h_l2026_c3_d0cc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2041_c7_c018] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_c018_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_c018_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_c018_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_c018_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_c018_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_c018_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_c018_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_c018_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2004_c2_0221] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_0221_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_0221_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_0221_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_0221_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2041_c7_c018] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_c018_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_c018_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_c018_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_c018_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_c018_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_c018_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_c018_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_c018_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2004_c2_0221] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_0221_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_0221_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_0221_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_0221_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2044_c21_e4a2] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2044_c21_e4a2_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2044_c31_23eb_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l2034_c3_cdb4] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2034_c3_cdb4_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_cdb4_left;
     BIN_OP_OR_uxn_opcodes_h_l2034_c3_cdb4_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_cdb4_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_cdb4_return_output := BIN_OP_OR_uxn_opcodes_h_l2034_c3_cdb4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2033_c7_bb1d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_bb1d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_bb1d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_bb1d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_bb1d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_bb1d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_bb1d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2004_c2_0221] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_0221_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_0221_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_0221_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_0221_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_d826 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_d826_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_d826_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_d826_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_d826_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2041_c7_c018] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_c018_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_c018_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_c018_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_c018_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_c018_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_c018_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_c018_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_c018_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_d0cc_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_82d5_right := VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_cdb4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2033_c7_bb1d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_cdb4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_c018_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2044_c21_e4a2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2029_c7_fb06_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_d826_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_d826_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_bb1d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_c018_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_fb06_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_bb1d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_c018_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_bb1d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_c018_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2033_c7_bb1d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_bb1d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_bb1d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_bb1d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_bb1d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_bb1d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_bb1d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2033_c7_bb1d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2033_c7_bb1d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2033_c7_bb1d_cond;
     n16_MUX_uxn_opcodes_h_l2033_c7_bb1d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2033_c7_bb1d_iftrue;
     n16_MUX_uxn_opcodes_h_l2033_c7_bb1d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2033_c7_bb1d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output := n16_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2041_c7_c018] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2041_c7_c018_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_c018_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2041_c7_c018_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_c018_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2041_c7_c018_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_c018_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_c018_return_output := result_u8_value_MUX_uxn_opcodes_h_l2041_c7_c018_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2035_c11_82d5] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_82d5_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_82d5_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_82d5_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_82d5_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_82d5_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_82d5_return_output;

     -- t16_MUX[uxn_opcodes_h_l2025_c7_94b0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2025_c7_94b0_cond <= VAR_t16_MUX_uxn_opcodes_h_l2025_c7_94b0_cond;
     t16_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue;
     t16_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output := t16_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2029_c7_fb06] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_fb06_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_fb06_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_fb06_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_fb06_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_fb06_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_fb06_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2033_c7_bb1d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_bb1d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_bb1d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_bb1d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_bb1d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_bb1d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_bb1d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2033_c7_bb1d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_bb1d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_bb1d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_bb1d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_bb1d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_bb1d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_bb1d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l2035_c3_e5be := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_82d5_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l2029_c7_fb06_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_fb06_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_fb06_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_fb06_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_bb1d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_c018_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_bb1d_iftrue := VAR_tmp16_uxn_opcodes_h_l2035_c3_e5be;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l2039_c21_c72b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2039_c21_c72b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l2035_c3_e5be);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2025_c7_94b0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_94b0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_94b0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2033_c7_bb1d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2033_c7_bb1d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_bb1d_cond;
     tmp16_MUX_uxn_opcodes_h_l2033_c7_bb1d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_bb1d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2033_c7_bb1d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_bb1d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output := tmp16_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2029_c7_fb06] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2029_c7_fb06_cond <= VAR_n16_MUX_uxn_opcodes_h_l2029_c7_fb06_cond;
     n16_MUX_uxn_opcodes_h_l2029_c7_fb06_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2029_c7_fb06_iftrue;
     n16_MUX_uxn_opcodes_h_l2029_c7_fb06_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2029_c7_fb06_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output := n16_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output;

     -- t16_MUX[uxn_opcodes_h_l2020_c7_fabd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2020_c7_fabd_cond <= VAR_t16_MUX_uxn_opcodes_h_l2020_c7_fabd_cond;
     t16_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue;
     t16_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output := t16_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2029_c7_fb06] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_fb06_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_fb06_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_fb06_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_fb06_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_fb06_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_fb06_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2029_c7_fb06] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_fb06_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_fb06_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_fb06_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_fb06_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_fb06_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_fb06_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2029_c7_fb06] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_fb06_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_fb06_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_fb06_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_fb06_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_fb06_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_fb06_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_bb1d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2039_c21_c72b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_fb06_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2025_c7_94b0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_94b0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_94b0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2020_c7_fabd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fabd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fabd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output;

     -- n16_MUX[uxn_opcodes_h_l2025_c7_94b0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2025_c7_94b0_cond <= VAR_n16_MUX_uxn_opcodes_h_l2025_c7_94b0_cond;
     n16_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue;
     n16_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output := n16_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2029_c7_fb06] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2029_c7_fb06_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_fb06_cond;
     tmp16_MUX_uxn_opcodes_h_l2029_c7_fb06_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_fb06_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2029_c7_fb06_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_fb06_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output := tmp16_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2025_c7_94b0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_94b0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_94b0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output;

     -- t16_MUX[uxn_opcodes_h_l2017_c7_9bf8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond <= VAR_t16_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond;
     t16_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue;
     t16_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output := t16_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2025_c7_94b0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_94b0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_94b0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2033_c7_bb1d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2033_c7_bb1d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_bb1d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2033_c7_bb1d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_bb1d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2033_c7_bb1d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_bb1d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_fb06_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_bb1d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2029_c7_fb06] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2029_c7_fb06_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_fb06_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2029_c7_fb06_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_fb06_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2029_c7_fb06_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_fb06_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output := result_u8_value_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2020_c7_fabd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fabd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fabd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2020_c7_fabd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fabd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fabd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output;

     -- n16_MUX[uxn_opcodes_h_l2020_c7_fabd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2020_c7_fabd_cond <= VAR_n16_MUX_uxn_opcodes_h_l2020_c7_fabd_cond;
     n16_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue;
     n16_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output := n16_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output;

     -- t16_MUX[uxn_opcodes_h_l2004_c2_0221] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2004_c2_0221_cond <= VAR_t16_MUX_uxn_opcodes_h_l2004_c2_0221_cond;
     t16_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue;
     t16_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2004_c2_0221_return_output := t16_MUX_uxn_opcodes_h_l2004_c2_0221_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2025_c7_94b0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2025_c7_94b0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_94b0_cond;
     tmp16_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output := tmp16_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2017_c7_9bf8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2020_c7_fabd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fabd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fabd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_fb06_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2004_c2_0221_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2004_c2_0221] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_0221_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_0221_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_0221_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_0221_return_output;

     -- n16_MUX[uxn_opcodes_h_l2017_c7_9bf8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond <= VAR_n16_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond;
     n16_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue;
     n16_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output := n16_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2017_c7_9bf8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2025_c7_94b0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2025_c7_94b0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_94b0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_94b0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_94b0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output := result_u8_value_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2020_c7_fabd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2020_c7_fabd_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_fabd_cond;
     tmp16_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output := tmp16_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2017_c7_9bf8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2017_c7_9bf8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_94b0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2004_c2_0221] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_0221_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_0221_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_0221_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_0221_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2004_c2_0221] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_0221_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_0221_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_0221_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_0221_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2017_c7_9bf8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond;
     tmp16_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output := tmp16_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2020_c7_fabd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fabd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fabd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fabd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fabd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output := result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2004_c2_0221] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_0221_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_0221_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_0221_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_0221_return_output;

     -- n16_MUX[uxn_opcodes_h_l2004_c2_0221] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2004_c2_0221_cond <= VAR_n16_MUX_uxn_opcodes_h_l2004_c2_0221_cond;
     n16_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue;
     n16_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2004_c2_0221_return_output := n16_MUX_uxn_opcodes_h_l2004_c2_0221_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2004_c2_0221_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_fabd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2004_c2_0221] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2004_c2_0221_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_0221_cond;
     tmp16_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_0221_return_output := tmp16_MUX_uxn_opcodes_h_l2004_c2_0221_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2017_c7_9bf8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_9bf8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_9bf8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_9bf8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_9bf8_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_0221_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2004_c2_0221] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2004_c2_0221_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_0221_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_0221_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_0221_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_0221_return_output := result_u8_value_MUX_uxn_opcodes_h_l2004_c2_0221_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l2048_l2000_DUPLICATE_4da0 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l2048_l2000_DUPLICATE_4da0_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8b52(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_0221_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_0221_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_0221_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_0221_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_0221_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_0221_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_0221_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_0221_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_0221_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l2048_l2000_DUPLICATE_4da0_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l2048_l2000_DUPLICATE_4da0_return_output;
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
