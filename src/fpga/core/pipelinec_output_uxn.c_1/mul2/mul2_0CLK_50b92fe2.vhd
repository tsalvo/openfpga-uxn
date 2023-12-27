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
-- BIN_OP_EQ[uxn_opcodes_h_l2004_c6_5f01]
signal BIN_OP_EQ_uxn_opcodes_h_l2004_c6_5f01_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2004_c6_5f01_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2004_c6_5f01_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2004_c2_9ec9]
signal tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2004_c2_9ec9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2004_c2_9ec9]
signal result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2004_c2_9ec9]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2004_c2_9ec9]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2004_c2_9ec9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2004_c2_9ec9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2004_c2_9ec9]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2004_c2_9ec9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2004_c2_9ec9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2004_c2_9ec9]
signal t16_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2004_c2_9ec9]
signal n16_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2017_c11_a114]
signal BIN_OP_EQ_uxn_opcodes_h_l2017_c11_a114_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2017_c11_a114_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2017_c11_a114_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2017_c7_66b7]
signal tmp16_MUX_uxn_opcodes_h_l2017_c7_66b7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2017_c7_66b7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_66b7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2017_c7_66b7]
signal result_u8_value_MUX_uxn_opcodes_h_l2017_c7_66b7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2017_c7_66b7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_66b7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2017_c7_66b7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_66b7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2017_c7_66b7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_66b7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2017_c7_66b7]
signal t16_MUX_uxn_opcodes_h_l2017_c7_66b7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2017_c7_66b7]
signal n16_MUX_uxn_opcodes_h_l2017_c7_66b7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2020_c11_f176]
signal BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f176_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f176_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f176_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2020_c7_42b7]
signal tmp16_MUX_uxn_opcodes_h_l2020_c7_42b7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2020_c7_42b7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_42b7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2020_c7_42b7]
signal result_u8_value_MUX_uxn_opcodes_h_l2020_c7_42b7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2020_c7_42b7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_42b7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2020_c7_42b7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_42b7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2020_c7_42b7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_42b7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2020_c7_42b7]
signal t16_MUX_uxn_opcodes_h_l2020_c7_42b7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2020_c7_42b7]
signal n16_MUX_uxn_opcodes_h_l2020_c7_42b7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2025_c11_6be3]
signal BIN_OP_EQ_uxn_opcodes_h_l2025_c11_6be3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2025_c11_6be3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2025_c11_6be3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2025_c7_7e67]
signal tmp16_MUX_uxn_opcodes_h_l2025_c7_7e67_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2025_c7_7e67]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_7e67_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2025_c7_7e67]
signal result_u8_value_MUX_uxn_opcodes_h_l2025_c7_7e67_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2025_c7_7e67]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_7e67_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2025_c7_7e67]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_7e67_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2025_c7_7e67]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_7e67_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2025_c7_7e67]
signal t16_MUX_uxn_opcodes_h_l2025_c7_7e67_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2025_c7_7e67]
signal n16_MUX_uxn_opcodes_h_l2025_c7_7e67_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2026_c3_649c]
signal BIN_OP_OR_uxn_opcodes_h_l2026_c3_649c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2026_c3_649c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2026_c3_649c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2029_c11_ab52]
signal BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ab52_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ab52_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ab52_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2029_c7_bb52]
signal tmp16_MUX_uxn_opcodes_h_l2029_c7_bb52_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2029_c7_bb52_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2029_c7_bb52_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2029_c7_bb52]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bb52_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bb52_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bb52_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2029_c7_bb52]
signal result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bb52_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bb52_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bb52_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2029_c7_bb52]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bb52_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bb52_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bb52_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2029_c7_bb52]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bb52_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bb52_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bb52_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2029_c7_bb52]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bb52_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bb52_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bb52_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2029_c7_bb52]
signal n16_MUX_uxn_opcodes_h_l2029_c7_bb52_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2029_c7_bb52_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2029_c7_bb52_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2033_c11_0618]
signal BIN_OP_EQ_uxn_opcodes_h_l2033_c11_0618_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2033_c11_0618_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2033_c11_0618_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2033_c7_d447]
signal tmp16_MUX_uxn_opcodes_h_l2033_c7_d447_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2033_c7_d447_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2033_c7_d447_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2033_c7_d447_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2033_c7_d447]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d447_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d447_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d447_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d447_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2033_c7_d447]
signal result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d447_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d447_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d447_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d447_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2033_c7_d447]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d447_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d447_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d447_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d447_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2033_c7_d447]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d447_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d447_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d447_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d447_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2033_c7_d447]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d447_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d447_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d447_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d447_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2033_c7_d447]
signal n16_MUX_uxn_opcodes_h_l2033_c7_d447_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2033_c7_d447_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2033_c7_d447_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2033_c7_d447_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2034_c3_2cd3]
signal BIN_OP_OR_uxn_opcodes_h_l2034_c3_2cd3_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2034_c3_2cd3_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2034_c3_2cd3_return_output : unsigned(15 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2035_c11_a7f4]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_a7f4_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_a7f4_right : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_a7f4_return_output : unsigned(31 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2036_c30_3dc6]
signal sp_relative_shift_uxn_opcodes_h_l2036_c30_3dc6_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2036_c30_3dc6_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2036_c30_3dc6_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2036_c30_3dc6_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2041_c11_97a8]
signal BIN_OP_EQ_uxn_opcodes_h_l2041_c11_97a8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2041_c11_97a8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2041_c11_97a8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2041_c7_7fbc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7fbc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7fbc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7fbc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7fbc_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2041_c7_7fbc]
signal result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7fbc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7fbc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7fbc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7fbc_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2041_c7_7fbc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7fbc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7fbc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7fbc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7fbc_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2041_c7_7fbc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7fbc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7fbc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7fbc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7fbc_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2044_c31_1456]
signal CONST_SR_8_uxn_opcodes_h_l2044_c31_1456_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2044_c31_1456_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2031_l2022_DUPLICATE_b453
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2031_l2022_DUPLICATE_b453_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2031_l2022_DUPLICATE_b453_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_b856( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2004_c6_5f01
BIN_OP_EQ_uxn_opcodes_h_l2004_c6_5f01 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2004_c6_5f01_left,
BIN_OP_EQ_uxn_opcodes_h_l2004_c6_5f01_right,
BIN_OP_EQ_uxn_opcodes_h_l2004_c6_5f01_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec9
tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond,
tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue,
tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse,
tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec9
result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond,
result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9
result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec9
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec9
result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9
result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec9
result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec9
result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output);

