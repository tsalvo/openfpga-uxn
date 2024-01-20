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
entity div2_0CLK_7cf9dac2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end div2_0CLK_7cf9dac2;
architecture arch of div2_0CLK_7cf9dac2 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2090_c6_1c78]
signal BIN_OP_EQ_uxn_opcodes_h_l2090_c6_1c78_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2090_c6_1c78_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2090_c6_1c78_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2090_c2_65f1]
signal t16_MUX_uxn_opcodes_h_l2090_c2_65f1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2090_c2_65f1]
signal n16_MUX_uxn_opcodes_h_l2090_c2_65f1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2090_c2_65f1]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2090_c2_65f1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_65f1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2090_c2_65f1]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2090_c2_65f1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_65f1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2090_c2_65f1]
signal result_u8_value_MUX_uxn_opcodes_h_l2090_c2_65f1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2090_c2_65f1]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_65f1_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2090_c2_65f1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_65f1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2090_c2_65f1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_65f1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2090_c2_65f1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_65f1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2090_c2_65f1]
signal tmp16_MUX_uxn_opcodes_h_l2090_c2_65f1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2103_c11_dd1b]
signal BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd1b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd1b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd1b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2103_c7_c087]
signal t16_MUX_uxn_opcodes_h_l2103_c7_c087_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2103_c7_c087_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2103_c7_c087]
signal n16_MUX_uxn_opcodes_h_l2103_c7_c087_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2103_c7_c087_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2103_c7_c087]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c087_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c087_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2103_c7_c087]
signal result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c087_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c087_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2103_c7_c087]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c087_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c087_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2103_c7_c087]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c087_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c087_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2103_c7_c087]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c087_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c087_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2103_c7_c087]
signal tmp16_MUX_uxn_opcodes_h_l2103_c7_c087_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2103_c7_c087_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2106_c11_8e0a]
signal BIN_OP_EQ_uxn_opcodes_h_l2106_c11_8e0a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2106_c11_8e0a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2106_c11_8e0a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2106_c7_dc5d]
signal t16_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2106_c7_dc5d]
signal n16_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2106_c7_dc5d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2106_c7_dc5d]
signal result_u8_value_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2106_c7_dc5d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2106_c7_dc5d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2106_c7_dc5d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2106_c7_dc5d]
signal tmp16_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2111_c11_10bd]
signal BIN_OP_EQ_uxn_opcodes_h_l2111_c11_10bd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2111_c11_10bd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2111_c11_10bd_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2111_c7_15ad]
signal t16_MUX_uxn_opcodes_h_l2111_c7_15ad_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2111_c7_15ad]
signal n16_MUX_uxn_opcodes_h_l2111_c7_15ad_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2111_c7_15ad]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_15ad_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2111_c7_15ad]
signal result_u8_value_MUX_uxn_opcodes_h_l2111_c7_15ad_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2111_c7_15ad]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_15ad_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2111_c7_15ad]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_15ad_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2111_c7_15ad]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_15ad_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2111_c7_15ad]
signal tmp16_MUX_uxn_opcodes_h_l2111_c7_15ad_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2112_c3_4ae6]
signal BIN_OP_OR_uxn_opcodes_h_l2112_c3_4ae6_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2112_c3_4ae6_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2112_c3_4ae6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2115_c11_0c8e]
signal BIN_OP_EQ_uxn_opcodes_h_l2115_c11_0c8e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2115_c11_0c8e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2115_c11_0c8e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2115_c7_1ded]
signal n16_MUX_uxn_opcodes_h_l2115_c7_1ded_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2115_c7_1ded_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2115_c7_1ded_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2115_c7_1ded]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_1ded_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_1ded_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_1ded_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2115_c7_1ded]
signal result_u8_value_MUX_uxn_opcodes_h_l2115_c7_1ded_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2115_c7_1ded_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2115_c7_1ded_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2115_c7_1ded]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_1ded_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_1ded_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_1ded_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2115_c7_1ded]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_1ded_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_1ded_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_1ded_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2115_c7_1ded]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_1ded_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_1ded_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_1ded_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2115_c7_1ded]
signal tmp16_MUX_uxn_opcodes_h_l2115_c7_1ded_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2115_c7_1ded_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2115_c7_1ded_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2119_c11_903b]
signal BIN_OP_EQ_uxn_opcodes_h_l2119_c11_903b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2119_c11_903b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2119_c11_903b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2119_c7_22af]
signal n16_MUX_uxn_opcodes_h_l2119_c7_22af_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2119_c7_22af_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2119_c7_22af_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2119_c7_22af_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2119_c7_22af]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_22af_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_22af_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_22af_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_22af_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2119_c7_22af]
signal result_u8_value_MUX_uxn_opcodes_h_l2119_c7_22af_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2119_c7_22af_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2119_c7_22af_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2119_c7_22af_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2119_c7_22af]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_22af_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_22af_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_22af_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_22af_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2119_c7_22af]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_22af_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_22af_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_22af_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_22af_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2119_c7_22af]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_22af_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_22af_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_22af_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_22af_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2119_c7_22af]
signal tmp16_MUX_uxn_opcodes_h_l2119_c7_22af_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2119_c7_22af_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2119_c7_22af_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2119_c7_22af_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2120_c3_31b1]
signal BIN_OP_OR_uxn_opcodes_h_l2120_c3_31b1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2120_c3_31b1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2120_c3_31b1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2121_c11_069a]
signal BIN_OP_EQ_uxn_opcodes_h_l2121_c11_069a_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2121_c11_069a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2121_c11_069a_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l2121_c26_6e22]
signal BIN_OP_DIV_uxn_opcodes_h_l2121_c26_6e22_left : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2121_c26_6e22_right : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2121_c26_6e22_return_output : unsigned(15 downto 0);

