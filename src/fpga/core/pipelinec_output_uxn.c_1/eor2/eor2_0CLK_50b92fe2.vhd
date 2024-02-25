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
-- BIN_OP_EQ[uxn_opcodes_h_l1111_c6_1f82]
signal BIN_OP_EQ_uxn_opcodes_h_l1111_c6_1f82_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1111_c6_1f82_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1111_c6_1f82_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1111_c2_28b9]
signal t16_MUX_uxn_opcodes_h_l1111_c2_28b9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1111_c2_28b9]
signal tmp16_MUX_uxn_opcodes_h_l1111_c2_28b9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1111_c2_28b9]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_28b9_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1111_c2_28b9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_28b9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1111_c2_28b9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_28b9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1111_c2_28b9]
signal result_u8_value_MUX_uxn_opcodes_h_l1111_c2_28b9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1111_c2_28b9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_28b9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1111_c2_28b9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_28b9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1111_c2_28b9]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1111_c2_28b9]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1111_c2_28b9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_28b9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1111_c2_28b9]
signal n16_MUX_uxn_opcodes_h_l1111_c2_28b9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1124_c11_03c7]
signal BIN_OP_EQ_uxn_opcodes_h_l1124_c11_03c7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1124_c11_03c7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1124_c11_03c7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1124_c7_2b10]
signal t16_MUX_uxn_opcodes_h_l1124_c7_2b10_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1124_c7_2b10]
signal tmp16_MUX_uxn_opcodes_h_l1124_c7_2b10_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1124_c7_2b10]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_2b10_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1124_c7_2b10]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_2b10_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1124_c7_2b10]
signal result_u8_value_MUX_uxn_opcodes_h_l1124_c7_2b10_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1124_c7_2b10]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_2b10_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1124_c7_2b10]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_2b10_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1124_c7_2b10]
signal n16_MUX_uxn_opcodes_h_l1124_c7_2b10_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1127_c11_832e]
signal BIN_OP_EQ_uxn_opcodes_h_l1127_c11_832e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1127_c11_832e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1127_c11_832e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1127_c7_dcfa]
signal t16_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1127_c7_dcfa]
signal tmp16_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1127_c7_dcfa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1127_c7_dcfa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1127_c7_dcfa]
signal result_u8_value_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1127_c7_dcfa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1127_c7_dcfa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1127_c7_dcfa]
signal n16_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1132_c11_9196]
signal BIN_OP_EQ_uxn_opcodes_h_l1132_c11_9196_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1132_c11_9196_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1132_c11_9196_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1132_c7_3c53]
signal t16_MUX_uxn_opcodes_h_l1132_c7_3c53_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1132_c7_3c53]
signal tmp16_MUX_uxn_opcodes_h_l1132_c7_3c53_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1132_c7_3c53]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_3c53_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1132_c7_3c53]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_3c53_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1132_c7_3c53]
signal result_u8_value_MUX_uxn_opcodes_h_l1132_c7_3c53_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1132_c7_3c53]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_3c53_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1132_c7_3c53]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_3c53_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1132_c7_3c53]
signal n16_MUX_uxn_opcodes_h_l1132_c7_3c53_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1133_c3_f8f5]
signal BIN_OP_OR_uxn_opcodes_h_l1133_c3_f8f5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1133_c3_f8f5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1133_c3_f8f5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1136_c11_3369]
signal BIN_OP_EQ_uxn_opcodes_h_l1136_c11_3369_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1136_c11_3369_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1136_c11_3369_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1136_c7_8fff]
signal tmp16_MUX_uxn_opcodes_h_l1136_c7_8fff_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1136_c7_8fff_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1136_c7_8fff_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1136_c7_8fff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_8fff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_8fff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_8fff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1136_c7_8fff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_8fff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_8fff_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_8fff_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1136_c7_8fff]
signal result_u8_value_MUX_uxn_opcodes_h_l1136_c7_8fff_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1136_c7_8fff_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1136_c7_8fff_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1136_c7_8fff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_8fff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_8fff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_8fff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1136_c7_8fff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_8fff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_8fff_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_8fff_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1136_c7_8fff]
signal n16_MUX_uxn_opcodes_h_l1136_c7_8fff_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1136_c7_8fff_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1136_c7_8fff_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1140_c11_8d3b]
signal BIN_OP_EQ_uxn_opcodes_h_l1140_c11_8d3b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1140_c11_8d3b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1140_c11_8d3b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1140_c7_e70c]
signal tmp16_MUX_uxn_opcodes_h_l1140_c7_e70c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1140_c7_e70c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1140_c7_e70c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1140_c7_e70c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_e70c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_e70c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_e70c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1140_c7_e70c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_e70c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_e70c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_e70c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1140_c7_e70c]
signal result_u8_value_MUX_uxn_opcodes_h_l1140_c7_e70c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1140_c7_e70c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1140_c7_e70c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1140_c7_e70c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_e70c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_e70c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_e70c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1140_c7_e70c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_e70c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_e70c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_e70c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1140_c7_e70c]
signal n16_MUX_uxn_opcodes_h_l1140_c7_e70c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1140_c7_e70c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1140_c7_e70c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1141_c3_89f9]
signal BIN_OP_OR_uxn_opcodes_h_l1141_c3_89f9_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1141_c3_89f9_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1141_c3_89f9_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l1142_c11_786c]
signal BIN_OP_XOR_uxn_opcodes_h_l1142_c11_786c_left : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1142_c11_786c_right : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1142_c11_786c_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1143_c30_c2c1]
signal sp_relative_shift_uxn_opcodes_h_l1143_c30_c2c1_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1143_c30_c2c1_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1143_c30_c2c1_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1143_c30_c2c1_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1148_c11_80c7]
signal BIN_OP_EQ_uxn_opcodes_h_l1148_c11_80c7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1148_c11_80c7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1148_c11_80c7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1148_c7_467d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_467d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_467d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_467d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_467d_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1148_c7_467d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_467d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_467d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_467d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_467d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1148_c7_467d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_467d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_467d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_467d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_467d_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1148_c7_467d]
signal result_u8_value_MUX_uxn_opcodes_h_l1148_c7_467d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1148_c7_467d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1148_c7_467d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1148_c7_467d_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1151_c31_fc5a]
signal CONST_SR_8_uxn_opcodes_h_l1151_c31_fc5a_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1151_c31_fc5a_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_7c93
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_7c93_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_7c93_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1111_c6_1f82
BIN_OP_EQ_uxn_opcodes_h_l1111_c6_1f82 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1111_c6_1f82_left,
BIN_OP_EQ_uxn_opcodes_h_l1111_c6_1f82_right,
BIN_OP_EQ_uxn_opcodes_h_l1111_c6_1f82_return_output);

