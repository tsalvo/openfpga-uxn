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
-- Submodules: 73
entity div2_0CLK_7c6279d3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end div2_0CLK_7c6279d3;
architecture arch of div2_0CLK_7c6279d3 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2090_c6_b186]
signal BIN_OP_EQ_uxn_opcodes_h_l2090_c6_b186_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2090_c6_b186_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2090_c6_b186_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2090_c2_3cd1]
signal t16_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2090_c2_3cd1]
signal tmp16_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2090_c2_3cd1]
signal n16_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2090_c2_3cd1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2090_c2_3cd1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2090_c2_3cd1]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2090_c2_3cd1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2090_c2_3cd1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2090_c2_3cd1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2090_c2_3cd1]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2090_c2_3cd1]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2090_c2_3cd1]
signal result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2103_c11_d94a]
signal BIN_OP_EQ_uxn_opcodes_h_l2103_c11_d94a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2103_c11_d94a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2103_c11_d94a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2103_c7_9a14]
signal t16_MUX_uxn_opcodes_h_l2103_c7_9a14_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2103_c7_9a14]
signal tmp16_MUX_uxn_opcodes_h_l2103_c7_9a14_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2103_c7_9a14]
signal n16_MUX_uxn_opcodes_h_l2103_c7_9a14_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2103_c7_9a14]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_9a14_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2103_c7_9a14]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_9a14_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2103_c7_9a14]
signal result_u8_value_MUX_uxn_opcodes_h_l2103_c7_9a14_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2103_c7_9a14]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_9a14_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2103_c7_9a14]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_9a14_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2106_c11_617d]
signal BIN_OP_EQ_uxn_opcodes_h_l2106_c11_617d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2106_c11_617d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2106_c11_617d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2106_c7_aa00]
signal t16_MUX_uxn_opcodes_h_l2106_c7_aa00_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2106_c7_aa00]
signal tmp16_MUX_uxn_opcodes_h_l2106_c7_aa00_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2106_c7_aa00]
signal n16_MUX_uxn_opcodes_h_l2106_c7_aa00_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2106_c7_aa00]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_aa00_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2106_c7_aa00]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_aa00_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2106_c7_aa00]
signal result_u8_value_MUX_uxn_opcodes_h_l2106_c7_aa00_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2106_c7_aa00]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_aa00_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2106_c7_aa00]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_aa00_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2111_c11_8c35]
signal BIN_OP_EQ_uxn_opcodes_h_l2111_c11_8c35_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2111_c11_8c35_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2111_c11_8c35_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2111_c7_3ed1]
signal t16_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2111_c7_3ed1]
signal tmp16_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2111_c7_3ed1]
signal n16_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2111_c7_3ed1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2111_c7_3ed1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2111_c7_3ed1]
signal result_u8_value_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2111_c7_3ed1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2111_c7_3ed1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2112_c3_be9a]
signal BIN_OP_OR_uxn_opcodes_h_l2112_c3_be9a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2112_c3_be9a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2112_c3_be9a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2115_c11_9029]
signal BIN_OP_EQ_uxn_opcodes_h_l2115_c11_9029_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2115_c11_9029_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2115_c11_9029_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2115_c7_7327]
signal tmp16_MUX_uxn_opcodes_h_l2115_c7_7327_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2115_c7_7327_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2115_c7_7327_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2115_c7_7327_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2115_c7_7327]
signal n16_MUX_uxn_opcodes_h_l2115_c7_7327_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2115_c7_7327_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2115_c7_7327_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2115_c7_7327_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2115_c7_7327]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_7327_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_7327_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_7327_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_7327_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2115_c7_7327]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_7327_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_7327_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_7327_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_7327_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2115_c7_7327]
signal result_u8_value_MUX_uxn_opcodes_h_l2115_c7_7327_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2115_c7_7327_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2115_c7_7327_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2115_c7_7327_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2115_c7_7327]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_7327_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_7327_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_7327_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_7327_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2115_c7_7327]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_7327_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_7327_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_7327_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_7327_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2119_c11_ffb6]
signal BIN_OP_EQ_uxn_opcodes_h_l2119_c11_ffb6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2119_c11_ffb6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2119_c11_ffb6_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2119_c7_42e2]
signal tmp16_MUX_uxn_opcodes_h_l2119_c7_42e2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2119_c7_42e2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2119_c7_42e2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2119_c7_42e2]
signal n16_MUX_uxn_opcodes_h_l2119_c7_42e2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2119_c7_42e2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2119_c7_42e2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2119_c7_42e2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_42e2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_42e2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_42e2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2119_c7_42e2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_42e2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_42e2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_42e2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2119_c7_42e2]
signal result_u8_value_MUX_uxn_opcodes_h_l2119_c7_42e2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2119_c7_42e2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2119_c7_42e2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2119_c7_42e2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_42e2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_42e2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_42e2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2119_c7_42e2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_42e2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_42e2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_42e2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2120_c3_6093]
signal BIN_OP_OR_uxn_opcodes_h_l2120_c3_6093_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2120_c3_6093_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2120_c3_6093_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2121_c11_4c30]
signal BIN_OP_EQ_uxn_opcodes_h_l2121_c11_4c30_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2121_c11_4c30_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2121_c11_4c30_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l2121_c26_6e15]
signal BIN_OP_DIV_uxn_opcodes_h_l2121_c26_6e15_left : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2121_c26_6e15_right : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2121_c26_6e15_return_output : unsigned(15 downto 0);

