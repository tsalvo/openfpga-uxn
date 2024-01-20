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
-- BIN_OP_EQ[uxn_opcodes_h_l2004_c6_d83b]
signal BIN_OP_EQ_uxn_opcodes_h_l2004_c6_d83b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2004_c6_d83b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2004_c6_d83b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2004_c2_e20c]
signal t16_MUX_uxn_opcodes_h_l2004_c2_e20c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2004_c2_e20c]
signal n16_MUX_uxn_opcodes_h_l2004_c2_e20c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2004_c2_e20c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2004_c2_e20c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_e20c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2004_c2_e20c]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2004_c2_e20c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_e20c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2004_c2_e20c]
signal result_u8_value_MUX_uxn_opcodes_h_l2004_c2_e20c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2004_c2_e20c]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_e20c_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2004_c2_e20c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_e20c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2004_c2_e20c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_e20c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2004_c2_e20c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_e20c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2004_c2_e20c]
signal tmp16_MUX_uxn_opcodes_h_l2004_c2_e20c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2017_c11_067c]
signal BIN_OP_EQ_uxn_opcodes_h_l2017_c11_067c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2017_c11_067c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2017_c11_067c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2017_c7_be22]
signal t16_MUX_uxn_opcodes_h_l2017_c7_be22_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2017_c7_be22_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2017_c7_be22]
signal n16_MUX_uxn_opcodes_h_l2017_c7_be22_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2017_c7_be22_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2017_c7_be22]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_be22_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_be22_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2017_c7_be22]
signal result_u8_value_MUX_uxn_opcodes_h_l2017_c7_be22_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2017_c7_be22_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2017_c7_be22]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_be22_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_be22_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2017_c7_be22]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_be22_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_be22_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2017_c7_be22]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_be22_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_be22_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2017_c7_be22]
signal tmp16_MUX_uxn_opcodes_h_l2017_c7_be22_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2017_c7_be22_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2020_c11_b26c]
signal BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b26c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b26c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b26c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2020_c7_36e1]
signal t16_MUX_uxn_opcodes_h_l2020_c7_36e1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2020_c7_36e1]
signal n16_MUX_uxn_opcodes_h_l2020_c7_36e1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2020_c7_36e1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_36e1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2020_c7_36e1]
signal result_u8_value_MUX_uxn_opcodes_h_l2020_c7_36e1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2020_c7_36e1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_36e1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2020_c7_36e1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_36e1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2020_c7_36e1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_36e1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2020_c7_36e1]
signal tmp16_MUX_uxn_opcodes_h_l2020_c7_36e1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2025_c11_56c2]
signal BIN_OP_EQ_uxn_opcodes_h_l2025_c11_56c2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2025_c11_56c2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2025_c11_56c2_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2025_c7_a427]
signal t16_MUX_uxn_opcodes_h_l2025_c7_a427_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2025_c7_a427_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2025_c7_a427]
signal n16_MUX_uxn_opcodes_h_l2025_c7_a427_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2025_c7_a427_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2025_c7_a427]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_a427_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_a427_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2025_c7_a427]
signal result_u8_value_MUX_uxn_opcodes_h_l2025_c7_a427_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2025_c7_a427_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2025_c7_a427]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_a427_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_a427_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2025_c7_a427]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_a427_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_a427_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2025_c7_a427]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_a427_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_a427_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2025_c7_a427]
signal tmp16_MUX_uxn_opcodes_h_l2025_c7_a427_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2025_c7_a427_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2026_c3_4ade]
signal BIN_OP_OR_uxn_opcodes_h_l2026_c3_4ade_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2026_c3_4ade_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2026_c3_4ade_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2029_c11_21a5]
signal BIN_OP_EQ_uxn_opcodes_h_l2029_c11_21a5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2029_c11_21a5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2029_c11_21a5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2029_c7_bc9f]
signal n16_MUX_uxn_opcodes_h_l2029_c7_bc9f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2029_c7_bc9f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2029_c7_bc9f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2029_c7_bc9f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bc9f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bc9f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bc9f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2029_c7_bc9f]
signal result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bc9f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bc9f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bc9f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2029_c7_bc9f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bc9f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bc9f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bc9f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2029_c7_bc9f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bc9f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bc9f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bc9f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2029_c7_bc9f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bc9f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bc9f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bc9f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2029_c7_bc9f]
signal tmp16_MUX_uxn_opcodes_h_l2029_c7_bc9f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2029_c7_bc9f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2029_c7_bc9f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2033_c11_3c72]
signal BIN_OP_EQ_uxn_opcodes_h_l2033_c11_3c72_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2033_c11_3c72_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2033_c11_3c72_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2033_c7_d6ab]
signal n16_MUX_uxn_opcodes_h_l2033_c7_d6ab_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2033_c7_d6ab_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2033_c7_d6ab_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2033_c7_d6ab]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d6ab_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d6ab_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d6ab_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2033_c7_d6ab]
signal result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d6ab_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d6ab_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d6ab_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2033_c7_d6ab]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d6ab_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d6ab_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d6ab_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2033_c7_d6ab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d6ab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d6ab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d6ab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2033_c7_d6ab]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d6ab_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d6ab_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d6ab_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2033_c7_d6ab]
signal tmp16_MUX_uxn_opcodes_h_l2033_c7_d6ab_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2033_c7_d6ab_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2033_c7_d6ab_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2034_c3_7638]
signal BIN_OP_OR_uxn_opcodes_h_l2034_c3_7638_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2034_c3_7638_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2034_c3_7638_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2035_c11_29cd]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_29cd_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_29cd_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_29cd_return_output : unsigned(31 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2036_c30_4b2b]
signal sp_relative_shift_uxn_opcodes_h_l2036_c30_4b2b_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2036_c30_4b2b_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2036_c30_4b2b_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2036_c30_4b2b_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2041_c11_2dd8]
signal BIN_OP_EQ_uxn_opcodes_h_l2041_c11_2dd8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2041_c11_2dd8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2041_c11_2dd8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2041_c7_9e61]
signal result_u8_value_MUX_uxn_opcodes_h_l2041_c7_9e61_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2041_c7_9e61_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2041_c7_9e61_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2041_c7_9e61_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2041_c7_9e61]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_9e61_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_9e61_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_9e61_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_9e61_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2041_c7_9e61]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_9e61_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_9e61_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_9e61_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_9e61_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2041_c7_9e61]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_9e61_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_9e61_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_9e61_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_9e61_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2044_c31_4574]
signal CONST_SR_8_uxn_opcodes_h_l2044_c31_4574_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2044_c31_4574_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_127e
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_127e_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_127e_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea( ref_toks_0 : opcode_result_t;
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
      base.is_ram_write := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2004_c6_d83b
BIN_OP_EQ_uxn_opcodes_h_l2004_c6_d83b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2004_c6_d83b_left,
BIN_OP_EQ_uxn_opcodes_h_l2004_c6_d83b_right,
BIN_OP_EQ_uxn_opcodes_h_l2004_c6_d83b_return_output);

