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
entity eor2_0CLK_50b92fe2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end eor2_0CLK_50b92fe2;
architecture arch of eor2_0CLK_50b92fe2 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1111_c6_5add]
signal BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5add_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5add_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5add_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1111_c2_e4b5]
signal result_u8_value_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1111_c2_e4b5]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1111_c2_e4b5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output : unsigned(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1111_c2_e4b5]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1111_c2_e4b5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1111_c2_e4b5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1111_c2_e4b5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1111_c2_e4b5]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1111_c2_e4b5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1111_c2_e4b5]
signal n16_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1111_c2_e4b5]
signal tmp16_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1111_c2_e4b5]
signal t16_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1124_c11_ba84]
signal BIN_OP_EQ_uxn_opcodes_h_l1124_c11_ba84_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1124_c11_ba84_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1124_c11_ba84_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1124_c7_cfa9]
signal result_u8_value_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1124_c7_cfa9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1124_c7_cfa9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1124_c7_cfa9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1124_c7_cfa9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1124_c7_cfa9]
signal n16_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1124_c7_cfa9]
signal tmp16_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1124_c7_cfa9]
signal t16_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1127_c11_f9c2]
signal BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f9c2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f9c2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f9c2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1127_c7_e932]
signal result_u8_value_MUX_uxn_opcodes_h_l1127_c7_e932_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1127_c7_e932_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1127_c7_e932]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_e932_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_e932_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1127_c7_e932]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_e932_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_e932_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1127_c7_e932]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_e932_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_e932_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1127_c7_e932]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_e932_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_e932_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1127_c7_e932]
signal n16_MUX_uxn_opcodes_h_l1127_c7_e932_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1127_c7_e932_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1127_c7_e932]
signal tmp16_MUX_uxn_opcodes_h_l1127_c7_e932_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1127_c7_e932_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1127_c7_e932]
signal t16_MUX_uxn_opcodes_h_l1127_c7_e932_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1127_c7_e932_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1132_c11_5385]
signal BIN_OP_EQ_uxn_opcodes_h_l1132_c11_5385_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1132_c11_5385_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1132_c11_5385_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1132_c7_9333]
signal result_u8_value_MUX_uxn_opcodes_h_l1132_c7_9333_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1132_c7_9333_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1132_c7_9333]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_9333_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_9333_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1132_c7_9333]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_9333_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_9333_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1132_c7_9333]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_9333_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_9333_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1132_c7_9333]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_9333_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_9333_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1132_c7_9333]
signal n16_MUX_uxn_opcodes_h_l1132_c7_9333_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1132_c7_9333_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1132_c7_9333]
signal tmp16_MUX_uxn_opcodes_h_l1132_c7_9333_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1132_c7_9333_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1132_c7_9333]
signal t16_MUX_uxn_opcodes_h_l1132_c7_9333_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1132_c7_9333_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1133_c3_390b]
signal BIN_OP_OR_uxn_opcodes_h_l1133_c3_390b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1133_c3_390b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1133_c3_390b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1136_c11_1efc]
signal BIN_OP_EQ_uxn_opcodes_h_l1136_c11_1efc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1136_c11_1efc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1136_c11_1efc_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1136_c7_4aed]
signal result_u8_value_MUX_uxn_opcodes_h_l1136_c7_4aed_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1136_c7_4aed_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1136_c7_4aed_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1136_c7_4aed]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_4aed_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_4aed_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_4aed_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1136_c7_4aed]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_4aed_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_4aed_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_4aed_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1136_c7_4aed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_4aed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_4aed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_4aed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1136_c7_4aed]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_4aed_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_4aed_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_4aed_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1136_c7_4aed]
signal n16_MUX_uxn_opcodes_h_l1136_c7_4aed_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1136_c7_4aed_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1136_c7_4aed_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1136_c7_4aed]
signal tmp16_MUX_uxn_opcodes_h_l1136_c7_4aed_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1136_c7_4aed_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1136_c7_4aed_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1140_c11_4521]
signal BIN_OP_EQ_uxn_opcodes_h_l1140_c11_4521_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1140_c11_4521_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1140_c11_4521_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1140_c7_90d6]
signal result_u8_value_MUX_uxn_opcodes_h_l1140_c7_90d6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1140_c7_90d6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1140_c7_90d6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1140_c7_90d6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_90d6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_90d6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_90d6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1140_c7_90d6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_90d6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_90d6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_90d6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1140_c7_90d6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_90d6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_90d6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_90d6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1140_c7_90d6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_90d6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_90d6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_90d6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1140_c7_90d6]
signal n16_MUX_uxn_opcodes_h_l1140_c7_90d6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1140_c7_90d6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1140_c7_90d6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1140_c7_90d6]
signal tmp16_MUX_uxn_opcodes_h_l1140_c7_90d6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1140_c7_90d6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1140_c7_90d6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1141_c3_526a]
signal BIN_OP_OR_uxn_opcodes_h_l1141_c3_526a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1141_c3_526a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1141_c3_526a_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l1142_c11_3ee0]
signal BIN_OP_XOR_uxn_opcodes_h_l1142_c11_3ee0_left : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1142_c11_3ee0_right : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1142_c11_3ee0_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1143_c30_4385]
signal sp_relative_shift_uxn_opcodes_h_l1143_c30_4385_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1143_c30_4385_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1143_c30_4385_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1143_c30_4385_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1148_c11_5bb8]
signal BIN_OP_EQ_uxn_opcodes_h_l1148_c11_5bb8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1148_c11_5bb8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1148_c11_5bb8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1148_c7_2e37]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_2e37_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_2e37_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_2e37_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_2e37_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1148_c7_2e37]
signal result_u8_value_MUX_uxn_opcodes_h_l1148_c7_2e37_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1148_c7_2e37_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1148_c7_2e37_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1148_c7_2e37_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1148_c7_2e37]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_2e37_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_2e37_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_2e37_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_2e37_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1148_c7_2e37]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_2e37_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_2e37_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_2e37_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_2e37_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1151_c31_f107]
signal CONST_SR_8_uxn_opcodes_h_l1151_c31_f107_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1151_c31_f107_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_99a8
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_99a8_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_99a8_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_922a( ref_toks_0 : opcode_result_t;
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
      base.u8_value := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_pc_updated := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.is_stack_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5add
BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5add : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5add_left,
BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5add_right,
BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5add_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1111_c2_e4b5
result_u8_value_MUX_uxn_opcodes_h_l1111_c2_e4b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_e4b5
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_e4b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_e4b5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_e4b5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5
result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_e4b5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_e4b5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_e4b5
result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_e4b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_e4b5
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_e4b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5
result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_e4b5
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_e4b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output);

