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
-- BIN_OP_EQ[uxn_opcodes_h_l1111_c6_64f9]
signal BIN_OP_EQ_uxn_opcodes_h_l1111_c6_64f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1111_c6_64f9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1111_c6_64f9_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1111_c2_6dea]
signal t16_MUX_uxn_opcodes_h_l1111_c2_6dea_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1111_c2_6dea]
signal n16_MUX_uxn_opcodes_h_l1111_c2_6dea_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1111_c2_6dea]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1111_c2_6dea]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_6dea_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1111_c2_6dea]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1111_c2_6dea]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_6dea_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1111_c2_6dea]
signal result_u8_value_MUX_uxn_opcodes_h_l1111_c2_6dea_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1111_c2_6dea]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_6dea_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1111_c2_6dea]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_6dea_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1111_c2_6dea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_6dea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1111_c2_6dea]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_6dea_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1111_c2_6dea]
signal tmp16_MUX_uxn_opcodes_h_l1111_c2_6dea_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1124_c11_340f]
signal BIN_OP_EQ_uxn_opcodes_h_l1124_c11_340f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1124_c11_340f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1124_c11_340f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1124_c7_6be0]
signal t16_MUX_uxn_opcodes_h_l1124_c7_6be0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1124_c7_6be0]
signal n16_MUX_uxn_opcodes_h_l1124_c7_6be0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1124_c7_6be0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6be0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1124_c7_6be0]
signal result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6be0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1124_c7_6be0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6be0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1124_c7_6be0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6be0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1124_c7_6be0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6be0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1124_c7_6be0]
signal tmp16_MUX_uxn_opcodes_h_l1124_c7_6be0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1127_c11_c4f4]
signal BIN_OP_EQ_uxn_opcodes_h_l1127_c11_c4f4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1127_c11_c4f4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1127_c11_c4f4_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1127_c7_3c6a]
signal t16_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1127_c7_3c6a]
signal n16_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1127_c7_3c6a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1127_c7_3c6a]
signal result_u8_value_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1127_c7_3c6a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1127_c7_3c6a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1127_c7_3c6a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1127_c7_3c6a]
signal tmp16_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1132_c11_f432]
signal BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f432_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f432_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f432_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1132_c7_97a1]
signal t16_MUX_uxn_opcodes_h_l1132_c7_97a1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1132_c7_97a1]
signal n16_MUX_uxn_opcodes_h_l1132_c7_97a1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1132_c7_97a1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_97a1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1132_c7_97a1]
signal result_u8_value_MUX_uxn_opcodes_h_l1132_c7_97a1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1132_c7_97a1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_97a1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1132_c7_97a1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_97a1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1132_c7_97a1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_97a1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1132_c7_97a1]
signal tmp16_MUX_uxn_opcodes_h_l1132_c7_97a1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1133_c3_af81]
signal BIN_OP_OR_uxn_opcodes_h_l1133_c3_af81_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1133_c3_af81_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1133_c3_af81_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1136_c11_e833]
signal BIN_OP_EQ_uxn_opcodes_h_l1136_c11_e833_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1136_c11_e833_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1136_c11_e833_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1136_c7_f313]
signal n16_MUX_uxn_opcodes_h_l1136_c7_f313_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1136_c7_f313_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1136_c7_f313_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1136_c7_f313_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1136_c7_f313]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f313_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f313_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f313_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f313_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1136_c7_f313]
signal result_u8_value_MUX_uxn_opcodes_h_l1136_c7_f313_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1136_c7_f313_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1136_c7_f313_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1136_c7_f313_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1136_c7_f313]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_f313_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_f313_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_f313_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_f313_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1136_c7_f313]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f313_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f313_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f313_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f313_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1136_c7_f313]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f313_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f313_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f313_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f313_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1136_c7_f313]
signal tmp16_MUX_uxn_opcodes_h_l1136_c7_f313_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1136_c7_f313_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1136_c7_f313_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1136_c7_f313_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1140_c11_378b]
signal BIN_OP_EQ_uxn_opcodes_h_l1140_c11_378b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1140_c11_378b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1140_c11_378b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1140_c7_b969]
signal n16_MUX_uxn_opcodes_h_l1140_c7_b969_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1140_c7_b969_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1140_c7_b969_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1140_c7_b969_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1140_c7_b969]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b969_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b969_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b969_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b969_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1140_c7_b969]
signal result_u8_value_MUX_uxn_opcodes_h_l1140_c7_b969_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1140_c7_b969_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1140_c7_b969_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1140_c7_b969_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1140_c7_b969]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_b969_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_b969_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_b969_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_b969_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1140_c7_b969]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b969_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b969_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b969_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b969_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1140_c7_b969]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b969_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b969_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b969_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b969_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1140_c7_b969]
signal tmp16_MUX_uxn_opcodes_h_l1140_c7_b969_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1140_c7_b969_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1140_c7_b969_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1140_c7_b969_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1141_c3_b4b0]
signal BIN_OP_OR_uxn_opcodes_h_l1141_c3_b4b0_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1141_c3_b4b0_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1141_c3_b4b0_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l1142_c11_a050]
signal BIN_OP_XOR_uxn_opcodes_h_l1142_c11_a050_left : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1142_c11_a050_right : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1142_c11_a050_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1143_c30_effc]
signal sp_relative_shift_uxn_opcodes_h_l1143_c30_effc_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1143_c30_effc_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1143_c30_effc_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1143_c30_effc_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1148_c11_7dfb]
signal BIN_OP_EQ_uxn_opcodes_h_l1148_c11_7dfb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1148_c11_7dfb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1148_c11_7dfb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1148_c7_b9d1]
signal result_u8_value_MUX_uxn_opcodes_h_l1148_c7_b9d1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1148_c7_b9d1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1148_c7_b9d1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1148_c7_b9d1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1148_c7_b9d1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_b9d1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_b9d1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_b9d1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_b9d1_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1148_c7_b9d1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_b9d1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_b9d1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_b9d1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_b9d1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1148_c7_b9d1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_b9d1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_b9d1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_b9d1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_b9d1_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1151_c31_ce43]
signal CONST_SR_8_uxn_opcodes_h_l1151_c31_ce43_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1151_c31_ce43_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_f7a9
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_f7a9_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_f7a9_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1111_c6_64f9
BIN_OP_EQ_uxn_opcodes_h_l1111_c6_64f9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1111_c6_64f9_left,
BIN_OP_EQ_uxn_opcodes_h_l1111_c6_64f9_right,
BIN_OP_EQ_uxn_opcodes_h_l1111_c6_64f9_return_output);