-- t16_MUX_uxn_opcodes_h_l2004_c2_e20c
t16_MUX_uxn_opcodes_h_l2004_c2_e20c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2004_c2_e20c_cond,
t16_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue,
t16_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse,
t16_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output);

-- n16_MUX_uxn_opcodes_h_l2004_c2_e20c
n16_MUX_uxn_opcodes_h_l2004_c2_e20c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2004_c2_e20c_cond,
n16_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue,
n16_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse,
n16_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_e20c
result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_e20c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_e20c
result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_e20c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_e20c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_e20c
result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_e20c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_e20c
result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_e20c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_e20c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2004_c2_e20c
result_u8_value_MUX_uxn_opcodes_h_l2004_c2_e20c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2004_c2_e20c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_e20c
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_e20c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_e20c_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_e20c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_e20c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_e20c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_e20c
result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_e20c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_e20c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_e20c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_e20c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_e20c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2004_c2_e20c
tmp16_MUX_uxn_opcodes_h_l2004_c2_e20c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2004_c2_e20c_cond,
tmp16_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue,
tmp16_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse,
tmp16_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2017_c11_067c
BIN_OP_EQ_uxn_opcodes_h_l2017_c11_067c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2017_c11_067c_left,
BIN_OP_EQ_uxn_opcodes_h_l2017_c11_067c_right,
BIN_OP_EQ_uxn_opcodes_h_l2017_c11_067c_return_output);

-- t16_MUX_uxn_opcodes_h_l2017_c7_be22
t16_MUX_uxn_opcodes_h_l2017_c7_be22 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2017_c7_be22_cond,
t16_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue,
t16_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse,
t16_MUX_uxn_opcodes_h_l2017_c7_be22_return_output);

-- n16_MUX_uxn_opcodes_h_l2017_c7_be22
n16_MUX_uxn_opcodes_h_l2017_c7_be22 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2017_c7_be22_cond,
n16_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue,
n16_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse,
n16_MUX_uxn_opcodes_h_l2017_c7_be22_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_be22
result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_be22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_be22_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_be22_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2017_c7_be22
result_u8_value_MUX_uxn_opcodes_h_l2017_c7_be22 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2017_c7_be22_cond,
result_u8_value_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2017_c7_be22_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_be22
result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_be22 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_be22_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_be22_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_be22
result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_be22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_be22_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_be22_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_be22
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_be22 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_be22_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_be22_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2017_c7_be22
tmp16_MUX_uxn_opcodes_h_l2017_c7_be22 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2017_c7_be22_cond,
tmp16_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue,
tmp16_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse,
tmp16_MUX_uxn_opcodes_h_l2017_c7_be22_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b26c
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b26c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b26c_left,
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b26c_right,
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b26c_return_output);