-- n16_MUX_uxn_opcodes_h_l1111_c2_e4b5
n16_MUX_uxn_opcodes_h_l1111_c2_e4b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond,
n16_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue,
n16_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse,
n16_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1111_c2_e4b5
tmp16_MUX_uxn_opcodes_h_l1111_c2_e4b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond,
tmp16_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue,
tmp16_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse,
tmp16_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output);

-- t16_MUX_uxn_opcodes_h_l1111_c2_e4b5
t16_MUX_uxn_opcodes_h_l1111_c2_e4b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond,
t16_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue,
t16_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse,
t16_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1124_c11_ba84
BIN_OP_EQ_uxn_opcodes_h_l1124_c11_ba84 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1124_c11_ba84_left,
BIN_OP_EQ_uxn_opcodes_h_l1124_c11_ba84_right,
BIN_OP_EQ_uxn_opcodes_h_l1124_c11_ba84_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1124_c7_cfa9
result_u8_value_MUX_uxn_opcodes_h_l1124_c7_cfa9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond,
result_u8_value_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_cfa9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_cfa9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_cfa9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_cfa9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_cfa9
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_cfa9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_cfa9
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_cfa9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output);

-- n16_MUX_uxn_opcodes_h_l1124_c7_cfa9
n16_MUX_uxn_opcodes_h_l1124_c7_cfa9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond,
n16_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue,
n16_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse,
n16_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1124_c7_cfa9
tmp16_MUX_uxn_opcodes_h_l1124_c7_cfa9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond,
tmp16_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue,
tmp16_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse,
tmp16_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output);

-- t16_MUX_uxn_opcodes_h_l1124_c7_cfa9
t16_MUX_uxn_opcodes_h_l1124_c7_cfa9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond,
t16_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue,
t16_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse,
t16_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f9c2
BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f9c2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f9c2_left,
BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f9c2_right,
BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f9c2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1127_c7_e932
result_u8_value_MUX_uxn_opcodes_h_l1127_c7_e932 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1127_c7_e932_cond,
result_u8_value_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1127_c7_e932_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_e932
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_e932 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_e932_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_e932_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_e932
result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_e932 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_e932_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_e932_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_e932
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_e932 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_e932_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_e932_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_e932
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_e932 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_e932_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_e932_return_output);

-- n16_MUX_uxn_opcodes_h_l1127_c7_e932
n16_MUX_uxn_opcodes_h_l1127_c7_e932 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1127_c7_e932_cond,
n16_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue,
n16_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse,
n16_MUX_uxn_opcodes_h_l1127_c7_e932_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1127_c7_e932
tmp16_MUX_uxn_opcodes_h_l1127_c7_e932 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1127_c7_e932_cond,
tmp16_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue,
tmp16_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse,
tmp16_MUX_uxn_opcodes_h_l1127_c7_e932_return_output);