-- t16_MUX_uxn_opcodes_h_l1111_c2_28b9
t16_MUX_uxn_opcodes_h_l1111_c2_28b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1111_c2_28b9_cond,
t16_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue,
t16_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse,
t16_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1111_c2_28b9
tmp16_MUX_uxn_opcodes_h_l1111_c2_28b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1111_c2_28b9_cond,
tmp16_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue,
tmp16_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse,
tmp16_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_28b9
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_28b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_28b9_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_28b9
result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_28b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_28b9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_28b9
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_28b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_28b9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1111_c2_28b9
result_u8_value_MUX_uxn_opcodes_h_l1111_c2_28b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1111_c2_28b9_cond,
result_u8_value_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_28b9
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_28b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_28b9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_28b9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_28b9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_28b9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_28b9
result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_28b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_28b9
result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_28b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_28b9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_28b9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_28b9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output);

-- n16_MUX_uxn_opcodes_h_l1111_c2_28b9
n16_MUX_uxn_opcodes_h_l1111_c2_28b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1111_c2_28b9_cond,
n16_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue,
n16_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse,
n16_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1124_c11_03c7
BIN_OP_EQ_uxn_opcodes_h_l1124_c11_03c7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1124_c11_03c7_left,
BIN_OP_EQ_uxn_opcodes_h_l1124_c11_03c7_right,
BIN_OP_EQ_uxn_opcodes_h_l1124_c11_03c7_return_output);

-- t16_MUX_uxn_opcodes_h_l1124_c7_2b10
t16_MUX_uxn_opcodes_h_l1124_c7_2b10 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1124_c7_2b10_cond,
t16_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue,
t16_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse,
t16_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1124_c7_2b10
tmp16_MUX_uxn_opcodes_h_l1124_c7_2b10 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1124_c7_2b10_cond,
tmp16_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue,
tmp16_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse,
tmp16_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_2b10
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_2b10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_2b10_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_2b10
result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_2b10 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_2b10_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1124_c7_2b10
result_u8_value_MUX_uxn_opcodes_h_l1124_c7_2b10 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1124_c7_2b10_cond,
result_u8_value_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_2b10
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_2b10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_2b10_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_2b10
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_2b10 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_2b10_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output);

