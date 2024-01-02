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
-- BIN_OP_EQ[uxn_opcodes_h_l1111_c6_fa04]
signal BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fa04_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fa04_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fa04_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1111_c2_de2b]
signal n16_MUX_uxn_opcodes_h_l1111_c2_de2b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1111_c2_de2b]
signal tmp16_MUX_uxn_opcodes_h_l1111_c2_de2b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1111_c2_de2b]
signal t16_MUX_uxn_opcodes_h_l1111_c2_de2b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1111_c2_de2b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_de2b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1111_c2_de2b]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1111_c2_de2b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_de2b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1111_c2_de2b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_de2b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1111_c2_de2b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_de2b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1111_c2_de2b]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_de2b_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1111_c2_de2b]
signal result_u8_value_MUX_uxn_opcodes_h_l1111_c2_de2b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1111_c2_de2b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_de2b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1111_c2_de2b]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1124_c11_d97f]
signal BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d97f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d97f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d97f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1124_c7_87fb]
signal n16_MUX_uxn_opcodes_h_l1124_c7_87fb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1124_c7_87fb]
signal tmp16_MUX_uxn_opcodes_h_l1124_c7_87fb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1124_c7_87fb]
signal t16_MUX_uxn_opcodes_h_l1124_c7_87fb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1124_c7_87fb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_87fb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1124_c7_87fb]
signal result_u8_value_MUX_uxn_opcodes_h_l1124_c7_87fb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1124_c7_87fb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_87fb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1124_c7_87fb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_87fb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1124_c7_87fb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_87fb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1127_c11_79b4]
signal BIN_OP_EQ_uxn_opcodes_h_l1127_c11_79b4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1127_c11_79b4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1127_c11_79b4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1127_c7_1808]
signal n16_MUX_uxn_opcodes_h_l1127_c7_1808_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1127_c7_1808_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1127_c7_1808]
signal tmp16_MUX_uxn_opcodes_h_l1127_c7_1808_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1127_c7_1808_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1127_c7_1808]
signal t16_MUX_uxn_opcodes_h_l1127_c7_1808_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1127_c7_1808_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1127_c7_1808]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_1808_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_1808_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1127_c7_1808]
signal result_u8_value_MUX_uxn_opcodes_h_l1127_c7_1808_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1127_c7_1808_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1127_c7_1808]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_1808_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_1808_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1127_c7_1808]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_1808_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_1808_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1127_c7_1808]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_1808_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_1808_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1132_c11_8b0c]
signal BIN_OP_EQ_uxn_opcodes_h_l1132_c11_8b0c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1132_c11_8b0c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1132_c11_8b0c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1132_c7_1db2]
signal n16_MUX_uxn_opcodes_h_l1132_c7_1db2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1132_c7_1db2]
signal tmp16_MUX_uxn_opcodes_h_l1132_c7_1db2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1132_c7_1db2]
signal t16_MUX_uxn_opcodes_h_l1132_c7_1db2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1132_c7_1db2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_1db2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1132_c7_1db2]
signal result_u8_value_MUX_uxn_opcodes_h_l1132_c7_1db2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1132_c7_1db2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_1db2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1132_c7_1db2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_1db2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1132_c7_1db2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_1db2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1133_c3_c789]
signal BIN_OP_OR_uxn_opcodes_h_l1133_c3_c789_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1133_c3_c789_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1133_c3_c789_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1136_c11_2fc5]
signal BIN_OP_EQ_uxn_opcodes_h_l1136_c11_2fc5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1136_c11_2fc5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1136_c11_2fc5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1136_c7_189d]
signal n16_MUX_uxn_opcodes_h_l1136_c7_189d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1136_c7_189d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1136_c7_189d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1136_c7_189d_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1136_c7_189d]
signal tmp16_MUX_uxn_opcodes_h_l1136_c7_189d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1136_c7_189d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1136_c7_189d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1136_c7_189d_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1136_c7_189d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_189d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_189d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_189d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_189d_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1136_c7_189d]
signal result_u8_value_MUX_uxn_opcodes_h_l1136_c7_189d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1136_c7_189d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1136_c7_189d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1136_c7_189d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1136_c7_189d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_189d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_189d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_189d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_189d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1136_c7_189d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_189d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_189d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_189d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_189d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1136_c7_189d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_189d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_189d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_189d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_189d_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1140_c11_c219]
signal BIN_OP_EQ_uxn_opcodes_h_l1140_c11_c219_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1140_c11_c219_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1140_c11_c219_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1140_c7_0b61]
signal n16_MUX_uxn_opcodes_h_l1140_c7_0b61_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1140_c7_0b61_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1140_c7_0b61_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1140_c7_0b61]
signal tmp16_MUX_uxn_opcodes_h_l1140_c7_0b61_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1140_c7_0b61_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1140_c7_0b61_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1140_c7_0b61]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_0b61_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_0b61_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_0b61_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1140_c7_0b61]
signal result_u8_value_MUX_uxn_opcodes_h_l1140_c7_0b61_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1140_c7_0b61_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1140_c7_0b61_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1140_c7_0b61]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_0b61_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_0b61_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_0b61_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1140_c7_0b61]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_0b61_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_0b61_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_0b61_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1140_c7_0b61]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_0b61_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_0b61_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_0b61_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1141_c3_f49a]
signal BIN_OP_OR_uxn_opcodes_h_l1141_c3_f49a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1141_c3_f49a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1141_c3_f49a_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l1142_c11_7ca6]
signal BIN_OP_XOR_uxn_opcodes_h_l1142_c11_7ca6_left : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1142_c11_7ca6_right : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1142_c11_7ca6_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1143_c30_8584]
signal sp_relative_shift_uxn_opcodes_h_l1143_c30_8584_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1143_c30_8584_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1143_c30_8584_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1143_c30_8584_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1148_c11_bae1]
signal BIN_OP_EQ_uxn_opcodes_h_l1148_c11_bae1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1148_c11_bae1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1148_c11_bae1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1148_c7_a8d8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_a8d8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_a8d8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_a8d8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_a8d8_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1148_c7_a8d8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_a8d8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_a8d8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_a8d8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_a8d8_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1148_c7_a8d8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_a8d8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_a8d8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_a8d8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_a8d8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1148_c7_a8d8]
signal result_u8_value_MUX_uxn_opcodes_h_l1148_c7_a8d8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1148_c7_a8d8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1148_c7_a8d8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1148_c7_a8d8_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1151_c31_8160]
signal CONST_SR_8_uxn_opcodes_h_l1151_c31_8160_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1151_c31_8160_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_186c
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_186c_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_186c_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fa04
BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fa04 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fa04_left,
BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fa04_right,
BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fa04_return_output);