-- t16_MUX_uxn_opcodes_h_l1127_c7_e932
t16_MUX_uxn_opcodes_h_l1127_c7_e932 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1127_c7_e932_cond,
t16_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue,
t16_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse,
t16_MUX_uxn_opcodes_h_l1127_c7_e932_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1132_c11_5385
BIN_OP_EQ_uxn_opcodes_h_l1132_c11_5385 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1132_c11_5385_left,
BIN_OP_EQ_uxn_opcodes_h_l1132_c11_5385_right,
BIN_OP_EQ_uxn_opcodes_h_l1132_c11_5385_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1132_c7_9333
result_u8_value_MUX_uxn_opcodes_h_l1132_c7_9333 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1132_c7_9333_cond,
result_u8_value_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1132_c7_9333_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_9333
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_9333 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_9333_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_9333_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_9333
result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_9333 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_9333_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_9333_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_9333
result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_9333 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_9333_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_9333_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_9333
result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_9333 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_9333_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_9333_return_output);

-- n16_MUX_uxn_opcodes_h_l1132_c7_9333
n16_MUX_uxn_opcodes_h_l1132_c7_9333 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1132_c7_9333_cond,
n16_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue,
n16_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse,
n16_MUX_uxn_opcodes_h_l1132_c7_9333_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1132_c7_9333
tmp16_MUX_uxn_opcodes_h_l1132_c7_9333 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1132_c7_9333_cond,
tmp16_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue,
tmp16_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse,
tmp16_MUX_uxn_opcodes_h_l1132_c7_9333_return_output);

-- t16_MUX_uxn_opcodes_h_l1132_c7_9333
t16_MUX_uxn_opcodes_h_l1132_c7_9333 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1132_c7_9333_cond,
t16_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue,
t16_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse,
t16_MUX_uxn_opcodes_h_l1132_c7_9333_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1133_c3_390b
BIN_OP_OR_uxn_opcodes_h_l1133_c3_390b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1133_c3_390b_left,
BIN_OP_OR_uxn_opcodes_h_l1133_c3_390b_right,
BIN_OP_OR_uxn_opcodes_h_l1133_c3_390b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1136_c11_1efc
BIN_OP_EQ_uxn_opcodes_h_l1136_c11_1efc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1136_c11_1efc_left,
BIN_OP_EQ_uxn_opcodes_h_l1136_c11_1efc_right,
BIN_OP_EQ_uxn_opcodes_h_l1136_c11_1efc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1136_c7_4aed
result_u8_value_MUX_uxn_opcodes_h_l1136_c7_4aed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1136_c7_4aed_cond,
result_u8_value_MUX_uxn_opcodes_h_l1136_c7_4aed_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1136_c7_4aed_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_4aed
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_4aed : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_4aed_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_4aed_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_4aed_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_4aed
result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_4aed : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_4aed_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_4aed_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_4aed_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_4aed
result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_4aed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_4aed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_4aed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_4aed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_4aed
result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_4aed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_4aed_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_4aed_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_4aed_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output);

-- n16_MUX_uxn_opcodes_h_l1136_c7_4aed
n16_MUX_uxn_opcodes_h_l1136_c7_4aed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1136_c7_4aed_cond,
n16_MUX_uxn_opcodes_h_l1136_c7_4aed_iftrue,
n16_MUX_uxn_opcodes_h_l1136_c7_4aed_iffalse,
n16_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1136_c7_4aed
tmp16_MUX_uxn_opcodes_h_l1136_c7_4aed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1136_c7_4aed_cond,
tmp16_MUX_uxn_opcodes_h_l1136_c7_4aed_iftrue,
tmp16_MUX_uxn_opcodes_h_l1136_c7_4aed_iffalse,
tmp16_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1140_c11_4521
BIN_OP_EQ_uxn_opcodes_h_l1140_c11_4521 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1140_c11_4521_left,
BIN_OP_EQ_uxn_opcodes_h_l1140_c11_4521_right,
BIN_OP_EQ_uxn_opcodes_h_l1140_c11_4521_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1140_c7_90d6
result_u8_value_MUX_uxn_opcodes_h_l1140_c7_90d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1140_c7_90d6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1140_c7_90d6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1140_c7_90d6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_90d6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_90d6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_90d6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_90d6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_90d6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_90d6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_90d6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_90d6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_90d6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_90d6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_90d6
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_90d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_90d6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_90d6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_90d6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_90d6
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_90d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_90d6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_90d6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_90d6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output);