-- MUX[uxn_opcodes_h_l2121_c11_3653]
signal MUX_uxn_opcodes_h_l2121_c11_3653_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2121_c11_3653_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2121_c11_3653_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2121_c11_3653_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2122_c30_91a4]
signal sp_relative_shift_uxn_opcodes_h_l2122_c30_91a4_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2122_c30_91a4_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2122_c30_91a4_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2122_c30_91a4_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2127_c11_6916]
signal BIN_OP_EQ_uxn_opcodes_h_l2127_c11_6916_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2127_c11_6916_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2127_c11_6916_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2127_c7_ecb3]
signal result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ecb3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ecb3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ecb3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ecb3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2127_c7_ecb3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ecb3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ecb3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ecb3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ecb3_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2127_c7_ecb3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ecb3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ecb3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ecb3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ecb3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2127_c7_ecb3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ecb3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ecb3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ecb3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ecb3_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2130_c31_6604]
signal CONST_SR_8_uxn_opcodes_h_l2130_c31_6604_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2130_c31_6604_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_222a
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_222a_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_222a_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2090_c6_1c78
BIN_OP_EQ_uxn_opcodes_h_l2090_c6_1c78 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2090_c6_1c78_left,
BIN_OP_EQ_uxn_opcodes_h_l2090_c6_1c78_right,
BIN_OP_EQ_uxn_opcodes_h_l2090_c6_1c78_return_output);

-- t16_MUX_uxn_opcodes_h_l2090_c2_65f1
t16_MUX_uxn_opcodes_h_l2090_c2_65f1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2090_c2_65f1_cond,
t16_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue,
t16_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse,
t16_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output);

-- n16_MUX_uxn_opcodes_h_l2090_c2_65f1
n16_MUX_uxn_opcodes_h_l2090_c2_65f1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2090_c2_65f1_cond,
n16_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue,
n16_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse,
n16_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_65f1
result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_65f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_65f1
result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_65f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_65f1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_65f1
result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_65f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_65f1
result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_65f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_65f1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2090_c2_65f1
result_u8_value_MUX_uxn_opcodes_h_l2090_c2_65f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2090_c2_65f1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_65f1
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_65f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_65f1_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_65f1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_65f1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_65f1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_65f1
result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_65f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_65f1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_65f1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_65f1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_65f1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2090_c2_65f1
tmp16_MUX_uxn_opcodes_h_l2090_c2_65f1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2090_c2_65f1_cond,
tmp16_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue,
tmp16_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse,
tmp16_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd1b
BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd1b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd1b_left,
BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd1b_right,
BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd1b_return_output);

-- t16_MUX_uxn_opcodes_h_l2103_c7_c087
t16_MUX_uxn_opcodes_h_l2103_c7_c087 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2103_c7_c087_cond,
t16_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue,
t16_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse,
t16_MUX_uxn_opcodes_h_l2103_c7_c087_return_output);

-- n16_MUX_uxn_opcodes_h_l2103_c7_c087
n16_MUX_uxn_opcodes_h_l2103_c7_c087 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2103_c7_c087_cond,
n16_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue,
n16_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse,
n16_MUX_uxn_opcodes_h_l2103_c7_c087_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c087
result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c087 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c087_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c087_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c087
result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c087 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c087_cond,
result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c087_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c087
result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c087 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c087_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c087_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c087
result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c087 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c087_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c087_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c087
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c087 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c087_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c087_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2103_c7_c087
tmp16_MUX_uxn_opcodes_h_l2103_c7_c087 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2103_c7_c087_cond,
tmp16_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue,
tmp16_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse,
tmp16_MUX_uxn_opcodes_h_l2103_c7_c087_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2106_c11_8e0a
BIN_OP_EQ_uxn_opcodes_h_l2106_c11_8e0a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2106_c11_8e0a_left,
BIN_OP_EQ_uxn_opcodes_h_l2106_c11_8e0a_right,
BIN_OP_EQ_uxn_opcodes_h_l2106_c11_8e0a_return_output);

-- t16_MUX_uxn_opcodes_h_l2106_c7_dc5d
t16_MUX_uxn_opcodes_h_l2106_c7_dc5d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond,
t16_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue,
t16_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse,
t16_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output);