-- t16_MUX_uxn_opcodes_h_l1111_c2_6dea
t16_MUX_uxn_opcodes_h_l1111_c2_6dea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1111_c2_6dea_cond,
t16_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue,
t16_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse,
t16_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output);

-- n16_MUX_uxn_opcodes_h_l1111_c2_6dea
n16_MUX_uxn_opcodes_h_l1111_c2_6dea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1111_c2_6dea_cond,
n16_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue,
n16_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse,
n16_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_6dea
result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_6dea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_6dea
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_6dea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_6dea_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_6dea
result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_6dea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_6dea
result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_6dea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_6dea_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1111_c2_6dea
result_u8_value_MUX_uxn_opcodes_h_l1111_c2_6dea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1111_c2_6dea_cond,
result_u8_value_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_6dea
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_6dea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_6dea_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_6dea
result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_6dea : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_6dea_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_6dea
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_6dea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_6dea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_6dea
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_6dea : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_6dea_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1111_c2_6dea
tmp16_MUX_uxn_opcodes_h_l1111_c2_6dea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1111_c2_6dea_cond,
tmp16_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue,
tmp16_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse,
tmp16_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1124_c11_340f
BIN_OP_EQ_uxn_opcodes_h_l1124_c11_340f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1124_c11_340f_left,
BIN_OP_EQ_uxn_opcodes_h_l1124_c11_340f_right,
BIN_OP_EQ_uxn_opcodes_h_l1124_c11_340f_return_output);

-- t16_MUX_uxn_opcodes_h_l1124_c7_6be0
t16_MUX_uxn_opcodes_h_l1124_c7_6be0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1124_c7_6be0_cond,
t16_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue,
t16_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse,
t16_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output);

-- n16_MUX_uxn_opcodes_h_l1124_c7_6be0
n16_MUX_uxn_opcodes_h_l1124_c7_6be0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1124_c7_6be0_cond,
n16_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue,
n16_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse,
n16_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6be0
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6be0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6be0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6be0
result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6be0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6be0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6be0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6be0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6be0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6be0
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6be0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6be0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6be0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6be0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6be0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1124_c7_6be0
tmp16_MUX_uxn_opcodes_h_l1124_c7_6be0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1124_c7_6be0_cond,
tmp16_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue,
tmp16_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse,
tmp16_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1127_c11_c4f4
BIN_OP_EQ_uxn_opcodes_h_l1127_c11_c4f4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1127_c11_c4f4_left,
BIN_OP_EQ_uxn_opcodes_h_l1127_c11_c4f4_right,
BIN_OP_EQ_uxn_opcodes_h_l1127_c11_c4f4_return_output);

-- t16_MUX_uxn_opcodes_h_l1127_c7_3c6a
t16_MUX_uxn_opcodes_h_l1127_c7_3c6a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond,
t16_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue,
t16_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse,
t16_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output);