-- n16_MUX_uxn_opcodes_h_l1140_c7_90d6
n16_MUX_uxn_opcodes_h_l1140_c7_90d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1140_c7_90d6_cond,
n16_MUX_uxn_opcodes_h_l1140_c7_90d6_iftrue,
n16_MUX_uxn_opcodes_h_l1140_c7_90d6_iffalse,
n16_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1140_c7_90d6
tmp16_MUX_uxn_opcodes_h_l1140_c7_90d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1140_c7_90d6_cond,
tmp16_MUX_uxn_opcodes_h_l1140_c7_90d6_iftrue,
tmp16_MUX_uxn_opcodes_h_l1140_c7_90d6_iffalse,
tmp16_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1141_c3_526a
BIN_OP_OR_uxn_opcodes_h_l1141_c3_526a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1141_c3_526a_left,
BIN_OP_OR_uxn_opcodes_h_l1141_c3_526a_right,
BIN_OP_OR_uxn_opcodes_h_l1141_c3_526a_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l1142_c11_3ee0
BIN_OP_XOR_uxn_opcodes_h_l1142_c11_3ee0 : entity work.BIN_OP_XOR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l1142_c11_3ee0_left,
BIN_OP_XOR_uxn_opcodes_h_l1142_c11_3ee0_right,
BIN_OP_XOR_uxn_opcodes_h_l1142_c11_3ee0_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1143_c30_4385
sp_relative_shift_uxn_opcodes_h_l1143_c30_4385 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1143_c30_4385_ins,
sp_relative_shift_uxn_opcodes_h_l1143_c30_4385_x,
sp_relative_shift_uxn_opcodes_h_l1143_c30_4385_y,
sp_relative_shift_uxn_opcodes_h_l1143_c30_4385_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1148_c11_5bb8
BIN_OP_EQ_uxn_opcodes_h_l1148_c11_5bb8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1148_c11_5bb8_left,
BIN_OP_EQ_uxn_opcodes_h_l1148_c11_5bb8_right,
BIN_OP_EQ_uxn_opcodes_h_l1148_c11_5bb8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_2e37
result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_2e37 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_2e37_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_2e37_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_2e37_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_2e37_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1148_c7_2e37
result_u8_value_MUX_uxn_opcodes_h_l1148_c7_2e37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1148_c7_2e37_cond,
result_u8_value_MUX_uxn_opcodes_h_l1148_c7_2e37_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1148_c7_2e37_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1148_c7_2e37_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_2e37
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_2e37 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_2e37_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_2e37_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_2e37_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_2e37_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_2e37
result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_2e37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_2e37_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_2e37_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_2e37_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_2e37_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1151_c31_f107
CONST_SR_8_uxn_opcodes_h_l1151_c31_f107 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1151_c31_f107_x,
CONST_SR_8_uxn_opcodes_h_l1151_c31_f107_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_99a8
CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_99a8 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_99a8_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_99a8_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5add_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output,
 n16_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output,
 tmp16_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output,
 t16_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1124_c11_ba84_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output,
 n16_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output,
 tmp16_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output,
 t16_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f9c2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1127_c7_e932_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_e932_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_e932_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_e932_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_e932_return_output,
 n16_MUX_uxn_opcodes_h_l1127_c7_e932_return_output,
 tmp16_MUX_uxn_opcodes_h_l1127_c7_e932_return_output,
 t16_MUX_uxn_opcodes_h_l1127_c7_e932_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1132_c11_5385_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1132_c7_9333_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_9333_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_9333_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_9333_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_9333_return_output,
 n16_MUX_uxn_opcodes_h_l1132_c7_9333_return_output,
 tmp16_MUX_uxn_opcodes_h_l1132_c7_9333_return_output,
 t16_MUX_uxn_opcodes_h_l1132_c7_9333_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1133_c3_390b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1136_c11_1efc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output,
 n16_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output,
 tmp16_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1140_c11_4521_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output,
 n16_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output,
 tmp16_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1141_c3_526a_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l1142_c11_3ee0_return_output,
 sp_relative_shift_uxn_opcodes_h_l1143_c30_4385_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1148_c11_5bb8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_2e37_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1148_c7_2e37_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_2e37_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_2e37_return_output,
 CONST_SR_8_uxn_opcodes_h_l1151_c31_f107_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_99a8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5add_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5add_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5add_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1111_c2_e4b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1121_c3_8127 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1111_c2_e4b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1116_c3_4415 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1111_c2_e4b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1111_c2_e4b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_ba84_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_ba84_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_ba84_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_e932_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1125_c3_d2e6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_e932_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_e932_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_e932_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_e932_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1127_c7_e932_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_e932_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1127_c7_e932_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f9c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f9c2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f9c2_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_9333_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_e932_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1130_c3_6ec0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_9333_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_e932_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_9333_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_e932_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_9333_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_e932_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_9333_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_e932_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1132_c7_9333_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1127_c7_e932_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_9333_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_e932_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1132_c7_9333_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1127_c7_e932_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_5385_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_5385_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_5385_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_9333_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1134_c3_579a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_9333_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_9333_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_9333_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_9333_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1132_c7_9333_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_9333_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1132_c7_9333_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_390b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_390b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_390b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_1efc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_1efc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_1efc_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_4aed_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_4aed_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_4aed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_4aed_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_4aed_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_4aed_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_4aed_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_4aed_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_4aed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_4aed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_4aed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_4aed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_4aed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_4aed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_4aed_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1136_c7_4aed_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1136_c7_4aed_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1136_c7_4aed_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_4aed_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_4aed_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_4aed_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_4521_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_4521_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_4521_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_90d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_90d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_2e37_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_90d6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_90d6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1145_c3_e500 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_90d6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_2e37_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_90d6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_90d6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_90d6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_2e37_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_90d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_90d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_90d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_2e37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_90d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_90d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_90d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_90d6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1140_c7_90d6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1140_c7_90d6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1140_c7_90d6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_90d6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_90d6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_90d6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_526a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_526a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_526a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_3ee0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_3ee0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_3ee0_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_4385_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_4385_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_4385_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_4385_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1146_c21_7dd5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_5bb8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_5bb8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_5bb8_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_2e37_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1149_c3_67d2 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_2e37_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_2e37_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_2e37_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_2e37_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_2e37_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_2e37_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1150_c3_65b1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_2e37_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_2e37_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_2e37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_2e37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_2e37_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1151_c31_f107_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1151_c31_f107_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1151_c21_b41b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1148_l1136_l1132_l1127_l1111_l1124_DUPLICATE_2fb3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1148_l1136_l1132_l1127_l1124_DUPLICATE_7742_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1148_l1136_l1140_l1132_l1127_l1124_DUPLICATE_70c8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1136_l1140_l1132_l1127_l1124_DUPLICATE_be25_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1128_l1133_l1141_l1137_DUPLICATE_be0c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_99a8_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_99a8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1148_l1136_DUPLICATE_ba1c_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l1155_l1107_DUPLICATE_e9d8_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1134_c3_579a := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1134_c3_579a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1145_c3_e500 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_90d6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1145_c3_e500;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1130_c3_6ec0 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1130_c3_6ec0;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1125_c3_d2e6 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1125_c3_d2e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_5bb8_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_4521_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_ba84_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_4385_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_5385_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1149_c3_67d2 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_2e37_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1149_c3_67d2;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1150_c3_65b1 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_2e37_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1150_c3_65b1;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1121_c3_8127 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1121_c3_8127;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f9c2_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_2e37_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1116_c3_4415 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1116_c3_4415;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_4385_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_90d6_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5add_right := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_1efc_right := to_unsigned(4, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_4385_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_526a_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1140_c7_90d6_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5add_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_ba84_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f9c2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_5385_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_1efc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_4521_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_5bb8_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_390b_left := t16;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_3ee0_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1151_c31_f107_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_4aed_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_90d6_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1148_l1136_l1140_l1132_l1127_l1124_DUPLICATE_70c8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1148_l1136_l1140_l1132_l1127_l1124_DUPLICATE_70c8_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1136_l1140_l1132_l1127_l1124_DUPLICATE_be25 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1136_l1140_l1132_l1127_l1124_DUPLICATE_be25_return_output := result.is_stack_write;

     -- CONST_SR_8[uxn_opcodes_h_l1151_c31_f107] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1151_c31_f107_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1151_c31_f107_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1151_c31_f107_return_output := CONST_SR_8_uxn_opcodes_h_l1151_c31_f107_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1148_l1136_l1132_l1127_l1124_DUPLICATE_7742 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1148_l1136_l1132_l1127_l1124_DUPLICATE_7742_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1124_c11_ba84] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1124_c11_ba84_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_ba84_left;
     BIN_OP_EQ_uxn_opcodes_h_l1124_c11_ba84_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_ba84_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_ba84_return_output := BIN_OP_EQ_uxn_opcodes_h_l1124_c11_ba84_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1111_c2_e4b5] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1111_c2_e4b5_return_output := result.is_pc_updated;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1111_c2_e4b5] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1111_c2_e4b5_return_output := result.is_ram_write;

     -- sp_relative_shift[uxn_opcodes_h_l1143_c30_4385] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1143_c30_4385_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_4385_ins;
     sp_relative_shift_uxn_opcodes_h_l1143_c30_4385_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_4385_x;
     sp_relative_shift_uxn_opcodes_h_l1143_c30_4385_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_4385_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_4385_return_output := sp_relative_shift_uxn_opcodes_h_l1143_c30_4385_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1140_c11_4521] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1140_c11_4521_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_4521_left;
     BIN_OP_EQ_uxn_opcodes_h_l1140_c11_4521_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_4521_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_4521_return_output := BIN_OP_EQ_uxn_opcodes_h_l1140_c11_4521_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1111_c2_e4b5] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1111_c2_e4b5_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1148_c11_5bb8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1148_c11_5bb8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_5bb8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1148_c11_5bb8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_5bb8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_5bb8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1148_c11_5bb8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1127_c11_f9c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f9c2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f9c2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f9c2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f9c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f9c2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f9c2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1132_c11_5385] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1132_c11_5385_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_5385_left;
     BIN_OP_EQ_uxn_opcodes_h_l1132_c11_5385_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_5385_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_5385_return_output := BIN_OP_EQ_uxn_opcodes_h_l1132_c11_5385_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1148_l1136_l1132_l1127_l1111_l1124_DUPLICATE_2fb3 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1148_l1136_l1132_l1127_l1111_l1124_DUPLICATE_2fb3_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1136_c11_1efc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1136_c11_1efc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_1efc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1136_c11_1efc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_1efc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_1efc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1136_c11_1efc_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1128_l1133_l1141_l1137_DUPLICATE_be0c LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1128_l1133_l1141_l1137_DUPLICATE_be0c_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1111_c6_5add] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5add_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5add_left;
     BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5add_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5add_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5add_return_output := BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5add_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1148_l1136_DUPLICATE_ba1c LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1148_l1136_DUPLICATE_ba1c_return_output := result.stack_address_sp_offset;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1111_c2_e4b5] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1111_c2_e4b5_return_output := result.is_vram_write;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5add_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5add_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5add_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5add_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5add_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5add_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5add_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5add_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5add_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5add_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5add_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_5add_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_ba84_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_ba84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_ba84_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_ba84_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_ba84_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_ba84_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_ba84_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_ba84_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1127_c7_e932_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f9c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_e932_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f9c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_e932_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f9c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_e932_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f9c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_e932_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f9c2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_e932_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f9c2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1127_c7_e932_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f9c2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_e932_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_f9c2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1132_c7_9333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_5385_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_9333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_5385_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_9333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_5385_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_9333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_5385_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_9333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_5385_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_9333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_5385_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1132_c7_9333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_5385_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_9333_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_5385_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1136_c7_4aed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_1efc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_4aed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_1efc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_4aed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_1efc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_4aed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_1efc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_4aed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_1efc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_4aed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_1efc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_4aed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_1efc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1140_c7_90d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_4521_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_90d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_4521_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_90d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_4521_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_90d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_4521_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_90d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_4521_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_90d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_4521_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_90d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_4521_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_2e37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_5bb8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_2e37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_5bb8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_2e37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_5bb8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_2e37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_5bb8_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_390b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1128_l1133_l1141_l1137_DUPLICATE_be0c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_526a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1128_l1133_l1141_l1137_DUPLICATE_be0c_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_99a8_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1128_l1133_l1141_l1137_DUPLICATE_be0c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1148_l1136_l1132_l1127_l1124_DUPLICATE_7742_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1148_l1136_l1132_l1127_l1124_DUPLICATE_7742_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1148_l1136_l1132_l1127_l1124_DUPLICATE_7742_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_4aed_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1148_l1136_l1132_l1127_l1124_DUPLICATE_7742_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_2e37_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1148_l1136_l1132_l1127_l1124_DUPLICATE_7742_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1148_l1136_l1140_l1132_l1127_l1124_DUPLICATE_70c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1148_l1136_l1140_l1132_l1127_l1124_DUPLICATE_70c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1148_l1136_l1140_l1132_l1127_l1124_DUPLICATE_70c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_4aed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1148_l1136_l1140_l1132_l1127_l1124_DUPLICATE_70c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_90d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1148_l1136_l1140_l1132_l1127_l1124_DUPLICATE_70c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_2e37_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1148_l1136_l1140_l1132_l1127_l1124_DUPLICATE_70c8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1136_l1140_l1132_l1127_l1124_DUPLICATE_be25_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1136_l1140_l1132_l1127_l1124_DUPLICATE_be25_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1136_l1140_l1132_l1127_l1124_DUPLICATE_be25_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_4aed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1136_l1140_l1132_l1127_l1124_DUPLICATE_be25_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_90d6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1136_l1140_l1132_l1127_l1124_DUPLICATE_be25_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_4aed_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1148_l1136_DUPLICATE_ba1c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_2e37_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1148_l1136_DUPLICATE_ba1c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1148_l1136_l1132_l1127_l1111_l1124_DUPLICATE_2fb3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1148_l1136_l1132_l1127_l1111_l1124_DUPLICATE_2fb3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1148_l1136_l1132_l1127_l1111_l1124_DUPLICATE_2fb3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1148_l1136_l1132_l1127_l1111_l1124_DUPLICATE_2fb3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_4aed_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1148_l1136_l1132_l1127_l1111_l1124_DUPLICATE_2fb3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_2e37_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1148_l1136_l1132_l1127_l1111_l1124_DUPLICATE_2fb3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1111_c2_e4b5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1111_c2_e4b5_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1111_c2_e4b5_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1111_c2_e4b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_90d6_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_4385_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l1151_c21_b41b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1151_c21_b41b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1151_c31_f107_return_output);

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1111_c2_e4b5] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1133_c3_390b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1133_c3_390b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_390b_left;
     BIN_OP_OR_uxn_opcodes_h_l1133_c3_390b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_390b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_390b_return_output := BIN_OP_OR_uxn_opcodes_h_l1133_c3_390b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1148_c7_2e37] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_2e37_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_2e37_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_2e37_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_2e37_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_2e37_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_2e37_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_2e37_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_2e37_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1140_c7_90d6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_90d6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_90d6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_90d6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_90d6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_90d6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_90d6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1148_c7_2e37] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_2e37_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_2e37_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_2e37_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_2e37_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_2e37_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_2e37_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_2e37_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_2e37_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1148_c7_2e37] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_2e37_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_2e37_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_2e37_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_2e37_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_2e37_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_2e37_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_2e37_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_2e37_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1111_c2_e4b5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1111_c2_e4b5] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1111_c2_e4b5] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_99a8 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_99a8_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_99a8_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_99a8_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_99a8_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1141_c3_526a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1141_c3_526a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_526a_left;
     BIN_OP_OR_uxn_opcodes_h_l1141_c3_526a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_526a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_526a_return_output := BIN_OP_OR_uxn_opcodes_h_l1141_c3_526a_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_390b_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_3ee0_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_526a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1140_c7_90d6_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_526a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_2e37_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1151_c21_b41b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1136_c7_4aed_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_99a8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_99a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_90d6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_2e37_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_4aed_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_90d6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_2e37_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_90d6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_2e37_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1140_c7_90d6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_90d6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_90d6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_90d6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_90d6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_90d6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_90d6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1140_c7_90d6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1140_c7_90d6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1140_c7_90d6_cond;
     n16_MUX_uxn_opcodes_h_l1140_c7_90d6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1140_c7_90d6_iftrue;
     n16_MUX_uxn_opcodes_h_l1140_c7_90d6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1140_c7_90d6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output := n16_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output;

     -- t16_MUX[uxn_opcodes_h_l1132_c7_9333] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1132_c7_9333_cond <= VAR_t16_MUX_uxn_opcodes_h_l1132_c7_9333_cond;
     t16_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue;
     t16_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1132_c7_9333_return_output := t16_MUX_uxn_opcodes_h_l1132_c7_9333_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1140_c7_90d6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_90d6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_90d6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_90d6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_90d6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_90d6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_90d6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1140_c7_90d6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_90d6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_90d6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_90d6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_90d6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_90d6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_90d6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output;

     -- BIN_OP_XOR[uxn_opcodes_h_l1142_c11_3ee0] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l1142_c11_3ee0_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_3ee0_left;
     BIN_OP_XOR_uxn_opcodes_h_l1142_c11_3ee0_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_3ee0_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_3ee0_return_output := BIN_OP_XOR_uxn_opcodes_h_l1142_c11_3ee0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1148_c7_2e37] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1148_c7_2e37_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_2e37_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1148_c7_2e37_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_2e37_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1148_c7_2e37_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_2e37_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_2e37_return_output := result_u8_value_MUX_uxn_opcodes_h_l1148_c7_2e37_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1136_c7_4aed] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_4aed_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_4aed_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_4aed_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_4aed_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_4aed_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_4aed_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_90d6_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_3ee0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1136_c7_4aed_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_4aed_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_4aed_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_4aed_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_90d6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_2e37_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1132_c7_9333_return_output;
     -- t16_MUX[uxn_opcodes_h_l1127_c7_e932] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1127_c7_e932_cond <= VAR_t16_MUX_uxn_opcodes_h_l1127_c7_e932_cond;
     t16_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue;
     t16_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1127_c7_e932_return_output := t16_MUX_uxn_opcodes_h_l1127_c7_e932_return_output;

     -- n16_MUX[uxn_opcodes_h_l1136_c7_4aed] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1136_c7_4aed_cond <= VAR_n16_MUX_uxn_opcodes_h_l1136_c7_4aed_cond;
     n16_MUX_uxn_opcodes_h_l1136_c7_4aed_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1136_c7_4aed_iftrue;
     n16_MUX_uxn_opcodes_h_l1136_c7_4aed_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1136_c7_4aed_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output := n16_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1136_c7_4aed] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_4aed_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_4aed_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_4aed_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_4aed_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_4aed_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_4aed_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1136_c7_4aed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_4aed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_4aed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_4aed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_4aed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_4aed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_4aed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1136_c7_4aed] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_4aed_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_4aed_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_4aed_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_4aed_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_4aed_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_4aed_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1146_c21_7dd5] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1146_c21_7dd5_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_3ee0_return_output);

     -- tmp16_MUX[uxn_opcodes_h_l1140_c7_90d6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1140_c7_90d6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_90d6_cond;
     tmp16_MUX_uxn_opcodes_h_l1140_c7_90d6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_90d6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1140_c7_90d6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_90d6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output := tmp16_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1132_c7_9333] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_9333_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_9333_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_9333_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_9333_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_90d6_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1146_c21_7dd5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_9333_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1127_c7_e932_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_4aed_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1136_c7_4aed] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1136_c7_4aed_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_4aed_cond;
     tmp16_MUX_uxn_opcodes_h_l1136_c7_4aed_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_4aed_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1136_c7_4aed_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_4aed_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output := tmp16_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1132_c7_9333] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_9333_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_9333_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_9333_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_9333_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1140_c7_90d6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1140_c7_90d6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_90d6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1140_c7_90d6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_90d6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1140_c7_90d6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_90d6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1132_c7_9333] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_9333_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_9333_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_9333_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_9333_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1127_c7_e932] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_e932_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_e932_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_e932_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_e932_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1132_c7_9333] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_9333_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_9333_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_9333_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_9333_return_output;

     -- n16_MUX[uxn_opcodes_h_l1132_c7_9333] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1132_c7_9333_cond <= VAR_n16_MUX_uxn_opcodes_h_l1132_c7_9333_cond;
     n16_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue;
     n16_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1132_c7_9333_return_output := n16_MUX_uxn_opcodes_h_l1132_c7_9333_return_output;

     -- t16_MUX[uxn_opcodes_h_l1124_c7_cfa9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond <= VAR_t16_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond;
     t16_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue;
     t16_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output := t16_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1132_c7_9333_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_9333_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_e932_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_9333_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_9333_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_4aed_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_90d6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1136_c7_4aed] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1136_c7_4aed_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_4aed_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1136_c7_4aed_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_4aed_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1136_c7_4aed_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_4aed_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output := result_u8_value_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1132_c7_9333] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1132_c7_9333_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_9333_cond;
     tmp16_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_9333_return_output := tmp16_MUX_uxn_opcodes_h_l1132_c7_9333_return_output;

     -- t16_MUX[uxn_opcodes_h_l1111_c2_e4b5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond <= VAR_t16_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond;
     t16_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue;
     t16_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output := t16_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1127_c7_e932] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_e932_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_e932_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_e932_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_e932_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1127_c7_e932] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_e932_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_e932_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_e932_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_e932_return_output;

     -- n16_MUX[uxn_opcodes_h_l1127_c7_e932] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1127_c7_e932_cond <= VAR_n16_MUX_uxn_opcodes_h_l1127_c7_e932_cond;
     n16_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue;
     n16_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1127_c7_e932_return_output := n16_MUX_uxn_opcodes_h_l1127_c7_e932_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1124_c7_cfa9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1127_c7_e932] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_e932_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_e932_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_e932_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_e932_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1127_c7_e932_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_e932_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_e932_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_e932_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_4aed_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_9333_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1124_c7_cfa9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output;

     -- n16_MUX[uxn_opcodes_h_l1124_c7_cfa9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond <= VAR_n16_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond;
     n16_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue;
     n16_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output := n16_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1127_c7_e932] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1127_c7_e932_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_e932_cond;
     tmp16_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_e932_return_output := tmp16_MUX_uxn_opcodes_h_l1127_c7_e932_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1132_c7_9333] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1132_c7_9333_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_9333_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_9333_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_9333_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_9333_return_output := result_u8_value_MUX_uxn_opcodes_h_l1132_c7_9333_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1111_c2_e4b5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1124_c7_cfa9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1124_c7_cfa9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_9333_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_e932_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1111_c2_e4b5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1111_c2_e4b5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output;

     -- n16_MUX[uxn_opcodes_h_l1111_c2_e4b5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond <= VAR_n16_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond;
     n16_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue;
     n16_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output := n16_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1124_c7_cfa9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond;
     tmp16_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output := tmp16_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1111_c2_e4b5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1127_c7_e932] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1127_c7_e932_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_e932_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_e932_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_e932_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_e932_return_output := result_u8_value_MUX_uxn_opcodes_h_l1127_c7_e932_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_e932_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1124_c7_cfa9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_cfa9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_cfa9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_cfa9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output := result_u8_value_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1111_c2_e4b5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond;
     tmp16_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output := tmp16_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_cfa9_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1111_c2_e4b5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_e4b5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_e4b5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_e4b5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l1155_l1107_DUPLICATE_e9d8 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l1155_l1107_DUPLICATE_e9d8_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_922a(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_e4b5_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l1155_l1107_DUPLICATE_e9d8_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l1155_l1107_DUPLICATE_e9d8_return_output;
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