-- n16_MUX_uxn_opcodes_h_l2106_c7_dc5d
n16_MUX_uxn_opcodes_h_l2106_c7_dc5d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond,
n16_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue,
n16_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse,
n16_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_dc5d
result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_dc5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2106_c7_dc5d
result_u8_value_MUX_uxn_opcodes_h_l2106_c7_dc5d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_dc5d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_dc5d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_dc5d
result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_dc5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_dc5d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_dc5d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2106_c7_dc5d
tmp16_MUX_uxn_opcodes_h_l2106_c7_dc5d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond,
tmp16_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue,
tmp16_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse,
tmp16_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2111_c11_10bd
BIN_OP_EQ_uxn_opcodes_h_l2111_c11_10bd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2111_c11_10bd_left,
BIN_OP_EQ_uxn_opcodes_h_l2111_c11_10bd_right,
BIN_OP_EQ_uxn_opcodes_h_l2111_c11_10bd_return_output);

-- t16_MUX_uxn_opcodes_h_l2111_c7_15ad
t16_MUX_uxn_opcodes_h_l2111_c7_15ad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2111_c7_15ad_cond,
t16_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue,
t16_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse,
t16_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output);

-- n16_MUX_uxn_opcodes_h_l2111_c7_15ad
n16_MUX_uxn_opcodes_h_l2111_c7_15ad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2111_c7_15ad_cond,
n16_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue,
n16_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse,
n16_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_15ad
result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_15ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_15ad_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2111_c7_15ad
result_u8_value_MUX_uxn_opcodes_h_l2111_c7_15ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2111_c7_15ad_cond,
result_u8_value_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_15ad
result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_15ad : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_15ad_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_15ad
result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_15ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_15ad_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_15ad
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_15ad : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_15ad_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2111_c7_15ad
tmp16_MUX_uxn_opcodes_h_l2111_c7_15ad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2111_c7_15ad_cond,
tmp16_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue,
tmp16_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse,
tmp16_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2112_c3_4ae6
BIN_OP_OR_uxn_opcodes_h_l2112_c3_4ae6 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2112_c3_4ae6_left,
BIN_OP_OR_uxn_opcodes_h_l2112_c3_4ae6_right,
BIN_OP_OR_uxn_opcodes_h_l2112_c3_4ae6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2115_c11_0c8e
BIN_OP_EQ_uxn_opcodes_h_l2115_c11_0c8e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2115_c11_0c8e_left,
BIN_OP_EQ_uxn_opcodes_h_l2115_c11_0c8e_right,
BIN_OP_EQ_uxn_opcodes_h_l2115_c11_0c8e_return_output);

-- n16_MUX_uxn_opcodes_h_l2115_c7_1ded
n16_MUX_uxn_opcodes_h_l2115_c7_1ded : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2115_c7_1ded_cond,
n16_MUX_uxn_opcodes_h_l2115_c7_1ded_iftrue,
n16_MUX_uxn_opcodes_h_l2115_c7_1ded_iffalse,
n16_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_1ded
result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_1ded : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_1ded_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_1ded_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_1ded_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2115_c7_1ded
result_u8_value_MUX_uxn_opcodes_h_l2115_c7_1ded : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2115_c7_1ded_cond,
result_u8_value_MUX_uxn_opcodes_h_l2115_c7_1ded_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2115_c7_1ded_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_1ded
result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_1ded : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_1ded_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_1ded_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_1ded_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_1ded
result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_1ded : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_1ded_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_1ded_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_1ded_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_1ded
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_1ded : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_1ded_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_1ded_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_1ded_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2115_c7_1ded
tmp16_MUX_uxn_opcodes_h_l2115_c7_1ded : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2115_c7_1ded_cond,
tmp16_MUX_uxn_opcodes_h_l2115_c7_1ded_iftrue,
tmp16_MUX_uxn_opcodes_h_l2115_c7_1ded_iffalse,
tmp16_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2119_c11_903b
BIN_OP_EQ_uxn_opcodes_h_l2119_c11_903b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2119_c11_903b_left,
BIN_OP_EQ_uxn_opcodes_h_l2119_c11_903b_right,
BIN_OP_EQ_uxn_opcodes_h_l2119_c11_903b_return_output);

