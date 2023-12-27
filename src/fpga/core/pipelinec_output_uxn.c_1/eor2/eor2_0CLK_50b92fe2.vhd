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
-- BIN_OP_EQ[uxn_opcodes_h_l1111_c6_fef9]
signal BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fef9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fef9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fef9_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1111_c2_5981]
signal tmp16_MUX_uxn_opcodes_h_l1111_c2_5981_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1111_c2_5981_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1111_c2_5981]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_5981_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_5981_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1111_c2_5981]
signal result_u8_value_MUX_uxn_opcodes_h_l1111_c2_5981_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1111_c2_5981_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1111_c2_5981]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_5981_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_5981_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1111_c2_5981]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_5981_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_5981_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1111_c2_5981]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_5981_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_5981_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1111_c2_5981]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_5981_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_5981_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1111_c2_5981]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_5981_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_5981_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1111_c2_5981]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_5981_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_5981_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1111_c2_5981]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_5981_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_5981_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1111_c2_5981]
signal t16_MUX_uxn_opcodes_h_l1111_c2_5981_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1111_c2_5981_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1111_c2_5981]
signal n16_MUX_uxn_opcodes_h_l1111_c2_5981_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1111_c2_5981_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1124_c11_6d2a]
signal BIN_OP_EQ_uxn_opcodes_h_l1124_c11_6d2a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1124_c11_6d2a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1124_c11_6d2a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1124_c7_61a0]
signal tmp16_MUX_uxn_opcodes_h_l1124_c7_61a0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1124_c7_61a0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_61a0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1124_c7_61a0]
signal result_u8_value_MUX_uxn_opcodes_h_l1124_c7_61a0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1124_c7_61a0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_61a0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1124_c7_61a0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_61a0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1124_c7_61a0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_61a0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1124_c7_61a0]
signal t16_MUX_uxn_opcodes_h_l1124_c7_61a0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1124_c7_61a0]
signal n16_MUX_uxn_opcodes_h_l1124_c7_61a0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1127_c11_aec9]
signal BIN_OP_EQ_uxn_opcodes_h_l1127_c11_aec9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1127_c11_aec9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1127_c11_aec9_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1127_c7_f1ac]
signal tmp16_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1127_c7_f1ac]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1127_c7_f1ac]
signal result_u8_value_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1127_c7_f1ac]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1127_c7_f1ac]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1127_c7_f1ac]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1127_c7_f1ac]
signal t16_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1127_c7_f1ac]
signal n16_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1132_c11_f8d6]
signal BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f8d6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f8d6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f8d6_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1132_c7_dcc2]
signal tmp16_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1132_c7_dcc2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1132_c7_dcc2]
signal result_u8_value_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1132_c7_dcc2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1132_c7_dcc2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1132_c7_dcc2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1132_c7_dcc2]
signal t16_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1132_c7_dcc2]
signal n16_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1133_c3_0f4b]
signal BIN_OP_OR_uxn_opcodes_h_l1133_c3_0f4b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1133_c3_0f4b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1133_c3_0f4b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1136_c11_0be2]
signal BIN_OP_EQ_uxn_opcodes_h_l1136_c11_0be2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1136_c11_0be2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1136_c11_0be2_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1136_c7_db5b]
signal tmp16_MUX_uxn_opcodes_h_l1136_c7_db5b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1136_c7_db5b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1136_c7_db5b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1136_c7_db5b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_db5b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_db5b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_db5b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1136_c7_db5b]
signal result_u8_value_MUX_uxn_opcodes_h_l1136_c7_db5b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1136_c7_db5b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1136_c7_db5b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1136_c7_db5b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_db5b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_db5b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_db5b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1136_c7_db5b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_db5b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_db5b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_db5b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1136_c7_db5b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_db5b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_db5b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_db5b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1136_c7_db5b]
signal n16_MUX_uxn_opcodes_h_l1136_c7_db5b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1136_c7_db5b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1136_c7_db5b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1140_c11_1a14]
signal BIN_OP_EQ_uxn_opcodes_h_l1140_c11_1a14_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1140_c11_1a14_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1140_c11_1a14_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1140_c7_6e97]
signal tmp16_MUX_uxn_opcodes_h_l1140_c7_6e97_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1140_c7_6e97_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1140_c7_6e97_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1140_c7_6e97]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_6e97_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_6e97_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_6e97_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1140_c7_6e97]
signal result_u8_value_MUX_uxn_opcodes_h_l1140_c7_6e97_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1140_c7_6e97_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1140_c7_6e97_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1140_c7_6e97]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_6e97_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_6e97_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_6e97_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1140_c7_6e97]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_6e97_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_6e97_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_6e97_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1140_c7_6e97]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_6e97_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_6e97_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_6e97_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1140_c7_6e97]
signal n16_MUX_uxn_opcodes_h_l1140_c7_6e97_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1140_c7_6e97_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1140_c7_6e97_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1141_c3_380b]
signal BIN_OP_OR_uxn_opcodes_h_l1141_c3_380b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1141_c3_380b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1141_c3_380b_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l1142_c11_15d0]
signal BIN_OP_XOR_uxn_opcodes_h_l1142_c11_15d0_left : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1142_c11_15d0_right : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1142_c11_15d0_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1143_c30_fc81]
signal sp_relative_shift_uxn_opcodes_h_l1143_c30_fc81_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1143_c30_fc81_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1143_c30_fc81_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1143_c30_fc81_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1148_c11_ae43]
signal BIN_OP_EQ_uxn_opcodes_h_l1148_c11_ae43_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1148_c11_ae43_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1148_c11_ae43_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1148_c7_bce3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_bce3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_bce3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_bce3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_bce3_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1148_c7_bce3]
signal result_u8_value_MUX_uxn_opcodes_h_l1148_c7_bce3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1148_c7_bce3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1148_c7_bce3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1148_c7_bce3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1148_c7_bce3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_bce3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_bce3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_bce3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_bce3_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1148_c7_bce3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_bce3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_bce3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_bce3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_bce3_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1151_c31_59af]
signal CONST_SR_8_uxn_opcodes_h_l1151_c31_59af_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1151_c31_59af_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_0f5d
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_0f5d_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_0f5d_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fef9
BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fef9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fef9_left,
BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fef9_right,
BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fef9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1111_c2_5981
tmp16_MUX_uxn_opcodes_h_l1111_c2_5981 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1111_c2_5981_cond,
tmp16_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue,
tmp16_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse,
tmp16_MUX_uxn_opcodes_h_l1111_c2_5981_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_5981
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_5981 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_5981_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_5981_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1111_c2_5981
result_u8_value_MUX_uxn_opcodes_h_l1111_c2_5981 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1111_c2_5981_cond,
result_u8_value_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1111_c2_5981_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_5981
result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_5981 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_5981_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_5981_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_5981
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_5981 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_5981_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_5981_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_5981
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_5981 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_5981_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_5981_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_5981
result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_5981 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_5981_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_5981_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_5981
result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_5981 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_5981_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_5981_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_5981
result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_5981 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_5981_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_5981_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_5981
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_5981 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_5981_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_5981_return_output);

