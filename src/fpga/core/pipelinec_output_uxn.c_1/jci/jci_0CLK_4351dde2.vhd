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
-- Submodules: 42
entity jci_0CLK_4351dde2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jci_0CLK_4351dde2;
architecture arch of jci_0CLK_4351dde2 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l71_c6_6c24]
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_6c24_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_6c24_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_6c24_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l71_c2_02c8]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_02c8_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_02c8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l71_c2_02c8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_02c8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_02c8_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l71_c2_02c8]
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_02c8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_02c8_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l71_c2_02c8]
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_02c8_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_02c8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l71_c2_02c8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_02c8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_02c8_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l71_c2_02c8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_02c8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_02c8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l71_c2_02c8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_02c8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_02c8_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l71_c2_02c8]
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_02c8_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_02c8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l71_c2_02c8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_02c8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_02c8_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l71_c2_02c8]
signal t8_MUX_uxn_opcodes_h_l71_c2_02c8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_02c8_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l71_c2_02c8]
signal tmp16_MUX_uxn_opcodes_h_l71_c2_02c8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_02c8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l85_c11_d825]
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_d825_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_d825_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_d825_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l85_c7_d4e7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d4e7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d4e7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d4e7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l85_c7_d4e7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d4e7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d4e7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d4e7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l85_c7_d4e7]
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_d4e7_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_d4e7_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_d4e7_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l85_c7_d4e7]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d4e7_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d4e7_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d4e7_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l85_c7_d4e7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d4e7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d4e7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d4e7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l85_c7_d4e7]
signal t8_MUX_uxn_opcodes_h_l85_c7_d4e7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l85_c7_d4e7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l85_c7_d4e7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l85_c7_d4e7]
signal tmp16_MUX_uxn_opcodes_h_l85_c7_d4e7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_d4e7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_d4e7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l88_c22_4501]
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_4501_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_4501_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_4501_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l90_c11_7259]
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_7259_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_7259_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_7259_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l90_c7_2f0c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_2f0c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_2f0c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_2f0c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_2f0c_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l90_c7_2f0c]
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_2f0c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_2f0c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_2f0c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_2f0c_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_2f0c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_2f0c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_2f0c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_2f0c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_2f0c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_2f0c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_2f0c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_2f0c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_2f0c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_2f0c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l90_c7_2f0c]
signal t8_MUX_uxn_opcodes_h_l90_c7_2f0c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l90_c7_2f0c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l90_c7_2f0c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l90_c7_2f0c_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l90_c7_2f0c]
signal tmp16_MUX_uxn_opcodes_h_l90_c7_2f0c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_2f0c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_2f0c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_2f0c_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l93_c3_2536]
signal CONST_SL_8_uxn_opcodes_h_l93_c3_2536_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l93_c3_2536_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l96_c11_90b4]
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_90b4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_90b4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_90b4_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l96_c7_ef4c]
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_ef4c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_ef4c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_ef4c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_ef4c_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l96_c7_ef4c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ef4c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ef4c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ef4c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ef4c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l96_c7_ef4c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ef4c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ef4c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ef4c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ef4c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l96_c7_ef4c]
signal tmp16_MUX_uxn_opcodes_h_l96_c7_ef4c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_ef4c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_ef4c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_ef4c_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l97_c3_4f6e]
signal BIN_OP_OR_uxn_opcodes_h_l97_c3_4f6e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l97_c3_4f6e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l97_c3_4f6e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l99_c22_a42f]
signal BIN_OP_EQ_uxn_opcodes_h_l99_c22_a42f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c22_a42f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c22_a42f_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c32_4cd3]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c32_4cd3_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c32_4cd3_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c32_4cd3_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_2287]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2287_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2287_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2287_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_23da]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_23da_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_23da_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_23da_return_output : unsigned(17 downto 0);