-- n16_MUX_uxn_opcodes_h_l1111_c2_de2b
n16_MUX_uxn_opcodes_h_l1111_c2_de2b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1111_c2_de2b_cond,
n16_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue,
n16_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse,
n16_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1111_c2_de2b
tmp16_MUX_uxn_opcodes_h_l1111_c2_de2b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1111_c2_de2b_cond,
tmp16_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output);

-- t16_MUX_uxn_opcodes_h_l1111_c2_de2b
t16_MUX_uxn_opcodes_h_l1111_c2_de2b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1111_c2_de2b_cond,
t16_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue,
t16_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse,
t16_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_de2b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_de2b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_de2b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_de2b
result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_de2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_de2b
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_de2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_de2b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_de2b
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_de2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_de2b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_de2b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_de2b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_de2b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_de2b
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_de2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_de2b_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1111_c2_de2b
result_u8_value_MUX_uxn_opcodes_h_l1111_c2_de2b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1111_c2_de2b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_de2b
result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_de2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_de2b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_de2b
result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_de2b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d97f
BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d97f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d97f_left,
BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d97f_right,
BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d97f_return_output);

-- n16_MUX_uxn_opcodes_h_l1124_c7_87fb
n16_MUX_uxn_opcodes_h_l1124_c7_87fb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1124_c7_87fb_cond,
n16_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue,
n16_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse,
n16_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1124_c7_87fb
tmp16_MUX_uxn_opcodes_h_l1124_c7_87fb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1124_c7_87fb_cond,
tmp16_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue,
tmp16_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse,
tmp16_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output);

-- t16_MUX_uxn_opcodes_h_l1124_c7_87fb
t16_MUX_uxn_opcodes_h_l1124_c7_87fb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1124_c7_87fb_cond,
t16_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue,
t16_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse,
t16_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_87fb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_87fb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_87fb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1124_c7_87fb
result_u8_value_MUX_uxn_opcodes_h_l1124_c7_87fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1124_c7_87fb_cond,
result_u8_value_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_87fb
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_87fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_87fb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_87fb
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_87fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_87fb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_87fb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_87fb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_87fb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1127_c11_79b4
BIN_OP_EQ_uxn_opcodes_h_l1127_c11_79b4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1127_c11_79b4_left,
BIN_OP_EQ_uxn_opcodes_h_l1127_c11_79b4_right,
BIN_OP_EQ_uxn_opcodes_h_l1127_c11_79b4_return_output);

-- n16_MUX_uxn_opcodes_h_l1127_c7_1808
n16_MUX_uxn_opcodes_h_l1127_c7_1808 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1127_c7_1808_cond,
n16_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue,
n16_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse,
n16_MUX_uxn_opcodes_h_l1127_c7_1808_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1127_c7_1808
tmp16_MUX_uxn_opcodes_h_l1127_c7_1808 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1127_c7_1808_cond,
tmp16_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue,
tmp16_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse,
tmp16_MUX_uxn_opcodes_h_l1127_c7_1808_return_output);