-- t16_MUX_uxn_opcodes_h_l2004_c2_9ec9
t16_MUX_uxn_opcodes_h_l2004_c2_9ec9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond,
t16_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue,
t16_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse,
t16_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output);

-- n16_MUX_uxn_opcodes_h_l2004_c2_9ec9
n16_MUX_uxn_opcodes_h_l2004_c2_9ec9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond,
n16_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue,
n16_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse,
n16_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2017_c11_a114
BIN_OP_EQ_uxn_opcodes_h_l2017_c11_a114 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2017_c11_a114_left,
BIN_OP_EQ_uxn_opcodes_h_l2017_c11_a114_right,
BIN_OP_EQ_uxn_opcodes_h_l2017_c11_a114_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2017_c7_66b7
tmp16_MUX_uxn_opcodes_h_l2017_c7_66b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2017_c7_66b7_cond,
tmp16_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue,
tmp16_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse,
tmp16_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_66b7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_66b7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_66b7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2017_c7_66b7
result_u8_value_MUX_uxn_opcodes_h_l2017_c7_66b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2017_c7_66b7_cond,
result_u8_value_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_66b7
result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_66b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_66b7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_66b7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_66b7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_66b7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_66b7
result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_66b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_66b7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output);

-- t16_MUX_uxn_opcodes_h_l2017_c7_66b7
t16_MUX_uxn_opcodes_h_l2017_c7_66b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2017_c7_66b7_cond,
t16_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue,
t16_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse,
t16_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output);

-- n16_MUX_uxn_opcodes_h_l2017_c7_66b7
n16_MUX_uxn_opcodes_h_l2017_c7_66b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2017_c7_66b7_cond,
n16_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue,
n16_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse,
n16_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f176
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f176 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f176_left,
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f176_right,
BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f176_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2020_c7_42b7
tmp16_MUX_uxn_opcodes_h_l2020_c7_42b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2020_c7_42b7_cond,
tmp16_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue,
tmp16_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse,
tmp16_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_42b7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_42b7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_42b7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2020_c7_42b7
result_u8_value_MUX_uxn_opcodes_h_l2020_c7_42b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2020_c7_42b7_cond,
result_u8_value_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_42b7
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_42b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_42b7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_42b7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_42b7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_42b7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_42b7
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_42b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_42b7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output);

-- t16_MUX_uxn_opcodes_h_l2020_c7_42b7
t16_MUX_uxn_opcodes_h_l2020_c7_42b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2020_c7_42b7_cond,
t16_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue,
t16_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse,
t16_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output);