-- MUX[uxn_opcodes_h_l99_c22_36c0]
signal MUX_uxn_opcodes_h_l99_c22_36c0_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l99_c22_36c0_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l99_c22_36c0_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l99_c22_36c0_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_d1aa( ref_toks_0 : opcode_result_t;
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
      base.is_stack_index_flipped := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.u16_value := ref_toks_3;
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
-- BIN_OP_EQ_uxn_opcodes_h_l71_c6_6c24
BIN_OP_EQ_uxn_opcodes_h_l71_c6_6c24 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l71_c6_6c24_left,
BIN_OP_EQ_uxn_opcodes_h_l71_c6_6c24_right,
BIN_OP_EQ_uxn_opcodes_h_l71_c6_6c24_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_02c8
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_02c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_02c8_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_02c8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_02c8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_02c8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_02c8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_02c8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l71_c2_02c8
result_u16_value_MUX_uxn_opcodes_h_l71_c2_02c8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l71_c2_02c8_cond,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_02c8_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_02c8
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_02c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_02c8_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_02c8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_02c8
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_02c8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_02c8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_02c8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_02c8
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_02c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_02c8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_02c8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_02c8
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_02c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_02c8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_02c8_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_02c8
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_02c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_02c8_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_02c8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_02c8
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_02c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_02c8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_02c8_return_output);

-- t8_MUX_uxn_opcodes_h_l71_c2_02c8
t8_MUX_uxn_opcodes_h_l71_c2_02c8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l71_c2_02c8_cond,
t8_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue,
t8_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse,
t8_MUX_uxn_opcodes_h_l71_c2_02c8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l71_c2_02c8
tmp16_MUX_uxn_opcodes_h_l71_c2_02c8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l71_c2_02c8_cond,
tmp16_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue,
tmp16_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse,
tmp16_MUX_uxn_opcodes_h_l71_c2_02c8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l85_c11_d825
BIN_OP_EQ_uxn_opcodes_h_l85_c11_d825 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l85_c11_d825_left,
BIN_OP_EQ_uxn_opcodes_h_l85_c11_d825_right,
BIN_OP_EQ_uxn_opcodes_h_l85_c11_d825_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d4e7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d4e7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d4e7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d4e7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d4e7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d4e7
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d4e7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d4e7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d4e7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d4e7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l85_c7_d4e7
result_u16_value_MUX_uxn_opcodes_h_l85_c7_d4e7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l85_c7_d4e7_cond,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_d4e7_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_d4e7_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d4e7
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d4e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d4e7_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d4e7_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d4e7_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d4e7
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d4e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d4e7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d4e7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d4e7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output);

-- t8_MUX_uxn_opcodes_h_l85_c7_d4e7
t8_MUX_uxn_opcodes_h_l85_c7_d4e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l85_c7_d4e7_cond,
t8_MUX_uxn_opcodes_h_l85_c7_d4e7_iftrue,
t8_MUX_uxn_opcodes_h_l85_c7_d4e7_iffalse,
t8_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l85_c7_d4e7
tmp16_MUX_uxn_opcodes_h_l85_c7_d4e7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l85_c7_d4e7_cond,
tmp16_MUX_uxn_opcodes_h_l85_c7_d4e7_iftrue,
tmp16_MUX_uxn_opcodes_h_l85_c7_d4e7_iffalse,
tmp16_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l88_c22_4501
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_4501 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_4501_left,
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_4501_right,
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_4501_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l90_c11_7259
BIN_OP_EQ_uxn_opcodes_h_l90_c11_7259 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l90_c11_7259_left,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_7259_right,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_7259_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_2f0c
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_2f0c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_2f0c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_2f0c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_2f0c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_2f0c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l90_c7_2f0c
result_u16_value_MUX_uxn_opcodes_h_l90_c7_2f0c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l90_c7_2f0c_cond,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_2f0c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_2f0c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_2f0c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_2f0c
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_2f0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_2f0c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_2f0c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_2f0c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_2f0c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_2f0c
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_2f0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_2f0c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_2f0c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_2f0c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_2f0c_return_output);