-- t16_MUX_uxn_opcodes_h_l1111_c2_5981
t16_MUX_uxn_opcodes_h_l1111_c2_5981 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1111_c2_5981_cond,
t16_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue,
t16_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse,
t16_MUX_uxn_opcodes_h_l1111_c2_5981_return_output);

-- n16_MUX_uxn_opcodes_h_l1111_c2_5981
n16_MUX_uxn_opcodes_h_l1111_c2_5981 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1111_c2_5981_cond,
n16_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue,
n16_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse,
n16_MUX_uxn_opcodes_h_l1111_c2_5981_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1124_c11_6d2a
BIN_OP_EQ_uxn_opcodes_h_l1124_c11_6d2a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1124_c11_6d2a_left,
BIN_OP_EQ_uxn_opcodes_h_l1124_c11_6d2a_right,
BIN_OP_EQ_uxn_opcodes_h_l1124_c11_6d2a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1124_c7_61a0
tmp16_MUX_uxn_opcodes_h_l1124_c7_61a0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1124_c7_61a0_cond,
tmp16_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue,
tmp16_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse,
tmp16_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_61a0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_61a0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_61a0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1124_c7_61a0
result_u8_value_MUX_uxn_opcodes_h_l1124_c7_61a0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1124_c7_61a0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_61a0
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_61a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_61a0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_61a0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_61a0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_61a0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_61a0
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_61a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_61a0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output);

-- t16_MUX_uxn_opcodes_h_l1124_c7_61a0
t16_MUX_uxn_opcodes_h_l1124_c7_61a0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1124_c7_61a0_cond,
t16_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue,
t16_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse,
t16_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output);