-- MUX[uxn_opcodes_h_l2121_c11_309c]
signal MUX_uxn_opcodes_h_l2121_c11_309c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2121_c11_309c_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2121_c11_309c_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2121_c11_309c_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2122_c30_d8d4]
signal sp_relative_shift_uxn_opcodes_h_l2122_c30_d8d4_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2122_c30_d8d4_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2122_c30_d8d4_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2122_c30_d8d4_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2127_c11_79cd]
signal BIN_OP_EQ_uxn_opcodes_h_l2127_c11_79cd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2127_c11_79cd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2127_c11_79cd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2127_c7_1cbf]
signal result_u8_value_MUX_uxn_opcodes_h_l2127_c7_1cbf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2127_c7_1cbf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2127_c7_1cbf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2127_c7_1cbf_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2127_c7_1cbf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_1cbf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_1cbf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_1cbf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_1cbf_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2127_c7_1cbf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_1cbf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_1cbf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_1cbf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_1cbf_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2127_c7_1cbf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_1cbf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_1cbf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_1cbf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_1cbf_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2130_c31_b0ca]
signal CONST_SR_8_uxn_opcodes_h_l2130_c31_b0ca_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2130_c31_b0ca_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_a5d2
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_a5d2_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_a5d2_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2090_c6_b186
BIN_OP_EQ_uxn_opcodes_h_l2090_c6_b186 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2090_c6_b186_left,
BIN_OP_EQ_uxn_opcodes_h_l2090_c6_b186_right,
BIN_OP_EQ_uxn_opcodes_h_l2090_c6_b186_return_output);

-- t16_MUX_uxn_opcodes_h_l2090_c2_3cd1
t16_MUX_uxn_opcodes_h_l2090_c2_3cd1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond,
t16_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue,
t16_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse,
t16_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2090_c2_3cd1
tmp16_MUX_uxn_opcodes_h_l2090_c2_3cd1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond,
tmp16_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue,
tmp16_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse,
tmp16_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output);

-- n16_MUX_uxn_opcodes_h_l2090_c2_3cd1
n16_MUX_uxn_opcodes_h_l2090_c2_3cd1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond,
n16_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue,
n16_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse,
n16_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3cd1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3cd1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3cd1
result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3cd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3cd1
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3cd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3cd1
result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3cd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3cd1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3cd1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3cd1
result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3cd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1
result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1
result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3cd1
result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3cd1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2103_c11_d94a
BIN_OP_EQ_uxn_opcodes_h_l2103_c11_d94a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2103_c11_d94a_left,
BIN_OP_EQ_uxn_opcodes_h_l2103_c11_d94a_right,
BIN_OP_EQ_uxn_opcodes_h_l2103_c11_d94a_return_output);

-- t16_MUX_uxn_opcodes_h_l2103_c7_9a14
t16_MUX_uxn_opcodes_h_l2103_c7_9a14 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2103_c7_9a14_cond,
t16_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue,
t16_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse,
t16_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2103_c7_9a14
tmp16_MUX_uxn_opcodes_h_l2103_c7_9a14 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2103_c7_9a14_cond,
tmp16_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue,
tmp16_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse,
tmp16_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output);

-- n16_MUX_uxn_opcodes_h_l2103_c7_9a14
n16_MUX_uxn_opcodes_h_l2103_c7_9a14 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2103_c7_9a14_cond,
n16_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue,
n16_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse,
n16_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_9a14
result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_9a14 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_9a14_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_9a14
result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_9a14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_9a14_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2103_c7_9a14
result_u8_value_MUX_uxn_opcodes_h_l2103_c7_9a14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2103_c7_9a14_cond,
result_u8_value_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_9a14
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_9a14 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_9a14_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_9a14
result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_9a14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_9a14_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2106_c11_617d
BIN_OP_EQ_uxn_opcodes_h_l2106_c11_617d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2106_c11_617d_left,
BIN_OP_EQ_uxn_opcodes_h_l2106_c11_617d_right,
BIN_OP_EQ_uxn_opcodes_h_l2106_c11_617d_return_output);

-- t16_MUX_uxn_opcodes_h_l2106_c7_aa00
t16_MUX_uxn_opcodes_h_l2106_c7_aa00 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2106_c7_aa00_cond,
t16_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue,
t16_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse,
t16_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2106_c7_aa00
tmp16_MUX_uxn_opcodes_h_l2106_c7_aa00 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2106_c7_aa00_cond,
tmp16_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue,
tmp16_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse,
tmp16_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output);