-- n16_MUX_uxn_opcodes_h_l1124_c7_2b10
n16_MUX_uxn_opcodes_h_l1124_c7_2b10 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1124_c7_2b10_cond,
n16_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue,
n16_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse,
n16_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1127_c11_832e
BIN_OP_EQ_uxn_opcodes_h_l1127_c11_832e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1127_c11_832e_left,
BIN_OP_EQ_uxn_opcodes_h_l1127_c11_832e_right,
BIN_OP_EQ_uxn_opcodes_h_l1127_c11_832e_return_output);

-- t16_MUX_uxn_opcodes_h_l1127_c7_dcfa
t16_MUX_uxn_opcodes_h_l1127_c7_dcfa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond,
t16_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue,
t16_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse,
t16_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1127_c7_dcfa
tmp16_MUX_uxn_opcodes_h_l1127_c7_dcfa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond,
tmp16_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue,
tmp16_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse,
tmp16_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_dcfa
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_dcfa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_dcfa
result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_dcfa : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1127_c7_dcfa
result_u8_value_MUX_uxn_opcodes_h_l1127_c7_dcfa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond,
result_u8_value_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_dcfa
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_dcfa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_dcfa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_dcfa : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output);

-- n16_MUX_uxn_opcodes_h_l1127_c7_dcfa
n16_MUX_uxn_opcodes_h_l1127_c7_dcfa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond,
n16_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue,
n16_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse,
n16_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1132_c11_9196
BIN_OP_EQ_uxn_opcodes_h_l1132_c11_9196 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1132_c11_9196_left,
BIN_OP_EQ_uxn_opcodes_h_l1132_c11_9196_right,
BIN_OP_EQ_uxn_opcodes_h_l1132_c11_9196_return_output);

-- t16_MUX_uxn_opcodes_h_l1132_c7_3c53
t16_MUX_uxn_opcodes_h_l1132_c7_3c53 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1132_c7_3c53_cond,
t16_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue,
t16_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse,
t16_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1132_c7_3c53
tmp16_MUX_uxn_opcodes_h_l1132_c7_3c53 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1132_c7_3c53_cond,
tmp16_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue,
tmp16_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse,
tmp16_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_3c53
result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_3c53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_3c53_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_3c53
result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_3c53 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_3c53_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1132_c7_3c53
result_u8_value_MUX_uxn_opcodes_h_l1132_c7_3c53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1132_c7_3c53_cond,
result_u8_value_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_3c53
result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_3c53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_3c53_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_3c53
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_3c53 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_3c53_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output);

-- n16_MUX_uxn_opcodes_h_l1132_c7_3c53
n16_MUX_uxn_opcodes_h_l1132_c7_3c53 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1132_c7_3c53_cond,
n16_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue,
n16_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse,
n16_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1133_c3_f8f5
BIN_OP_OR_uxn_opcodes_h_l1133_c3_f8f5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1133_c3_f8f5_left,
BIN_OP_OR_uxn_opcodes_h_l1133_c3_f8f5_right,
BIN_OP_OR_uxn_opcodes_h_l1133_c3_f8f5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1136_c11_3369
BIN_OP_EQ_uxn_opcodes_h_l1136_c11_3369 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1136_c11_3369_left,
BIN_OP_EQ_uxn_opcodes_h_l1136_c11_3369_right,
BIN_OP_EQ_uxn_opcodes_h_l1136_c11_3369_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1136_c7_8fff
tmp16_MUX_uxn_opcodes_h_l1136_c7_8fff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1136_c7_8fff_cond,
tmp16_MUX_uxn_opcodes_h_l1136_c7_8fff_iftrue,
tmp16_MUX_uxn_opcodes_h_l1136_c7_8fff_iffalse,
tmp16_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_8fff
result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_8fff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_8fff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_8fff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_8fff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_8fff
result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_8fff : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_8fff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_8fff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_8fff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1136_c7_8fff
result_u8_value_MUX_uxn_opcodes_h_l1136_c7_8fff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1136_c7_8fff_cond,
result_u8_value_MUX_uxn_opcodes_h_l1136_c7_8fff_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1136_c7_8fff_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_8fff
result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_8fff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_8fff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_8fff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_8fff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_8fff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_8fff : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_8fff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_8fff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_8fff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output);