-- t16_MUX_uxn_opcodes_h_l2020_c7_36e1
t16_MUX_uxn_opcodes_h_l2020_c7_36e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2020_c7_36e1_cond,
t16_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue,
t16_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse,
t16_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output);

-- n16_MUX_uxn_opcodes_h_l2020_c7_36e1
n16_MUX_uxn_opcodes_h_l2020_c7_36e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2020_c7_36e1_cond,
n16_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue,
n16_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse,
n16_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_36e1
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_36e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_36e1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2020_c7_36e1
result_u8_value_MUX_uxn_opcodes_h_l2020_c7_36e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2020_c7_36e1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_36e1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_36e1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_36e1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_36e1
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_36e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_36e1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_36e1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_36e1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_36e1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2020_c7_36e1
tmp16_MUX_uxn_opcodes_h_l2020_c7_36e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2020_c7_36e1_cond,
tmp16_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue,
tmp16_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse,
tmp16_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2025_c11_56c2
BIN_OP_EQ_uxn_opcodes_h_l2025_c11_56c2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2025_c11_56c2_left,
BIN_OP_EQ_uxn_opcodes_h_l2025_c11_56c2_right,
BIN_OP_EQ_uxn_opcodes_h_l2025_c11_56c2_return_output);

-- t16_MUX_uxn_opcodes_h_l2025_c7_a427
t16_MUX_uxn_opcodes_h_l2025_c7_a427 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2025_c7_a427_cond,
t16_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue,
t16_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse,
t16_MUX_uxn_opcodes_h_l2025_c7_a427_return_output);

-- n16_MUX_uxn_opcodes_h_l2025_c7_a427
n16_MUX_uxn_opcodes_h_l2025_c7_a427 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2025_c7_a427_cond,
n16_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue,
n16_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse,
n16_MUX_uxn_opcodes_h_l2025_c7_a427_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_a427
result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_a427 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_a427_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_a427_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2025_c7_a427
result_u8_value_MUX_uxn_opcodes_h_l2025_c7_a427 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2025_c7_a427_cond,
result_u8_value_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2025_c7_a427_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_a427
result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_a427 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_a427_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_a427_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_a427
result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_a427 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_a427_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_a427_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_a427
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_a427 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_a427_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_a427_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2025_c7_a427
tmp16_MUX_uxn_opcodes_h_l2025_c7_a427 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2025_c7_a427_cond,
tmp16_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue,
tmp16_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse,
tmp16_MUX_uxn_opcodes_h_l2025_c7_a427_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2026_c3_4ade
BIN_OP_OR_uxn_opcodes_h_l2026_c3_4ade : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2026_c3_4ade_left,
BIN_OP_OR_uxn_opcodes_h_l2026_c3_4ade_right,
BIN_OP_OR_uxn_opcodes_h_l2026_c3_4ade_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2029_c11_21a5
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_21a5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_21a5_left,
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_21a5_right,
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_21a5_return_output);

-- n16_MUX_uxn_opcodes_h_l2029_c7_bc9f
n16_MUX_uxn_opcodes_h_l2029_c7_bc9f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2029_c7_bc9f_cond,
n16_MUX_uxn_opcodes_h_l2029_c7_bc9f_iftrue,
n16_MUX_uxn_opcodes_h_l2029_c7_bc9f_iffalse,
n16_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bc9f
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bc9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bc9f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bc9f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bc9f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bc9f
result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bc9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bc9f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bc9f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bc9f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bc9f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bc9f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bc9f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bc9f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bc9f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bc9f
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bc9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bc9f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bc9f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bc9f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bc9f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bc9f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bc9f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bc9f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bc9f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2029_c7_bc9f
tmp16_MUX_uxn_opcodes_h_l2029_c7_bc9f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2029_c7_bc9f_cond,
tmp16_MUX_uxn_opcodes_h_l2029_c7_bc9f_iftrue,
tmp16_MUX_uxn_opcodes_h_l2029_c7_bc9f_iffalse,
tmp16_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2033_c11_3c72
BIN_OP_EQ_uxn_opcodes_h_l2033_c11_3c72 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2033_c11_3c72_left,
BIN_OP_EQ_uxn_opcodes_h_l2033_c11_3c72_right,
BIN_OP_EQ_uxn_opcodes_h_l2033_c11_3c72_return_output);