-- n16_MUX_uxn_opcodes_h_l1127_c7_3c6a
n16_MUX_uxn_opcodes_h_l1127_c7_3c6a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond,
n16_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue,
n16_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse,
n16_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_3c6a
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_3c6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1127_c7_3c6a
result_u8_value_MUX_uxn_opcodes_h_l1127_c7_3c6a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_3c6a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_3c6a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_3c6a
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_3c6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_3c6a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_3c6a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1127_c7_3c6a
tmp16_MUX_uxn_opcodes_h_l1127_c7_3c6a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond,
tmp16_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f432
BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f432 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f432_left,
BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f432_right,
BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f432_return_output);

-- t16_MUX_uxn_opcodes_h_l1132_c7_97a1
t16_MUX_uxn_opcodes_h_l1132_c7_97a1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1132_c7_97a1_cond,
t16_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue,
t16_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse,
t16_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output);

-- n16_MUX_uxn_opcodes_h_l1132_c7_97a1
n16_MUX_uxn_opcodes_h_l1132_c7_97a1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1132_c7_97a1_cond,
n16_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue,
n16_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse,
n16_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_97a1
result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_97a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_97a1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1132_c7_97a1
result_u8_value_MUX_uxn_opcodes_h_l1132_c7_97a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1132_c7_97a1_cond,
result_u8_value_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_97a1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_97a1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_97a1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_97a1
result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_97a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_97a1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_97a1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_97a1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_97a1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1132_c7_97a1
tmp16_MUX_uxn_opcodes_h_l1132_c7_97a1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1132_c7_97a1_cond,
tmp16_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue,
tmp16_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse,
tmp16_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1133_c3_af81
BIN_OP_OR_uxn_opcodes_h_l1133_c3_af81 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1133_c3_af81_left,
BIN_OP_OR_uxn_opcodes_h_l1133_c3_af81_right,
BIN_OP_OR_uxn_opcodes_h_l1133_c3_af81_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1136_c11_e833
BIN_OP_EQ_uxn_opcodes_h_l1136_c11_e833 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1136_c11_e833_left,
BIN_OP_EQ_uxn_opcodes_h_l1136_c11_e833_right,
BIN_OP_EQ_uxn_opcodes_h_l1136_c11_e833_return_output);

-- n16_MUX_uxn_opcodes_h_l1136_c7_f313
n16_MUX_uxn_opcodes_h_l1136_c7_f313 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1136_c7_f313_cond,
n16_MUX_uxn_opcodes_h_l1136_c7_f313_iftrue,
n16_MUX_uxn_opcodes_h_l1136_c7_f313_iffalse,
n16_MUX_uxn_opcodes_h_l1136_c7_f313_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f313
result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f313 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f313_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f313_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f313_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f313_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1136_c7_f313
result_u8_value_MUX_uxn_opcodes_h_l1136_c7_f313 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1136_c7_f313_cond,
result_u8_value_MUX_uxn_opcodes_h_l1136_c7_f313_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1136_c7_f313_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1136_c7_f313_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_f313
result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_f313 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_f313_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_f313_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_f313_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_f313_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f313
result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f313 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f313_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f313_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f313_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f313_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f313
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f313 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f313_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f313_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f313_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f313_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1136_c7_f313
tmp16_MUX_uxn_opcodes_h_l1136_c7_f313 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1136_c7_f313_cond,
tmp16_MUX_uxn_opcodes_h_l1136_c7_f313_iftrue,
tmp16_MUX_uxn_opcodes_h_l1136_c7_f313_iffalse,
tmp16_MUX_uxn_opcodes_h_l1136_c7_f313_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1140_c11_378b
BIN_OP_EQ_uxn_opcodes_h_l1140_c11_378b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1140_c11_378b_left,
BIN_OP_EQ_uxn_opcodes_h_l1140_c11_378b_right,
BIN_OP_EQ_uxn_opcodes_h_l1140_c11_378b_return_output);