-- n16_MUX_uxn_opcodes_h_l1136_c7_8fff
n16_MUX_uxn_opcodes_h_l1136_c7_8fff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1136_c7_8fff_cond,
n16_MUX_uxn_opcodes_h_l1136_c7_8fff_iftrue,
n16_MUX_uxn_opcodes_h_l1136_c7_8fff_iffalse,
n16_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1140_c11_8d3b
BIN_OP_EQ_uxn_opcodes_h_l1140_c11_8d3b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1140_c11_8d3b_left,
BIN_OP_EQ_uxn_opcodes_h_l1140_c11_8d3b_right,
BIN_OP_EQ_uxn_opcodes_h_l1140_c11_8d3b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1140_c7_e70c
tmp16_MUX_uxn_opcodes_h_l1140_c7_e70c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1140_c7_e70c_cond,
tmp16_MUX_uxn_opcodes_h_l1140_c7_e70c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1140_c7_e70c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_e70c
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_e70c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_e70c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_e70c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_e70c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_e70c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_e70c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_e70c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_e70c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_e70c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1140_c7_e70c
result_u8_value_MUX_uxn_opcodes_h_l1140_c7_e70c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1140_c7_e70c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1140_c7_e70c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1140_c7_e70c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_e70c
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_e70c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_e70c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_e70c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_e70c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_e70c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_e70c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_e70c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_e70c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_e70c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output);