-- n16_MUX_uxn_opcodes_h_l2020_c7_42b7
n16_MUX_uxn_opcodes_h_l2020_c7_42b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2020_c7_42b7_cond,
n16_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue,
n16_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse,
n16_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2025_c11_6be3
BIN_OP_EQ_uxn_opcodes_h_l2025_c11_6be3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2025_c11_6be3_left,
BIN_OP_EQ_uxn_opcodes_h_l2025_c11_6be3_right,
BIN_OP_EQ_uxn_opcodes_h_l2025_c11_6be3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2025_c7_7e67
tmp16_MUX_uxn_opcodes_h_l2025_c7_7e67 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2025_c7_7e67_cond,
tmp16_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue,
tmp16_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse,
tmp16_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_7e67
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_7e67 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_7e67_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2025_c7_7e67
result_u8_value_MUX_uxn_opcodes_h_l2025_c7_7e67 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2025_c7_7e67_cond,
result_u8_value_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_7e67
result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_7e67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_7e67_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_7e67
result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_7e67 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_7e67_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_7e67
result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_7e67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_7e67_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output);

-- t16_MUX_uxn_opcodes_h_l2025_c7_7e67
t16_MUX_uxn_opcodes_h_l2025_c7_7e67 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2025_c7_7e67_cond,
t16_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue,
t16_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse,
t16_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output);

-- n16_MUX_uxn_opcodes_h_l2025_c7_7e67
n16_MUX_uxn_opcodes_h_l2025_c7_7e67 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2025_c7_7e67_cond,
n16_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue,
n16_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse,
n16_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2026_c3_649c
BIN_OP_OR_uxn_opcodes_h_l2026_c3_649c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2026_c3_649c_left,
BIN_OP_OR_uxn_opcodes_h_l2026_c3_649c_right,
BIN_OP_OR_uxn_opcodes_h_l2026_c3_649c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ab52
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ab52 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ab52_left,
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ab52_right,
BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ab52_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2029_c7_bb52
tmp16_MUX_uxn_opcodes_h_l2029_c7_bb52 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2029_c7_bb52_cond,
tmp16_MUX_uxn_opcodes_h_l2029_c7_bb52_iftrue,
tmp16_MUX_uxn_opcodes_h_l2029_c7_bb52_iffalse,
tmp16_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bb52
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bb52 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bb52_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bb52_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bb52_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bb52
result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bb52 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bb52_cond,
result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bb52_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bb52_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bb52
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bb52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bb52_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bb52_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bb52_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bb52
result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bb52 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bb52_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bb52_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bb52_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bb52
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bb52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bb52_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bb52_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bb52_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output);

-- n16_MUX_uxn_opcodes_h_l2029_c7_bb52
n16_MUX_uxn_opcodes_h_l2029_c7_bb52 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2029_c7_bb52_cond,
n16_MUX_uxn_opcodes_h_l2029_c7_bb52_iftrue,
n16_MUX_uxn_opcodes_h_l2029_c7_bb52_iffalse,
n16_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2033_c11_0618
BIN_OP_EQ_uxn_opcodes_h_l2033_c11_0618 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2033_c11_0618_left,
BIN_OP_EQ_uxn_opcodes_h_l2033_c11_0618_right,
BIN_OP_EQ_uxn_opcodes_h_l2033_c11_0618_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2033_c7_d447
tmp16_MUX_uxn_opcodes_h_l2033_c7_d447 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2033_c7_d447_cond,
tmp16_MUX_uxn_opcodes_h_l2033_c7_d447_iftrue,
tmp16_MUX_uxn_opcodes_h_l2033_c7_d447_iffalse,
tmp16_MUX_uxn_opcodes_h_l2033_c7_d447_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d447
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d447 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d447_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d447_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d447_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d447_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d447
result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d447 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d447_cond,
result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d447_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d447_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d447_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d447
result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d447 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d447_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d447_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d447_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d447_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d447
result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d447 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d447_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d447_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d447_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d447_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d447
result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d447 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d447_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d447_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d447_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d447_return_output);