-- n16_MUX_uxn_opcodes_h_l1124_c7_61a0
n16_MUX_uxn_opcodes_h_l1124_c7_61a0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1124_c7_61a0_cond,
n16_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue,
n16_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse,
n16_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1127_c11_aec9
BIN_OP_EQ_uxn_opcodes_h_l1127_c11_aec9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1127_c11_aec9_left,
BIN_OP_EQ_uxn_opcodes_h_l1127_c11_aec9_right,
BIN_OP_EQ_uxn_opcodes_h_l1127_c11_aec9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1127_c7_f1ac
tmp16_MUX_uxn_opcodes_h_l1127_c7_f1ac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond,
tmp16_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue,
tmp16_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse,
tmp16_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_f1ac
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_f1ac : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1127_c7_f1ac
result_u8_value_MUX_uxn_opcodes_h_l1127_c7_f1ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond,
result_u8_value_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_f1ac
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_f1ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_f1ac
result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_f1ac : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_f1ac
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_f1ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output);

-- t16_MUX_uxn_opcodes_h_l1127_c7_f1ac
t16_MUX_uxn_opcodes_h_l1127_c7_f1ac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond,
t16_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue,
t16_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse,
t16_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output);

-- n16_MUX_uxn_opcodes_h_l1127_c7_f1ac
n16_MUX_uxn_opcodes_h_l1127_c7_f1ac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond,
n16_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue,
n16_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse,
n16_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f8d6
BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f8d6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f8d6_left,
BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f8d6_right,
BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f8d6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1132_c7_dcc2
tmp16_MUX_uxn_opcodes_h_l1132_c7_dcc2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond,
tmp16_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue,
tmp16_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse,
tmp16_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_dcc2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_dcc2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1132_c7_dcc2
result_u8_value_MUX_uxn_opcodes_h_l1132_c7_dcc2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_dcc2
result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_dcc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_dcc2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_dcc2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_dcc2
result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_dcc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output);

-- t16_MUX_uxn_opcodes_h_l1132_c7_dcc2
t16_MUX_uxn_opcodes_h_l1132_c7_dcc2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond,
t16_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue,
t16_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse,
t16_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output);

-- n16_MUX_uxn_opcodes_h_l1132_c7_dcc2
n16_MUX_uxn_opcodes_h_l1132_c7_dcc2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond,
n16_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue,
n16_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse,
n16_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1133_c3_0f4b
BIN_OP_OR_uxn_opcodes_h_l1133_c3_0f4b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1133_c3_0f4b_left,
BIN_OP_OR_uxn_opcodes_h_l1133_c3_0f4b_right,
BIN_OP_OR_uxn_opcodes_h_l1133_c3_0f4b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1136_c11_0be2
BIN_OP_EQ_uxn_opcodes_h_l1136_c11_0be2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1136_c11_0be2_left,
BIN_OP_EQ_uxn_opcodes_h_l1136_c11_0be2_right,
BIN_OP_EQ_uxn_opcodes_h_l1136_c11_0be2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1136_c7_db5b
tmp16_MUX_uxn_opcodes_h_l1136_c7_db5b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1136_c7_db5b_cond,
tmp16_MUX_uxn_opcodes_h_l1136_c7_db5b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1136_c7_db5b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_db5b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_db5b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_db5b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_db5b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_db5b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1136_c7_db5b
result_u8_value_MUX_uxn_opcodes_h_l1136_c7_db5b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1136_c7_db5b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1136_c7_db5b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1136_c7_db5b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_db5b
result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_db5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_db5b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_db5b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_db5b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_db5b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_db5b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_db5b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_db5b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_db5b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_db5b
result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_db5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_db5b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_db5b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_db5b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output);

-- n16_MUX_uxn_opcodes_h_l1136_c7_db5b
n16_MUX_uxn_opcodes_h_l1136_c7_db5b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1136_c7_db5b_cond,
n16_MUX_uxn_opcodes_h_l1136_c7_db5b_iftrue,
n16_MUX_uxn_opcodes_h_l1136_c7_db5b_iffalse,
n16_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1140_c11_1a14
BIN_OP_EQ_uxn_opcodes_h_l1140_c11_1a14 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1140_c11_1a14_left,
BIN_OP_EQ_uxn_opcodes_h_l1140_c11_1a14_right,
BIN_OP_EQ_uxn_opcodes_h_l1140_c11_1a14_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1140_c7_6e97
tmp16_MUX_uxn_opcodes_h_l1140_c7_6e97 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1140_c7_6e97_cond,
tmp16_MUX_uxn_opcodes_h_l1140_c7_6e97_iftrue,
tmp16_MUX_uxn_opcodes_h_l1140_c7_6e97_iffalse,
tmp16_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_6e97
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_6e97 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_6e97_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_6e97_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_6e97_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1140_c7_6e97
result_u8_value_MUX_uxn_opcodes_h_l1140_c7_6e97 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1140_c7_6e97_cond,
result_u8_value_MUX_uxn_opcodes_h_l1140_c7_6e97_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1140_c7_6e97_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_6e97
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_6e97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_6e97_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_6e97_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_6e97_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_6e97
result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_6e97 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_6e97_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_6e97_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_6e97_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_6e97
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_6e97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_6e97_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_6e97_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_6e97_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output);