-- n16_MUX_uxn_opcodes_h_l2119_c7_22af
n16_MUX_uxn_opcodes_h_l2119_c7_22af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2119_c7_22af_cond,
n16_MUX_uxn_opcodes_h_l2119_c7_22af_iftrue,
n16_MUX_uxn_opcodes_h_l2119_c7_22af_iffalse,
n16_MUX_uxn_opcodes_h_l2119_c7_22af_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_22af
result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_22af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_22af_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_22af_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_22af_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_22af_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2119_c7_22af
result_u8_value_MUX_uxn_opcodes_h_l2119_c7_22af : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2119_c7_22af_cond,
result_u8_value_MUX_uxn_opcodes_h_l2119_c7_22af_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2119_c7_22af_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2119_c7_22af_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_22af
result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_22af : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_22af_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_22af_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_22af_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_22af_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_22af
result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_22af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_22af_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_22af_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_22af_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_22af_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_22af
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_22af : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_22af_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_22af_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_22af_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_22af_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2119_c7_22af
tmp16_MUX_uxn_opcodes_h_l2119_c7_22af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2119_c7_22af_cond,
tmp16_MUX_uxn_opcodes_h_l2119_c7_22af_iftrue,
tmp16_MUX_uxn_opcodes_h_l2119_c7_22af_iffalse,
tmp16_MUX_uxn_opcodes_h_l2119_c7_22af_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2120_c3_31b1
BIN_OP_OR_uxn_opcodes_h_l2120_c3_31b1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2120_c3_31b1_left,
BIN_OP_OR_uxn_opcodes_h_l2120_c3_31b1_right,
BIN_OP_OR_uxn_opcodes_h_l2120_c3_31b1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2121_c11_069a
BIN_OP_EQ_uxn_opcodes_h_l2121_c11_069a : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2121_c11_069a_left,
BIN_OP_EQ_uxn_opcodes_h_l2121_c11_069a_right,
BIN_OP_EQ_uxn_opcodes_h_l2121_c11_069a_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l2121_c26_6e22
BIN_OP_DIV_uxn_opcodes_h_l2121_c26_6e22 : entity work.BIN_OP_DIV_uint16_t_uint16_t_0CLK_2b0015ee port map (
BIN_OP_DIV_uxn_opcodes_h_l2121_c26_6e22_left,
BIN_OP_DIV_uxn_opcodes_h_l2121_c26_6e22_right,
BIN_OP_DIV_uxn_opcodes_h_l2121_c26_6e22_return_output);