-- n16_MUX_uxn_opcodes_h_l2106_c7_aa00
n16_MUX_uxn_opcodes_h_l2106_c7_aa00 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2106_c7_aa00_cond,
n16_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue,
n16_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse,
n16_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_aa00
result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_aa00 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_aa00_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_aa00
result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_aa00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_aa00_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2106_c7_aa00
result_u8_value_MUX_uxn_opcodes_h_l2106_c7_aa00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2106_c7_aa00_cond,
result_u8_value_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_aa00
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_aa00 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_aa00_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_aa00
result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_aa00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_aa00_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2111_c11_8c35
BIN_OP_EQ_uxn_opcodes_h_l2111_c11_8c35 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2111_c11_8c35_left,
BIN_OP_EQ_uxn_opcodes_h_l2111_c11_8c35_right,
BIN_OP_EQ_uxn_opcodes_h_l2111_c11_8c35_return_output);

-- t16_MUX_uxn_opcodes_h_l2111_c7_3ed1
t16_MUX_uxn_opcodes_h_l2111_c7_3ed1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond,
t16_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue,
t16_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse,
t16_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2111_c7_3ed1
tmp16_MUX_uxn_opcodes_h_l2111_c7_3ed1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond,
tmp16_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue,
tmp16_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse,
tmp16_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output);

-- n16_MUX_uxn_opcodes_h_l2111_c7_3ed1
n16_MUX_uxn_opcodes_h_l2111_c7_3ed1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond,
n16_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue,
n16_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse,
n16_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_3ed1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_3ed1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_3ed1
result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_3ed1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2111_c7_3ed1
result_u8_value_MUX_uxn_opcodes_h_l2111_c7_3ed1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_3ed1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_3ed1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_3ed1
result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_3ed1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2112_c3_be9a
BIN_OP_OR_uxn_opcodes_h_l2112_c3_be9a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2112_c3_be9a_left,
BIN_OP_OR_uxn_opcodes_h_l2112_c3_be9a_right,
BIN_OP_OR_uxn_opcodes_h_l2112_c3_be9a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2115_c11_9029
BIN_OP_EQ_uxn_opcodes_h_l2115_c11_9029 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2115_c11_9029_left,
BIN_OP_EQ_uxn_opcodes_h_l2115_c11_9029_right,
BIN_OP_EQ_uxn_opcodes_h_l2115_c11_9029_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2115_c7_7327
tmp16_MUX_uxn_opcodes_h_l2115_c7_7327 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2115_c7_7327_cond,
tmp16_MUX_uxn_opcodes_h_l2115_c7_7327_iftrue,
tmp16_MUX_uxn_opcodes_h_l2115_c7_7327_iffalse,
tmp16_MUX_uxn_opcodes_h_l2115_c7_7327_return_output);

-- n16_MUX_uxn_opcodes_h_l2115_c7_7327
n16_MUX_uxn_opcodes_h_l2115_c7_7327 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2115_c7_7327_cond,
n16_MUX_uxn_opcodes_h_l2115_c7_7327_iftrue,
n16_MUX_uxn_opcodes_h_l2115_c7_7327_iffalse,
n16_MUX_uxn_opcodes_h_l2115_c7_7327_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_7327
result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_7327 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_7327_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_7327_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_7327_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_7327_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_7327
result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_7327 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_7327_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_7327_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_7327_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_7327_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2115_c7_7327
result_u8_value_MUX_uxn_opcodes_h_l2115_c7_7327 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2115_c7_7327_cond,
result_u8_value_MUX_uxn_opcodes_h_l2115_c7_7327_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2115_c7_7327_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2115_c7_7327_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_7327
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_7327 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_7327_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_7327_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_7327_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_7327_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_7327
result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_7327 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_7327_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_7327_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_7327_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_7327_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2119_c11_ffb6
BIN_OP_EQ_uxn_opcodes_h_l2119_c11_ffb6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2119_c11_ffb6_left,
BIN_OP_EQ_uxn_opcodes_h_l2119_c11_ffb6_right,
BIN_OP_EQ_uxn_opcodes_h_l2119_c11_ffb6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2119_c7_42e2
tmp16_MUX_uxn_opcodes_h_l2119_c7_42e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2119_c7_42e2_cond,
tmp16_MUX_uxn_opcodes_h_l2119_c7_42e2_iftrue,
tmp16_MUX_uxn_opcodes_h_l2119_c7_42e2_iffalse,
tmp16_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output);