-- t16_MUX_uxn_opcodes_h_l1127_c7_1808
t16_MUX_uxn_opcodes_h_l1127_c7_1808 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1127_c7_1808_cond,
t16_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue,
t16_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse,
t16_MUX_uxn_opcodes_h_l1127_c7_1808_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_1808
result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_1808 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_1808_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_1808_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1127_c7_1808
result_u8_value_MUX_uxn_opcodes_h_l1127_c7_1808 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1127_c7_1808_cond,
result_u8_value_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1127_c7_1808_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_1808
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_1808 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_1808_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_1808_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_1808
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_1808 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_1808_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_1808_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_1808
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_1808 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_1808_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_1808_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1132_c11_8b0c
BIN_OP_EQ_uxn_opcodes_h_l1132_c11_8b0c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1132_c11_8b0c_left,
BIN_OP_EQ_uxn_opcodes_h_l1132_c11_8b0c_right,
BIN_OP_EQ_uxn_opcodes_h_l1132_c11_8b0c_return_output);

-- n16_MUX_uxn_opcodes_h_l1132_c7_1db2
n16_MUX_uxn_opcodes_h_l1132_c7_1db2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1132_c7_1db2_cond,
n16_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue,
n16_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse,
n16_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1132_c7_1db2
tmp16_MUX_uxn_opcodes_h_l1132_c7_1db2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1132_c7_1db2_cond,
tmp16_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue,
tmp16_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse,
tmp16_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output);

-- t16_MUX_uxn_opcodes_h_l1132_c7_1db2
t16_MUX_uxn_opcodes_h_l1132_c7_1db2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1132_c7_1db2_cond,
t16_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue,
t16_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse,
t16_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_1db2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_1db2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_1db2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1132_c7_1db2
result_u8_value_MUX_uxn_opcodes_h_l1132_c7_1db2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1132_c7_1db2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_1db2
result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_1db2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_1db2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_1db2
result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_1db2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_1db2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_1db2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_1db2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_1db2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1133_c3_c789
BIN_OP_OR_uxn_opcodes_h_l1133_c3_c789 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1133_c3_c789_left,
BIN_OP_OR_uxn_opcodes_h_l1133_c3_c789_right,
BIN_OP_OR_uxn_opcodes_h_l1133_c3_c789_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1136_c11_2fc5
BIN_OP_EQ_uxn_opcodes_h_l1136_c11_2fc5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1136_c11_2fc5_left,
BIN_OP_EQ_uxn_opcodes_h_l1136_c11_2fc5_right,
BIN_OP_EQ_uxn_opcodes_h_l1136_c11_2fc5_return_output);

-- n16_MUX_uxn_opcodes_h_l1136_c7_189d
n16_MUX_uxn_opcodes_h_l1136_c7_189d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1136_c7_189d_cond,
n16_MUX_uxn_opcodes_h_l1136_c7_189d_iftrue,
n16_MUX_uxn_opcodes_h_l1136_c7_189d_iffalse,
n16_MUX_uxn_opcodes_h_l1136_c7_189d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1136_c7_189d
tmp16_MUX_uxn_opcodes_h_l1136_c7_189d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1136_c7_189d_cond,
tmp16_MUX_uxn_opcodes_h_l1136_c7_189d_iftrue,
tmp16_MUX_uxn_opcodes_h_l1136_c7_189d_iffalse,
tmp16_MUX_uxn_opcodes_h_l1136_c7_189d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_189d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_189d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_189d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_189d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_189d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_189d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1136_c7_189d
result_u8_value_MUX_uxn_opcodes_h_l1136_c7_189d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1136_c7_189d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1136_c7_189d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1136_c7_189d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1136_c7_189d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_189d
result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_189d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_189d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_189d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_189d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_189d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_189d
result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_189d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_189d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_189d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_189d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_189d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_189d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_189d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_189d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_189d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_189d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_189d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1140_c11_c219
BIN_OP_EQ_uxn_opcodes_h_l1140_c11_c219 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1140_c11_c219_left,
BIN_OP_EQ_uxn_opcodes_h_l1140_c11_c219_right,
BIN_OP_EQ_uxn_opcodes_h_l1140_c11_c219_return_output);