-- MUX_uxn_opcodes_h_l2121_c11_3653
MUX_uxn_opcodes_h_l2121_c11_3653 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2121_c11_3653_cond,
MUX_uxn_opcodes_h_l2121_c11_3653_iftrue,
MUX_uxn_opcodes_h_l2121_c11_3653_iffalse,
MUX_uxn_opcodes_h_l2121_c11_3653_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2122_c30_91a4
sp_relative_shift_uxn_opcodes_h_l2122_c30_91a4 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2122_c30_91a4_ins,
sp_relative_shift_uxn_opcodes_h_l2122_c30_91a4_x,
sp_relative_shift_uxn_opcodes_h_l2122_c30_91a4_y,
sp_relative_shift_uxn_opcodes_h_l2122_c30_91a4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2127_c11_6916
BIN_OP_EQ_uxn_opcodes_h_l2127_c11_6916 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2127_c11_6916_left,
BIN_OP_EQ_uxn_opcodes_h_l2127_c11_6916_right,
BIN_OP_EQ_uxn_opcodes_h_l2127_c11_6916_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ecb3
result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ecb3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ecb3_cond,
result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ecb3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ecb3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ecb3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ecb3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ecb3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ecb3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ecb3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ecb3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ecb3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ecb3
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ecb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ecb3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ecb3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ecb3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ecb3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ecb3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ecb3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ecb3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ecb3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ecb3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ecb3_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2130_c31_6604
CONST_SR_8_uxn_opcodes_h_l2130_c31_6604 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2130_c31_6604_x,
CONST_SR_8_uxn_opcodes_h_l2130_c31_6604_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_222a
CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_222a : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_222a_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_222a_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2090_c6_1c78_return_output,
 t16_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output,
 n16_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output,
 tmp16_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd1b_return_output,
 t16_MUX_uxn_opcodes_h_l2103_c7_c087_return_output,
 n16_MUX_uxn_opcodes_h_l2103_c7_c087_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c087_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c087_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c087_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c087_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c087_return_output,
 tmp16_MUX_uxn_opcodes_h_l2103_c7_c087_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2106_c11_8e0a_return_output,
 t16_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output,
 n16_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output,
 tmp16_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2111_c11_10bd_return_output,
 t16_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output,
 n16_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output,
 tmp16_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2112_c3_4ae6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2115_c11_0c8e_return_output,
 n16_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output,
 tmp16_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2119_c11_903b_return_output,
 n16_MUX_uxn_opcodes_h_l2119_c7_22af_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_22af_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2119_c7_22af_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_22af_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_22af_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_22af_return_output,
 tmp16_MUX_uxn_opcodes_h_l2119_c7_22af_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2120_c3_31b1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2121_c11_069a_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l2121_c26_6e22_return_output,
 MUX_uxn_opcodes_h_l2121_c11_3653_return_output,
 sp_relative_shift_uxn_opcodes_h_l2122_c30_91a4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2127_c11_6916_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ecb3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ecb3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ecb3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ecb3_return_output,
 CONST_SR_8_uxn_opcodes_h_l2130_c31_6604_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_222a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_1c78_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_1c78_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_1c78_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2103_c7_c087_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2090_c2_65f1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2103_c7_c087_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2090_c2_65f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2090_c2_65f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c087_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_65f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2090_c2_65f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2090_c2_65f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_65f1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c087_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_65f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2090_c2_65f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_65f1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2095_c3_57eb : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c087_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_65f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c087_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_65f1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2100_c3_0edf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c087_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_65f1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_c087_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_65f1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd1b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd1b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd1b_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2103_c7_c087_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2103_c7_c087_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c087_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c087_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c087_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c087_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2104_c3_d74b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c087_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_c087_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_8e0a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_8e0a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_8e0a_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2109_c3_767f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_10bd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_10bd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_10bd_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2111_c7_15ad_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2111_c7_15ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_15ad_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_15ad_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_15ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_15ad_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2113_c3_1630 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_15ad_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_15ad_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_4ae6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_4ae6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_4ae6_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_0c8e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_0c8e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_0c8e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2115_c7_1ded_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2115_c7_1ded_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2119_c7_22af_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2115_c7_1ded_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_1ded_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_1ded_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_22af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_1ded_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_1ded_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_1ded_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_22af_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_1ded_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_1ded_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_1ded_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_22af_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_1ded_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_1ded_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_1ded_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_22af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_1ded_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_1ded_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_1ded_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_22af_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_1ded_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_1ded_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_1ded_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_22af_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_1ded_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_903b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_903b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_903b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2119_c7_22af_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2119_c7_22af_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2119_c7_22af_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_22af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_22af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_22af_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_22af_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_22af_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ecb3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_22af_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_22af_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_22af_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ecb3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_22af_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_22af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_22af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ecb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_22af_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_22af_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2124_c3_3f4c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_22af_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ecb3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_22af_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_22af_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_22af_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_22af_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_31b1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_31b1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_31b1_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2121_c11_3653_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_069a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_069a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_069a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2121_c11_3653_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2121_c11_3653_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_6e22_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_6e22_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_6e22_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2121_c11_3653_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_91a4_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_91a4_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_91a4_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_91a4_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2125_c21_6312_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_6916_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_6916_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_6916_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ecb3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ecb3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ecb3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ecb3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2128_c3_d91a : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ecb3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ecb3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ecb3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ecb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ecb3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ecb3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2129_c3_01c2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ecb3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ecb3_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2130_c31_6604_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2130_c31_6604_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2130_c21_d585_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2127_l2115_l2111_l2106_l2103_l2090_DUPLICATE_2226_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2119_l2115_l2111_l2106_l2103_DUPLICATE_6cc5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2127_l2115_l2111_l2106_l2103_DUPLICATE_70a5_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2127_l2119_l2115_l2111_l2106_l2103_DUPLICATE_97d8_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2116_l2112_l2107_l2120_DUPLICATE_ab69_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_222a_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_222a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2127_l2115_DUPLICATE_6670_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l2086_l2134_DUPLICATE_eb00_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_91a4_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2113_c3_1630 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2113_c3_1630;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2104_c3_d74b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2104_c3_d74b;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_069a_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_903b_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l2121_c11_3653_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2129_c3_01c2 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ecb3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2129_c3_01c2;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2100_c3_0edf := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2100_c3_0edf;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_1c78_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2124_c3_3f4c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_22af_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2124_c3_3f4c;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2095_c3_57eb := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2095_c3_57eb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_0c8e_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2109_c3_767f := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2109_c3_767f;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_22af_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_8e0a_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_6916_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_91a4_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd1b_right := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2128_c3_d91a := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ecb3_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2128_c3_d91a;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ecb3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_10bd_right := to_unsigned(3, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_91a4_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_31b1_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2119_c7_22af_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_1c78_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd1b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_8e0a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_10bd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_0c8e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_903b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_6916_left := VAR_phase;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_6e22_right := t16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_069a_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_4ae6_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2130_c31_6604_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_1ded_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_22af_iffalse := tmp16;
     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2090_c2_65f1] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2090_c2_65f1_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2115_c11_0c8e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2115_c11_0c8e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_0c8e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2115_c11_0c8e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_0c8e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_0c8e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2115_c11_0c8e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2119_l2115_l2111_l2106_l2103_DUPLICATE_6cc5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2119_l2115_l2111_l2106_l2103_DUPLICATE_6cc5_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2111_c11_10bd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2111_c11_10bd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_10bd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2111_c11_10bd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_10bd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_10bd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2111_c11_10bd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2103_c11_dd1b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd1b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd1b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd1b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd1b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd1b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd1b_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2127_l2115_l2111_l2106_l2103_DUPLICATE_70a5 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2127_l2115_l2111_l2106_l2103_DUPLICATE_70a5_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l2122_c30_91a4] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2122_c30_91a4_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_91a4_ins;
     sp_relative_shift_uxn_opcodes_h_l2122_c30_91a4_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_91a4_x;
     sp_relative_shift_uxn_opcodes_h_l2122_c30_91a4_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_91a4_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_91a4_return_output := sp_relative_shift_uxn_opcodes_h_l2122_c30_91a4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2119_c11_903b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2119_c11_903b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_903b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2119_c11_903b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_903b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_903b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2119_c11_903b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2121_c11_069a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2121_c11_069a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_069a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2121_c11_069a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_069a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_069a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2121_c11_069a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2127_l2119_l2115_l2111_l2106_l2103_DUPLICATE_97d8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2127_l2119_l2115_l2111_l2106_l2103_DUPLICATE_97d8_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2127_l2115_l2111_l2106_l2103_l2090_DUPLICATE_2226 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2127_l2115_l2111_l2106_l2103_l2090_DUPLICATE_2226_return_output := result.u8_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2127_l2115_DUPLICATE_6670 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2127_l2115_DUPLICATE_6670_return_output := result.stack_address_sp_offset;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2090_c2_65f1] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2090_c2_65f1_return_output := result.is_ram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2090_c2_65f1] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2090_c2_65f1_return_output := result.is_pc_updated;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2116_l2112_l2107_l2120_DUPLICATE_ab69 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2116_l2112_l2107_l2120_DUPLICATE_ab69_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2127_c11_6916] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2127_c11_6916_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_6916_left;
     BIN_OP_EQ_uxn_opcodes_h_l2127_c11_6916_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_6916_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_6916_return_output := BIN_OP_EQ_uxn_opcodes_h_l2127_c11_6916_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2090_c6_1c78] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2090_c6_1c78_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_1c78_left;
     BIN_OP_EQ_uxn_opcodes_h_l2090_c6_1c78_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_1c78_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_1c78_return_output := BIN_OP_EQ_uxn_opcodes_h_l2090_c6_1c78_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2130_c31_6604] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2130_c31_6604_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2130_c31_6604_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2130_c31_6604_return_output := CONST_SR_8_uxn_opcodes_h_l2130_c31_6604_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2090_c2_65f1] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2090_c2_65f1_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2106_c11_8e0a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2106_c11_8e0a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_8e0a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2106_c11_8e0a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_8e0a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_8e0a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2106_c11_8e0a_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2090_c2_65f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_1c78_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_65f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_1c78_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_65f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_1c78_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_1c78_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_65f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_1c78_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_65f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_1c78_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_1c78_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_65f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_1c78_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_65f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_1c78_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_65f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_1c78_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2090_c2_65f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_1c78_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_65f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_1c78_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2103_c7_c087_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd1b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c087_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd1b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c087_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd1b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c087_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd1b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c087_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd1b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c087_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd1b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2103_c7_c087_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd1b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_c087_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd1b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_8e0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_8e0a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_8e0a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_8e0a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_8e0a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_8e0a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_8e0a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_8e0a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2111_c7_15ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_10bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_15ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_10bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_15ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_10bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_15ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_10bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_15ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_10bd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_15ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_10bd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2111_c7_15ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_10bd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_15ad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_10bd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2115_c7_1ded_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_0c8e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_1ded_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_0c8e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_1ded_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_0c8e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_1ded_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_0c8e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_1ded_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_0c8e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_1ded_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_0c8e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_1ded_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_0c8e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2119_c7_22af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_903b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_22af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_903b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_22af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_903b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_22af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_903b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_22af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_903b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_22af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_903b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_22af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_903b_return_output;
     VAR_MUX_uxn_opcodes_h_l2121_c11_3653_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_069a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ecb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_6916_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ecb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_6916_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ecb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_6916_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ecb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_6916_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_4ae6_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2116_l2112_l2107_l2120_DUPLICATE_ab69_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_31b1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2116_l2112_l2107_l2120_DUPLICATE_ab69_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_222a_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2116_l2112_l2107_l2120_DUPLICATE_ab69_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2127_l2115_l2111_l2106_l2103_DUPLICATE_70a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2127_l2115_l2111_l2106_l2103_DUPLICATE_70a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2127_l2115_l2111_l2106_l2103_DUPLICATE_70a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_1ded_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2127_l2115_l2111_l2106_l2103_DUPLICATE_70a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ecb3_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2127_l2115_l2111_l2106_l2103_DUPLICATE_70a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2127_l2119_l2115_l2111_l2106_l2103_DUPLICATE_97d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2127_l2119_l2115_l2111_l2106_l2103_DUPLICATE_97d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2127_l2119_l2115_l2111_l2106_l2103_DUPLICATE_97d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_1ded_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2127_l2119_l2115_l2111_l2106_l2103_DUPLICATE_97d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_22af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2127_l2119_l2115_l2111_l2106_l2103_DUPLICATE_97d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ecb3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2127_l2119_l2115_l2111_l2106_l2103_DUPLICATE_97d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2119_l2115_l2111_l2106_l2103_DUPLICATE_6cc5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2119_l2115_l2111_l2106_l2103_DUPLICATE_6cc5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2119_l2115_l2111_l2106_l2103_DUPLICATE_6cc5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_1ded_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2119_l2115_l2111_l2106_l2103_DUPLICATE_6cc5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_22af_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2119_l2115_l2111_l2106_l2103_DUPLICATE_6cc5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_1ded_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2127_l2115_DUPLICATE_6670_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ecb3_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2127_l2115_DUPLICATE_6670_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2127_l2115_l2111_l2106_l2103_l2090_DUPLICATE_2226_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2127_l2115_l2111_l2106_l2103_l2090_DUPLICATE_2226_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2127_l2115_l2111_l2106_l2103_l2090_DUPLICATE_2226_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2127_l2115_l2111_l2106_l2103_l2090_DUPLICATE_2226_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_1ded_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2127_l2115_l2111_l2106_l2103_l2090_DUPLICATE_2226_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ecb3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2127_l2115_l2111_l2106_l2103_l2090_DUPLICATE_2226_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2090_c2_65f1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2090_c2_65f1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2090_c2_65f1_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2090_c2_65f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_22af_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_91a4_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l2090_c2_65f1] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2090_c2_65f1] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2120_c3_31b1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2120_c3_31b1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_31b1_left;
     BIN_OP_OR_uxn_opcodes_h_l2120_c3_31b1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_31b1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_31b1_return_output := BIN_OP_OR_uxn_opcodes_h_l2120_c3_31b1_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_222a LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_222a_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_222a_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_222a_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_222a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2127_c7_ecb3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ecb3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ecb3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ecb3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ecb3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ecb3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ecb3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ecb3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ecb3_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2090_c2_65f1] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_65f1_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_65f1_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2130_c21_d585] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2130_c21_d585_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2130_c31_6604_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2127_c7_ecb3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ecb3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ecb3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ecb3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ecb3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ecb3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ecb3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ecb3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ecb3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2119_c7_22af] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_22af_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_22af_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_22af_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_22af_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_22af_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_22af_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_22af_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_22af_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2127_c7_ecb3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ecb3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ecb3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ecb3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ecb3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ecb3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ecb3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ecb3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ecb3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2090_c2_65f1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_65f1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_65f1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2112_c3_4ae6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2112_c3_4ae6_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_4ae6_left;
     BIN_OP_OR_uxn_opcodes_h_l2112_c3_4ae6_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_4ae6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_4ae6_return_output := BIN_OP_OR_uxn_opcodes_h_l2112_c3_4ae6_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_4ae6_return_output;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_6e22_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_31b1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2119_c7_22af_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_31b1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ecb3_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2130_c21_d585_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2115_c7_1ded_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_222a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_222a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_22af_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ecb3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_1ded_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_22af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_22af_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ecb3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_22af_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ecb3_return_output;
     -- t16_MUX[uxn_opcodes_h_l2111_c7_15ad] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2111_c7_15ad_cond <= VAR_t16_MUX_uxn_opcodes_h_l2111_c7_15ad_cond;
     t16_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue;
     t16_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output := t16_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2119_c7_22af] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_22af_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_22af_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_22af_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_22af_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_22af_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_22af_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_22af_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_22af_return_output;

     -- n16_MUX[uxn_opcodes_h_l2119_c7_22af] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2119_c7_22af_cond <= VAR_n16_MUX_uxn_opcodes_h_l2119_c7_22af_cond;
     n16_MUX_uxn_opcodes_h_l2119_c7_22af_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2119_c7_22af_iftrue;
     n16_MUX_uxn_opcodes_h_l2119_c7_22af_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2119_c7_22af_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2119_c7_22af_return_output := n16_MUX_uxn_opcodes_h_l2119_c7_22af_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2127_c7_ecb3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ecb3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ecb3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ecb3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ecb3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ecb3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ecb3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ecb3_return_output := result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ecb3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2119_c7_22af] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_22af_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_22af_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_22af_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_22af_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_22af_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_22af_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_22af_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_22af_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2115_c7_1ded] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_1ded_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_1ded_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_1ded_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_1ded_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_1ded_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_1ded_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2119_c7_22af] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_22af_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_22af_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_22af_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_22af_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_22af_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_22af_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_22af_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_22af_return_output;

     -- BIN_OP_DIV[uxn_opcodes_h_l2121_c26_6e22] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l2121_c26_6e22_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_6e22_left;
     BIN_OP_DIV_uxn_opcodes_h_l2121_c26_6e22_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_6e22_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_6e22_return_output := BIN_OP_DIV_uxn_opcodes_h_l2121_c26_6e22_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l2121_c11_3653_iffalse := VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_6e22_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2115_c7_1ded_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2119_c7_22af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_1ded_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_22af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_1ded_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_22af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_1ded_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_22af_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_22af_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ecb3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output;
     -- n16_MUX[uxn_opcodes_h_l2115_c7_1ded] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2115_c7_1ded_cond <= VAR_n16_MUX_uxn_opcodes_h_l2115_c7_1ded_cond;
     n16_MUX_uxn_opcodes_h_l2115_c7_1ded_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2115_c7_1ded_iftrue;
     n16_MUX_uxn_opcodes_h_l2115_c7_1ded_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2115_c7_1ded_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output := n16_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output;

     -- t16_MUX[uxn_opcodes_h_l2106_c7_dc5d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond;
     t16_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue;
     t16_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output := t16_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output;

     -- MUX[uxn_opcodes_h_l2121_c11_3653] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2121_c11_3653_cond <= VAR_MUX_uxn_opcodes_h_l2121_c11_3653_cond;
     MUX_uxn_opcodes_h_l2121_c11_3653_iftrue <= VAR_MUX_uxn_opcodes_h_l2121_c11_3653_iftrue;
     MUX_uxn_opcodes_h_l2121_c11_3653_iffalse <= VAR_MUX_uxn_opcodes_h_l2121_c11_3653_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2121_c11_3653_return_output := MUX_uxn_opcodes_h_l2121_c11_3653_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2115_c7_1ded] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_1ded_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_1ded_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_1ded_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_1ded_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_1ded_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_1ded_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2111_c7_15ad] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_15ad_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_15ad_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2115_c7_1ded] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_1ded_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_1ded_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_1ded_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_1ded_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_1ded_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_1ded_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2115_c7_1ded] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_1ded_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_1ded_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_1ded_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_1ded_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_1ded_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_1ded_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_22af_iftrue := VAR_MUX_uxn_opcodes_h_l2121_c11_3653_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output;
     -- t16_MUX[uxn_opcodes_h_l2103_c7_c087] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2103_c7_c087_cond <= VAR_t16_MUX_uxn_opcodes_h_l2103_c7_c087_cond;
     t16_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue;
     t16_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2103_c7_c087_return_output := t16_MUX_uxn_opcodes_h_l2103_c7_c087_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2111_c7_15ad] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_15ad_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_15ad_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2111_c7_15ad] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_15ad_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_15ad_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2119_c7_22af] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2119_c7_22af_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_22af_cond;
     tmp16_MUX_uxn_opcodes_h_l2119_c7_22af_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_22af_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2119_c7_22af_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_22af_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_22af_return_output := tmp16_MUX_uxn_opcodes_h_l2119_c7_22af_return_output;

     -- n16_MUX[uxn_opcodes_h_l2111_c7_15ad] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2111_c7_15ad_cond <= VAR_n16_MUX_uxn_opcodes_h_l2111_c7_15ad_cond;
     n16_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue;
     n16_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output := n16_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2125_c21_6312] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2125_c21_6312_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_MUX_uxn_opcodes_h_l2121_c11_3653_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2106_c7_dc5d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2111_c7_15ad] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_15ad_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_15ad_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_22af_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2125_c21_6312_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2103_c7_c087_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_1ded_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_22af_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2106_c7_dc5d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2106_c7_dc5d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond;
     n16_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue;
     n16_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output := n16_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output;

     -- t16_MUX[uxn_opcodes_h_l2090_c2_65f1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2090_c2_65f1_cond <= VAR_t16_MUX_uxn_opcodes_h_l2090_c2_65f1_cond;
     t16_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue;
     t16_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output := t16_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2119_c7_22af] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2119_c7_22af_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_22af_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2119_c7_22af_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_22af_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2119_c7_22af_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_22af_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_22af_return_output := result_u8_value_MUX_uxn_opcodes_h_l2119_c7_22af_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2115_c7_1ded] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2115_c7_1ded_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_1ded_cond;
     tmp16_MUX_uxn_opcodes_h_l2115_c7_1ded_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_1ded_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2115_c7_1ded_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_1ded_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output := tmp16_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2106_c7_dc5d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2103_c7_c087] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c087_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c087_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c087_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c087_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2106_c7_dc5d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c087_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_1ded_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_22af_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2115_c7_1ded] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2115_c7_1ded_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_1ded_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2115_c7_1ded_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_1ded_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2115_c7_1ded_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_1ded_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output := result_u8_value_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2090_c2_65f1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_65f1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_65f1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output;

     -- n16_MUX[uxn_opcodes_h_l2103_c7_c087] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2103_c7_c087_cond <= VAR_n16_MUX_uxn_opcodes_h_l2103_c7_c087_cond;
     n16_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue;
     n16_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2103_c7_c087_return_output := n16_MUX_uxn_opcodes_h_l2103_c7_c087_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2103_c7_c087] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c087_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c087_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c087_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c087_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2103_c7_c087] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c087_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c087_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c087_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c087_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2103_c7_c087] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c087_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c087_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c087_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c087_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2111_c7_15ad] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2111_c7_15ad_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_15ad_cond;
     tmp16_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output := tmp16_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2103_c7_c087_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c087_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c087_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c087_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_1ded_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2090_c2_65f1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_65f1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_65f1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2106_c7_dc5d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond;
     tmp16_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output := tmp16_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2090_c2_65f1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_65f1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_65f1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2111_c7_15ad] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2111_c7_15ad_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_15ad_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_15ad_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_15ad_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output := result_u8_value_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output;

     -- n16_MUX[uxn_opcodes_h_l2090_c2_65f1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2090_c2_65f1_cond <= VAR_n16_MUX_uxn_opcodes_h_l2090_c2_65f1_cond;
     n16_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue;
     n16_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output := n16_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2090_c2_65f1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_65f1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_65f1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_15ad_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2106_c7_dc5d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_dc5d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_dc5d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_dc5d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2103_c7_c087] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2103_c7_c087_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_c087_cond;
     tmp16_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_c087_return_output := tmp16_MUX_uxn_opcodes_h_l2103_c7_c087_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_dc5d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_c087_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2103_c7_c087] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c087_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c087_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c087_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c087_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c087_return_output := result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c087_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2090_c2_65f1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2090_c2_65f1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_65f1_cond;
     tmp16_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output := tmp16_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output;

     -- Submodule level 10
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c087_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2090_c2_65f1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2090_c2_65f1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_65f1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_65f1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_65f1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l2086_l2134_DUPLICATE_eb00 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l2086_l2134_DUPLICATE_eb00_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_65f1_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l2086_l2134_DUPLICATE_eb00_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c5ea_uxn_opcodes_h_l2086_l2134_DUPLICATE_eb00_return_output;
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