-- n16_MUX_uxn_opcodes_h_l2119_c7_42e2
n16_MUX_uxn_opcodes_h_l2119_c7_42e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2119_c7_42e2_cond,
n16_MUX_uxn_opcodes_h_l2119_c7_42e2_iftrue,
n16_MUX_uxn_opcodes_h_l2119_c7_42e2_iffalse,
n16_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_42e2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_42e2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_42e2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_42e2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_42e2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_42e2
result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_42e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_42e2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_42e2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_42e2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2119_c7_42e2
result_u8_value_MUX_uxn_opcodes_h_l2119_c7_42e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2119_c7_42e2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2119_c7_42e2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2119_c7_42e2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_42e2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_42e2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_42e2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_42e2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_42e2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_42e2
result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_42e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_42e2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_42e2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_42e2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2120_c3_6093
BIN_OP_OR_uxn_opcodes_h_l2120_c3_6093 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2120_c3_6093_left,
BIN_OP_OR_uxn_opcodes_h_l2120_c3_6093_right,
BIN_OP_OR_uxn_opcodes_h_l2120_c3_6093_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2121_c11_4c30
BIN_OP_EQ_uxn_opcodes_h_l2121_c11_4c30 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2121_c11_4c30_left,
BIN_OP_EQ_uxn_opcodes_h_l2121_c11_4c30_right,
BIN_OP_EQ_uxn_opcodes_h_l2121_c11_4c30_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l2121_c26_6e15
BIN_OP_DIV_uxn_opcodes_h_l2121_c26_6e15 : entity work.BIN_OP_DIV_uint16_t_uint16_t_0CLK_ccb8c834 port map (
BIN_OP_DIV_uxn_opcodes_h_l2121_c26_6e15_left,
BIN_OP_DIV_uxn_opcodes_h_l2121_c26_6e15_right,
BIN_OP_DIV_uxn_opcodes_h_l2121_c26_6e15_return_output);