-- n16_MUX_uxn_opcodes_h_l1140_c7_b969
n16_MUX_uxn_opcodes_h_l1140_c7_b969 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1140_c7_b969_cond,
n16_MUX_uxn_opcodes_h_l1140_c7_b969_iftrue,
n16_MUX_uxn_opcodes_h_l1140_c7_b969_iffalse,
n16_MUX_uxn_opcodes_h_l1140_c7_b969_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b969
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b969 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b969_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b969_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b969_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b969_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1140_c7_b969
result_u8_value_MUX_uxn_opcodes_h_l1140_c7_b969 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1140_c7_b969_cond,
result_u8_value_MUX_uxn_opcodes_h_l1140_c7_b969_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1140_c7_b969_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1140_c7_b969_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_b969
result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_b969 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_b969_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_b969_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_b969_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_b969_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b969
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b969 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b969_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b969_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b969_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b969_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b969
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b969 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b969_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b969_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b969_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b969_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1140_c7_b969
tmp16_MUX_uxn_opcodes_h_l1140_c7_b969 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1140_c7_b969_cond,
tmp16_MUX_uxn_opcodes_h_l1140_c7_b969_iftrue,
tmp16_MUX_uxn_opcodes_h_l1140_c7_b969_iffalse,
tmp16_MUX_uxn_opcodes_h_l1140_c7_b969_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1141_c3_b4b0
BIN_OP_OR_uxn_opcodes_h_l1141_c3_b4b0 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1141_c3_b4b0_left,
BIN_OP_OR_uxn_opcodes_h_l1141_c3_b4b0_right,
BIN_OP_OR_uxn_opcodes_h_l1141_c3_b4b0_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l1142_c11_a050
BIN_OP_XOR_uxn_opcodes_h_l1142_c11_a050 : entity work.BIN_OP_XOR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l1142_c11_a050_left,
BIN_OP_XOR_uxn_opcodes_h_l1142_c11_a050_right,
BIN_OP_XOR_uxn_opcodes_h_l1142_c11_a050_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1143_c30_effc
sp_relative_shift_uxn_opcodes_h_l1143_c30_effc : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1143_c30_effc_ins,
sp_relative_shift_uxn_opcodes_h_l1143_c30_effc_x,
sp_relative_shift_uxn_opcodes_h_l1143_c30_effc_y,
sp_relative_shift_uxn_opcodes_h_l1143_c30_effc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1148_c11_7dfb
BIN_OP_EQ_uxn_opcodes_h_l1148_c11_7dfb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1148_c11_7dfb_left,
BIN_OP_EQ_uxn_opcodes_h_l1148_c11_7dfb_right,
BIN_OP_EQ_uxn_opcodes_h_l1148_c11_7dfb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1148_c7_b9d1
result_u8_value_MUX_uxn_opcodes_h_l1148_c7_b9d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1148_c7_b9d1_cond,
result_u8_value_MUX_uxn_opcodes_h_l1148_c7_b9d1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1148_c7_b9d1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1148_c7_b9d1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_b9d1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_b9d1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_b9d1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_b9d1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_b9d1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_b9d1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_b9d1
result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_b9d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_b9d1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_b9d1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_b9d1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_b9d1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_b9d1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_b9d1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_b9d1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_b9d1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_b9d1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_b9d1_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1151_c31_ce43
CONST_SR_8_uxn_opcodes_h_l1151_c31_ce43 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1151_c31_ce43_x,
CONST_SR_8_uxn_opcodes_h_l1151_c31_ce43_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_f7a9
CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_f7a9 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_f7a9_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_f7a9_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1111_c6_64f9_return_output,
 t16_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output,
 n16_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output,
 tmp16_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1124_c11_340f_return_output,
 t16_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output,
 n16_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output,
 tmp16_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1127_c11_c4f4_return_output,
 t16_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output,
 n16_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f432_return_output,
 t16_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output,
 n16_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output,
 tmp16_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1133_c3_af81_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1136_c11_e833_return_output,
 n16_MUX_uxn_opcodes_h_l1136_c7_f313_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f313_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1136_c7_f313_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_f313_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f313_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f313_return_output,
 tmp16_MUX_uxn_opcodes_h_l1136_c7_f313_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1140_c11_378b_return_output,
 n16_MUX_uxn_opcodes_h_l1140_c7_b969_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b969_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1140_c7_b969_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_b969_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b969_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b969_return_output,
 tmp16_MUX_uxn_opcodes_h_l1140_c7_b969_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1141_c3_b4b0_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l1142_c11_a050_return_output,
 sp_relative_shift_uxn_opcodes_h_l1143_c30_effc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1148_c11_7dfb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1148_c7_b9d1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_b9d1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_b9d1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_b9d1_return_output,
 CONST_SR_8_uxn_opcodes_h_l1151_c31_ce43_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_f7a9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_64f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_64f9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_64f9_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1111_c2_6dea_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1111_c2_6dea_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1111_c2_6dea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_6dea_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1111_c2_6dea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1111_c2_6dea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_6dea_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_6dea_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1111_c2_6dea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_6dea_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1116_c3_774a : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_6dea_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_6dea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1121_c3_4ce2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_6dea_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_6dea_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_340f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_340f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_340f_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1124_c7_6be0_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1124_c7_6be0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6be0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6be0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6be0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6be0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1125_c3_5cf0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6be0_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_6be0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_c4f4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_c4f4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_c4f4_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1130_c3_7582 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f432_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f432_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f432_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1132_c7_97a1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1136_c7_f313_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1132_c7_97a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f313_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_97a1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_f313_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_97a1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_f313_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_97a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f313_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_97a1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1134_c3_0890 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f313_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_97a1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_f313_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_97a1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_af81_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_af81_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_af81_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_e833_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_e833_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_e833_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1136_c7_f313_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1136_c7_f313_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1140_c7_b969_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1136_c7_f313_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f313_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f313_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b969_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f313_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_f313_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_f313_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_b969_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_f313_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_f313_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_f313_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_b969_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_f313_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f313_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f313_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b969_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f313_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f313_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f313_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b969_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f313_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_f313_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_f313_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_b969_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_f313_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_378b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_378b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_378b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1140_c7_b969_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1140_c7_b969_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1140_c7_b969_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b969_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b969_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b969_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_b969_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_b969_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_b9d1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_b969_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_b969_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_b969_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_b9d1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_b969_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b969_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b969_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_b9d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b969_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b969_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1145_c3_b8dc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b969_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_b9d1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b969_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_b969_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_b969_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_b969_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_b4b0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_b4b0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_b4b0_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_a050_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_a050_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_a050_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_effc_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_effc_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_effc_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_effc_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1146_c21_e14b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_7dfb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_7dfb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_7dfb_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_b9d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_b9d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_b9d1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_b9d1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1149_c3_a37d : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_b9d1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_b9d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_b9d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_b9d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_b9d1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_b9d1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1150_c3_e5bd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_b9d1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_b9d1_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1151_c31_ce43_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1151_c31_ce43_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1151_c21_08cc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1111_l1148_l1136_l1132_l1127_l1124_DUPLICATE_22a7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1140_l1136_l1132_l1127_l1124_DUPLICATE_8506_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1148_l1136_l1132_l1127_l1124_DUPLICATE_fd72_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1148_l1140_l1136_l1132_l1127_l1124_DUPLICATE_c631_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1133_l1137_l1141_l1128_DUPLICATE_4013_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_f7a9_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_f7a9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1136_l1148_DUPLICATE_3ed8_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l1155_l1107_DUPLICATE_4484_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_effc_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1150_c3_e5bd := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_b9d1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1150_c3_e5bd;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1134_c3_0890 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1134_c3_0890;
     VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_effc_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_b9d1_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_e833_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_340f_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b969_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1116_c3_774a := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1116_c3_774a;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1149_c3_a37d := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_b9d1_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1149_c3_a37d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_7dfb_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1125_c3_5cf0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1125_c3_5cf0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_64f9_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_c4f4_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1130_c3_7582 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1130_c3_7582;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1145_c3_b8dc := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b969_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1145_c3_b8dc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_378b_right := to_unsigned(5, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f432_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1121_c3_4ce2 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1121_c3_4ce2;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_effc_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_b4b0_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1140_c7_b969_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_64f9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_340f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_c4f4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f432_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_e833_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_378b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_7dfb_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_af81_left := t16;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_a050_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1151_c31_ce43_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_f313_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_b969_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1148_l1140_l1136_l1132_l1127_l1124_DUPLICATE_c631 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1148_l1140_l1136_l1132_l1127_l1124_DUPLICATE_c631_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1140_l1136_l1132_l1127_l1124_DUPLICATE_8506 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1140_l1136_l1132_l1127_l1124_DUPLICATE_8506_return_output := result.is_stack_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1111_c2_6dea] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1111_c2_6dea_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1111_l1148_l1136_l1132_l1127_l1124_DUPLICATE_22a7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1111_l1148_l1136_l1132_l1127_l1124_DUPLICATE_22a7_return_output := result.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1148_l1136_l1132_l1127_l1124_DUPLICATE_fd72 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1148_l1136_l1132_l1127_l1124_DUPLICATE_fd72_return_output := result.sp_relative_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1133_l1137_l1141_l1128_DUPLICATE_4013 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1133_l1137_l1141_l1128_DUPLICATE_4013_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1136_c11_e833] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1136_c11_e833_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_e833_left;
     BIN_OP_EQ_uxn_opcodes_h_l1136_c11_e833_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_e833_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_e833_return_output := BIN_OP_EQ_uxn_opcodes_h_l1136_c11_e833_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1111_c2_6dea] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1111_c2_6dea_return_output := result.is_stack_index_flipped;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1111_c2_6dea] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1111_c2_6dea_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1127_c11_c4f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1127_c11_c4f4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_c4f4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1127_c11_c4f4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_c4f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_c4f4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1127_c11_c4f4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1124_c11_340f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1124_c11_340f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_340f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1124_c11_340f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_340f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_340f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1124_c11_340f_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1151_c31_ce43] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1151_c31_ce43_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1151_c31_ce43_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1151_c31_ce43_return_output := CONST_SR_8_uxn_opcodes_h_l1151_c31_ce43_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1148_c11_7dfb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1148_c11_7dfb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_7dfb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1148_c11_7dfb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_7dfb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_7dfb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1148_c11_7dfb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1132_c11_f432] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f432_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f432_left;
     BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f432_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f432_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f432_return_output := BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f432_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1111_c2_6dea] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1111_c2_6dea_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1111_c6_64f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1111_c6_64f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_64f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1111_c6_64f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_64f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_64f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1111_c6_64f9_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1143_c30_effc] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1143_c30_effc_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_effc_ins;
     sp_relative_shift_uxn_opcodes_h_l1143_c30_effc_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_effc_x;
     sp_relative_shift_uxn_opcodes_h_l1143_c30_effc_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_effc_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_effc_return_output := sp_relative_shift_uxn_opcodes_h_l1143_c30_effc_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1136_l1148_DUPLICATE_3ed8 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1136_l1148_DUPLICATE_3ed8_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1140_c11_378b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1140_c11_378b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_378b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1140_c11_378b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_378b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_378b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1140_c11_378b_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1111_c2_6dea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_64f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_6dea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_64f9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_6dea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_64f9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_64f9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_6dea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_64f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_6dea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_64f9_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_64f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_6dea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_64f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_6dea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_64f9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_6dea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_64f9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1111_c2_6dea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_64f9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_6dea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_64f9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1124_c7_6be0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_340f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6be0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_340f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6be0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_340f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6be0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_340f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6be0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_340f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6be0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_340f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1124_c7_6be0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_340f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_6be0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_340f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_c4f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_c4f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_c4f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_c4f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_c4f4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_c4f4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_c4f4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_c4f4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1132_c7_97a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f432_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_97a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f432_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_97a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f432_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_97a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f432_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_97a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f432_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_97a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f432_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1132_c7_97a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f432_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_97a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f432_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1136_c7_f313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_e833_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_e833_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_e833_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_f313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_e833_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_e833_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_f313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_e833_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_f313_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_e833_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1140_c7_b969_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_378b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b969_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_378b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b969_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_378b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_b969_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_378b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b969_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_378b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_b969_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_378b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_b969_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_378b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_b9d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_7dfb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_b9d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_7dfb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_b9d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_7dfb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_b9d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_7dfb_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_af81_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1133_l1137_l1141_l1128_DUPLICATE_4013_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_b4b0_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1133_l1137_l1141_l1128_DUPLICATE_4013_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_f7a9_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1133_l1137_l1141_l1128_DUPLICATE_4013_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1148_l1136_l1132_l1127_l1124_DUPLICATE_fd72_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1148_l1136_l1132_l1127_l1124_DUPLICATE_fd72_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1148_l1136_l1132_l1127_l1124_DUPLICATE_fd72_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_f313_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1148_l1136_l1132_l1127_l1124_DUPLICATE_fd72_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_b9d1_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1148_l1136_l1132_l1127_l1124_DUPLICATE_fd72_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1148_l1140_l1136_l1132_l1127_l1124_DUPLICATE_c631_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1148_l1140_l1136_l1132_l1127_l1124_DUPLICATE_c631_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1148_l1140_l1136_l1132_l1127_l1124_DUPLICATE_c631_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f313_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1148_l1140_l1136_l1132_l1127_l1124_DUPLICATE_c631_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b969_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1148_l1140_l1136_l1132_l1127_l1124_DUPLICATE_c631_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_b9d1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1148_l1140_l1136_l1132_l1127_l1124_DUPLICATE_c631_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1140_l1136_l1132_l1127_l1124_DUPLICATE_8506_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1140_l1136_l1132_l1127_l1124_DUPLICATE_8506_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1140_l1136_l1132_l1127_l1124_DUPLICATE_8506_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f313_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1140_l1136_l1132_l1127_l1124_DUPLICATE_8506_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b969_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1140_l1136_l1132_l1127_l1124_DUPLICATE_8506_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f313_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1136_l1148_DUPLICATE_3ed8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_b9d1_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1136_l1148_DUPLICATE_3ed8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1111_l1148_l1136_l1132_l1127_l1124_DUPLICATE_22a7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1111_l1148_l1136_l1132_l1127_l1124_DUPLICATE_22a7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1111_l1148_l1136_l1132_l1127_l1124_DUPLICATE_22a7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1111_l1148_l1136_l1132_l1127_l1124_DUPLICATE_22a7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_f313_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1111_l1148_l1136_l1132_l1127_l1124_DUPLICATE_22a7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_b9d1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1111_l1148_l1136_l1132_l1127_l1124_DUPLICATE_22a7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1111_c2_6dea_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1111_c2_6dea_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1111_c2_6dea_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1111_c2_6dea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_b969_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_effc_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1148_c7_b9d1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_b9d1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_b9d1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_b9d1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_b9d1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_b9d1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_b9d1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_b9d1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_b9d1_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1111_c2_6dea] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1140_c7_b969] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b969_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b969_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b969_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b969_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b969_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b969_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b969_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b969_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1111_c2_6dea] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_6dea_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_6dea_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1111_c2_6dea] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1148_c7_b9d1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_b9d1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_b9d1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_b9d1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_b9d1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_b9d1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_b9d1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_b9d1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_b9d1_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1141_c3_b4b0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1141_c3_b4b0_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_b4b0_left;
     BIN_OP_OR_uxn_opcodes_h_l1141_c3_b4b0_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_b4b0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_b4b0_return_output := BIN_OP_OR_uxn_opcodes_h_l1141_c3_b4b0_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1111_c2_6dea] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_6dea_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_6dea_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1151_c21_08cc] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1151_c21_08cc_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1151_c31_ce43_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l1133_c3_af81] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1133_c3_af81_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_af81_left;
     BIN_OP_OR_uxn_opcodes_h_l1133_c3_af81_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_af81_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_af81_return_output := BIN_OP_OR_uxn_opcodes_h_l1133_c3_af81_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1148_c7_b9d1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_b9d1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_b9d1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_b9d1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_b9d1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_b9d1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_b9d1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_b9d1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_b9d1_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_f7a9 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_f7a9_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_f7a9_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_f7a9_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_f7a9_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_af81_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_a050_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_b4b0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1140_c7_b969_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_b4b0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_b9d1_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1151_c21_08cc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1136_c7_f313_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_f7a9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_f7a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b969_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_b9d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f313_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_b969_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_b969_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_b9d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b969_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_b9d1_return_output;
     -- BIN_OP_XOR[uxn_opcodes_h_l1142_c11_a050] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l1142_c11_a050_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_a050_left;
     BIN_OP_XOR_uxn_opcodes_h_l1142_c11_a050_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_a050_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_a050_return_output := BIN_OP_XOR_uxn_opcodes_h_l1142_c11_a050_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1148_c7_b9d1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1148_c7_b9d1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_b9d1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1148_c7_b9d1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_b9d1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1148_c7_b9d1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_b9d1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_b9d1_return_output := result_u8_value_MUX_uxn_opcodes_h_l1148_c7_b9d1_return_output;

     -- t16_MUX[uxn_opcodes_h_l1132_c7_97a1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1132_c7_97a1_cond <= VAR_t16_MUX_uxn_opcodes_h_l1132_c7_97a1_cond;
     t16_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue;
     t16_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output := t16_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1136_c7_f313] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f313_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f313_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f313_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f313_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f313_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f313_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f313_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f313_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1140_c7_b969] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b969_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b969_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b969_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b969_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b969_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b969_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b969_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b969_return_output;

     -- n16_MUX[uxn_opcodes_h_l1140_c7_b969] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1140_c7_b969_cond <= VAR_n16_MUX_uxn_opcodes_h_l1140_c7_b969_cond;
     n16_MUX_uxn_opcodes_h_l1140_c7_b969_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1140_c7_b969_iftrue;
     n16_MUX_uxn_opcodes_h_l1140_c7_b969_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1140_c7_b969_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1140_c7_b969_return_output := n16_MUX_uxn_opcodes_h_l1140_c7_b969_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1140_c7_b969] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_b969_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_b969_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_b969_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_b969_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_b969_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_b969_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_b969_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_b969_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1140_c7_b969] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b969_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b969_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b969_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b969_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b969_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b969_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b969_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b969_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_b969_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_a050_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1136_c7_f313_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1140_c7_b969_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f313_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_b969_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_f313_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_f313_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_b969_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f313_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_b969_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_b969_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_b9d1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1136_c7_f313] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f313_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f313_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f313_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f313_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f313_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f313_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f313_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f313_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1132_c7_97a1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_97a1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_97a1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1146_c21_e14b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1146_c21_e14b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_a050_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1136_c7_f313] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f313_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f313_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f313_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f313_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f313_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f313_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f313_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f313_return_output;

     -- t16_MUX[uxn_opcodes_h_l1127_c7_3c6a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond;
     t16_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue;
     t16_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output := t16_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1136_c7_f313] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_f313_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_f313_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_f313_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_f313_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_f313_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_f313_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_f313_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_f313_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1140_c7_b969] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1140_c7_b969_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_b969_cond;
     tmp16_MUX_uxn_opcodes_h_l1140_c7_b969_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_b969_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1140_c7_b969_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_b969_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_b969_return_output := tmp16_MUX_uxn_opcodes_h_l1140_c7_b969_return_output;

     -- n16_MUX[uxn_opcodes_h_l1136_c7_f313] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1136_c7_f313_cond <= VAR_n16_MUX_uxn_opcodes_h_l1136_c7_f313_cond;
     n16_MUX_uxn_opcodes_h_l1136_c7_f313_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1136_c7_f313_iftrue;
     n16_MUX_uxn_opcodes_h_l1136_c7_f313_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1136_c7_f313_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1136_c7_f313_return_output := n16_MUX_uxn_opcodes_h_l1136_c7_f313_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_b969_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1146_c21_e14b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1136_c7_f313_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_f313_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_f313_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_f313_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_f313_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_b969_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1132_c7_97a1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_97a1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_97a1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1136_c7_f313] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1136_c7_f313_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_f313_cond;
     tmp16_MUX_uxn_opcodes_h_l1136_c7_f313_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_f313_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1136_c7_f313_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_f313_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_f313_return_output := tmp16_MUX_uxn_opcodes_h_l1136_c7_f313_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1127_c7_3c6a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1132_c7_97a1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_97a1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_97a1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output;

     -- n16_MUX[uxn_opcodes_h_l1132_c7_97a1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1132_c7_97a1_cond <= VAR_n16_MUX_uxn_opcodes_h_l1132_c7_97a1_cond;
     n16_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue;
     n16_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output := n16_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1140_c7_b969] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1140_c7_b969_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_b969_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1140_c7_b969_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_b969_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1140_c7_b969_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_b969_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_b969_return_output := result_u8_value_MUX_uxn_opcodes_h_l1140_c7_b969_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1132_c7_97a1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_97a1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_97a1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output;

     -- t16_MUX[uxn_opcodes_h_l1124_c7_6be0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1124_c7_6be0_cond <= VAR_t16_MUX_uxn_opcodes_h_l1124_c7_6be0_cond;
     t16_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue;
     t16_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output := t16_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_f313_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_b969_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_f313_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1127_c7_3c6a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1127_c7_3c6a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond;
     n16_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue;
     n16_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output := n16_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1136_c7_f313] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1136_c7_f313_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_f313_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1136_c7_f313_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_f313_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1136_c7_f313_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_f313_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_f313_return_output := result_u8_value_MUX_uxn_opcodes_h_l1136_c7_f313_return_output;

     -- t16_MUX[uxn_opcodes_h_l1111_c2_6dea] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1111_c2_6dea_cond <= VAR_t16_MUX_uxn_opcodes_h_l1111_c2_6dea_cond;
     t16_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue;
     t16_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output := t16_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1127_c7_3c6a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1127_c7_3c6a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1124_c7_6be0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6be0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6be0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1132_c7_97a1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1132_c7_97a1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_97a1_cond;
     tmp16_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output := tmp16_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_f313_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output;
     -- n16_MUX[uxn_opcodes_h_l1124_c7_6be0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1124_c7_6be0_cond <= VAR_n16_MUX_uxn_opcodes_h_l1124_c7_6be0_cond;
     n16_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue;
     n16_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output := n16_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1124_c7_6be0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6be0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6be0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1124_c7_6be0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6be0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6be0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1127_c7_3c6a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond;
     tmp16_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output := tmp16_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1132_c7_97a1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1132_c7_97a1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_97a1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_97a1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_97a1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output := result_u8_value_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1111_c2_6dea] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_6dea_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_6dea_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1124_c7_6be0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6be0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6be0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_97a1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1111_c2_6dea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_6dea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_6dea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1127_c7_3c6a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_3c6a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_3c6a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_3c6a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1111_c2_6dea] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1111_c2_6dea_cond <= VAR_n16_MUX_uxn_opcodes_h_l1111_c2_6dea_cond;
     n16_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue;
     n16_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output := n16_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1111_c2_6dea] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_6dea_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_6dea_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1111_c2_6dea] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_6dea_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_6dea_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1124_c7_6be0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1124_c7_6be0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_6be0_cond;
     tmp16_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output := tmp16_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_3c6a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1111_c2_6dea] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1111_c2_6dea_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_6dea_cond;
     tmp16_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output := tmp16_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1124_c7_6be0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6be0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6be0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6be0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6be0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_6be0_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1111_c2_6dea] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1111_c2_6dea_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_6dea_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_6dea_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_6dea_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output := result_u8_value_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l1155_l1107_DUPLICATE_4484 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l1155_l1107_DUPLICATE_4484_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_6dea_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l1155_l1107_DUPLICATE_4484_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l1155_l1107_DUPLICATE_4484_return_output;
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