-- n16_MUX_uxn_opcodes_h_l2033_c7_d447
n16_MUX_uxn_opcodes_h_l2033_c7_d447 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2033_c7_d447_cond,
n16_MUX_uxn_opcodes_h_l2033_c7_d447_iftrue,
n16_MUX_uxn_opcodes_h_l2033_c7_d447_iffalse,
n16_MUX_uxn_opcodes_h_l2033_c7_d447_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2034_c3_2cd3
BIN_OP_OR_uxn_opcodes_h_l2034_c3_2cd3 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2034_c3_2cd3_left,
BIN_OP_OR_uxn_opcodes_h_l2034_c3_2cd3_right,
BIN_OP_OR_uxn_opcodes_h_l2034_c3_2cd3_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_a7f4
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_a7f4 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_a7f4_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_a7f4_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_a7f4_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2036_c30_3dc6
sp_relative_shift_uxn_opcodes_h_l2036_c30_3dc6 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2036_c30_3dc6_ins,
sp_relative_shift_uxn_opcodes_h_l2036_c30_3dc6_x,
sp_relative_shift_uxn_opcodes_h_l2036_c30_3dc6_y,
sp_relative_shift_uxn_opcodes_h_l2036_c30_3dc6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2041_c11_97a8
BIN_OP_EQ_uxn_opcodes_h_l2041_c11_97a8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2041_c11_97a8_left,
BIN_OP_EQ_uxn_opcodes_h_l2041_c11_97a8_right,
BIN_OP_EQ_uxn_opcodes_h_l2041_c11_97a8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7fbc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7fbc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7fbc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7fbc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7fbc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7fbc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7fbc
result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7fbc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7fbc_cond,
result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7fbc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7fbc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7fbc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7fbc
result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7fbc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7fbc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7fbc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7fbc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7fbc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7fbc
result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7fbc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7fbc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7fbc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7fbc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7fbc_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2044_c31_1456
CONST_SR_8_uxn_opcodes_h_l2044_c31_1456 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2044_c31_1456_x,
CONST_SR_8_uxn_opcodes_h_l2044_c31_1456_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2031_l2022_DUPLICATE_b453
CONST_SL_8_uint16_t_uxn_opcodes_h_l2031_l2022_DUPLICATE_b453 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2031_l2022_DUPLICATE_b453_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2031_l2022_DUPLICATE_b453_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2004_c6_5f01_return_output,
 tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output,
 t16_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output,
 n16_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2017_c11_a114_return_output,
 tmp16_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output,
 t16_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output,
 n16_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f176_return_output,
 tmp16_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output,
 t16_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output,
 n16_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2025_c11_6be3_return_output,
 tmp16_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output,
 t16_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output,
 n16_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2026_c3_649c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ab52_return_output,
 tmp16_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output,
 n16_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2033_c11_0618_return_output,
 tmp16_MUX_uxn_opcodes_h_l2033_c7_d447_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d447_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d447_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d447_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d447_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d447_return_output,
 n16_MUX_uxn_opcodes_h_l2033_c7_d447_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2034_c3_2cd3_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_a7f4_return_output,
 sp_relative_shift_uxn_opcodes_h_l2036_c30_3dc6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2041_c11_97a8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7fbc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7fbc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7fbc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7fbc_return_output,
 CONST_SR_8_uxn_opcodes_h_l2044_c31_1456_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2031_l2022_DUPLICATE_b453_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_5f01_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_5f01_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_5f01_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2014_c3_3d24 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2004_c2_9ec9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2004_c2_9ec9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2009_c3_9a12 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2004_c2_9ec9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2004_c2_9ec9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_a114_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_a114_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_a114_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_66b7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2018_c3_ff3f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_66b7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_66b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_66b7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_66b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_66b7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2017_c7_66b7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2017_c7_66b7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f176_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f176_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f176_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_42b7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2023_c3_20ab : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_42b7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_42b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_42b7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_42b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_42b7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2020_c7_42b7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2020_c7_42b7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_6be3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_6be3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_6be3_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_7e67_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2027_c3_2630 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_7e67_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_7e67_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_7e67_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_7e67_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_7e67_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2025_c7_7e67_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2025_c7_7e67_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_649c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_649c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_649c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ab52_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ab52_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ab52_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_bb52_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_bb52_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_d447_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_bb52_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bb52_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bb52_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d447_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bb52_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bb52_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bb52_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d447_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bb52_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bb52_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bb52_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d447_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bb52_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bb52_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bb52_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d447_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bb52_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bb52_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bb52_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d447_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bb52_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2029_c7_bb52_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2029_c7_bb52_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2033_c7_d447_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2029_c7_bb52_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_0618_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_0618_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_0618_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_d447_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l2035_c3_5fe4 : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_d447_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_d447_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d447_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2038_c3_8130 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d447_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7fbc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d447_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d447_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d447_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7fbc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d447_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d447_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d447_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d447_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d447_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d447_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7fbc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d447_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d447_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d447_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7fbc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d447_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2033_c7_d447_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2033_c7_d447_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2033_c7_d447_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_2cd3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_2cd3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_2cd3_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_a7f4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_a7f4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_a7f4_return_output : unsigned(31 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_3dc6_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_3dc6_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_3dc6_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_3dc6_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2039_c21_4b97_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_97a8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_97a8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_97a8_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7fbc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2043_c3_a508 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7fbc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7fbc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7fbc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7fbc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7fbc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7fbc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2042_c3_0b04 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7fbc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7fbc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7fbc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7fbc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7fbc_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2044_c31_1456_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2044_c31_1456_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2044_c21_e0c9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2004_l2041_l2029_l2025_l2020_l2017_DUPLICATE_bb9a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2033_l2029_l2025_l2020_l2017_DUPLICATE_804e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2041_l2029_l2025_l2020_l2017_DUPLICATE_f6b2_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2041_l2033_l2029_l2025_l2020_l2017_DUPLICATE_9fa0_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2026_l2030_l2021_l2034_DUPLICATE_5304_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2031_l2022_DUPLICATE_b453_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2031_l2022_DUPLICATE_b453_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2029_l2041_DUPLICATE_283f_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l2048_l2000_DUPLICATE_eb57_return_output : opcode_result_t;
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
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_6be3_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2027_c3_2630 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2027_c3_2630;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2042_c3_0b04 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7fbc_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2042_c3_0b04;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2018_c3_ff3f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2018_c3_ff3f;
     VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_3dc6_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_a114_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d447_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_5f01_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_3dc6_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2014_c3_3d24 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2014_c3_3d24;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2023_c3_20ab := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2023_c3_20ab;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_0618_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2038_c3_8130 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d447_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2038_c3_8130;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_97a8_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7fbc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f176_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ab52_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2043_c3_a508 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7fbc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2043_c3_a508;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2009_c3_9a12 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2009_c3_9a12;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_3dc6_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_2cd3_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2033_c7_d447_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_5f01_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_a114_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f176_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_6be3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ab52_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_0618_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_97a8_left := VAR_phase;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_a7f4_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_649c_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2044_c31_1456_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_bb52_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_d447_iffalse := tmp16;
     -- sp_relative_shift[uxn_opcodes_h_l2036_c30_3dc6] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2036_c30_3dc6_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_3dc6_ins;
     sp_relative_shift_uxn_opcodes_h_l2036_c30_3dc6_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_3dc6_x;
     sp_relative_shift_uxn_opcodes_h_l2036_c30_3dc6_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_3dc6_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_3dc6_return_output := sp_relative_shift_uxn_opcodes_h_l2036_c30_3dc6_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2004_c2_9ec9] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2004_c2_9ec9_return_output := result.is_stack_index_flipped;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2026_l2030_l2021_l2034_DUPLICATE_5304 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2026_l2030_l2021_l2034_DUPLICATE_5304_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_SR_8[uxn_opcodes_h_l2044_c31_1456] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2044_c31_1456_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2044_c31_1456_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2044_c31_1456_return_output := CONST_SR_8_uxn_opcodes_h_l2044_c31_1456_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2017_c11_a114] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2017_c11_a114_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_a114_left;
     BIN_OP_EQ_uxn_opcodes_h_l2017_c11_a114_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_a114_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_a114_return_output := BIN_OP_EQ_uxn_opcodes_h_l2017_c11_a114_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2004_c2_9ec9] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2004_c2_9ec9_return_output := result.is_ram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2041_l2029_l2025_l2020_l2017_DUPLICATE_f6b2 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2041_l2029_l2025_l2020_l2017_DUPLICATE_f6b2_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2033_c11_0618] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2033_c11_0618_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_0618_left;
     BIN_OP_EQ_uxn_opcodes_h_l2033_c11_0618_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_0618_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_0618_return_output := BIN_OP_EQ_uxn_opcodes_h_l2033_c11_0618_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2041_l2033_l2029_l2025_l2020_l2017_DUPLICATE_9fa0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2041_l2033_l2029_l2025_l2020_l2017_DUPLICATE_9fa0_return_output := result.is_opc_done;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2004_c2_9ec9] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2004_c2_9ec9_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2004_c6_5f01] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2004_c6_5f01_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_5f01_left;
     BIN_OP_EQ_uxn_opcodes_h_l2004_c6_5f01_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_5f01_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_5f01_return_output := BIN_OP_EQ_uxn_opcodes_h_l2004_c6_5f01_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2020_c11_f176] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f176_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f176_left;
     BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f176_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f176_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f176_return_output := BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f176_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2004_l2041_l2029_l2025_l2020_l2017_DUPLICATE_bb9a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2004_l2041_l2029_l2025_l2020_l2017_DUPLICATE_bb9a_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2025_c11_6be3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2025_c11_6be3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_6be3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2025_c11_6be3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_6be3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_6be3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2025_c11_6be3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2029_c11_ab52] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ab52_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ab52_left;
     BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ab52_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ab52_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ab52_return_output := BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ab52_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2004_c2_9ec9] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2004_c2_9ec9_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2041_c11_97a8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2041_c11_97a8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_97a8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2041_c11_97a8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_97a8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_97a8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2041_c11_97a8_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2029_l2041_DUPLICATE_283f LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2029_l2041_DUPLICATE_283f_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2033_l2029_l2025_l2020_l2017_DUPLICATE_804e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2033_l2029_l2025_l2020_l2017_DUPLICATE_804e_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_5f01_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_5f01_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_5f01_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_5f01_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_5f01_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_5f01_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_5f01_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_5f01_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_5f01_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_5f01_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_5f01_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2004_c6_5f01_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2017_c7_66b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_a114_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_66b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_a114_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_66b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_a114_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_66b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_a114_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_66b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_a114_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_66b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_a114_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2017_c7_66b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_a114_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_66b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2017_c11_a114_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2020_c7_42b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f176_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_42b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f176_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_42b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f176_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_42b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f176_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_42b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f176_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_42b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f176_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2020_c7_42b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f176_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_42b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2020_c11_f176_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2025_c7_7e67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_6be3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_7e67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_6be3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_7e67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_6be3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_7e67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_6be3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_7e67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_6be3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_7e67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_6be3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2025_c7_7e67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_6be3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_7e67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2025_c11_6be3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2029_c7_bb52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ab52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bb52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ab52_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bb52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ab52_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bb52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ab52_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bb52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ab52_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bb52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ab52_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_bb52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2029_c11_ab52_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2033_c7_d447_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_0618_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d447_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_0618_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d447_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_0618_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d447_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_0618_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d447_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_0618_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d447_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_0618_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_d447_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2033_c11_0618_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7fbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_97a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7fbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_97a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7fbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_97a8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7fbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2041_c11_97a8_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_649c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2026_l2030_l2021_l2034_DUPLICATE_5304_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_2cd3_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2026_l2030_l2021_l2034_DUPLICATE_5304_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2031_l2022_DUPLICATE_b453_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2026_l2030_l2021_l2034_DUPLICATE_5304_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2041_l2029_l2025_l2020_l2017_DUPLICATE_f6b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2041_l2029_l2025_l2020_l2017_DUPLICATE_f6b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2041_l2029_l2025_l2020_l2017_DUPLICATE_f6b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bb52_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2041_l2029_l2025_l2020_l2017_DUPLICATE_f6b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7fbc_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2041_l2029_l2025_l2020_l2017_DUPLICATE_f6b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2041_l2033_l2029_l2025_l2020_l2017_DUPLICATE_9fa0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2041_l2033_l2029_l2025_l2020_l2017_DUPLICATE_9fa0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2041_l2033_l2029_l2025_l2020_l2017_DUPLICATE_9fa0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bb52_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2041_l2033_l2029_l2025_l2020_l2017_DUPLICATE_9fa0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d447_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2041_l2033_l2029_l2025_l2020_l2017_DUPLICATE_9fa0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7fbc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2041_l2033_l2029_l2025_l2020_l2017_DUPLICATE_9fa0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2033_l2029_l2025_l2020_l2017_DUPLICATE_804e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2033_l2029_l2025_l2020_l2017_DUPLICATE_804e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2033_l2029_l2025_l2020_l2017_DUPLICATE_804e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bb52_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2033_l2029_l2025_l2020_l2017_DUPLICATE_804e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d447_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2033_l2029_l2025_l2020_l2017_DUPLICATE_804e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bb52_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2029_l2041_DUPLICATE_283f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7fbc_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2029_l2041_DUPLICATE_283f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2004_l2041_l2029_l2025_l2020_l2017_DUPLICATE_bb9a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2004_l2041_l2029_l2025_l2020_l2017_DUPLICATE_bb9a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2004_l2041_l2029_l2025_l2020_l2017_DUPLICATE_bb9a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2004_l2041_l2029_l2025_l2020_l2017_DUPLICATE_bb9a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bb52_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2004_l2041_l2029_l2025_l2020_l2017_DUPLICATE_bb9a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7fbc_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2004_l2041_l2029_l2025_l2020_l2017_DUPLICATE_bb9a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2004_c2_9ec9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2004_c2_9ec9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2004_c2_9ec9_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2004_c2_9ec9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d447_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2036_c30_3dc6_return_output;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2031_l2022_DUPLICATE_b453 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2031_l2022_DUPLICATE_b453_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2031_l2022_DUPLICATE_b453_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2031_l2022_DUPLICATE_b453_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2031_l2022_DUPLICATE_b453_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2004_c2_9ec9] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2034_c3_2cd3] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2034_c3_2cd3_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_2cd3_left;
     BIN_OP_OR_uxn_opcodes_h_l2034_c3_2cd3_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_2cd3_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_2cd3_return_output := BIN_OP_OR_uxn_opcodes_h_l2034_c3_2cd3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2033_c7_d447] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d447_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d447_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d447_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d447_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d447_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d447_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d447_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d447_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2041_c7_7fbc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7fbc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7fbc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7fbc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7fbc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7fbc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7fbc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7fbc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7fbc_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2026_c3_649c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2026_c3_649c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_649c_left;
     BIN_OP_OR_uxn_opcodes_h_l2026_c3_649c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_649c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_649c_return_output := BIN_OP_OR_uxn_opcodes_h_l2026_c3_649c_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2044_c21_e0c9] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2044_c21_e0c9_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2044_c31_1456_return_output);

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2004_c2_9ec9] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2041_c7_7fbc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7fbc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7fbc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7fbc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7fbc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7fbc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7fbc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7fbc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7fbc_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2004_c2_9ec9] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2041_c7_7fbc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7fbc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7fbc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7fbc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7fbc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7fbc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7fbc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7fbc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7fbc_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2004_c2_9ec9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2026_c3_649c_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_a7f4_right := VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_2cd3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2033_c7_d447_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2034_c3_2cd3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7fbc_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2044_c21_e0c9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2029_c7_bb52_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2031_l2022_DUPLICATE_b453_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2031_l2022_DUPLICATE_b453_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d447_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2041_c7_7fbc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bb52_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2033_c7_d447_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d447_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2041_c7_7fbc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d447_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2041_c7_7fbc_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2033_c7_d447] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d447_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d447_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d447_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d447_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d447_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d447_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d447_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d447_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2033_c7_d447] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d447_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d447_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d447_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d447_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d447_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d447_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d447_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d447_return_output;

     -- t16_MUX[uxn_opcodes_h_l2025_c7_7e67] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2025_c7_7e67_cond <= VAR_t16_MUX_uxn_opcodes_h_l2025_c7_7e67_cond;
     t16_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue;
     t16_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output := t16_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2033_c7_d447] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d447_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d447_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d447_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d447_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d447_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d447_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d447_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d447_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2041_c7_7fbc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7fbc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7fbc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7fbc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7fbc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7fbc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7fbc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7fbc_return_output := result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7fbc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2029_c7_bb52] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bb52_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bb52_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bb52_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bb52_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bb52_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bb52_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2035_c11_a7f4] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_a7f4_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_a7f4_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_a7f4_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_a7f4_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_a7f4_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_a7f4_return_output;

     -- n16_MUX[uxn_opcodes_h_l2033_c7_d447] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2033_c7_d447_cond <= VAR_n16_MUX_uxn_opcodes_h_l2033_c7_d447_cond;
     n16_MUX_uxn_opcodes_h_l2033_c7_d447_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2033_c7_d447_iftrue;
     n16_MUX_uxn_opcodes_h_l2033_c7_d447_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2033_c7_d447_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2033_c7_d447_return_output := n16_MUX_uxn_opcodes_h_l2033_c7_d447_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l2035_c3_5fe4 := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2035_c11_a7f4_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l2029_c7_bb52_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2033_c7_d447_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bb52_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2033_c7_d447_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bb52_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2033_c7_d447_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bb52_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2033_c7_d447_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d447_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2041_c7_7fbc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_d447_iftrue := VAR_tmp16_uxn_opcodes_h_l2035_c3_5fe4;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2029_c7_bb52] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bb52_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bb52_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bb52_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bb52_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bb52_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bb52_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output;

     -- n16_MUX[uxn_opcodes_h_l2029_c7_bb52] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2029_c7_bb52_cond <= VAR_n16_MUX_uxn_opcodes_h_l2029_c7_bb52_cond;
     n16_MUX_uxn_opcodes_h_l2029_c7_bb52_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2029_c7_bb52_iftrue;
     n16_MUX_uxn_opcodes_h_l2029_c7_bb52_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2029_c7_bb52_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output := n16_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2039_c21_4b97] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2039_c21_4b97_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l2035_c3_5fe4);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2029_c7_bb52] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bb52_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bb52_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bb52_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bb52_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bb52_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bb52_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output;

     -- t16_MUX[uxn_opcodes_h_l2020_c7_42b7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2020_c7_42b7_cond <= VAR_t16_MUX_uxn_opcodes_h_l2020_c7_42b7_cond;
     t16_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue;
     t16_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output := t16_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2025_c7_7e67] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_7e67_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_7e67_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2029_c7_bb52] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bb52_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bb52_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bb52_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bb52_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bb52_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bb52_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2033_c7_d447] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2033_c7_d447_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_d447_cond;
     tmp16_MUX_uxn_opcodes_h_l2033_c7_d447_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_d447_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2033_c7_d447_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_d447_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_d447_return_output := tmp16_MUX_uxn_opcodes_h_l2033_c7_d447_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d447_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2039_c21_4b97_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_bb52_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2033_c7_d447_return_output;
     -- t16_MUX[uxn_opcodes_h_l2017_c7_66b7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2017_c7_66b7_cond <= VAR_t16_MUX_uxn_opcodes_h_l2017_c7_66b7_cond;
     t16_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue;
     t16_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output := t16_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2025_c7_7e67] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_7e67_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_7e67_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2029_c7_bb52] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2029_c7_bb52_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_bb52_cond;
     tmp16_MUX_uxn_opcodes_h_l2029_c7_bb52_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_bb52_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2029_c7_bb52_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_bb52_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output := tmp16_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2033_c7_d447] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d447_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d447_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d447_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d447_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d447_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d447_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d447_return_output := result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d447_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2020_c7_42b7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_42b7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_42b7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2025_c7_7e67] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_7e67_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_7e67_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2025_c7_7e67] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_7e67_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_7e67_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output;

     -- n16_MUX[uxn_opcodes_h_l2025_c7_7e67] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2025_c7_7e67_cond <= VAR_n16_MUX_uxn_opcodes_h_l2025_c7_7e67_cond;
     n16_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue;
     n16_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output := n16_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bb52_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2033_c7_d447_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2025_c7_7e67] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2025_c7_7e67_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_7e67_cond;
     tmp16_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output := tmp16_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2020_c7_42b7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_42b7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_42b7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2020_c7_42b7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_42b7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_42b7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2020_c7_42b7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_42b7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_42b7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2017_c7_66b7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_66b7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_66b7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output;

     -- t16_MUX[uxn_opcodes_h_l2004_c2_9ec9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond <= VAR_t16_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond;
     t16_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue;
     t16_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output := t16_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2029_c7_bb52] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bb52_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bb52_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bb52_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bb52_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bb52_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bb52_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output := result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output;

     -- n16_MUX[uxn_opcodes_h_l2020_c7_42b7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2020_c7_42b7_cond <= VAR_n16_MUX_uxn_opcodes_h_l2020_c7_42b7_cond;
     n16_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue;
     n16_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output := n16_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2029_c7_bb52_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2025_c7_7e67] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2025_c7_7e67_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_7e67_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_7e67_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_7e67_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output := result_u8_value_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2004_c2_9ec9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2017_c7_66b7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_66b7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_66b7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2020_c7_42b7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2020_c7_42b7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_42b7_cond;
     tmp16_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output := tmp16_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2017_c7_66b7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_66b7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_66b7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2017_c7_66b7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_66b7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_66b7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output;

     -- n16_MUX[uxn_opcodes_h_l2017_c7_66b7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2017_c7_66b7_cond <= VAR_n16_MUX_uxn_opcodes_h_l2017_c7_66b7_cond;
     n16_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue;
     n16_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output := n16_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2025_c7_7e67_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output;
     -- n16_MUX[uxn_opcodes_h_l2004_c2_9ec9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond <= VAR_n16_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond;
     n16_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue;
     n16_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output := n16_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2004_c2_9ec9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2004_c2_9ec9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2017_c7_66b7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2017_c7_66b7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_66b7_cond;
     tmp16_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output := tmp16_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2020_c7_42b7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2020_c7_42b7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_42b7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_42b7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_42b7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output := result_u8_value_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2004_c2_9ec9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2020_c7_42b7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2004_c2_9ec9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond;
     tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output := tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2017_c7_66b7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2017_c7_66b7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_66b7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_66b7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_66b7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output := result_u8_value_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2017_c7_66b7_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2004_c2_9ec9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output := result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l2048_l2000_DUPLICATE_eb57 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l2048_l2000_DUPLICATE_eb57_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b856(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2004_c2_9ec9_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l2048_l2000_DUPLICATE_eb57_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l2048_l2000_DUPLICATE_eb57_return_output;
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