-- MUX_uxn_opcodes_h_l2121_c11_309c
MUX_uxn_opcodes_h_l2121_c11_309c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2121_c11_309c_cond,
MUX_uxn_opcodes_h_l2121_c11_309c_iftrue,
MUX_uxn_opcodes_h_l2121_c11_309c_iffalse,
MUX_uxn_opcodes_h_l2121_c11_309c_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2122_c30_d8d4
sp_relative_shift_uxn_opcodes_h_l2122_c30_d8d4 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2122_c30_d8d4_ins,
sp_relative_shift_uxn_opcodes_h_l2122_c30_d8d4_x,
sp_relative_shift_uxn_opcodes_h_l2122_c30_d8d4_y,
sp_relative_shift_uxn_opcodes_h_l2122_c30_d8d4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2127_c11_79cd
BIN_OP_EQ_uxn_opcodes_h_l2127_c11_79cd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2127_c11_79cd_left,
BIN_OP_EQ_uxn_opcodes_h_l2127_c11_79cd_right,
BIN_OP_EQ_uxn_opcodes_h_l2127_c11_79cd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2127_c7_1cbf
result_u8_value_MUX_uxn_opcodes_h_l2127_c7_1cbf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2127_c7_1cbf_cond,
result_u8_value_MUX_uxn_opcodes_h_l2127_c7_1cbf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2127_c7_1cbf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2127_c7_1cbf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_1cbf
result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_1cbf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_1cbf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_1cbf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_1cbf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_1cbf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_1cbf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_1cbf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_1cbf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_1cbf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_1cbf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_1cbf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_1cbf
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_1cbf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_1cbf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_1cbf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_1cbf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_1cbf_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2130_c31_b0ca
CONST_SR_8_uxn_opcodes_h_l2130_c31_b0ca : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2130_c31_b0ca_x,
CONST_SR_8_uxn_opcodes_h_l2130_c31_b0ca_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_a5d2
CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_a5d2 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_a5d2_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_a5d2_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2090_c6_b186_return_output,
 t16_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output,
 tmp16_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output,
 n16_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2103_c11_d94a_return_output,
 t16_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output,
 tmp16_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output,
 n16_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2106_c11_617d_return_output,
 t16_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output,
 tmp16_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output,
 n16_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2111_c11_8c35_return_output,
 t16_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output,
 tmp16_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output,
 n16_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2112_c3_be9a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2115_c11_9029_return_output,
 tmp16_MUX_uxn_opcodes_h_l2115_c7_7327_return_output,
 n16_MUX_uxn_opcodes_h_l2115_c7_7327_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_7327_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_7327_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2115_c7_7327_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_7327_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_7327_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2119_c11_ffb6_return_output,
 tmp16_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output,
 n16_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2120_c3_6093_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2121_c11_4c30_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l2121_c26_6e15_return_output,
 MUX_uxn_opcodes_h_l2121_c11_309c_return_output,
 sp_relative_shift_uxn_opcodes_h_l2122_c30_d8d4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2127_c11_79cd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2127_c7_1cbf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_1cbf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_1cbf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_1cbf_return_output,
 CONST_SR_8_uxn_opcodes_h_l2130_c31_b0ca_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_a5d2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_b186_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_b186_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_b186_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2095_c3_b0d3 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2090_c2_3cd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2090_c2_3cd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2100_c3_7d18 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2090_c2_3cd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2090_c2_3cd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_d94a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_d94a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_d94a_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2103_c7_9a14_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_9a14_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2103_c7_9a14_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_9a14_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_9a14_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_9a14_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2104_c3_6669 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_9a14_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_9a14_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_617d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_617d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_617d_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2106_c7_aa00_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_aa00_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2106_c7_aa00_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_aa00_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_aa00_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_aa00_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2109_c3_8e8f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_aa00_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_aa00_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_8c35_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_8c35_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_8c35_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_7327_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2115_c7_7327_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_7327_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_7327_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_7327_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2113_c3_7122 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_7327_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_7327_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_be9a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_be9a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_be9a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_9029_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_9029_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_9029_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_7327_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_7327_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_7327_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2115_c7_7327_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2115_c7_7327_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2115_c7_7327_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_7327_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_7327_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_7327_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_7327_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_7327_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_7327_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_7327_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_7327_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_7327_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_7327_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_7327_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_7327_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_7327_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_7327_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_7327_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_ffb6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_ffb6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_ffb6_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_42e2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_42e2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_42e2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2119_c7_42e2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2119_c7_42e2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2119_c7_42e2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_42e2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_42e2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_1cbf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_42e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_42e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_42e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_42e2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_42e2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_42e2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_1cbf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_42e2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_42e2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2124_c3_62ec : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_42e2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_1cbf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_42e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_42e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_42e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_1cbf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_42e2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_6093_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_6093_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_6093_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2121_c11_309c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_4c30_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_4c30_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_4c30_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2121_c11_309c_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2121_c11_309c_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_6e15_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_6e15_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_6e15_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2121_c11_309c_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_d8d4_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_d8d4_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_d8d4_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_d8d4_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2125_c21_fe2b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_79cd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_79cd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_79cd_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_1cbf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_1cbf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_1cbf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_1cbf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2128_c3_31b8 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_1cbf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_1cbf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_1cbf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2129_c3_16ad : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_1cbf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_1cbf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_1cbf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_1cbf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_1cbf_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2130_c31_b0ca_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2130_c31_b0ca_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2130_c21_8210_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2090_l2127_DUPLICATE_3005_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2127_DUPLICATE_e10d_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2119_DUPLICATE_2ed9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2127_l2119_DUPLICATE_4d3e_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2116_l2112_l2120_l2107_DUPLICATE_dc67_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_a5d2_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_a5d2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2127_l2115_DUPLICATE_b1e3_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l2134_l2086_DUPLICATE_2126_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_d94a_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_d8d4_y := resize(to_signed(-2, 3), 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_d8d4_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2129_c3_16ad := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_1cbf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2129_c3_16ad;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_42e2_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2100_c3_7d18 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2100_c3_7d18;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2109_c3_8e8f := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2109_c3_8e8f;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2128_c3_31b8 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_1cbf_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2128_c3_31b8;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2113_c3_7122 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2113_c3_7122;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_9029_right := to_unsigned(4, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2124_c3_62ec := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_42e2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2124_c3_62ec;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2104_c3_6669 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2104_c3_6669;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_79cd_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_ffb6_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_8c35_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_1cbf_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2121_c11_309c_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_b186_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_4c30_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_617d_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2095_c3_b0d3 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2095_c3_b0d3;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_d8d4_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_6093_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2119_c7_42e2_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_b186_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_d94a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_617d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_8c35_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_9029_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_ffb6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_79cd_left := VAR_phase;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_6e15_right := t16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_4c30_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_be9a_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2130_c31_b0ca_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_7327_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_42e2_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2106_c11_617d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2106_c11_617d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_617d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2106_c11_617d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_617d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_617d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2106_c11_617d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2127_l2119_DUPLICATE_4d3e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2127_l2119_DUPLICATE_4d3e_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2111_c11_8c35] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2111_c11_8c35_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_8c35_left;
     BIN_OP_EQ_uxn_opcodes_h_l2111_c11_8c35_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_8c35_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_8c35_return_output := BIN_OP_EQ_uxn_opcodes_h_l2111_c11_8c35_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2127_c11_79cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2127_c11_79cd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_79cd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2127_c11_79cd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_79cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_79cd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2127_c11_79cd_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2090_c2_3cd1] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2090_c2_3cd1_return_output := result.is_ram_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2090_c2_3cd1] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2090_c2_3cd1_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2103_c11_d94a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2103_c11_d94a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_d94a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2103_c11_d94a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_d94a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_d94a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2103_c11_d94a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2119_DUPLICATE_2ed9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2119_DUPLICATE_2ed9_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2115_c11_9029] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2115_c11_9029_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_9029_left;
     BIN_OP_EQ_uxn_opcodes_h_l2115_c11_9029_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_9029_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_9029_return_output := BIN_OP_EQ_uxn_opcodes_h_l2115_c11_9029_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2127_DUPLICATE_e10d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2127_DUPLICATE_e10d_return_output := result.sp_relative_shift;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2090_c2_3cd1] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2090_c2_3cd1_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2090_c6_b186] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2090_c6_b186_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_b186_left;
     BIN_OP_EQ_uxn_opcodes_h_l2090_c6_b186_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_b186_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_b186_return_output := BIN_OP_EQ_uxn_opcodes_h_l2090_c6_b186_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2090_l2127_DUPLICATE_3005 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2090_l2127_DUPLICATE_3005_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2119_c11_ffb6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2119_c11_ffb6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_ffb6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2119_c11_ffb6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_ffb6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_ffb6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2119_c11_ffb6_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2127_l2115_DUPLICATE_b1e3 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2127_l2115_DUPLICATE_b1e3_return_output := result.stack_address_sp_offset;

     -- CONST_SR_8[uxn_opcodes_h_l2130_c31_b0ca] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2130_c31_b0ca_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2130_c31_b0ca_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2130_c31_b0ca_return_output := CONST_SR_8_uxn_opcodes_h_l2130_c31_b0ca_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2116_l2112_l2120_l2107_DUPLICATE_dc67 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2116_l2112_l2120_l2107_DUPLICATE_dc67_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2121_c11_4c30] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2121_c11_4c30_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_4c30_left;
     BIN_OP_EQ_uxn_opcodes_h_l2121_c11_4c30_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_4c30_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_4c30_return_output := BIN_OP_EQ_uxn_opcodes_h_l2121_c11_4c30_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2090_c2_3cd1] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2090_c2_3cd1_return_output := result.is_pc_updated;

     -- sp_relative_shift[uxn_opcodes_h_l2122_c30_d8d4] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2122_c30_d8d4_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_d8d4_ins;
     sp_relative_shift_uxn_opcodes_h_l2122_c30_d8d4_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_d8d4_x;
     sp_relative_shift_uxn_opcodes_h_l2122_c30_d8d4_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_d8d4_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_d8d4_return_output := sp_relative_shift_uxn_opcodes_h_l2122_c30_d8d4_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_b186_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_b186_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_b186_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_b186_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_b186_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_b186_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_b186_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_b186_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_b186_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_b186_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_b186_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_b186_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2103_c7_9a14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_d94a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_9a14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_d94a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_9a14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_d94a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_9a14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_d94a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_9a14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_d94a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_9a14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_d94a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2103_c7_9a14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_d94a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_9a14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_d94a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2106_c7_aa00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_617d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_aa00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_617d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_aa00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_617d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_aa00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_617d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_aa00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_617d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_aa00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_617d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2106_c7_aa00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_617d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_aa00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_617d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_8c35_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_8c35_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_8c35_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_8c35_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_8c35_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_8c35_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_8c35_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_8c35_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2115_c7_7327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_9029_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_7327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_9029_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_7327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_9029_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_7327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_9029_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_7327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_9029_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_7327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_9029_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_7327_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_9029_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2119_c7_42e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_ffb6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_42e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_ffb6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_42e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_ffb6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_42e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_ffb6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_42e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_ffb6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_42e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_ffb6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_42e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_ffb6_return_output;
     VAR_MUX_uxn_opcodes_h_l2121_c11_309c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_4c30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_1cbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_79cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_1cbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_79cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_1cbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_79cd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_1cbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_79cd_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_be9a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2116_l2112_l2120_l2107_DUPLICATE_dc67_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_6093_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2116_l2112_l2120_l2107_DUPLICATE_dc67_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_a5d2_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2116_l2112_l2120_l2107_DUPLICATE_dc67_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2127_DUPLICATE_e10d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2127_DUPLICATE_e10d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2127_DUPLICATE_e10d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_7327_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2127_DUPLICATE_e10d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_1cbf_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2127_DUPLICATE_e10d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2127_l2119_DUPLICATE_4d3e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2127_l2119_DUPLICATE_4d3e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2127_l2119_DUPLICATE_4d3e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_7327_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2127_l2119_DUPLICATE_4d3e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_42e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2127_l2119_DUPLICATE_4d3e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_1cbf_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2127_l2119_DUPLICATE_4d3e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2119_DUPLICATE_2ed9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2119_DUPLICATE_2ed9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2119_DUPLICATE_2ed9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_7327_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2119_DUPLICATE_2ed9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_42e2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2119_DUPLICATE_2ed9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_7327_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2127_l2115_DUPLICATE_b1e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_1cbf_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2127_l2115_DUPLICATE_b1e3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2090_l2127_DUPLICATE_3005_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2090_l2127_DUPLICATE_3005_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2090_l2127_DUPLICATE_3005_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2090_l2127_DUPLICATE_3005_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_7327_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2090_l2127_DUPLICATE_3005_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_1cbf_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2115_l2111_l2106_l2103_l2090_l2127_DUPLICATE_3005_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2090_c2_3cd1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2090_c2_3cd1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2090_c2_3cd1_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2090_c2_3cd1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_42e2_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_d8d4_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2112_c3_be9a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2112_c3_be9a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_be9a_left;
     BIN_OP_OR_uxn_opcodes_h_l2112_c3_be9a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_be9a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_be9a_return_output := BIN_OP_OR_uxn_opcodes_h_l2112_c3_be9a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2090_c2_3cd1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2090_c2_3cd1] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2090_c2_3cd1] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2127_c7_1cbf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_1cbf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_1cbf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_1cbf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_1cbf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_1cbf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_1cbf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_1cbf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_1cbf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2119_c7_42e2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_42e2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_42e2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_42e2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_42e2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_42e2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_42e2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_a5d2 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_a5d2_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_a5d2_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_a5d2_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_a5d2_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2130_c21_8210] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2130_c21_8210_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2130_c31_b0ca_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2127_c7_1cbf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_1cbf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_1cbf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_1cbf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_1cbf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_1cbf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_1cbf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_1cbf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_1cbf_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2120_c3_6093] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2120_c3_6093_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_6093_left;
     BIN_OP_OR_uxn_opcodes_h_l2120_c3_6093_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_6093_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_6093_return_output := BIN_OP_OR_uxn_opcodes_h_l2120_c3_6093_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2090_c2_3cd1] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2127_c7_1cbf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_1cbf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_1cbf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_1cbf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_1cbf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_1cbf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_1cbf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_1cbf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_1cbf_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_be9a_return_output;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_6e15_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_6093_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2119_c7_42e2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_6093_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_1cbf_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2130_c21_8210_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2115_c7_7327_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_a5d2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_a5d2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_42e2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_1cbf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_7327_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_42e2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_1cbf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_42e2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_1cbf_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2115_c7_7327] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_7327_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_7327_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_7327_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_7327_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_7327_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_7327_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_7327_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_7327_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2127_c7_1cbf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2127_c7_1cbf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_1cbf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2127_c7_1cbf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_1cbf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2127_c7_1cbf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_1cbf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_1cbf_return_output := result_u8_value_MUX_uxn_opcodes_h_l2127_c7_1cbf_return_output;

     -- n16_MUX[uxn_opcodes_h_l2119_c7_42e2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2119_c7_42e2_cond <= VAR_n16_MUX_uxn_opcodes_h_l2119_c7_42e2_cond;
     n16_MUX_uxn_opcodes_h_l2119_c7_42e2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2119_c7_42e2_iftrue;
     n16_MUX_uxn_opcodes_h_l2119_c7_42e2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2119_c7_42e2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output := n16_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2119_c7_42e2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_42e2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_42e2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_42e2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_42e2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_42e2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_42e2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2119_c7_42e2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_42e2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_42e2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_42e2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_42e2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_42e2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_42e2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2119_c7_42e2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_42e2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_42e2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_42e2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_42e2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_42e2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_42e2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output;

     -- BIN_OP_DIV[uxn_opcodes_h_l2121_c26_6e15] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l2121_c26_6e15_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_6e15_left;
     BIN_OP_DIV_uxn_opcodes_h_l2121_c26_6e15_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_6e15_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_6e15_return_output := BIN_OP_DIV_uxn_opcodes_h_l2121_c26_6e15_return_output;

     -- t16_MUX[uxn_opcodes_h_l2111_c7_3ed1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond <= VAR_t16_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond;
     t16_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue;
     t16_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output := t16_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l2121_c11_309c_iffalse := VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_6e15_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2115_c7_7327_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_7327_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_7327_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_7327_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_7327_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_42e2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_1cbf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output;
     -- n16_MUX[uxn_opcodes_h_l2115_c7_7327] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2115_c7_7327_cond <= VAR_n16_MUX_uxn_opcodes_h_l2115_c7_7327_cond;
     n16_MUX_uxn_opcodes_h_l2115_c7_7327_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2115_c7_7327_iftrue;
     n16_MUX_uxn_opcodes_h_l2115_c7_7327_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2115_c7_7327_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2115_c7_7327_return_output := n16_MUX_uxn_opcodes_h_l2115_c7_7327_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2115_c7_7327] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_7327_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_7327_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_7327_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_7327_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_7327_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_7327_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_7327_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_7327_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2115_c7_7327] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_7327_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_7327_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_7327_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_7327_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_7327_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_7327_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_7327_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_7327_return_output;

     -- t16_MUX[uxn_opcodes_h_l2106_c7_aa00] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2106_c7_aa00_cond <= VAR_t16_MUX_uxn_opcodes_h_l2106_c7_aa00_cond;
     t16_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue;
     t16_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output := t16_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output;

     -- MUX[uxn_opcodes_h_l2121_c11_309c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2121_c11_309c_cond <= VAR_MUX_uxn_opcodes_h_l2121_c11_309c_cond;
     MUX_uxn_opcodes_h_l2121_c11_309c_iftrue <= VAR_MUX_uxn_opcodes_h_l2121_c11_309c_iftrue;
     MUX_uxn_opcodes_h_l2121_c11_309c_iffalse <= VAR_MUX_uxn_opcodes_h_l2121_c11_309c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2121_c11_309c_return_output := MUX_uxn_opcodes_h_l2121_c11_309c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2111_c7_3ed1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2115_c7_7327] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_7327_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_7327_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_7327_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_7327_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_7327_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_7327_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_7327_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_7327_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_42e2_iftrue := VAR_MUX_uxn_opcodes_h_l2121_c11_309c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2115_c7_7327_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_7327_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_7327_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_7327_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l2125_c21_fe2b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2125_c21_fe2b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_MUX_uxn_opcodes_h_l2121_c11_309c_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2111_c7_3ed1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output;

     -- n16_MUX[uxn_opcodes_h_l2111_c7_3ed1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond <= VAR_n16_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond;
     n16_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue;
     n16_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output := n16_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output;

     -- t16_MUX[uxn_opcodes_h_l2103_c7_9a14] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2103_c7_9a14_cond <= VAR_t16_MUX_uxn_opcodes_h_l2103_c7_9a14_cond;
     t16_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue;
     t16_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output := t16_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2111_c7_3ed1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2111_c7_3ed1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2106_c7_aa00] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_aa00_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_aa00_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2119_c7_42e2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2119_c7_42e2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_42e2_cond;
     tmp16_MUX_uxn_opcodes_h_l2119_c7_42e2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_42e2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2119_c7_42e2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_42e2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output := tmp16_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_42e2_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2125_c21_fe2b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_7327_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2106_c7_aa00] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_aa00_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_aa00_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output;

     -- t16_MUX[uxn_opcodes_h_l2090_c2_3cd1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond <= VAR_t16_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond;
     t16_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue;
     t16_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output := t16_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output;

     -- n16_MUX[uxn_opcodes_h_l2106_c7_aa00] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2106_c7_aa00_cond <= VAR_n16_MUX_uxn_opcodes_h_l2106_c7_aa00_cond;
     n16_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue;
     n16_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output := n16_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2119_c7_42e2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2119_c7_42e2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_42e2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2119_c7_42e2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_42e2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2119_c7_42e2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_42e2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2106_c7_aa00] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_aa00_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_aa00_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2103_c7_9a14] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_9a14_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_9a14_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2115_c7_7327] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2115_c7_7327_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_7327_cond;
     tmp16_MUX_uxn_opcodes_h_l2115_c7_7327_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_7327_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2115_c7_7327_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_7327_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_7327_return_output := tmp16_MUX_uxn_opcodes_h_l2115_c7_7327_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2106_c7_aa00] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_aa00_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_aa00_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_7327_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_42e2_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_7327_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2103_c7_9a14] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_9a14_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_9a14_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output;

     -- n16_MUX[uxn_opcodes_h_l2103_c7_9a14] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2103_c7_9a14_cond <= VAR_n16_MUX_uxn_opcodes_h_l2103_c7_9a14_cond;
     n16_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue;
     n16_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output := n16_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2103_c7_9a14] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_9a14_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_9a14_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2111_c7_3ed1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond;
     tmp16_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output := tmp16_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2103_c7_9a14] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_9a14_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_9a14_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2090_c2_3cd1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2115_c7_7327] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2115_c7_7327_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_7327_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2115_c7_7327_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_7327_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2115_c7_7327_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_7327_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_7327_return_output := result_u8_value_MUX_uxn_opcodes_h_l2115_c7_7327_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_7327_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2090_c2_3cd1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2090_c2_3cd1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output;

     -- n16_MUX[uxn_opcodes_h_l2090_c2_3cd1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond <= VAR_n16_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond;
     n16_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue;
     n16_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output := n16_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2111_c7_3ed1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_3ed1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_3ed1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_3ed1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2090_c2_3cd1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2106_c7_aa00] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2106_c7_aa00_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_aa00_cond;
     tmp16_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output := tmp16_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_3ed1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2106_c7_aa00] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2106_c7_aa00_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_aa00_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_aa00_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_aa00_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output := result_u8_value_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2103_c7_9a14] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2103_c7_9a14_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_9a14_cond;
     tmp16_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output := tmp16_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_aa00_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2103_c7_9a14] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2103_c7_9a14_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_9a14_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_9a14_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_9a14_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output := result_u8_value_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2090_c2_3cd1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond;
     tmp16_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output := tmp16_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output;

     -- Submodule level 10
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_9a14_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2090_c2_3cd1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3cd1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3cd1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3cd1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l2134_l2086_DUPLICATE_2126 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l2134_l2086_DUPLICATE_2126_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8b52(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3cd1_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l2134_l2086_DUPLICATE_2126_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l2134_l2086_DUPLICATE_2126_return_output;
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