-- t8_MUX_uxn_opcodes_h_l90_c7_2f0c
t8_MUX_uxn_opcodes_h_l90_c7_2f0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l90_c7_2f0c_cond,
t8_MUX_uxn_opcodes_h_l90_c7_2f0c_iftrue,
t8_MUX_uxn_opcodes_h_l90_c7_2f0c_iffalse,
t8_MUX_uxn_opcodes_h_l90_c7_2f0c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l90_c7_2f0c
tmp16_MUX_uxn_opcodes_h_l90_c7_2f0c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l90_c7_2f0c_cond,
tmp16_MUX_uxn_opcodes_h_l90_c7_2f0c_iftrue,
tmp16_MUX_uxn_opcodes_h_l90_c7_2f0c_iffalse,
tmp16_MUX_uxn_opcodes_h_l90_c7_2f0c_return_output);

-- CONST_SL_8_uxn_opcodes_h_l93_c3_2536
CONST_SL_8_uxn_opcodes_h_l93_c3_2536 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l93_c3_2536_x,
CONST_SL_8_uxn_opcodes_h_l93_c3_2536_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l96_c11_90b4
BIN_OP_EQ_uxn_opcodes_h_l96_c11_90b4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l96_c11_90b4_left,
BIN_OP_EQ_uxn_opcodes_h_l96_c11_90b4_right,
BIN_OP_EQ_uxn_opcodes_h_l96_c11_90b4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l96_c7_ef4c
result_u16_value_MUX_uxn_opcodes_h_l96_c7_ef4c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l96_c7_ef4c_cond,
result_u16_value_MUX_uxn_opcodes_h_l96_c7_ef4c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l96_c7_ef4c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l96_c7_ef4c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ef4c
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ef4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ef4c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ef4c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ef4c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ef4c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ef4c
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ef4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ef4c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ef4c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ef4c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ef4c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l96_c7_ef4c
tmp16_MUX_uxn_opcodes_h_l96_c7_ef4c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l96_c7_ef4c_cond,
tmp16_MUX_uxn_opcodes_h_l96_c7_ef4c_iftrue,
tmp16_MUX_uxn_opcodes_h_l96_c7_ef4c_iffalse,
tmp16_MUX_uxn_opcodes_h_l96_c7_ef4c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l97_c3_4f6e
BIN_OP_OR_uxn_opcodes_h_l97_c3_4f6e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l97_c3_4f6e_left,
BIN_OP_OR_uxn_opcodes_h_l97_c3_4f6e_right,
BIN_OP_OR_uxn_opcodes_h_l97_c3_4f6e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l99_c22_a42f
BIN_OP_EQ_uxn_opcodes_h_l99_c22_a42f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l99_c22_a42f_left,
BIN_OP_EQ_uxn_opcodes_h_l99_c22_a42f_right,
BIN_OP_EQ_uxn_opcodes_h_l99_c22_a42f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c32_4cd3
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_4cd3 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_4cd3_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_4cd3_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_4cd3_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2287
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2287 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2287_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2287_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2287_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c42_23da
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_23da : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_23da_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_23da_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_23da_return_output);