-- n16_MUX_uxn_opcodes_h_l1140_c7_6e97
n16_MUX_uxn_opcodes_h_l1140_c7_6e97 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1140_c7_6e97_cond,
n16_MUX_uxn_opcodes_h_l1140_c7_6e97_iftrue,
n16_MUX_uxn_opcodes_h_l1140_c7_6e97_iffalse,
n16_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1141_c3_380b
BIN_OP_OR_uxn_opcodes_h_l1141_c3_380b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1141_c3_380b_left,
BIN_OP_OR_uxn_opcodes_h_l1141_c3_380b_right,
BIN_OP_OR_uxn_opcodes_h_l1141_c3_380b_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l1142_c11_15d0
BIN_OP_XOR_uxn_opcodes_h_l1142_c11_15d0 : entity work.BIN_OP_XOR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l1142_c11_15d0_left,
BIN_OP_XOR_uxn_opcodes_h_l1142_c11_15d0_right,
BIN_OP_XOR_uxn_opcodes_h_l1142_c11_15d0_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1143_c30_fc81
sp_relative_shift_uxn_opcodes_h_l1143_c30_fc81 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1143_c30_fc81_ins,
sp_relative_shift_uxn_opcodes_h_l1143_c30_fc81_x,
sp_relative_shift_uxn_opcodes_h_l1143_c30_fc81_y,
sp_relative_shift_uxn_opcodes_h_l1143_c30_fc81_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1148_c11_ae43
BIN_OP_EQ_uxn_opcodes_h_l1148_c11_ae43 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1148_c11_ae43_left,
BIN_OP_EQ_uxn_opcodes_h_l1148_c11_ae43_right,
BIN_OP_EQ_uxn_opcodes_h_l1148_c11_ae43_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_bce3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_bce3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_bce3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_bce3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_bce3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_bce3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1148_c7_bce3
result_u8_value_MUX_uxn_opcodes_h_l1148_c7_bce3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1148_c7_bce3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1148_c7_bce3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1148_c7_bce3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1148_c7_bce3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_bce3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_bce3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_bce3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_bce3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_bce3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_bce3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_bce3
result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_bce3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_bce3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_bce3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_bce3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_bce3_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1151_c31_59af
CONST_SR_8_uxn_opcodes_h_l1151_c31_59af : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1151_c31_59af_x,
CONST_SR_8_uxn_opcodes_h_l1151_c31_59af_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_0f5d
CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_0f5d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_0f5d_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_0f5d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fef9_return_output,
 tmp16_MUX_uxn_opcodes_h_l1111_c2_5981_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_5981_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1111_c2_5981_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_5981_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_5981_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_5981_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_5981_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_5981_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_5981_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_5981_return_output,
 t16_MUX_uxn_opcodes_h_l1111_c2_5981_return_output,
 n16_MUX_uxn_opcodes_h_l1111_c2_5981_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1124_c11_6d2a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output,
 t16_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output,
 n16_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1127_c11_aec9_return_output,
 tmp16_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output,
 t16_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output,
 n16_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f8d6_return_output,
 tmp16_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output,
 t16_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output,
 n16_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1133_c3_0f4b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1136_c11_0be2_return_output,
 tmp16_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output,
 n16_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1140_c11_1a14_return_output,
 tmp16_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output,
 n16_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1141_c3_380b_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l1142_c11_15d0_return_output,
 sp_relative_shift_uxn_opcodes_h_l1143_c30_fc81_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1148_c11_ae43_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_bce3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1148_c7_bce3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_bce3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_bce3_return_output,
 CONST_SR_8_uxn_opcodes_h_l1151_c31_59af_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_0f5d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fef9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fef9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fef9_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_5981_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_5981_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1121_c3_65f5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_5981_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_5981_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_5981_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_5981_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1111_c2_5981_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_5981_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_5981_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1111_c2_5981_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_5981_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_5981_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_5981_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_5981_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1116_c3_f8b9 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_5981_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_5981_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1111_c2_5981_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_5981_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_5981_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1111_c2_5981_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_5981_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_5981_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_5981_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_5981_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1111_c2_5981_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1111_c2_5981_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1111_c2_5981_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1111_c2_5981_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_6d2a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_6d2a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_6d2a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_61a0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1125_c3_a1e7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_61a0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_61a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_61a0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_61a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_61a0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1124_c7_61a0_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1124_c7_61a0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_aec9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_aec9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_aec9_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1130_c3_e3e2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f8d6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f8d6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f8d6_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1134_c3_ec91 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_0f4b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_0f4b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_0f4b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_0be2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_0be2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_0be2_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_db5b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_db5b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_db5b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_db5b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_db5b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_db5b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_db5b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_db5b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_db5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_db5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_db5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_db5b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_db5b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_db5b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_db5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_db5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_db5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_db5b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1136_c7_db5b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1136_c7_db5b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1136_c7_db5b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_1a14_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_1a14_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_1a14_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_6e97_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_6e97_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_6e97_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_6e97_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1145_c3_7804 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_6e97_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_bce3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_6e97_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_6e97_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_6e97_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_bce3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_6e97_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_6e97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_6e97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_6e97_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_6e97_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_6e97_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_bce3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_6e97_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_6e97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_6e97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_bce3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_6e97_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1140_c7_6e97_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1140_c7_6e97_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1140_c7_6e97_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_380b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_380b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_380b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_15d0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_15d0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_15d0_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_fc81_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_fc81_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_fc81_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_fc81_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1146_c21_3a33_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_ae43_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_ae43_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_ae43_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_bce3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1150_c3_2ff4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_bce3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_bce3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_bce3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_bce3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_bce3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_bce3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1149_c3_05c1 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_bce3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_bce3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_bce3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_bce3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_bce3_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1151_c31_59af_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1151_c31_59af_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1151_c21_2363_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1148_l1136_l1132_l1127_l1111_l1124_DUPLICATE_82e9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1136_l1140_l1132_l1127_l1124_DUPLICATE_6fed_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1148_l1136_l1132_l1127_l1124_DUPLICATE_d529_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1148_l1136_l1140_l1132_l1127_l1124_DUPLICATE_5d0d_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1128_l1133_l1141_l1137_DUPLICATE_d4e4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_0f5d_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_0f5d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1148_l1136_DUPLICATE_09b7_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l1155_l1107_DUPLICATE_f8da_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1125_c3_a1e7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1125_c3_a1e7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_0be2_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_1a14_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_aec9_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_ae43_right := to_unsigned(6, 3);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1145_c3_7804 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_6e97_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1145_c3_7804;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1121_c3_65f5 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1121_c3_65f5;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1130_c3_e3e2 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1130_c3_e3e2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_6d2a_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1116_c3_f8b9 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1116_c3_f8b9;
     VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_fc81_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fef9_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_fc81_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_bce3_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1149_c3_05c1 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_bce3_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1149_c3_05c1;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f8d6_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_6e97_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1150_c3_2ff4 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_bce3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1150_c3_2ff4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1134_c3_ec91 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1134_c3_ec91;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_fc81_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_380b_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1140_c7_6e97_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fef9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_6d2a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_aec9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f8d6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_0be2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_1a14_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_ae43_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_0f4b_left := t16;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_15d0_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1151_c31_59af_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_db5b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_6e97_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1124_c11_6d2a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1124_c11_6d2a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_6d2a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1124_c11_6d2a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_6d2a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_6d2a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1124_c11_6d2a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1140_c11_1a14] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1140_c11_1a14_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_1a14_left;
     BIN_OP_EQ_uxn_opcodes_h_l1140_c11_1a14_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_1a14_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_1a14_return_output := BIN_OP_EQ_uxn_opcodes_h_l1140_c11_1a14_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1148_l1136_l1132_l1127_l1124_DUPLICATE_d529 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1148_l1136_l1132_l1127_l1124_DUPLICATE_d529_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1136_c11_0be2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1136_c11_0be2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_0be2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1136_c11_0be2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_0be2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_0be2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1136_c11_0be2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1111_c6_fef9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fef9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fef9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fef9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fef9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fef9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fef9_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1151_c31_59af] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1151_c31_59af_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1151_c31_59af_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1151_c31_59af_return_output := CONST_SR_8_uxn_opcodes_h_l1151_c31_59af_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1143_c30_fc81] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1143_c30_fc81_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_fc81_ins;
     sp_relative_shift_uxn_opcodes_h_l1143_c30_fc81_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_fc81_x;
     sp_relative_shift_uxn_opcodes_h_l1143_c30_fc81_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_fc81_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_fc81_return_output := sp_relative_shift_uxn_opcodes_h_l1143_c30_fc81_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1148_l1136_l1140_l1132_l1127_l1124_DUPLICATE_5d0d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1148_l1136_l1140_l1132_l1127_l1124_DUPLICATE_5d0d_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1127_c11_aec9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1127_c11_aec9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_aec9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1127_c11_aec9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_aec9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_aec9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1127_c11_aec9_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1148_l1136_l1132_l1127_l1111_l1124_DUPLICATE_82e9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1148_l1136_l1132_l1127_l1111_l1124_DUPLICATE_82e9_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1132_c11_f8d6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f8d6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f8d6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f8d6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f8d6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f8d6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f8d6_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1111_c2_5981] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1111_c2_5981_return_output := result.is_stack_index_flipped;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1111_c2_5981] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1111_c2_5981_return_output := result.is_pc_updated;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1111_c2_5981] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1111_c2_5981_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1148_c11_ae43] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1148_c11_ae43_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_ae43_left;
     BIN_OP_EQ_uxn_opcodes_h_l1148_c11_ae43_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_ae43_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_ae43_return_output := BIN_OP_EQ_uxn_opcodes_h_l1148_c11_ae43_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1128_l1133_l1141_l1137_DUPLICATE_d4e4 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1128_l1133_l1141_l1137_DUPLICATE_d4e4_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1148_l1136_DUPLICATE_09b7 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1148_l1136_DUPLICATE_09b7_return_output := result.stack_address_sp_offset;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1111_c2_5981] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1111_c2_5981_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1136_l1140_l1132_l1127_l1124_DUPLICATE_6fed LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1136_l1140_l1132_l1127_l1124_DUPLICATE_6fed_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1111_c2_5981_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fef9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_5981_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fef9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_5981_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fef9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_5981_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fef9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_5981_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fef9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_5981_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fef9_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_5981_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fef9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_5981_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fef9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_5981_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fef9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_5981_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fef9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1111_c2_5981_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fef9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_5981_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fef9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1124_c7_61a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_6d2a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_61a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_6d2a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_61a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_6d2a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_61a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_6d2a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_61a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_6d2a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_61a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_6d2a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1124_c7_61a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_6d2a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_61a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_6d2a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_aec9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_aec9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_aec9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_aec9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_aec9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_aec9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_aec9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_aec9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f8d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f8d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f8d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f8d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f8d6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f8d6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f8d6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_f8d6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1136_c7_db5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_0be2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_db5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_0be2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_db5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_0be2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_db5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_0be2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_db5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_0be2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_db5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_0be2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_db5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_0be2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1140_c7_6e97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_1a14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_6e97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_1a14_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_6e97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_1a14_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_6e97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_1a14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_6e97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_1a14_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_6e97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_1a14_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_6e97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_1a14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_bce3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_ae43_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_bce3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_ae43_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_bce3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_ae43_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_bce3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_ae43_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_0f4b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1128_l1133_l1141_l1137_DUPLICATE_d4e4_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_380b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1128_l1133_l1141_l1137_DUPLICATE_d4e4_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_0f5d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1128_l1133_l1141_l1137_DUPLICATE_d4e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1148_l1136_l1132_l1127_l1124_DUPLICATE_d529_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1148_l1136_l1132_l1127_l1124_DUPLICATE_d529_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1148_l1136_l1132_l1127_l1124_DUPLICATE_d529_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_db5b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1148_l1136_l1132_l1127_l1124_DUPLICATE_d529_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_bce3_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1148_l1136_l1132_l1127_l1124_DUPLICATE_d529_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1148_l1136_l1140_l1132_l1127_l1124_DUPLICATE_5d0d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1148_l1136_l1140_l1132_l1127_l1124_DUPLICATE_5d0d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1148_l1136_l1140_l1132_l1127_l1124_DUPLICATE_5d0d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_db5b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1148_l1136_l1140_l1132_l1127_l1124_DUPLICATE_5d0d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_6e97_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1148_l1136_l1140_l1132_l1127_l1124_DUPLICATE_5d0d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_bce3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1148_l1136_l1140_l1132_l1127_l1124_DUPLICATE_5d0d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1136_l1140_l1132_l1127_l1124_DUPLICATE_6fed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1136_l1140_l1132_l1127_l1124_DUPLICATE_6fed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1136_l1140_l1132_l1127_l1124_DUPLICATE_6fed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_db5b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1136_l1140_l1132_l1127_l1124_DUPLICATE_6fed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_6e97_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1136_l1140_l1132_l1127_l1124_DUPLICATE_6fed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_db5b_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1148_l1136_DUPLICATE_09b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_bce3_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1148_l1136_DUPLICATE_09b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1148_l1136_l1132_l1127_l1111_l1124_DUPLICATE_82e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1148_l1136_l1132_l1127_l1111_l1124_DUPLICATE_82e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1148_l1136_l1132_l1127_l1111_l1124_DUPLICATE_82e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1148_l1136_l1132_l1127_l1111_l1124_DUPLICATE_82e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_db5b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1148_l1136_l1132_l1127_l1111_l1124_DUPLICATE_82e9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_bce3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1148_l1136_l1132_l1127_l1111_l1124_DUPLICATE_82e9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1111_c2_5981_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1111_c2_5981_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1111_c2_5981_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1111_c2_5981_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_6e97_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_fc81_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1148_c7_bce3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_bce3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_bce3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_bce3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_bce3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_bce3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_bce3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_bce3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_bce3_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1111_c2_5981] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_5981_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_5981_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_5981_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_5981_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1111_c2_5981] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_5981_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_5981_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_5981_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_5981_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1111_c2_5981] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_5981_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_5981_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_5981_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_5981_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1133_c3_0f4b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1133_c3_0f4b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_0f4b_left;
     BIN_OP_OR_uxn_opcodes_h_l1133_c3_0f4b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_0f4b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_0f4b_return_output := BIN_OP_OR_uxn_opcodes_h_l1133_c3_0f4b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1151_c21_2363] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1151_c21_2363_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1151_c31_59af_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1148_c7_bce3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_bce3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_bce3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_bce3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_bce3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_bce3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_bce3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_bce3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_bce3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1148_c7_bce3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_bce3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_bce3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_bce3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_bce3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_bce3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_bce3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_bce3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_bce3_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1141_c3_380b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1141_c3_380b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_380b_left;
     BIN_OP_OR_uxn_opcodes_h_l1141_c3_380b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_380b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_380b_return_output := BIN_OP_OR_uxn_opcodes_h_l1141_c3_380b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1140_c7_6e97] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_6e97_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_6e97_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_6e97_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_6e97_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_6e97_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_6e97_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_0f5d LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_0f5d_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_0f5d_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_0f5d_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_0f5d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1111_c2_5981] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_5981_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_5981_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_5981_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_5981_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_0f4b_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_15d0_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_380b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1140_c7_6e97_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_380b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_bce3_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1151_c21_2363_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1136_c7_db5b_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_0f5d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_0f5d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_6e97_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_bce3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_db5b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_6e97_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_bce3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_6e97_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_bce3_return_output;
     -- t16_MUX[uxn_opcodes_h_l1132_c7_dcc2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond <= VAR_t16_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond;
     t16_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue;
     t16_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output := t16_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1136_c7_db5b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_db5b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_db5b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_db5b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_db5b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_db5b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_db5b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1140_c7_6e97] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1140_c7_6e97_cond <= VAR_n16_MUX_uxn_opcodes_h_l1140_c7_6e97_cond;
     n16_MUX_uxn_opcodes_h_l1140_c7_6e97_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1140_c7_6e97_iftrue;
     n16_MUX_uxn_opcodes_h_l1140_c7_6e97_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1140_c7_6e97_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output := n16_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1148_c7_bce3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1148_c7_bce3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_bce3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1148_c7_bce3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_bce3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1148_c7_bce3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_bce3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_bce3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1148_c7_bce3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1140_c7_6e97] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_6e97_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_6e97_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_6e97_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_6e97_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_6e97_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_6e97_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1140_c7_6e97] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_6e97_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_6e97_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_6e97_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_6e97_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_6e97_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_6e97_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1140_c7_6e97] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_6e97_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_6e97_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_6e97_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_6e97_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_6e97_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_6e97_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output;

     -- BIN_OP_XOR[uxn_opcodes_h_l1142_c11_15d0] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l1142_c11_15d0_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_15d0_left;
     BIN_OP_XOR_uxn_opcodes_h_l1142_c11_15d0_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_15d0_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_15d0_return_output := BIN_OP_XOR_uxn_opcodes_h_l1142_c11_15d0_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_6e97_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_15d0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1136_c7_db5b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_db5b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_db5b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_db5b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_6e97_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_bce3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output;
     -- t16_MUX[uxn_opcodes_h_l1127_c7_f1ac] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond <= VAR_t16_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond;
     t16_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue;
     t16_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output := t16_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1146_c21_3a33] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1146_c21_3a33_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_15d0_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1136_c7_db5b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_db5b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_db5b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_db5b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_db5b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_db5b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_db5b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1140_c7_6e97] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1140_c7_6e97_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_6e97_cond;
     tmp16_MUX_uxn_opcodes_h_l1140_c7_6e97_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_6e97_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1140_c7_6e97_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_6e97_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output := tmp16_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1136_c7_db5b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_db5b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_db5b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_db5b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_db5b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_db5b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_db5b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1132_c7_dcc2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output;

     -- n16_MUX[uxn_opcodes_h_l1136_c7_db5b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1136_c7_db5b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1136_c7_db5b_cond;
     n16_MUX_uxn_opcodes_h_l1136_c7_db5b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1136_c7_db5b_iftrue;
     n16_MUX_uxn_opcodes_h_l1136_c7_db5b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1136_c7_db5b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output := n16_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1136_c7_db5b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_db5b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_db5b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_db5b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_db5b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_db5b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_db5b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_6e97_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1146_c21_3a33_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_db5b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output;
     -- t16_MUX[uxn_opcodes_h_l1124_c7_61a0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1124_c7_61a0_cond <= VAR_t16_MUX_uxn_opcodes_h_l1124_c7_61a0_cond;
     t16_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue;
     t16_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output := t16_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1127_c7_f1ac] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1136_c7_db5b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1136_c7_db5b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_db5b_cond;
     tmp16_MUX_uxn_opcodes_h_l1136_c7_db5b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_db5b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1136_c7_db5b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_db5b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output := tmp16_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1132_c7_dcc2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1140_c7_6e97] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1140_c7_6e97_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_6e97_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1140_c7_6e97_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_6e97_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1140_c7_6e97_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_6e97_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output := result_u8_value_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1132_c7_dcc2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output;

     -- n16_MUX[uxn_opcodes_h_l1132_c7_dcc2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond;
     n16_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue;
     n16_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output := n16_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1132_c7_dcc2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_db5b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_6e97_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1132_c7_dcc2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond;
     tmp16_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output := tmp16_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1127_c7_f1ac] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output;

     -- n16_MUX[uxn_opcodes_h_l1127_c7_f1ac] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond <= VAR_n16_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond;
     n16_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue;
     n16_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output := n16_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1127_c7_f1ac] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1124_c7_61a0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_61a0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_61a0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1127_c7_f1ac] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1136_c7_db5b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1136_c7_db5b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_db5b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1136_c7_db5b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_db5b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1136_c7_db5b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_db5b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1111_c2_5981] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1111_c2_5981_cond <= VAR_t16_MUX_uxn_opcodes_h_l1111_c2_5981_cond;
     t16_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue;
     t16_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1111_c2_5981_return_output := t16_MUX_uxn_opcodes_h_l1111_c2_5981_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_db5b_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1111_c2_5981_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1124_c7_61a0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_61a0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_61a0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1111_c2_5981] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_5981_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_5981_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_5981_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_5981_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1124_c7_61a0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_61a0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_61a0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1124_c7_61a0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_61a0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_61a0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1127_c7_f1ac] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond;
     tmp16_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output := tmp16_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output;

     -- n16_MUX[uxn_opcodes_h_l1124_c7_61a0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1124_c7_61a0_cond <= VAR_n16_MUX_uxn_opcodes_h_l1124_c7_61a0_cond;
     n16_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue;
     n16_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output := n16_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1132_c7_dcc2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_dcc2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_dcc2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_dcc2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_dcc2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output;
     -- n16_MUX[uxn_opcodes_h_l1111_c2_5981] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1111_c2_5981_cond <= VAR_n16_MUX_uxn_opcodes_h_l1111_c2_5981_cond;
     n16_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue;
     n16_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1111_c2_5981_return_output := n16_MUX_uxn_opcodes_h_l1111_c2_5981_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1124_c7_61a0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1124_c7_61a0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_61a0_cond;
     tmp16_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output := tmp16_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1127_c7_f1ac] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_f1ac_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_f1ac_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_f1ac_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output := result_u8_value_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1111_c2_5981] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_5981_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_5981_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_5981_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_5981_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1111_c2_5981] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_5981_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_5981_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_5981_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_5981_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1111_c2_5981] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_5981_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_5981_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_5981_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_5981_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1111_c2_5981_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_f1ac_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1124_c7_61a0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1124_c7_61a0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_61a0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_61a0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_61a0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1111_c2_5981] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1111_c2_5981_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_5981_cond;
     tmp16_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_5981_return_output := tmp16_MUX_uxn_opcodes_h_l1111_c2_5981_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_61a0_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_5981_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1111_c2_5981] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1111_c2_5981_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_5981_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_5981_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_5981_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_5981_return_output := result_u8_value_MUX_uxn_opcodes_h_l1111_c2_5981_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l1155_l1107_DUPLICATE_f8da LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l1155_l1107_DUPLICATE_f8da_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b856(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_5981_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_5981_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_5981_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_5981_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_5981_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_5981_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_5981_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_5981_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_5981_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l1155_l1107_DUPLICATE_f8da_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l1155_l1107_DUPLICATE_f8da_return_output;
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