-- n16_MUX_uxn_opcodes_h_l1140_c7_e70c
n16_MUX_uxn_opcodes_h_l1140_c7_e70c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1140_c7_e70c_cond,
n16_MUX_uxn_opcodes_h_l1140_c7_e70c_iftrue,
n16_MUX_uxn_opcodes_h_l1140_c7_e70c_iffalse,
n16_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1141_c3_89f9
BIN_OP_OR_uxn_opcodes_h_l1141_c3_89f9 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1141_c3_89f9_left,
BIN_OP_OR_uxn_opcodes_h_l1141_c3_89f9_right,
BIN_OP_OR_uxn_opcodes_h_l1141_c3_89f9_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l1142_c11_786c
BIN_OP_XOR_uxn_opcodes_h_l1142_c11_786c : entity work.BIN_OP_XOR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l1142_c11_786c_left,
BIN_OP_XOR_uxn_opcodes_h_l1142_c11_786c_right,
BIN_OP_XOR_uxn_opcodes_h_l1142_c11_786c_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1143_c30_c2c1
sp_relative_shift_uxn_opcodes_h_l1143_c30_c2c1 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1143_c30_c2c1_ins,
sp_relative_shift_uxn_opcodes_h_l1143_c30_c2c1_x,
sp_relative_shift_uxn_opcodes_h_l1143_c30_c2c1_y,
sp_relative_shift_uxn_opcodes_h_l1143_c30_c2c1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1148_c11_80c7
BIN_OP_EQ_uxn_opcodes_h_l1148_c11_80c7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1148_c11_80c7_left,
BIN_OP_EQ_uxn_opcodes_h_l1148_c11_80c7_right,
BIN_OP_EQ_uxn_opcodes_h_l1148_c11_80c7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_467d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_467d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_467d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_467d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_467d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_467d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_467d
result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_467d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_467d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_467d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_467d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_467d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_467d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_467d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_467d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_467d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_467d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_467d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1148_c7_467d
result_u8_value_MUX_uxn_opcodes_h_l1148_c7_467d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1148_c7_467d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1148_c7_467d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1148_c7_467d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1148_c7_467d_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1151_c31_fc5a
CONST_SR_8_uxn_opcodes_h_l1151_c31_fc5a : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1151_c31_fc5a_x,
CONST_SR_8_uxn_opcodes_h_l1151_c31_fc5a_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_7c93
CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_7c93 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_7c93_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_7c93_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1111_c6_1f82_return_output,
 t16_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output,
 tmp16_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output,
 n16_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1124_c11_03c7_return_output,
 t16_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output,
 tmp16_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output,
 n16_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1127_c11_832e_return_output,
 t16_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output,
 tmp16_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output,
 n16_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1132_c11_9196_return_output,
 t16_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output,
 tmp16_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output,
 n16_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1133_c3_f8f5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1136_c11_3369_return_output,
 tmp16_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output,
 n16_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1140_c11_8d3b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output,
 n16_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1141_c3_89f9_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l1142_c11_786c_return_output,
 sp_relative_shift_uxn_opcodes_h_l1143_c30_c2c1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1148_c11_80c7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_467d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_467d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_467d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1148_c7_467d_return_output,
 CONST_SR_8_uxn_opcodes_h_l1151_c31_fc5a_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_7c93_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_1f82_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_1f82_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_1f82_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1111_c2_28b9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_28b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1111_c2_28b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_28b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1111_c2_28b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_28b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_28b9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_28b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_28b9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1116_c3_2790 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_28b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1111_c2_28b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1111_c2_28b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1121_c3_7acf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_28b9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1111_c2_28b9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_03c7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_03c7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_03c7_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1124_c7_2b10_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_2b10_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_2b10_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_2b10_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_2b10_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_2b10_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1125_c3_1c3d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_2b10_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1124_c7_2b10_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_832e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_832e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_832e_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1130_c3_3a8b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_9196_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_9196_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_9196_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1132_c7_3c53_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_3c53_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_3c53_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_3c53_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_3c53_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_3c53_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1134_c3_f40f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_3c53_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1132_c7_3c53_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_f8f5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_f8f5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_f8f5_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_3369_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_3369_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_3369_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_8fff_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_8fff_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_8fff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_8fff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_8fff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_8fff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_8fff_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_8fff_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_8fff_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_8fff_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_8fff_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_8fff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_8fff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_8fff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_8fff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_8fff_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_8fff_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_8fff_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1136_c7_8fff_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1136_c7_8fff_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1136_c7_8fff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_8d3b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_8d3b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_8d3b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_e70c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_e70c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_e70c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_e70c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_e70c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_e70c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_e70c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_e70c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_467d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_e70c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_e70c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_e70c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_467d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_e70c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_e70c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_e70c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_467d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_e70c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_e70c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1145_c3_a70a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_e70c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_467d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_e70c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1140_c7_e70c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1140_c7_e70c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1140_c7_e70c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_89f9_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_89f9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_89f9_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_786c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_786c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_786c_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_c2c1_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_c2c1_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_c2c1_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_c2c1_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1146_c21_187d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_80c7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_80c7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_80c7_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_467d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1150_c3_24ec : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_467d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_467d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_467d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_467d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_467d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_467d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1149_c3_b08a : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_467d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_467d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_467d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_467d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_467d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1151_c31_fc5a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1151_c31_fc5a_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1151_c21_9880_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1132_l1127_l1124_l1111_l1148_l1136_DUPLICATE_5465_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1132_l1127_l1124_l1140_l1136_DUPLICATE_a518_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1132_l1127_l1124_l1148_l1136_DUPLICATE_1e88_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1132_l1127_l1124_l1148_l1140_l1136_DUPLICATE_9597_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1128_l1133_l1141_l1137_DUPLICATE_b554_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_7c93_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_7c93_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1148_l1136_DUPLICATE_59f7_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l1155_l1107_DUPLICATE_3fcd_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1150_c3_24ec := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_467d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1150_c3_24ec;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_c2c1_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1145_c3_a70a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_e70c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1145_c3_a70a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_9196_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1130_c3_3a8b := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1130_c3_3a8b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_3369_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_8d3b_right := to_unsigned(5, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1149_c3_b08a := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_467d_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1149_c3_b08a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_03c7_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1125_c3_1c3d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1125_c3_1c3d;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1134_c3_f40f := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1134_c3_f40f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_1f82_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_e70c_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_c2c1_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_467d_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1116_c3_2790 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1116_c3_2790;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1121_c3_7acf := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1121_c3_7acf;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_832e_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_80c7_right := to_unsigned(6, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_c2c1_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_89f9_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1140_c7_e70c_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_1f82_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_03c7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_832e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_9196_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_3369_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_8d3b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_80c7_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_f8f5_left := t16;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_786c_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1151_c31_fc5a_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_8fff_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_e70c_iffalse := tmp16;
     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1111_c2_28b9] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1111_c2_28b9_return_output := result.is_pc_updated;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1128_l1133_l1141_l1137_DUPLICATE_b554 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1128_l1133_l1141_l1137_DUPLICATE_b554_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1132_c11_9196] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1132_c11_9196_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_9196_left;
     BIN_OP_EQ_uxn_opcodes_h_l1132_c11_9196_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_9196_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_9196_return_output := BIN_OP_EQ_uxn_opcodes_h_l1132_c11_9196_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1151_c31_fc5a] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1151_c31_fc5a_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1151_c31_fc5a_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1151_c31_fc5a_return_output := CONST_SR_8_uxn_opcodes_h_l1151_c31_fc5a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1148_c11_80c7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1148_c11_80c7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_80c7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1148_c11_80c7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_80c7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_80c7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1148_c11_80c7_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1143_c30_c2c1] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1143_c30_c2c1_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_c2c1_ins;
     sp_relative_shift_uxn_opcodes_h_l1143_c30_c2c1_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_c2c1_x;
     sp_relative_shift_uxn_opcodes_h_l1143_c30_c2c1_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_c2c1_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_c2c1_return_output := sp_relative_shift_uxn_opcodes_h_l1143_c30_c2c1_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1111_c2_28b9] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1111_c2_28b9_return_output := result.is_ram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1132_l1127_l1124_l1148_l1136_DUPLICATE_1e88 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1132_l1127_l1124_l1148_l1136_DUPLICATE_1e88_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1127_c11_832e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1127_c11_832e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_832e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1127_c11_832e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_832e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_832e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1127_c11_832e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1124_c11_03c7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1124_c11_03c7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_03c7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1124_c11_03c7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_03c7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_03c7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1124_c11_03c7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1111_c6_1f82] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1111_c6_1f82_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_1f82_left;
     BIN_OP_EQ_uxn_opcodes_h_l1111_c6_1f82_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_1f82_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_1f82_return_output := BIN_OP_EQ_uxn_opcodes_h_l1111_c6_1f82_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1140_c11_8d3b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1140_c11_8d3b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_8d3b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1140_c11_8d3b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_8d3b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_8d3b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1140_c11_8d3b_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1148_l1136_DUPLICATE_59f7 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1148_l1136_DUPLICATE_59f7_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1132_l1127_l1124_l1148_l1140_l1136_DUPLICATE_9597 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1132_l1127_l1124_l1148_l1140_l1136_DUPLICATE_9597_return_output := result.is_opc_done;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1111_c2_28b9] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1111_c2_28b9_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1136_c11_3369] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1136_c11_3369_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_3369_left;
     BIN_OP_EQ_uxn_opcodes_h_l1136_c11_3369_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_3369_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_3369_return_output := BIN_OP_EQ_uxn_opcodes_h_l1136_c11_3369_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1111_c2_28b9] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1111_c2_28b9_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1132_l1127_l1124_l1111_l1148_l1136_DUPLICATE_5465 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1132_l1127_l1124_l1111_l1148_l1136_DUPLICATE_5465_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1132_l1127_l1124_l1140_l1136_DUPLICATE_a518 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1132_l1127_l1124_l1140_l1136_DUPLICATE_a518_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1111_c2_28b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_1f82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_28b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_1f82_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_28b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_1f82_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_1f82_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_28b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_1f82_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_28b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_1f82_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_1f82_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_28b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_1f82_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_28b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_1f82_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_28b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_1f82_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1111_c2_28b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_1f82_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_28b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_1f82_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1124_c7_2b10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_03c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_2b10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_03c7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_2b10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_03c7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_2b10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_03c7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_2b10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_03c7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_2b10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_03c7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1124_c7_2b10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_03c7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_2b10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_03c7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_832e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_832e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_832e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_832e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_832e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_832e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_832e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_832e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1132_c7_3c53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_9196_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_3c53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_9196_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_3c53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_9196_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_3c53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_9196_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_3c53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_9196_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_3c53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_9196_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1132_c7_3c53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_9196_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_3c53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_9196_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1136_c7_8fff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_3369_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_8fff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_3369_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_8fff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_3369_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_8fff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_3369_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_8fff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_3369_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_8fff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_3369_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_8fff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_3369_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1140_c7_e70c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_8d3b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_e70c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_8d3b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_e70c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_8d3b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_e70c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_8d3b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_e70c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_8d3b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_e70c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_8d3b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_e70c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_8d3b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_467d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_80c7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_467d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_80c7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_467d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_80c7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_467d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_80c7_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_f8f5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1128_l1133_l1141_l1137_DUPLICATE_b554_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_89f9_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1128_l1133_l1141_l1137_DUPLICATE_b554_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_7c93_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1128_l1133_l1141_l1137_DUPLICATE_b554_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1132_l1127_l1124_l1148_l1136_DUPLICATE_1e88_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1132_l1127_l1124_l1148_l1136_DUPLICATE_1e88_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1132_l1127_l1124_l1148_l1136_DUPLICATE_1e88_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_8fff_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1132_l1127_l1124_l1148_l1136_DUPLICATE_1e88_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_467d_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1132_l1127_l1124_l1148_l1136_DUPLICATE_1e88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1132_l1127_l1124_l1148_l1140_l1136_DUPLICATE_9597_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1132_l1127_l1124_l1148_l1140_l1136_DUPLICATE_9597_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1132_l1127_l1124_l1148_l1140_l1136_DUPLICATE_9597_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_8fff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1132_l1127_l1124_l1148_l1140_l1136_DUPLICATE_9597_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_e70c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1132_l1127_l1124_l1148_l1140_l1136_DUPLICATE_9597_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_467d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1132_l1127_l1124_l1148_l1140_l1136_DUPLICATE_9597_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1132_l1127_l1124_l1140_l1136_DUPLICATE_a518_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1132_l1127_l1124_l1140_l1136_DUPLICATE_a518_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1132_l1127_l1124_l1140_l1136_DUPLICATE_a518_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_8fff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1132_l1127_l1124_l1140_l1136_DUPLICATE_a518_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_e70c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1132_l1127_l1124_l1140_l1136_DUPLICATE_a518_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_8fff_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1148_l1136_DUPLICATE_59f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_467d_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1148_l1136_DUPLICATE_59f7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1132_l1127_l1124_l1111_l1148_l1136_DUPLICATE_5465_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1132_l1127_l1124_l1111_l1148_l1136_DUPLICATE_5465_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1132_l1127_l1124_l1111_l1148_l1136_DUPLICATE_5465_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1132_l1127_l1124_l1111_l1148_l1136_DUPLICATE_5465_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_8fff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1132_l1127_l1124_l1111_l1148_l1136_DUPLICATE_5465_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_467d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1132_l1127_l1124_l1111_l1148_l1136_DUPLICATE_5465_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1111_c2_28b9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1111_c2_28b9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1111_c2_28b9_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1111_c2_28b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_e70c_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_c2c1_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1140_c7_e70c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_e70c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_e70c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_e70c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_e70c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_e70c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_e70c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_7c93 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_7c93_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_7c93_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_7c93_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_7c93_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1111_c2_28b9] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_28b9_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_28b9_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1141_c3_89f9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1141_c3_89f9_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_89f9_left;
     BIN_OP_OR_uxn_opcodes_h_l1141_c3_89f9_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_89f9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_89f9_return_output := BIN_OP_OR_uxn_opcodes_h_l1141_c3_89f9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1148_c7_467d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_467d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_467d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_467d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_467d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_467d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_467d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_467d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_467d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1111_c2_28b9] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1133_c3_f8f5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1133_c3_f8f5_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_f8f5_left;
     BIN_OP_OR_uxn_opcodes_h_l1133_c3_f8f5_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_f8f5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_f8f5_return_output := BIN_OP_OR_uxn_opcodes_h_l1133_c3_f8f5_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1151_c21_9880] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1151_c21_9880_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1151_c31_fc5a_return_output);

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1111_c2_28b9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_28b9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_28b9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1148_c7_467d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_467d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_467d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_467d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_467d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_467d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_467d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_467d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_467d_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1111_c2_28b9] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1148_c7_467d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_467d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_467d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_467d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_467d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_467d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_467d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_467d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_467d_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_f8f5_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_786c_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_89f9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1140_c7_e70c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_89f9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_467d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1151_c21_9880_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1136_c7_8fff_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_7c93_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1138_l1129_DUPLICATE_7c93_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_e70c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_467d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_8fff_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_e70c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_467d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_e70c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_467d_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1140_c7_e70c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_e70c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_e70c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_e70c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_e70c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_e70c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_e70c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output;

     -- BIN_OP_XOR[uxn_opcodes_h_l1142_c11_786c] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l1142_c11_786c_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_786c_left;
     BIN_OP_XOR_uxn_opcodes_h_l1142_c11_786c_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_786c_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_786c_return_output := BIN_OP_XOR_uxn_opcodes_h_l1142_c11_786c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1140_c7_e70c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1140_c7_e70c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1140_c7_e70c_cond;
     n16_MUX_uxn_opcodes_h_l1140_c7_e70c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1140_c7_e70c_iftrue;
     n16_MUX_uxn_opcodes_h_l1140_c7_e70c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1140_c7_e70c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output := n16_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1140_c7_e70c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_e70c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_e70c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_e70c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_e70c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_e70c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_e70c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1148_c7_467d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1148_c7_467d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_467d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1148_c7_467d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_467d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1148_c7_467d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_467d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_467d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1148_c7_467d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1136_c7_8fff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_8fff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_8fff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_8fff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_8fff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_8fff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_8fff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1140_c7_e70c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_e70c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_e70c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_e70c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_e70c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_e70c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_e70c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1132_c7_3c53] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1132_c7_3c53_cond <= VAR_t16_MUX_uxn_opcodes_h_l1132_c7_3c53_cond;
     t16_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue;
     t16_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output := t16_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_e70c_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_786c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1136_c7_8fff_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_8fff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_8fff_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_8fff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_e70c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_467d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output;
     -- n16_MUX[uxn_opcodes_h_l1136_c7_8fff] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1136_c7_8fff_cond <= VAR_n16_MUX_uxn_opcodes_h_l1136_c7_8fff_cond;
     n16_MUX_uxn_opcodes_h_l1136_c7_8fff_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1136_c7_8fff_iftrue;
     n16_MUX_uxn_opcodes_h_l1136_c7_8fff_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1136_c7_8fff_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output := n16_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1146_c21_187d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1146_c21_187d_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_786c_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1136_c7_8fff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_8fff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_8fff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_8fff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_8fff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_8fff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_8fff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output;

     -- t16_MUX[uxn_opcodes_h_l1127_c7_dcfa] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond <= VAR_t16_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond;
     t16_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue;
     t16_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output := t16_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1132_c7_3c53] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_3c53_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_3c53_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1140_c7_e70c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1140_c7_e70c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_e70c_cond;
     tmp16_MUX_uxn_opcodes_h_l1140_c7_e70c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_e70c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1140_c7_e70c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_e70c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output := tmp16_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1136_c7_8fff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_8fff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_8fff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_8fff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_8fff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_8fff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_8fff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1136_c7_8fff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_8fff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_8fff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_8fff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_8fff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_8fff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_8fff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_e70c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1146_c21_187d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_8fff_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1140_c7_e70c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1140_c7_e70c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_e70c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1140_c7_e70c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_e70c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1140_c7_e70c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_e70c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1132_c7_3c53] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_3c53_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_3c53_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1132_c7_3c53] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_3c53_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_3c53_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1136_c7_8fff] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1136_c7_8fff_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_8fff_cond;
     tmp16_MUX_uxn_opcodes_h_l1136_c7_8fff_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_8fff_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1136_c7_8fff_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_8fff_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output := tmp16_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output;

     -- n16_MUX[uxn_opcodes_h_l1132_c7_3c53] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1132_c7_3c53_cond <= VAR_n16_MUX_uxn_opcodes_h_l1132_c7_3c53_cond;
     n16_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue;
     n16_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output := n16_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1132_c7_3c53] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_3c53_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_3c53_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output;

     -- t16_MUX[uxn_opcodes_h_l1124_c7_2b10] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1124_c7_2b10_cond <= VAR_t16_MUX_uxn_opcodes_h_l1124_c7_2b10_cond;
     t16_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue;
     t16_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output := t16_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1127_c7_dcfa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_8fff_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_e70c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1127_c7_dcfa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1127_c7_dcfa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1136_c7_8fff] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1136_c7_8fff_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_8fff_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1136_c7_8fff_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_8fff_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1136_c7_8fff_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_8fff_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output := result_u8_value_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1124_c7_2b10] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_2b10_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_2b10_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1127_c7_dcfa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1132_c7_3c53] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1132_c7_3c53_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_3c53_cond;
     tmp16_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output := tmp16_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output;

     -- t16_MUX[uxn_opcodes_h_l1111_c2_28b9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1111_c2_28b9_cond <= VAR_t16_MUX_uxn_opcodes_h_l1111_c2_28b9_cond;
     t16_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue;
     t16_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output := t16_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output;

     -- n16_MUX[uxn_opcodes_h_l1127_c7_dcfa] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond <= VAR_n16_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond;
     n16_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue;
     n16_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output := n16_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_8fff_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1132_c7_3c53] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1132_c7_3c53_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_3c53_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_3c53_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_3c53_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output := result_u8_value_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1124_c7_2b10] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_2b10_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_2b10_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1124_c7_2b10] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_2b10_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_2b10_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1124_c7_2b10] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_2b10_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_2b10_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1111_c2_28b9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_28b9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_28b9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output;

     -- n16_MUX[uxn_opcodes_h_l1124_c7_2b10] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1124_c7_2b10_cond <= VAR_n16_MUX_uxn_opcodes_h_l1124_c7_2b10_cond;
     n16_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue;
     n16_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output := n16_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1127_c7_dcfa] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond;
     tmp16_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output := tmp16_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_3c53_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1111_c2_28b9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_28b9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_28b9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1111_c2_28b9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_28b9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_28b9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1124_c7_2b10] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1124_c7_2b10_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_2b10_cond;
     tmp16_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output := tmp16_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1111_c2_28b9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_28b9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_28b9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output;

     -- n16_MUX[uxn_opcodes_h_l1111_c2_28b9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1111_c2_28b9_cond <= VAR_n16_MUX_uxn_opcodes_h_l1111_c2_28b9_cond;
     n16_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue;
     n16_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output := n16_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1127_c7_dcfa] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_dcfa_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_dcfa_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_dcfa_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output := result_u8_value_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_dcfa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1124_c7_2b10] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1124_c7_2b10_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_2b10_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_2b10_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_2b10_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output := result_u8_value_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1111_c2_28b9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1111_c2_28b9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_28b9_cond;
     tmp16_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output := tmp16_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_2b10_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1111_c2_28b9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1111_c2_28b9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_28b9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_28b9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_28b9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output := result_u8_value_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l1155_l1107_DUPLICATE_3fcd LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l1155_l1107_DUPLICATE_3fcd_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_71f0(
     result,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_28b9_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l1155_l1107_DUPLICATE_3fcd_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l1155_l1107_DUPLICATE_3fcd_return_output;
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