-- n16_MUX_uxn_opcodes_h_l1140_c7_0b61
n16_MUX_uxn_opcodes_h_l1140_c7_0b61 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1140_c7_0b61_cond,
n16_MUX_uxn_opcodes_h_l1140_c7_0b61_iftrue,
n16_MUX_uxn_opcodes_h_l1140_c7_0b61_iffalse,
n16_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1140_c7_0b61
tmp16_MUX_uxn_opcodes_h_l1140_c7_0b61 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1140_c7_0b61_cond,
tmp16_MUX_uxn_opcodes_h_l1140_c7_0b61_iftrue,
tmp16_MUX_uxn_opcodes_h_l1140_c7_0b61_iffalse,
tmp16_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_0b61
result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_0b61 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_0b61_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_0b61_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_0b61_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1140_c7_0b61
result_u8_value_MUX_uxn_opcodes_h_l1140_c7_0b61 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1140_c7_0b61_cond,
result_u8_value_MUX_uxn_opcodes_h_l1140_c7_0b61_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1140_c7_0b61_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_0b61
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_0b61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_0b61_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_0b61_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_0b61_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_0b61
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_0b61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_0b61_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_0b61_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_0b61_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_0b61
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_0b61 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_0b61_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_0b61_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_0b61_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1141_c3_f49a
BIN_OP_OR_uxn_opcodes_h_l1141_c3_f49a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1141_c3_f49a_left,
BIN_OP_OR_uxn_opcodes_h_l1141_c3_f49a_right,
BIN_OP_OR_uxn_opcodes_h_l1141_c3_f49a_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l1142_c11_7ca6
BIN_OP_XOR_uxn_opcodes_h_l1142_c11_7ca6 : entity work.BIN_OP_XOR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l1142_c11_7ca6_left,
BIN_OP_XOR_uxn_opcodes_h_l1142_c11_7ca6_right,
BIN_OP_XOR_uxn_opcodes_h_l1142_c11_7ca6_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1143_c30_8584
sp_relative_shift_uxn_opcodes_h_l1143_c30_8584 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1143_c30_8584_ins,
sp_relative_shift_uxn_opcodes_h_l1143_c30_8584_x,
sp_relative_shift_uxn_opcodes_h_l1143_c30_8584_y,
sp_relative_shift_uxn_opcodes_h_l1143_c30_8584_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1148_c11_bae1
BIN_OP_EQ_uxn_opcodes_h_l1148_c11_bae1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1148_c11_bae1_left,
BIN_OP_EQ_uxn_opcodes_h_l1148_c11_bae1_right,
BIN_OP_EQ_uxn_opcodes_h_l1148_c11_bae1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_a8d8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_a8d8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_a8d8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_a8d8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_a8d8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_a8d8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_a8d8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_a8d8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_a8d8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_a8d8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_a8d8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_a8d8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_a8d8
result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_a8d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_a8d8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_a8d8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_a8d8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_a8d8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1148_c7_a8d8
result_u8_value_MUX_uxn_opcodes_h_l1148_c7_a8d8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1148_c7_a8d8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1148_c7_a8d8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1148_c7_a8d8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1148_c7_a8d8_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1151_c31_8160
CONST_SR_8_uxn_opcodes_h_l1151_c31_8160 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1151_c31_8160_x,
CONST_SR_8_uxn_opcodes_h_l1151_c31_8160_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_186c
CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_186c : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_186c_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_186c_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fa04_return_output,
 n16_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output,
 t16_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d97f_return_output,
 n16_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output,
 tmp16_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output,
 t16_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1127_c11_79b4_return_output,
 n16_MUX_uxn_opcodes_h_l1127_c7_1808_return_output,
 tmp16_MUX_uxn_opcodes_h_l1127_c7_1808_return_output,
 t16_MUX_uxn_opcodes_h_l1127_c7_1808_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_1808_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1127_c7_1808_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_1808_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_1808_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_1808_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1132_c11_8b0c_return_output,
 n16_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output,
 tmp16_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output,
 t16_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1133_c3_c789_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1136_c11_2fc5_return_output,
 n16_MUX_uxn_opcodes_h_l1136_c7_189d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1136_c7_189d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_189d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1136_c7_189d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_189d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_189d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_189d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1140_c11_c219_return_output,
 n16_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output,
 tmp16_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1141_c3_f49a_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l1142_c11_7ca6_return_output,
 sp_relative_shift_uxn_opcodes_h_l1143_c30_8584_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1148_c11_bae1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_a8d8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_a8d8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_a8d8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1148_c7_a8d8_return_output,
 CONST_SR_8_uxn_opcodes_h_l1151_c31_8160_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_186c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fa04_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fa04_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fa04_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1111_c2_de2b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_de2b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1111_c2_de2b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1116_c3_8dcd : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_de2b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1111_c2_de2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_de2b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_de2b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1121_c3_3ee0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_de2b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1111_c2_de2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_de2b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_de2b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1111_c2_de2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_de2b_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1111_c2_de2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d97f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d97f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d97f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1127_c7_1808_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1124_c7_87fb_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_1808_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_87fb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1127_c7_1808_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1124_c7_87fb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_1808_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_87fb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_1808_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_87fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_1808_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_87fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_1808_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_87fb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1125_c3_6b8b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_1808_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_87fb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_79b4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_79b4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_79b4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1127_c7_1808_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_1808_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1127_c7_1808_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_1808_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_1808_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_1808_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_1808_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1130_c3_6f3b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_1808_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_8b0c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_8b0c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_8b0c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1136_c7_189d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1132_c7_1db2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_189d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_1db2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1132_c7_1db2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_189d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_1db2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_189d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_1db2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_189d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_1db2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_189d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_1db2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1134_c3_316c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_189d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_1db2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_c789_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_c789_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_c789_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_2fc5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_2fc5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_2fc5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1136_c7_189d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1136_c7_189d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1136_c7_189d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_189d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_189d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_189d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_189d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_189d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_189d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_189d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_189d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_189d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_189d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_189d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_189d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_189d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_189d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_189d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_189d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_189d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_189d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_c219_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_c219_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_c219_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1140_c7_0b61_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1140_c7_0b61_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1140_c7_0b61_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_0b61_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_0b61_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_0b61_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_0b61_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_0b61_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_a8d8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_0b61_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_0b61_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_0b61_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_a8d8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_0b61_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_0b61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_0b61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_0b61_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_0b61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_0b61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_a8d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_0b61_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_0b61_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1145_c3_c615 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_0b61_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_a8d8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_0b61_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_f49a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_f49a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_f49a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_7ca6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_7ca6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_7ca6_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_8584_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_8584_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_8584_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_8584_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1146_c21_37eb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_bae1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_bae1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_bae1_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_a8d8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1149_c3_6a00 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_a8d8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_a8d8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_a8d8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1150_c3_ce72 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_a8d8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_a8d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_a8d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_a8d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_a8d8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_a8d8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_a8d8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_a8d8_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1151_c31_8160_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1151_c31_8160_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1151_c21_1f48_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1124_l1111_l1148_l1136_l1132_l1127_DUPLICATE_00b0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1124_l1148_l1136_l1132_l1127_DUPLICATE_cef1_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1124_l1140_l1136_l1132_l1127_DUPLICATE_7741_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1124_l1148_l1140_l1136_l1132_l1127_DUPLICATE_466a_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1128_l1137_l1133_l1141_DUPLICATE_ca6a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_186c_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_186c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1148_l1136_DUPLICATE_2dcc_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l1155_l1107_DUPLICATE_6f77_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_0b61_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_79b4_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1149_c3_6a00 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_a8d8_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1149_c3_6a00;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_8584_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1145_c3_c615 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_0b61_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1145_c3_c615;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_bae1_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_2fc5_right := to_unsigned(4, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1121_c3_3ee0 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1121_c3_3ee0;
     VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_8584_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1150_c3_ce72 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_a8d8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1150_c3_ce72;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1130_c3_6f3b := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1130_c3_6f3b;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1116_c3_8dcd := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1116_c3_8dcd;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_8b0c_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_a8d8_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_c219_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fa04_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d97f_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1125_c3_6b8b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1125_c3_6b8b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1134_c3_316c := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1134_c3_316c;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_8584_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_f49a_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1140_c7_0b61_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fa04_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d97f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_79b4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_8b0c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_2fc5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_c219_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_bae1_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_c789_left := t16;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_7ca6_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1151_c31_8160_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_189d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_0b61_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1148_c11_bae1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1148_c11_bae1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_bae1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1148_c11_bae1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_bae1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_bae1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1148_c11_bae1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1124_c11_d97f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d97f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d97f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d97f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d97f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d97f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d97f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1111_c6_fa04] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fa04_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fa04_left;
     BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fa04_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fa04_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fa04_return_output := BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fa04_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1143_c30_8584] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1143_c30_8584_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_8584_ins;
     sp_relative_shift_uxn_opcodes_h_l1143_c30_8584_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_8584_x;
     sp_relative_shift_uxn_opcodes_h_l1143_c30_8584_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_8584_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_8584_return_output := sp_relative_shift_uxn_opcodes_h_l1143_c30_8584_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1111_c2_de2b] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1111_c2_de2b_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1124_l1111_l1148_l1136_l1132_l1127_DUPLICATE_00b0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1124_l1111_l1148_l1136_l1132_l1127_DUPLICATE_00b0_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1140_c11_c219] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1140_c11_c219_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_c219_left;
     BIN_OP_EQ_uxn_opcodes_h_l1140_c11_c219_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_c219_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_c219_return_output := BIN_OP_EQ_uxn_opcodes_h_l1140_c11_c219_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1148_l1136_DUPLICATE_2dcc LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1148_l1136_DUPLICATE_2dcc_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1136_c11_2fc5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1136_c11_2fc5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_2fc5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1136_c11_2fc5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_2fc5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_2fc5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1136_c11_2fc5_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1151_c31_8160] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1151_c31_8160_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1151_c31_8160_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1151_c31_8160_return_output := CONST_SR_8_uxn_opcodes_h_l1151_c31_8160_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1128_l1137_l1133_l1141_DUPLICATE_ca6a LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1128_l1137_l1133_l1141_DUPLICATE_ca6a_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1127_c11_79b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1127_c11_79b4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_79b4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1127_c11_79b4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_79b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_79b4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1127_c11_79b4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1124_l1148_l1140_l1136_l1132_l1127_DUPLICATE_466a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1124_l1148_l1140_l1136_l1132_l1127_DUPLICATE_466a_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1111_c2_de2b] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1111_c2_de2b_return_output := result.is_stack_index_flipped;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1111_c2_de2b] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1111_c2_de2b_return_output := result.is_vram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1124_l1148_l1136_l1132_l1127_DUPLICATE_cef1 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1124_l1148_l1136_l1132_l1127_DUPLICATE_cef1_return_output := result.sp_relative_shift;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1111_c2_de2b] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1111_c2_de2b_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1124_l1140_l1136_l1132_l1127_DUPLICATE_7741 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1124_l1140_l1136_l1132_l1127_DUPLICATE_7741_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1132_c11_8b0c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1132_c11_8b0c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_8b0c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1132_c11_8b0c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_8b0c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_8b0c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1132_c11_8b0c_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1111_c2_de2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fa04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_de2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fa04_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_de2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fa04_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fa04_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_de2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fa04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_de2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fa04_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fa04_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_de2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fa04_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_de2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fa04_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_de2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fa04_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1111_c2_de2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fa04_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_de2b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c6_fa04_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1124_c7_87fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d97f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_87fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d97f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_87fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d97f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_87fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d97f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_87fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d97f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_87fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d97f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1124_c7_87fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d97f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_87fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1124_c11_d97f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1127_c7_1808_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_79b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_1808_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_79b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_1808_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_79b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_1808_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_79b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_1808_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_79b4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_1808_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_79b4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1127_c7_1808_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_79b4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_1808_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1127_c11_79b4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1132_c7_1db2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_8b0c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_1db2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_8b0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_1db2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_8b0c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_1db2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_8b0c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_1db2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_8b0c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_1db2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_8b0c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1132_c7_1db2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_8b0c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_1db2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_8b0c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1136_c7_189d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_2fc5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_189d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_2fc5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_189d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_2fc5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_189d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_2fc5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_189d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_2fc5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_189d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_2fc5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_189d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1136_c11_2fc5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1140_c7_0b61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_c219_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_0b61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_c219_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_0b61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_c219_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_0b61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_c219_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_0b61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_c219_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_0b61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_c219_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_0b61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_c219_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_a8d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_bae1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_a8d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_bae1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_a8d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_bae1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_a8d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_bae1_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_c789_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1128_l1137_l1133_l1141_DUPLICATE_ca6a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_f49a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1128_l1137_l1133_l1141_DUPLICATE_ca6a_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_186c_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1128_l1137_l1133_l1141_DUPLICATE_ca6a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1124_l1148_l1136_l1132_l1127_DUPLICATE_cef1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1124_l1148_l1136_l1132_l1127_DUPLICATE_cef1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1124_l1148_l1136_l1132_l1127_DUPLICATE_cef1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_189d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1124_l1148_l1136_l1132_l1127_DUPLICATE_cef1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_a8d8_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1124_l1148_l1136_l1132_l1127_DUPLICATE_cef1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1124_l1148_l1140_l1136_l1132_l1127_DUPLICATE_466a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1124_l1148_l1140_l1136_l1132_l1127_DUPLICATE_466a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1124_l1148_l1140_l1136_l1132_l1127_DUPLICATE_466a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_189d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1124_l1148_l1140_l1136_l1132_l1127_DUPLICATE_466a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_0b61_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1124_l1148_l1140_l1136_l1132_l1127_DUPLICATE_466a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_a8d8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1124_l1148_l1140_l1136_l1132_l1127_DUPLICATE_466a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1124_l1140_l1136_l1132_l1127_DUPLICATE_7741_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1124_l1140_l1136_l1132_l1127_DUPLICATE_7741_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1124_l1140_l1136_l1132_l1127_DUPLICATE_7741_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_189d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1124_l1140_l1136_l1132_l1127_DUPLICATE_7741_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_0b61_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1124_l1140_l1136_l1132_l1127_DUPLICATE_7741_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_189d_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1148_l1136_DUPLICATE_2dcc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_a8d8_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1148_l1136_DUPLICATE_2dcc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1124_l1111_l1148_l1136_l1132_l1127_DUPLICATE_00b0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1124_l1111_l1148_l1136_l1132_l1127_DUPLICATE_00b0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1124_l1111_l1148_l1136_l1132_l1127_DUPLICATE_00b0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1124_l1111_l1148_l1136_l1132_l1127_DUPLICATE_00b0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_189d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1124_l1111_l1148_l1136_l1132_l1127_DUPLICATE_00b0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_a8d8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1124_l1111_l1148_l1136_l1132_l1127_DUPLICATE_00b0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1111_c2_de2b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1111_c2_de2b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1111_c2_de2b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1111_c2_de2b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_0b61_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1143_c30_8584_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1111_c2_de2b] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_de2b_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_de2b_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1140_c7_0b61] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_0b61_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_0b61_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_0b61_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_0b61_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_0b61_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_0b61_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1111_c2_de2b] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1148_c7_a8d8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_a8d8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_a8d8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_a8d8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_a8d8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_a8d8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_a8d8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_a8d8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_a8d8_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1151_c21_1f48] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1151_c21_1f48_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1151_c31_8160_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1148_c7_a8d8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_a8d8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_a8d8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_a8d8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_a8d8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_a8d8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_a8d8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_a8d8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_a8d8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1148_c7_a8d8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_a8d8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_a8d8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_a8d8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_a8d8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_a8d8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_a8d8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_a8d8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_a8d8_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1111_c2_de2b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_de2b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_de2b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_186c LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_186c_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_186c_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_186c_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_186c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1133_c3_c789] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1133_c3_c789_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_c789_left;
     BIN_OP_OR_uxn_opcodes_h_l1133_c3_c789_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_c789_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_c789_return_output := BIN_OP_OR_uxn_opcodes_h_l1133_c3_c789_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1111_c2_de2b] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1141_c3_f49a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1141_c3_f49a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_f49a_left;
     BIN_OP_OR_uxn_opcodes_h_l1141_c3_f49a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_f49a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_f49a_return_output := BIN_OP_OR_uxn_opcodes_h_l1141_c3_f49a_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1133_c3_c789_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_7ca6_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_f49a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1140_c7_0b61_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1141_c3_f49a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_a8d8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1151_c21_1f48_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1136_c7_189d_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_186c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1129_l1138_DUPLICATE_186c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_0b61_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_a8d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_189d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_0b61_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1148_c7_a8d8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_0b61_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_a8d8_return_output;
     -- n16_MUX[uxn_opcodes_h_l1140_c7_0b61] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1140_c7_0b61_cond <= VAR_n16_MUX_uxn_opcodes_h_l1140_c7_0b61_cond;
     n16_MUX_uxn_opcodes_h_l1140_c7_0b61_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1140_c7_0b61_iftrue;
     n16_MUX_uxn_opcodes_h_l1140_c7_0b61_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1140_c7_0b61_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output := n16_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1148_c7_a8d8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1148_c7_a8d8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_a8d8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1148_c7_a8d8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_a8d8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1148_c7_a8d8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_a8d8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_a8d8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1148_c7_a8d8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1140_c7_0b61] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_0b61_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_0b61_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_0b61_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_0b61_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_0b61_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_0b61_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output;

     -- t16_MUX[uxn_opcodes_h_l1132_c7_1db2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1132_c7_1db2_cond <= VAR_t16_MUX_uxn_opcodes_h_l1132_c7_1db2_cond;
     t16_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue;
     t16_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output := t16_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1140_c7_0b61] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_0b61_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_0b61_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_0b61_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_0b61_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_0b61_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_0b61_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output;

     -- BIN_OP_XOR[uxn_opcodes_h_l1142_c11_7ca6] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l1142_c11_7ca6_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_7ca6_left;
     BIN_OP_XOR_uxn_opcodes_h_l1142_c11_7ca6_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_7ca6_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_7ca6_return_output := BIN_OP_XOR_uxn_opcodes_h_l1142_c11_7ca6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1140_c7_0b61] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_0b61_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_0b61_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_0b61_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_0b61_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_0b61_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_0b61_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1136_c7_189d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_189d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_189d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_189d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_189d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_189d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_189d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_189d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_189d_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_0b61_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_7ca6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1136_c7_189d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_189d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1136_c7_189d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_189d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_189d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_0b61_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1148_c7_a8d8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1140_c7_0b61] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1140_c7_0b61_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_0b61_cond;
     tmp16_MUX_uxn_opcodes_h_l1140_c7_0b61_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_0b61_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1140_c7_0b61_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_0b61_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output := tmp16_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output;

     -- t16_MUX[uxn_opcodes_h_l1127_c7_1808] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1127_c7_1808_cond <= VAR_t16_MUX_uxn_opcodes_h_l1127_c7_1808_cond;
     t16_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue;
     t16_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1127_c7_1808_return_output := t16_MUX_uxn_opcodes_h_l1127_c7_1808_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1136_c7_189d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_189d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_189d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_189d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_189d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_189d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_189d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_189d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_189d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1132_c7_1db2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_1db2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_1db2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1136_c7_189d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_189d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_189d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_189d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_189d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_189d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_189d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_189d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_189d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1146_c21_37eb] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1146_c21_37eb_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1142_c11_7ca6_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1136_c7_189d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_189d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_189d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_189d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_189d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_189d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_189d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_189d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_189d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1136_c7_189d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1136_c7_189d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1136_c7_189d_cond;
     n16_MUX_uxn_opcodes_h_l1136_c7_189d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1136_c7_189d_iftrue;
     n16_MUX_uxn_opcodes_h_l1136_c7_189d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1136_c7_189d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1136_c7_189d_return_output := n16_MUX_uxn_opcodes_h_l1136_c7_189d_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_0b61_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1146_c21_37eb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1136_c7_189d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1136_c7_189d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1136_c7_189d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1136_c7_189d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1127_c7_1808_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_189d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1136_c7_189d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1136_c7_189d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_189d_cond;
     tmp16_MUX_uxn_opcodes_h_l1136_c7_189d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_189d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1136_c7_189d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_189d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_189d_return_output := tmp16_MUX_uxn_opcodes_h_l1136_c7_189d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1132_c7_1db2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_1db2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_1db2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output;

     -- t16_MUX[uxn_opcodes_h_l1124_c7_87fb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1124_c7_87fb_cond <= VAR_t16_MUX_uxn_opcodes_h_l1124_c7_87fb_cond;
     t16_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue;
     t16_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output := t16_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output;

     -- n16_MUX[uxn_opcodes_h_l1132_c7_1db2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1132_c7_1db2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1132_c7_1db2_cond;
     n16_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue;
     n16_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output := n16_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1127_c7_1808] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_1808_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_1808_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_1808_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_1808_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1140_c7_0b61] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1140_c7_0b61_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_0b61_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1140_c7_0b61_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_0b61_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1140_c7_0b61_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_0b61_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output := result_u8_value_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1132_c7_1db2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_1db2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_1db2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1132_c7_1db2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_1db2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_1db2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1127_c7_1808_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_189d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1140_c7_0b61_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1136_c7_189d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1124_c7_87fb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_87fb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_87fb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1136_c7_189d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1136_c7_189d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_189d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1136_c7_189d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_189d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1136_c7_189d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_189d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_189d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1136_c7_189d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1127_c7_1808] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_1808_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_1808_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_1808_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_1808_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1127_c7_1808] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_1808_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_1808_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_1808_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_1808_return_output;

     -- n16_MUX[uxn_opcodes_h_l1127_c7_1808] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1127_c7_1808_cond <= VAR_n16_MUX_uxn_opcodes_h_l1127_c7_1808_cond;
     n16_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue;
     n16_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1127_c7_1808_return_output := n16_MUX_uxn_opcodes_h_l1127_c7_1808_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1132_c7_1db2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1132_c7_1db2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_1db2_cond;
     tmp16_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output := tmp16_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1127_c7_1808] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_1808_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_1808_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_1808_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_1808_return_output;

     -- t16_MUX[uxn_opcodes_h_l1111_c2_de2b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1111_c2_de2b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1111_c2_de2b_cond;
     t16_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue;
     t16_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output := t16_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1127_c7_1808_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1127_c7_1808_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1127_c7_1808_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1127_c7_1808_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1136_c7_189d_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1124_c7_87fb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_87fb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_87fb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output;

     -- n16_MUX[uxn_opcodes_h_l1124_c7_87fb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1124_c7_87fb_cond <= VAR_n16_MUX_uxn_opcodes_h_l1124_c7_87fb_cond;
     n16_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue;
     n16_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output := n16_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1132_c7_1db2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1132_c7_1db2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_1db2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_1db2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_1db2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1124_c7_87fb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_87fb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_87fb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1111_c2_de2b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_de2b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_de2b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1124_c7_87fb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_87fb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_87fb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1127_c7_1808] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1127_c7_1808_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_1808_cond;
     tmp16_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_1808_return_output := tmp16_MUX_uxn_opcodes_h_l1127_c7_1808_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1132_c7_1db2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1127_c7_1808_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1124_c7_87fb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1124_c7_87fb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_87fb_cond;
     tmp16_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output := tmp16_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1111_c2_de2b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_de2b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_de2b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1111_c2_de2b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1111_c2_de2b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1111_c2_de2b_cond;
     n16_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue;
     n16_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output := n16_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1111_c2_de2b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_de2b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_de2b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1127_c7_1808] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1127_c7_1808_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_1808_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_1808_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_1808_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_1808_return_output := result_u8_value_MUX_uxn_opcodes_h_l1127_c7_1808_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1111_c2_de2b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_de2b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_de2b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1127_c7_1808_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1111_c2_de2b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1111_c2_de2b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_de2b_cond;
     tmp16_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output := tmp16_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1124_c7_87fb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1124_c7_87fb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_87fb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_87fb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_87fb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output := result_u8_value_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1124_c7_87fb_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1111_c2_de2b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1111_c2_de2b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_de2b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_de2b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_de2b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l1155_l1107_DUPLICATE_6f77 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l1155_l1107_DUPLICATE_6f77_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_ee25(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1111_c2_de2b_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l1155_l1107_DUPLICATE_6f77_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l1155_l1107_DUPLICATE_6f77_return_output;
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