-- MUX_uxn_opcodes_h_l99_c22_36c0
MUX_uxn_opcodes_h_l99_c22_36c0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l99_c22_36c0_cond,
MUX_uxn_opcodes_h_l99_c22_36c0_iftrue,
MUX_uxn_opcodes_h_l99_c22_36c0_iffalse,
MUX_uxn_opcodes_h_l99_c22_36c0_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 tmp16,
 t8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l71_c6_6c24_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_02c8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_02c8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l71_c2_02c8_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_02c8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_02c8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_02c8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_02c8_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_02c8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_02c8_return_output,
 t8_MUX_uxn_opcodes_h_l71_c2_02c8_return_output,
 tmp16_MUX_uxn_opcodes_h_l71_c2_02c8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l85_c11_d825_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output,
 t8_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output,
 tmp16_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l88_c22_4501_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l90_c11_7259_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_2f0c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l90_c7_2f0c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_2f0c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_2f0c_return_output,
 t8_MUX_uxn_opcodes_h_l90_c7_2f0c_return_output,
 tmp16_MUX_uxn_opcodes_h_l90_c7_2f0c_return_output,
 CONST_SL_8_uxn_opcodes_h_l93_c3_2536_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l96_c11_90b4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l96_c7_ef4c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ef4c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ef4c_return_output,
 tmp16_MUX_uxn_opcodes_h_l96_c7_ef4c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l97_c3_4f6e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l99_c22_a42f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c32_4cd3_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2287_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c42_23da_return_output,
 MUX_uxn_opcodes_h_l99_c22_36c0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_6c24_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_6c24_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_6c24_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l71_c2_02c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_02c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_02c8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_abbf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_02c8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_02c8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_02c8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_02c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l71_c2_02c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_02c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_02c8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l76_c3_7bbf : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_02c8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_02c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_02c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_02c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_02c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_02c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l71_c2_02c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_02c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_02c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l71_c2_02c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_02c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_02c8_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_02c8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_02c8_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_02c8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_02c8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_d825_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_d825_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_d825_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d4e7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l86_c3_a9ab : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d4e7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l85_c7_d4e7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d4e7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d4e7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l87_c3_4635 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d4e7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_2f0c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d4e7_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_d4e7_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l88_c3_8d75 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_d4e7_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_2f0c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_d4e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d4e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d4e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_2f0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d4e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d4e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d4e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_2f0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d4e7_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_d4e7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_d4e7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_2f0c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_d4e7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_d4e7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_d4e7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_2f0c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_d4e7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_4501_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_4501_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_4501_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_7259_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_7259_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_7259_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_2f0c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l94_c3_1b96 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_2f0c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l90_c7_2f0c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_2f0c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_2f0c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_2f0c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_ef4c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_2f0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_2f0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_2f0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ef4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_2f0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_2f0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_2f0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ef4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_2f0c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_2f0c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_2f0c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_2f0c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_2f0c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_2f0c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_ef4c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_2f0c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_2536_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_2536_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_90b4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_90b4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_90b4_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_ef4c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_ef4c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_ef4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ef4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ef4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ef4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ef4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ef4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ef4c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_ef4c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_ef4c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_ef4c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_4f6e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_4f6e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_4f6e_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_36c0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_a42f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_a42f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_a42f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_36c0_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_36c0_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_4cd3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_4cd3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_4cd3_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2287_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2287_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2287_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_23da_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_23da_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_23da_return_output : unsigned(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_36c0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_57f4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_ea74_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l97_l92_DUPLICATE_b879_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l96_l90_DUPLICATE_e5c3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d1aa_uxn_opcodes_h_l103_l66_DUPLICATE_7810_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp16 := tmp16;
  REG_VAR_t8 := t8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_a42f_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_4cd3_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_7259_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_23da_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_90b4_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l87_c3_4635 := resize(to_signed(-1, 2), 4);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d4e7_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l87_c3_4635;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_4501_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_d825_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l94_c3_1b96 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_2f0c_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l94_c3_1b96;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ef4c_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_abbf := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_abbf;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_6c24_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l86_c3_a9ab := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d4e7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l86_c3_a9ab;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l76_c3_7bbf := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l76_c3_7bbf;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ef4c_iftrue := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_4501_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_4cd3_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2287_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_6c24_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_d825_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_7259_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_90b4_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_2f0c_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_a42f_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_d4e7_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_2f0c_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_4f6e_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_d4e7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_ef4c_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_ea74 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_ea74_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l85_c11_d825] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l85_c11_d825_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_d825_left;
     BIN_OP_EQ_uxn_opcodes_h_l85_c11_d825_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_d825_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_d825_return_output := BIN_OP_EQ_uxn_opcodes_h_l85_c11_d825_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l97_l92_DUPLICATE_b879 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l97_l92_DUPLICATE_b879_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l96_l90_DUPLICATE_e5c3 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l96_l90_DUPLICATE_e5c3_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l90_c11_7259] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_7259_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_7259_left;
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_7259_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_7259_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_7259_return_output := BIN_OP_EQ_uxn_opcodes_h_l90_c11_7259_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l71_c2_02c8] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l71_c2_02c8_return_output := result.is_stack_index_flipped;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l90_c7_2f0c] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l90_c7_2f0c_return_output := result.sp_relative_shift;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l71_c2_02c8] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l71_c2_02c8_return_output := result.is_stack_write;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l85_c7_d4e7] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l85_c7_d4e7_return_output := result.stack_address_sp_offset;

     -- BIN_OP_PLUS[uxn_opcodes_h_l88_c22_4501] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l88_c22_4501_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_4501_left;
     BIN_OP_PLUS_uxn_opcodes_h_l88_c22_4501_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_4501_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_4501_return_output := BIN_OP_PLUS_uxn_opcodes_h_l88_c22_4501_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c32_4cd3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c32_4cd3_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_4cd3_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c32_4cd3_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_4cd3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_4cd3_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c32_4cd3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_57f4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_57f4_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l96_c11_90b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l96_c11_90b4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_90b4_left;
     BIN_OP_EQ_uxn_opcodes_h_l96_c11_90b4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_90b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_90b4_return_output := BIN_OP_EQ_uxn_opcodes_h_l96_c11_90b4_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l71_c2_02c8] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l71_c2_02c8_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l71_c6_6c24] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l71_c6_6c24_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_6c24_left;
     BIN_OP_EQ_uxn_opcodes_h_l71_c6_6c24_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_6c24_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_6c24_return_output := BIN_OP_EQ_uxn_opcodes_h_l71_c6_6c24_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l99_c22_a42f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l99_c22_a42f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_a42f_left;
     BIN_OP_EQ_uxn_opcodes_h_l99_c22_a42f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_a42f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_a42f_return_output := BIN_OP_EQ_uxn_opcodes_h_l99_c22_a42f_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l71_c2_02c8] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l71_c2_02c8_return_output := result.is_ram_write;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_02c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_6c24_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_02c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_6c24_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_02c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_6c24_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_02c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_6c24_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_02c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_6c24_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_02c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_6c24_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_02c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_6c24_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_02c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_6c24_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_02c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_6c24_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_02c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_6c24_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_02c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_6c24_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d4e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_d825_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d4e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_d825_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d4e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_d825_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d4e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_d825_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_d4e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_d825_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_d4e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_d825_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_d4e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_d825_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_2f0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_7259_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_2f0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_7259_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_2f0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_7259_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_2f0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_7259_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_2f0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_7259_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_2f0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_7259_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ef4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_90b4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ef4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_90b4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_ef4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_90b4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_ef4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_90b4_return_output;
     VAR_MUX_uxn_opcodes_h_l99_c22_36c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_a42f_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l88_c3_8d75 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_4501_return_output, 16);
     VAR_MUX_uxn_opcodes_h_l99_c22_36c0_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_4cd3_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_4f6e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l97_l92_DUPLICATE_b879_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_2536_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l97_l92_DUPLICATE_b879_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_2f0c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l96_l90_DUPLICATE_e5c3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_ef4c_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l96_l90_DUPLICATE_e5c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d4e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_ea74_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_2f0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_ea74_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ef4c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_ea74_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d4e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_57f4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_2f0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_57f4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ef4c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_57f4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l71_c2_02c8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l71_c2_02c8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l71_c2_02c8_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l71_c2_02c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_2f0c_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l90_c7_2f0c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d4e7_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l85_c7_d4e7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_d4e7_iftrue := VAR_result_u16_value_uxn_opcodes_h_l88_c3_8d75;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l90_c7_2f0c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_2f0c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_2f0c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_2f0c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_2f0c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_2f0c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_2f0c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_2f0c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_2f0c_return_output;

     -- t8_MUX[uxn_opcodes_h_l90_c7_2f0c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l90_c7_2f0c_cond <= VAR_t8_MUX_uxn_opcodes_h_l90_c7_2f0c_cond;
     t8_MUX_uxn_opcodes_h_l90_c7_2f0c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l90_c7_2f0c_iftrue;
     t8_MUX_uxn_opcodes_h_l90_c7_2f0c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l90_c7_2f0c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_2f0c_return_output := t8_MUX_uxn_opcodes_h_l90_c7_2f0c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l71_c2_02c8] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_02c8_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_02c8_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_02c8_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_02c8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l85_c7_d4e7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d4e7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d4e7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d4e7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d4e7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d4e7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d4e7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l96_c7_ef4c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ef4c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ef4c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ef4c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ef4c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ef4c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ef4c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ef4c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ef4c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l71_c2_02c8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_02c8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_02c8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_02c8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_02c8_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l71_c2_02c8] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_02c8_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_02c8_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_02c8_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_02c8_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l96_c7_ef4c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ef4c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ef4c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ef4c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ef4c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ef4c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ef4c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ef4c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ef4c_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l71_c2_02c8] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_02c8_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_02c8_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_02c8_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_02c8_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l93_c3_2536] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l93_c3_2536_x <= VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_2536_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_2536_return_output := CONST_SL_8_uxn_opcodes_h_l93_c3_2536_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l97_c3_4f6e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l97_c3_4f6e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_4f6e_left;
     BIN_OP_OR_uxn_opcodes_h_l97_c3_4f6e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_4f6e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_4f6e_return_output := BIN_OP_OR_uxn_opcodes_h_l97_c3_4f6e_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2287_right := VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_4f6e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_ef4c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_4f6e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_2f0c_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_2536_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_2f0c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_ef4c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_2f0c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_ef4c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d4e7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_2f0c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_d4e7_iffalse := VAR_t8_MUX_uxn_opcodes_h_l90_c7_2f0c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_2f0c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_2f0c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_2f0c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_2f0c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_2f0c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_2f0c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_2f0c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_2f0c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_2f0c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l71_c2_02c8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_02c8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_02c8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_02c8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_02c8_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_2287] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2287_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2287_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2287_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2287_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2287_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2287_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l85_c7_d4e7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d4e7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d4e7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d4e7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d4e7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d4e7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d4e7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l96_c7_ef4c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l96_c7_ef4c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_ef4c_cond;
     tmp16_MUX_uxn_opcodes_h_l96_c7_ef4c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_ef4c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l96_c7_ef4c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_ef4c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_ef4c_return_output := tmp16_MUX_uxn_opcodes_h_l96_c7_ef4c_return_output;

     -- t8_MUX[uxn_opcodes_h_l85_c7_d4e7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l85_c7_d4e7_cond <= VAR_t8_MUX_uxn_opcodes_h_l85_c7_d4e7_cond;
     t8_MUX_uxn_opcodes_h_l85_c7_d4e7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l85_c7_d4e7_iftrue;
     t8_MUX_uxn_opcodes_h_l85_c7_d4e7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l85_c7_d4e7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output := t8_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_2f0c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_2f0c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_2f0c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_2f0c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_2f0c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_2f0c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_2f0c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_2f0c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_2f0c_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_23da_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2287_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d4e7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_2f0c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d4e7_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_2f0c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse := VAR_t8_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_2f0c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_ef4c_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l90_c7_2f0c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l90_c7_2f0c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_2f0c_cond;
     tmp16_MUX_uxn_opcodes_h_l90_c7_2f0c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_2f0c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l90_c7_2f0c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_2f0c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_2f0c_return_output := tmp16_MUX_uxn_opcodes_h_l90_c7_2f0c_return_output;

     -- t8_MUX[uxn_opcodes_h_l71_c2_02c8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l71_c2_02c8_cond <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_02c8_cond;
     t8_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue;
     t8_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_02c8_return_output := t8_MUX_uxn_opcodes_h_l71_c2_02c8_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l85_c7_d4e7] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d4e7_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d4e7_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d4e7_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d4e7_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d4e7_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d4e7_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l71_c2_02c8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_02c8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_02c8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_02c8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_02c8_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_23da] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_23da_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_23da_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_23da_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_23da_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_23da_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c42_23da_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l85_c7_d4e7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d4e7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d4e7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d4e7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d4e7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d4e7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d4e7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_opcodes_h_l99_c22_36c0_iffalse := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_23da_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l71_c2_02c8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_d4e7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_2f0c_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l71_c2_02c8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_02c8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_02c8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_02c8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_02c8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l71_c2_02c8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_02c8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_02c8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_02c8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_02c8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l85_c7_d4e7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l85_c7_d4e7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_d4e7_cond;
     tmp16_MUX_uxn_opcodes_h_l85_c7_d4e7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_d4e7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l85_c7_d4e7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_d4e7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output := tmp16_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output;

     -- MUX[uxn_opcodes_h_l99_c22_36c0] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l99_c22_36c0_cond <= VAR_MUX_uxn_opcodes_h_l99_c22_36c0_cond;
     MUX_uxn_opcodes_h_l99_c22_36c0_iftrue <= VAR_MUX_uxn_opcodes_h_l99_c22_36c0_iftrue;
     MUX_uxn_opcodes_h_l99_c22_36c0_iffalse <= VAR_MUX_uxn_opcodes_h_l99_c22_36c0_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l99_c22_36c0_return_output := MUX_uxn_opcodes_h_l99_c22_36c0_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_ef4c_iftrue := VAR_MUX_uxn_opcodes_h_l99_c22_36c0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l71_c2_02c8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l71_c2_02c8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_02c8_cond;
     tmp16_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_02c8_return_output := tmp16_MUX_uxn_opcodes_h_l71_c2_02c8_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l96_c7_ef4c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l96_c7_ef4c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_ef4c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l96_c7_ef4c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_ef4c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l96_c7_ef4c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_ef4c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_ef4c_return_output := result_u16_value_MUX_uxn_opcodes_h_l96_c7_ef4c_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_2f0c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_ef4c_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_02c8_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l90_c7_2f0c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_2f0c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_2f0c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_2f0c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_2f0c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_2f0c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_2f0c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_2f0c_return_output := result_u16_value_MUX_uxn_opcodes_h_l90_c7_2f0c_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_d4e7_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_2f0c_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l85_c7_d4e7] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_d4e7_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_d4e7_cond;
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_d4e7_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_d4e7_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_d4e7_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_d4e7_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output := result_u16_value_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output;

     -- Submodule level 8
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_d4e7_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l71_c2_02c8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_02c8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_02c8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_02c8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_02c8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_02c8_return_output := result_u16_value_MUX_uxn_opcodes_h_l71_c2_02c8_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d1aa_uxn_opcodes_h_l103_l66_DUPLICATE_7810 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d1aa_uxn_opcodes_h_l103_l66_DUPLICATE_7810_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d1aa(
     result,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_02c8_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_02c8_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_02c8_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_02c8_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_02c8_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_02c8_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_02c8_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_02c8_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_02c8_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d1aa_uxn_opcodes_h_l103_l66_DUPLICATE_7810_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d1aa_uxn_opcodes_h_l103_l66_DUPLICATE_7810_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp16 <= REG_COMB_tmp16;
     t8 <= REG_COMB_t8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