-- n16_MUX_uxn_opcodes_h_l2033_c7_d6ab
n16_MUX_uxn_opcodes_h_l2033_c7_d6ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2033_c7_d6ab_cond,
n16_MUX_uxn_opcodes_h_l2033_c7_d6ab_iftrue,
n16_MUX_uxn_opcodes_h_l2033_c7_d6ab_iffalse,
n16_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d6ab
result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d6ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d6ab_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d6ab_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d6ab_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d6ab
result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d6ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d6ab_cond,
result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d6ab_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d6ab_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d6ab
result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d6ab : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d6ab_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d6ab_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d6ab_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d6ab
result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d6ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d6ab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d6ab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d6ab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d6ab
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d6ab : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d6ab_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d6ab_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d6ab_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2033_c7_d6ab
tmp16_MUX_uxn_opcodes_h_l2033_c7_d6ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2033_c7_d6ab_cond,
tmp16_MUX_uxn_opcodes_h_l2033_c7_d6ab_iftrue,
tmp16_MUX_uxn_opcodes_h_l2033_c7_d6ab_iffalse,
tmp16_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2034_c3_7638
BIN_OP_OR_uxn_opcodes_h_l2034_c3_7638 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2034_c3_7638_left,
BIN_OP_OR_uxn_opcodes_h_l2034_c3_7638_right,
BIN_OP_OR_uxn_opcodes_h_l2034_c3_7638_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_29cd
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_29cd : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_29cd_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_29cd_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_29cd_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2036_c30_4b2b
sp_relative_shift_uxn_opcodes_h_l2036_c30_4b2b : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2036_c30_4b2b_ins,
sp_relative_shift_uxn_opcodes_h_l2036_c30_4b2b_x,
sp_relative_shift_uxn_opcodes_h_l2036_c30_4b2b_y,
sp_relative_shift_uxn_opcodes_h_l2036_c30_4b2b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2041_c11_2dd8
BIN_OP_EQ_uxn_opcodes_h_l2041_c11_2dd8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2041_c11_2dd8_left,
BIN_OP_EQ_uxn_opcodes_h_l2041_c11_2dd8_right,
BIN_OP_EQ_uxn_opcodes_h_l2041_c11_2dd8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2041_c7_9e61
result_u8_value_MUX_uxn_opcodes_h_l2041_c7_9e61 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2041_c7_9e61_cond,
result_u8_value_MUX_uxn_opcodes_h_l2041_c7_9e61_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2041_c7_9e61_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2041_c7_9e61_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_9e61
result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_9e61 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_9e61_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_9e61_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_9e61_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_9e61_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_9e61
result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_9e61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_9e61_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_9e61_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_9e61_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_9e61_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_9e61
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_9e61 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_9e61_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_9e61_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_9e61_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_9e61_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2044_c31_4574
CONST_SR_8_uxn_opcodes_h_l2044_c31_4574 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2044_c31_4574_x,
CONST_SR_8_uxn_opcodes_h_l2044_c31_4574_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_127e
CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_127e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_127e_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_127e_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2004_c6_d83b_return_output,
 t16_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output,
 n16_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output,
 tmp16_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2017_c11_067c_return_output,
 t16_MUX_uxn_opcodes_h_l2017_c7_be22_return_output,
 n16_MUX_uxn_opcodes_h_l2017_c7_be22_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_be22_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2017_c7_be22_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_be22_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_be22_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_be22_return_output,
 tmp16_MUX_uxn_opcodes_h_l2017_c7_be22_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b26c_return_output,
 t16_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output,
 n16_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output,
 tmp16_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2025_c11_56c2_return_output,
 t16_MUX_uxn_opcodes_h_l2025_c7_a427_return_output,
 n16_MUX_uxn_opcodes_h_l2025_c7_a427_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_a427_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2025_c7_a427_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_a427_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_a427_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_a427_return_output,
 tmp16_MUX_uxn_opcodes_h_l2025_c7_a427_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2026_c3_4ade_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2029_c11_21a5_return_output,
 n16_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output,
 tmp16_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2033_c11_3c72_return_output,
 n16_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output,
 tmp16_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2034_c3_7638_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_29cd_return_output,
 sp_relative_shift_uxn_opcodes_h_l2036_c30_4b2b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2041_c11_2dd8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2041_c7_9e61_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_9e61_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_9e61_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_9e61_return_output,
 CONST_SR_8_uxn_opcodes_h_l2044_c31_4574_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_127e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_d83b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_d83b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_d83b_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2017_c7_be22_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2004_c2_e20c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2017_c7_be22_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2004_c2_e20c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2004_c2_e20c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_be22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_e20c_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2004_c2_e20c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2004_c2_e20c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_e20c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_be22_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_e20c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2004_c2_e20c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_e20c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2009_c3_2735 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_be22_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_e20c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_be22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_e20c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2014_c3_237a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_be22_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_e20c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_be22_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_e20c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_067c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_067c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_067c_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2017_c7_be22_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2017_c7_be22_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_be22_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_be22_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_be22_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_be22_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2018_c3_b500 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_be22_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_be22_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b26c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b26c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b26c_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2025_c7_a427_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2020_c7_36e1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2025_c7_a427_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2020_c7_36e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_a427_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_36e1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_a427_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_36e1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_a427_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_36e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_a427_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_36e1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2023_c3_15af : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_a427_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_36e1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_a427_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_36e1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_56c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_56c2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_56c2_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2025_c7_a427_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2025_c7_a427_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_a427_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_a427_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_a427_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_a427_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2027_c3_7f6e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_a427_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_a427_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_4ade_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_4ade_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_4ade_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_21a5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_21a5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_21a5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2029_c7_bc9f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2029_c7_bc9f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2029_c7_bc9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bc9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bc9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bc9f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bc9f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bc9f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bc9f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bc9f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bc9f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bc9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bc9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bc9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bc9f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bc9f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bc9f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bc9f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_bc9f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_bc9f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_bc9f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_3c72_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_3c72_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_3c72_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2033_c7_d6ab_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2033_c7_d6ab_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2033_c7_d6ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d6ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d6ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d6ab_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d6ab_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d6ab_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_9e61_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d6ab_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d6ab_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d6ab_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_9e61_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d6ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d6ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d6ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_9e61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d6ab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d6ab_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2038_c3_5737 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d6ab_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_9e61_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d6ab_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_d6ab_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l2035_c3_0003 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_d6ab_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_d6ab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_7638_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_7638_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_7638_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_29cd_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_29cd_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_29cd_return_output : unsigned(31 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_4b2b_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_4b2b_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_4b2b_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_4b2b_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2039_c21_9832_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_2dd8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_2dd8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_2dd8_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_9e61_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_9e61_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_9e61_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_9e61_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2042_c3_d0b8 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_9e61_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_9e61_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_9e61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_9e61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_9e61_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_9e61_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2043_c3_ad8e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_9e61_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_9e61_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2044_c31_4574_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2044_c31_4574_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2044_c21_8c9c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2004_l2041_l2029_l2025_l2020_l2017_DUPLICATE_d8a9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2033_l2029_l2025_l2020_l2017_DUPLICATE_5600_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2041_l2029_l2025_l2020_l2017_DUPLICATE_5dc4_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2041_l2033_l2029_l2025_l2020_l2017_DUPLICATE_4c9e_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2021_l2030_l2034_l2026_DUPLICATE_4d0e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_127e_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_127e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2029_l2041_DUPLICATE_d147_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l2000_l2048_DUPLICATE_719d_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_4b2b_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2027_c3_7f6e := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2027_c3_7f6e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_2dd8_right := to_unsigned(6, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2014_c3_237a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2014_c3_237a;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2009_c3_2735 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2009_c3_2735;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_d83b_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d6ab_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_9e61_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b26c_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_56c2_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_21a5_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2038_c3_5737 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d6ab_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2038_c3_5737;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2042_c3_d0b8 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_9e61_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2042_c3_d0b8;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2023_c3_15af := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2023_c3_15af;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2043_c3_ad8e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_9e61_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2043_c3_ad8e;
     VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_4b2b_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_067c_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2018_c3_b500 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2018_c3_b500;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_3c72_right := to_unsigned(5, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_4b2b_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_7638_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2033_c7_d6ab_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_d83b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_067c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b26c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_56c2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_21a5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_3c72_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_2dd8_left := VAR_phase;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_29cd_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_4ade_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2044_c31_4574_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_bc9f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_d6ab_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2033_l2029_l2025_l2020_l2017_DUPLICATE_5600 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2033_l2029_l2025_l2020_l2017_DUPLICATE_5600_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2017_c11_067c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2017_c11_067c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_067c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2017_c11_067c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_067c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_067c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2017_c11_067c_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2004_c2_e20c] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2004_c2_e20c_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2020_c11_b26c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b26c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b26c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b26c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b26c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b26c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b26c_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2004_c2_e20c] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2004_c2_e20c_return_output := result.is_pc_updated;

     -- sp_relative_shift[uxn_opcodes_h_l2036_c30_4b2b] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2036_c30_4b2b_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_4b2b_ins;
     sp_relative_shift_uxn_opcodes_h_l2036_c30_4b2b_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_4b2b_x;
     sp_relative_shift_uxn_opcodes_h_l2036_c30_4b2b_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_4b2b_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_4b2b_return_output := sp_relative_shift_uxn_opcodes_h_l2036_c30_4b2b_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2021_l2030_l2034_l2026_DUPLICATE_4d0e LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2021_l2030_l2034_l2026_DUPLICATE_4d0e_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2033_c11_3c72] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2033_c11_3c72_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_3c72_left;
     BIN_OP_EQ_uxn_opcodes_h_l2033_c11_3c72_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_3c72_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_3c72_return_output := BIN_OP_EQ_uxn_opcodes_h_l2033_c11_3c72_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2029_l2041_DUPLICATE_d147 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2029_l2041_DUPLICATE_d147_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2041_l2029_l2025_l2020_l2017_DUPLICATE_5dc4 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2041_l2029_l2025_l2020_l2017_DUPLICATE_5dc4_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2004_l2041_l2029_l2025_l2020_l2017_DUPLICATE_d8a9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2004_l2041_l2029_l2025_l2020_l2017_DUPLICATE_d8a9_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2029_c11_21a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2029_c11_21a5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_21a5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2029_c11_21a5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_21a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_21a5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2029_c11_21a5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2041_c11_2dd8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2041_c11_2dd8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_2dd8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2041_c11_2dd8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_2dd8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_2dd8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2041_c11_2dd8_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2004_c2_e20c] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2004_c2_e20c_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2004_c6_d83b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2004_c6_d83b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_d83b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2004_c6_d83b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_d83b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_d83b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2004_c6_d83b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2041_l2033_l2029_l2025_l2020_l2017_DUPLICATE_4c9e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2041_l2033_l2029_l2025_l2020_l2017_DUPLICATE_4c9e_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2025_c11_56c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2025_c11_56c2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_56c2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2025_c11_56c2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_56c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_56c2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2025_c11_56c2_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2044_c31_4574] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2044_c31_4574_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2044_c31_4574_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2044_c31_4574_return_output := CONST_SR_8_uxn_opcodes_h_l2044_c31_4574_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2004_c2_e20c] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2004_c2_e20c_return_output := result.is_stack_index_flipped;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2004_c2_e20c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_d83b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_e20c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_d83b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_e20c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_d83b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_d83b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_e20c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_d83b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_e20c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_d83b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_d83b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_e20c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_d83b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_e20c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_d83b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_e20c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_d83b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2004_c2_e20c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_d83b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_e20c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_d83b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2017_c7_be22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_067c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_be22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_067c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_be22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_067c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_be22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_067c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_be22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_067c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_be22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_067c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2017_c7_be22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_067c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_be22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_067c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2020_c7_36e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b26c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_36e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b26c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_36e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b26c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_36e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b26c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_36e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b26c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_36e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b26c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2020_c7_36e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b26c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_36e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_b26c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2025_c7_a427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_56c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_a427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_56c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_a427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_56c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_a427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_56c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_a427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_56c2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_a427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_56c2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2025_c7_a427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_56c2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_a427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_56c2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2029_c7_bc9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_21a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bc9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_21a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bc9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_21a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bc9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_21a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bc9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_21a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bc9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_21a5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_bc9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_21a5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2033_c7_d6ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_3c72_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d6ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_3c72_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d6ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_3c72_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d6ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_3c72_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d6ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_3c72_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d6ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_3c72_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_d6ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_3c72_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_9e61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_2dd8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_9e61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_2dd8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_9e61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_2dd8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_9e61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_2dd8_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_4ade_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2021_l2030_l2034_l2026_DUPLICATE_4d0e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_7638_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2021_l2030_l2034_l2026_DUPLICATE_4d0e_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_127e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2021_l2030_l2034_l2026_DUPLICATE_4d0e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2041_l2029_l2025_l2020_l2017_DUPLICATE_5dc4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2041_l2029_l2025_l2020_l2017_DUPLICATE_5dc4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2041_l2029_l2025_l2020_l2017_DUPLICATE_5dc4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bc9f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2041_l2029_l2025_l2020_l2017_DUPLICATE_5dc4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_9e61_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2041_l2029_l2025_l2020_l2017_DUPLICATE_5dc4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2041_l2033_l2029_l2025_l2020_l2017_DUPLICATE_4c9e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2041_l2033_l2029_l2025_l2020_l2017_DUPLICATE_4c9e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2041_l2033_l2029_l2025_l2020_l2017_DUPLICATE_4c9e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bc9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2041_l2033_l2029_l2025_l2020_l2017_DUPLICATE_4c9e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d6ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2041_l2033_l2029_l2025_l2020_l2017_DUPLICATE_4c9e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_9e61_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2041_l2033_l2029_l2025_l2020_l2017_DUPLICATE_4c9e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2033_l2029_l2025_l2020_l2017_DUPLICATE_5600_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2033_l2029_l2025_l2020_l2017_DUPLICATE_5600_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2033_l2029_l2025_l2020_l2017_DUPLICATE_5600_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bc9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2033_l2029_l2025_l2020_l2017_DUPLICATE_5600_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d6ab_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2033_l2029_l2025_l2020_l2017_DUPLICATE_5600_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bc9f_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2029_l2041_DUPLICATE_d147_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_9e61_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2029_l2041_DUPLICATE_d147_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2004_l2041_l2029_l2025_l2020_l2017_DUPLICATE_d8a9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2004_l2041_l2029_l2025_l2020_l2017_DUPLICATE_d8a9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2004_l2041_l2029_l2025_l2020_l2017_DUPLICATE_d8a9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2004_l2041_l2029_l2025_l2020_l2017_DUPLICATE_d8a9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bc9f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2004_l2041_l2029_l2025_l2020_l2017_DUPLICATE_d8a9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_9e61_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2004_l2041_l2029_l2025_l2020_l2017_DUPLICATE_d8a9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2004_c2_e20c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2004_c2_e20c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2004_c2_e20c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2004_c2_e20c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d6ab_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_4b2b_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2033_c7_d6ab] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d6ab_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d6ab_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d6ab_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d6ab_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d6ab_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d6ab_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2044_c21_8c9c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2044_c21_8c9c_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2044_c31_4574_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2041_c7_9e61] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_9e61_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_9e61_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_9e61_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_9e61_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_9e61_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_9e61_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_9e61_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_9e61_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2034_c3_7638] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2034_c3_7638_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_7638_left;
     BIN_OP_OR_uxn_opcodes_h_l2034_c3_7638_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_7638_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_7638_return_output := BIN_OP_OR_uxn_opcodes_h_l2034_c3_7638_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2004_c2_e20c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2004_c2_e20c] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2004_c2_e20c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_e20c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_e20c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2041_c7_9e61] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_9e61_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_9e61_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_9e61_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_9e61_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_9e61_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_9e61_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_9e61_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_9e61_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2004_c2_e20c] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_e20c_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_e20c_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_127e LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_127e_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_127e_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_127e_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_127e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2026_c3_4ade] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2026_c3_4ade_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_4ade_left;
     BIN_OP_OR_uxn_opcodes_h_l2026_c3_4ade_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_4ade_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_4ade_return_output := BIN_OP_OR_uxn_opcodes_h_l2026_c3_4ade_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2041_c7_9e61] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_9e61_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_9e61_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_9e61_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_9e61_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_9e61_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_9e61_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_9e61_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_9e61_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_4ade_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_29cd_right := VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_7638_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2033_c7_d6ab_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_7638_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_9e61_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2044_c21_8c9c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2029_c7_bc9f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_127e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2022_l2031_DUPLICATE_127e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d6ab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_9e61_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bc9f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d6ab_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_9e61_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d6ab_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_9e61_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2033_c7_d6ab] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d6ab_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d6ab_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d6ab_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d6ab_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d6ab_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d6ab_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output;

     -- n16_MUX[uxn_opcodes_h_l2033_c7_d6ab] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2033_c7_d6ab_cond <= VAR_n16_MUX_uxn_opcodes_h_l2033_c7_d6ab_cond;
     n16_MUX_uxn_opcodes_h_l2033_c7_d6ab_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2033_c7_d6ab_iftrue;
     n16_MUX_uxn_opcodes_h_l2033_c7_d6ab_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2033_c7_d6ab_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output := n16_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2041_c7_9e61] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2041_c7_9e61_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_9e61_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2041_c7_9e61_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_9e61_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2041_c7_9e61_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_9e61_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_9e61_return_output := result_u8_value_MUX_uxn_opcodes_h_l2041_c7_9e61_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2033_c7_d6ab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d6ab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d6ab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d6ab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d6ab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d6ab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d6ab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2029_c7_bc9f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bc9f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bc9f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bc9f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bc9f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bc9f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bc9f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2033_c7_d6ab] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d6ab_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d6ab_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d6ab_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d6ab_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d6ab_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d6ab_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output;

     -- t16_MUX[uxn_opcodes_h_l2025_c7_a427] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2025_c7_a427_cond <= VAR_t16_MUX_uxn_opcodes_h_l2025_c7_a427_cond;
     t16_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue;
     t16_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2025_c7_a427_return_output := t16_MUX_uxn_opcodes_h_l2025_c7_a427_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2035_c11_29cd] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_29cd_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_29cd_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_29cd_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_29cd_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_29cd_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_29cd_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l2035_c3_0003 := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_29cd_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l2029_c7_bc9f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bc9f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bc9f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bc9f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d6ab_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_9e61_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2025_c7_a427_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_d6ab_iftrue := VAR_tmp16_uxn_opcodes_h_l2035_c3_0003;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2029_c7_bc9f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bc9f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bc9f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bc9f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bc9f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bc9f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bc9f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2039_c21_9832] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2039_c21_9832_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l2035_c3_0003);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2029_c7_bc9f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bc9f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bc9f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bc9f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bc9f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bc9f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bc9f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2033_c7_d6ab] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2033_c7_d6ab_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_d6ab_cond;
     tmp16_MUX_uxn_opcodes_h_l2033_c7_d6ab_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_d6ab_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2033_c7_d6ab_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_d6ab_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output := tmp16_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output;

     -- n16_MUX[uxn_opcodes_h_l2029_c7_bc9f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2029_c7_bc9f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2029_c7_bc9f_cond;
     n16_MUX_uxn_opcodes_h_l2029_c7_bc9f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2029_c7_bc9f_iftrue;
     n16_MUX_uxn_opcodes_h_l2029_c7_bc9f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2029_c7_bc9f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output := n16_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output;

     -- t16_MUX[uxn_opcodes_h_l2020_c7_36e1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2020_c7_36e1_cond <= VAR_t16_MUX_uxn_opcodes_h_l2020_c7_36e1_cond;
     t16_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue;
     t16_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output := t16_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2025_c7_a427] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_a427_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_a427_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_a427_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_a427_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2029_c7_bc9f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bc9f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bc9f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bc9f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bc9f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bc9f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bc9f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d6ab_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2039_c21_9832_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_a427_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_bc9f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2025_c7_a427] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_a427_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_a427_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_a427_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_a427_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2033_c7_d6ab] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d6ab_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d6ab_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d6ab_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d6ab_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d6ab_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d6ab_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output := result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2025_c7_a427] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_a427_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_a427_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_a427_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_a427_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2020_c7_36e1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_36e1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_36e1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2025_c7_a427] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_a427_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_a427_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_a427_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_a427_return_output;

     -- n16_MUX[uxn_opcodes_h_l2025_c7_a427] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2025_c7_a427_cond <= VAR_n16_MUX_uxn_opcodes_h_l2025_c7_a427_cond;
     n16_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue;
     n16_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2025_c7_a427_return_output := n16_MUX_uxn_opcodes_h_l2025_c7_a427_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2029_c7_bc9f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2029_c7_bc9f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_bc9f_cond;
     tmp16_MUX_uxn_opcodes_h_l2029_c7_bc9f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_bc9f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2029_c7_bc9f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_bc9f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output := tmp16_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output;

     -- t16_MUX[uxn_opcodes_h_l2017_c7_be22] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2017_c7_be22_cond <= VAR_t16_MUX_uxn_opcodes_h_l2017_c7_be22_cond;
     t16_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue;
     t16_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2017_c7_be22_return_output := t16_MUX_uxn_opcodes_h_l2017_c7_be22_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2025_c7_a427_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_a427_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_a427_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_a427_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bc9f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d6ab_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2017_c7_be22_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output;
     -- n16_MUX[uxn_opcodes_h_l2020_c7_36e1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2020_c7_36e1_cond <= VAR_n16_MUX_uxn_opcodes_h_l2020_c7_36e1_cond;
     n16_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue;
     n16_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output := n16_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2029_c7_bc9f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bc9f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bc9f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bc9f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bc9f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bc9f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bc9f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output;

     -- t16_MUX[uxn_opcodes_h_l2004_c2_e20c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2004_c2_e20c_cond <= VAR_t16_MUX_uxn_opcodes_h_l2004_c2_e20c_cond;
     t16_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue;
     t16_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output := t16_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2020_c7_36e1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_36e1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_36e1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2020_c7_36e1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_36e1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_36e1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2020_c7_36e1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_36e1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_36e1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2017_c7_be22] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_be22_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_be22_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_be22_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_be22_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2025_c7_a427] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2025_c7_a427_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_a427_cond;
     tmp16_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_a427_return_output := tmp16_MUX_uxn_opcodes_h_l2025_c7_a427_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_be22_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bc9f_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_a427_return_output;
     -- n16_MUX[uxn_opcodes_h_l2017_c7_be22] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2017_c7_be22_cond <= VAR_n16_MUX_uxn_opcodes_h_l2017_c7_be22_cond;
     n16_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue;
     n16_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2017_c7_be22_return_output := n16_MUX_uxn_opcodes_h_l2017_c7_be22_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2020_c7_36e1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2020_c7_36e1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_36e1_cond;
     tmp16_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output := tmp16_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2025_c7_a427] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2025_c7_a427_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_a427_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_a427_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_a427_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_a427_return_output := result_u8_value_MUX_uxn_opcodes_h_l2025_c7_a427_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2017_c7_be22] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_be22_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_be22_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_be22_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_be22_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2017_c7_be22] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_be22_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_be22_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_be22_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_be22_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2017_c7_be22] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_be22_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_be22_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_be22_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_be22_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2004_c2_e20c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_e20c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_e20c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2017_c7_be22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_be22_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_be22_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_be22_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_a427_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2004_c2_e20c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_e20c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_e20c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2004_c2_e20c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_e20c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_e20c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2004_c2_e20c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_e20c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_e20c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2017_c7_be22] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2017_c7_be22_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_be22_cond;
     tmp16_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_be22_return_output := tmp16_MUX_uxn_opcodes_h_l2017_c7_be22_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2020_c7_36e1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2020_c7_36e1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_36e1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_36e1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_36e1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output;

     -- n16_MUX[uxn_opcodes_h_l2004_c2_e20c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2004_c2_e20c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2004_c2_e20c_cond;
     n16_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue;
     n16_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output := n16_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_36e1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_be22_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2004_c2_e20c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2004_c2_e20c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_e20c_cond;
     tmp16_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output := tmp16_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2017_c7_be22] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2017_c7_be22_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_be22_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_be22_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_be22_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_be22_return_output := result_u8_value_MUX_uxn_opcodes_h_l2017_c7_be22_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_be22_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2004_c2_e20c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2004_c2_e20c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_e20c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_e20c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_e20c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l2000_l2048_DUPLICATE_719d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l2000_l2048_DUPLICATE_719d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_e20c_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l2000_l2048_DUPLICATE_719d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l2000_l2048_DUPLICATE_719d_return_output;
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
