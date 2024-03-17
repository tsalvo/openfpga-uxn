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
-- BIN_OP_EQ[uxn_opcodes_h_l71_c6_e767]
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_e767_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_e767_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_e767_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l71_c2_db2d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_db2d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_db2d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l71_c2_db2d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_db2d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_db2d_return_output : unsigned(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l71_c2_db2d]
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_db2d_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_db2d_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l71_c2_db2d]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_db2d_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_db2d_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l71_c2_db2d]
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_db2d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_db2d_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l71_c2_db2d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_db2d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_db2d_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l71_c2_db2d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_db2d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_db2d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l71_c2_db2d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_db2d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_db2d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l71_c2_db2d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_db2d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_db2d_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l71_c2_db2d]
signal t8_MUX_uxn_opcodes_h_l71_c2_db2d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_db2d_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l71_c2_db2d]
signal tmp16_MUX_uxn_opcodes_h_l71_c2_db2d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_db2d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l85_c11_329b]
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_329b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_329b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_329b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l85_c7_48a7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_48a7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_48a7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_48a7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_48a7_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l85_c7_48a7]
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_48a7_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_48a7_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_48a7_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_48a7_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l85_c7_48a7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_48a7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_48a7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_48a7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_48a7_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l85_c7_48a7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_48a7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_48a7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_48a7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_48a7_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l85_c7_48a7]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_48a7_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_48a7_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_48a7_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_48a7_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l85_c7_48a7]
signal t8_MUX_uxn_opcodes_h_l85_c7_48a7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l85_c7_48a7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l85_c7_48a7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l85_c7_48a7_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l85_c7_48a7]
signal tmp16_MUX_uxn_opcodes_h_l85_c7_48a7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_48a7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_48a7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_48a7_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l88_c22_e584]
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_e584_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_e584_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_e584_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l90_c11_8e7d]
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_8e7d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_8e7d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_8e7d_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l90_c7_a47c]
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_a47c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_a47c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_a47c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_a47c_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l90_c7_a47c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_a47c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_a47c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_a47c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_a47c_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_a47c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a47c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a47c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a47c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a47c_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_a47c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a47c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a47c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a47c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a47c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l90_c7_a47c]
signal t8_MUX_uxn_opcodes_h_l90_c7_a47c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l90_c7_a47c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l90_c7_a47c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l90_c7_a47c_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l90_c7_a47c]
signal tmp16_MUX_uxn_opcodes_h_l90_c7_a47c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_a47c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_a47c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_a47c_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l93_c3_8c52]
signal CONST_SL_8_uxn_opcodes_h_l93_c3_8c52_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l93_c3_8c52_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l96_c11_7b0d]
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_7b0d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_7b0d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_7b0d_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l96_c7_865b]
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_865b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_865b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_865b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_865b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l96_c7_865b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_865b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_865b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_865b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_865b_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l96_c7_865b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_865b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_865b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_865b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_865b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l96_c7_865b]
signal tmp16_MUX_uxn_opcodes_h_l96_c7_865b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_865b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_865b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_865b_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l97_c3_7a45]
signal BIN_OP_OR_uxn_opcodes_h_l97_c3_7a45_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l97_c3_7a45_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l97_c3_7a45_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l99_c22_fb65]
signal BIN_OP_EQ_uxn_opcodes_h_l99_c22_fb65_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c22_fb65_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c22_fb65_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c32_7341]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c32_7341_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c32_7341_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c32_7341_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_2853]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2853_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2853_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2853_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_71cc]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_71cc_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_71cc_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_71cc_return_output : unsigned(17 downto 0);

-- MUX[uxn_opcodes_h_l99_c22_2525]
signal MUX_uxn_opcodes_h_l99_c22_2525_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l99_c22_2525_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l99_c22_2525_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l99_c22_2525_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_6c0a( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_vram_write := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.u16_value := ref_toks_5;
      base.is_pc_updated := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l71_c6_e767
BIN_OP_EQ_uxn_opcodes_h_l71_c6_e767 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l71_c6_e767_left,
BIN_OP_EQ_uxn_opcodes_h_l71_c6_e767_right,
BIN_OP_EQ_uxn_opcodes_h_l71_c6_e767_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_db2d
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_db2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_db2d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_db2d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_db2d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_db2d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_db2d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_db2d_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_db2d
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_db2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_db2d_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_db2d_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_db2d
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_db2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_db2d_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_db2d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l71_c2_db2d
result_u16_value_MUX_uxn_opcodes_h_l71_c2_db2d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l71_c2_db2d_cond,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_db2d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_db2d
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_db2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_db2d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_db2d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_db2d
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_db2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_db2d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_db2d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_db2d
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_db2d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_db2d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_db2d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_db2d
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_db2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_db2d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_db2d_return_output);

-- t8_MUX_uxn_opcodes_h_l71_c2_db2d
t8_MUX_uxn_opcodes_h_l71_c2_db2d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l71_c2_db2d_cond,
t8_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue,
t8_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse,
t8_MUX_uxn_opcodes_h_l71_c2_db2d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l71_c2_db2d
tmp16_MUX_uxn_opcodes_h_l71_c2_db2d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l71_c2_db2d_cond,
tmp16_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue,
tmp16_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse,
tmp16_MUX_uxn_opcodes_h_l71_c2_db2d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l85_c11_329b
BIN_OP_EQ_uxn_opcodes_h_l85_c11_329b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l85_c11_329b_left,
BIN_OP_EQ_uxn_opcodes_h_l85_c11_329b_right,
BIN_OP_EQ_uxn_opcodes_h_l85_c11_329b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_48a7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_48a7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_48a7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_48a7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_48a7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_48a7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l85_c7_48a7
result_u16_value_MUX_uxn_opcodes_h_l85_c7_48a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l85_c7_48a7_cond,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_48a7_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_48a7_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_48a7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_48a7
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_48a7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_48a7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_48a7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_48a7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_48a7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_48a7
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_48a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_48a7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_48a7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_48a7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_48a7_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_48a7
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_48a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_48a7_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_48a7_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_48a7_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_48a7_return_output);

-- t8_MUX_uxn_opcodes_h_l85_c7_48a7
t8_MUX_uxn_opcodes_h_l85_c7_48a7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l85_c7_48a7_cond,
t8_MUX_uxn_opcodes_h_l85_c7_48a7_iftrue,
t8_MUX_uxn_opcodes_h_l85_c7_48a7_iffalse,
t8_MUX_uxn_opcodes_h_l85_c7_48a7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l85_c7_48a7
tmp16_MUX_uxn_opcodes_h_l85_c7_48a7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l85_c7_48a7_cond,
tmp16_MUX_uxn_opcodes_h_l85_c7_48a7_iftrue,
tmp16_MUX_uxn_opcodes_h_l85_c7_48a7_iffalse,
tmp16_MUX_uxn_opcodes_h_l85_c7_48a7_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l88_c22_e584
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_e584 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_e584_left,
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_e584_right,
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_e584_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l90_c11_8e7d
BIN_OP_EQ_uxn_opcodes_h_l90_c11_8e7d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l90_c11_8e7d_left,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_8e7d_right,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_8e7d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l90_c7_a47c
result_u16_value_MUX_uxn_opcodes_h_l90_c7_a47c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l90_c7_a47c_cond,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_a47c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_a47c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_a47c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_a47c
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_a47c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_a47c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_a47c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_a47c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_a47c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a47c
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a47c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a47c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a47c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a47c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a47c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a47c
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a47c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a47c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a47c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a47c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a47c_return_output);

-- t8_MUX_uxn_opcodes_h_l90_c7_a47c
t8_MUX_uxn_opcodes_h_l90_c7_a47c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l90_c7_a47c_cond,
t8_MUX_uxn_opcodes_h_l90_c7_a47c_iftrue,
t8_MUX_uxn_opcodes_h_l90_c7_a47c_iffalse,
t8_MUX_uxn_opcodes_h_l90_c7_a47c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l90_c7_a47c
tmp16_MUX_uxn_opcodes_h_l90_c7_a47c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l90_c7_a47c_cond,
tmp16_MUX_uxn_opcodes_h_l90_c7_a47c_iftrue,
tmp16_MUX_uxn_opcodes_h_l90_c7_a47c_iffalse,
tmp16_MUX_uxn_opcodes_h_l90_c7_a47c_return_output);

-- CONST_SL_8_uxn_opcodes_h_l93_c3_8c52
CONST_SL_8_uxn_opcodes_h_l93_c3_8c52 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l93_c3_8c52_x,
CONST_SL_8_uxn_opcodes_h_l93_c3_8c52_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l96_c11_7b0d
BIN_OP_EQ_uxn_opcodes_h_l96_c11_7b0d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l96_c11_7b0d_left,
BIN_OP_EQ_uxn_opcodes_h_l96_c11_7b0d_right,
BIN_OP_EQ_uxn_opcodes_h_l96_c11_7b0d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l96_c7_865b
result_u16_value_MUX_uxn_opcodes_h_l96_c7_865b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l96_c7_865b_cond,
result_u16_value_MUX_uxn_opcodes_h_l96_c7_865b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l96_c7_865b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l96_c7_865b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_865b
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_865b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_865b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_865b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_865b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_865b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_865b
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_865b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_865b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_865b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_865b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_865b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l96_c7_865b
tmp16_MUX_uxn_opcodes_h_l96_c7_865b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l96_c7_865b_cond,
tmp16_MUX_uxn_opcodes_h_l96_c7_865b_iftrue,
tmp16_MUX_uxn_opcodes_h_l96_c7_865b_iffalse,
tmp16_MUX_uxn_opcodes_h_l96_c7_865b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l97_c3_7a45
BIN_OP_OR_uxn_opcodes_h_l97_c3_7a45 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l97_c3_7a45_left,
BIN_OP_OR_uxn_opcodes_h_l97_c3_7a45_right,
BIN_OP_OR_uxn_opcodes_h_l97_c3_7a45_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l99_c22_fb65
BIN_OP_EQ_uxn_opcodes_h_l99_c22_fb65 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l99_c22_fb65_left,
BIN_OP_EQ_uxn_opcodes_h_l99_c22_fb65_right,
BIN_OP_EQ_uxn_opcodes_h_l99_c22_fb65_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c32_7341
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_7341 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_7341_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_7341_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_7341_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2853
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2853 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2853_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2853_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2853_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c42_71cc
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_71cc : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_71cc_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_71cc_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_71cc_return_output);

-- MUX_uxn_opcodes_h_l99_c22_2525
MUX_uxn_opcodes_h_l99_c22_2525 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l99_c22_2525_cond,
MUX_uxn_opcodes_h_l99_c22_2525_iftrue,
MUX_uxn_opcodes_h_l99_c22_2525_iffalse,
MUX_uxn_opcodes_h_l99_c22_2525_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l71_c6_e767_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_db2d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_db2d_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_db2d_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_db2d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l71_c2_db2d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_db2d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_db2d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_db2d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_db2d_return_output,
 t8_MUX_uxn_opcodes_h_l71_c2_db2d_return_output,
 tmp16_MUX_uxn_opcodes_h_l71_c2_db2d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l85_c11_329b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_48a7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l85_c7_48a7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_48a7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_48a7_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_48a7_return_output,
 t8_MUX_uxn_opcodes_h_l85_c7_48a7_return_output,
 tmp16_MUX_uxn_opcodes_h_l85_c7_48a7_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l88_c22_e584_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l90_c11_8e7d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l90_c7_a47c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_a47c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a47c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a47c_return_output,
 t8_MUX_uxn_opcodes_h_l90_c7_a47c_return_output,
 tmp16_MUX_uxn_opcodes_h_l90_c7_a47c_return_output,
 CONST_SL_8_uxn_opcodes_h_l93_c3_8c52_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l96_c11_7b0d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l96_c7_865b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_865b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_865b_return_output,
 tmp16_MUX_uxn_opcodes_h_l96_c7_865b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l97_c3_7a45_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l99_c22_fb65_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c32_7341_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2853_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c42_71cc_return_output,
 MUX_uxn_opcodes_h_l99_c22_2525_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_e767_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_e767_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_e767_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l71_c2_db2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_db2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_db2d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_e691 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_48a7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_db2d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_db2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l71_c2_db2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_db2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_db2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l71_c2_db2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_db2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_db2d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_48a7_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_db2d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_db2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_48a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_db2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_db2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l71_c2_db2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_db2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_db2d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l76_c3_4921 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_48a7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_db2d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_db2d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_48a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_db2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_db2d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_48a7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_db2d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_db2d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_48a7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_db2d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_db2d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_329b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_329b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_329b_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_48a7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l86_c3_7064 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_48a7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l85_c7_48a7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_48a7_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_48a7_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l88_c3_71b5 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_48a7_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_a47c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_48a7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_48a7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l87_c3_07a9 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_48a7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_a47c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_48a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_48a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_48a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a47c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_48a7_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_48a7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_48a7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a47c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_48a7_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_48a7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_48a7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_a47c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_48a7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_48a7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_48a7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_a47c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_48a7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_e584_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_e584_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_e584_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_8e7d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_8e7d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_8e7d_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_a47c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_a47c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_865b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_a47c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_a47c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l94_c3_cbcc : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_a47c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l90_c7_a47c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_a47c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a47c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a47c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_865b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a47c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a47c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a47c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_865b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a47c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_a47c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_a47c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_a47c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_a47c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_a47c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_865b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_a47c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_8c52_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_8c52_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_7b0d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_7b0d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_7b0d_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_865b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_865b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_865b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_865b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_865b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_865b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_865b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_865b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_865b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_865b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_865b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_865b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_7a45_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_7a45_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_7a45_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_2525_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_fb65_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_fb65_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_fb65_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_2525_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_2525_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_7341_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_7341_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_7341_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2853_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2853_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2853_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_71cc_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_71cc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_71cc_return_output : unsigned(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_2525_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l85_l90_l96_DUPLICATE_1ba5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l85_l90_l96_DUPLICATE_7388_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l97_l92_DUPLICATE_e56f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l90_l96_DUPLICATE_a4ac_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6c0a_uxn_opcodes_h_l66_l103_DUPLICATE_ae65_return_output : opcode_result_t;
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
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l76_c3_4921 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l76_c3_4921;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_329b_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_7b0d_right := to_unsigned(3, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_71cc_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_865b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_8e7d_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_fb65_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_e584_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_e767_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l87_c3_07a9 := resize(to_signed(-1, 2), 4);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_48a7_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l87_c3_07a9;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_865b_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l94_c3_cbcc := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_a47c_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l94_c3_cbcc;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_e691 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_e691;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_7341_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l86_c3_7064 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_48a7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l86_c3_7064;

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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_e584_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_7341_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2853_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_e767_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_329b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_8e7d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_7b0d_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_a47c_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_fb65_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_48a7_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_a47c_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_7a45_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_48a7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_865b_iffalse := tmp16;
     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l71_c2_db2d] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l71_c2_db2d_return_output := result.is_stack_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l71_c2_db2d] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l71_c2_db2d_return_output := result.is_stack_index_flipped;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l85_c7_48a7] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l85_c7_48a7_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l85_l90_l96_DUPLICATE_1ba5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l85_l90_l96_DUPLICATE_1ba5_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l85_l90_l96_DUPLICATE_7388 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l85_l90_l96_DUPLICATE_7388_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l96_c11_7b0d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l96_c11_7b0d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_7b0d_left;
     BIN_OP_EQ_uxn_opcodes_h_l96_c11_7b0d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_7b0d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_7b0d_return_output := BIN_OP_EQ_uxn_opcodes_h_l96_c11_7b0d_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l71_c2_db2d] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l71_c2_db2d_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l71_c6_e767] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l71_c6_e767_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_e767_left;
     BIN_OP_EQ_uxn_opcodes_h_l71_c6_e767_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_e767_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_e767_return_output := BIN_OP_EQ_uxn_opcodes_h_l71_c6_e767_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l71_c2_db2d] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l71_c2_db2d_return_output := result.is_ram_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l97_l92_DUPLICATE_e56f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l97_l92_DUPLICATE_e56f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_PLUS[uxn_opcodes_h_l88_c22_e584] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l88_c22_e584_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_e584_left;
     BIN_OP_PLUS_uxn_opcodes_h_l88_c22_e584_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_e584_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_e584_return_output := BIN_OP_PLUS_uxn_opcodes_h_l88_c22_e584_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l90_c11_8e7d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_8e7d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_8e7d_left;
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_8e7d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_8e7d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_8e7d_return_output := BIN_OP_EQ_uxn_opcodes_h_l90_c11_8e7d_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l90_c7_a47c] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l90_c7_a47c_return_output := result.sp_relative_shift;

     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c32_7341] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c32_7341_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_7341_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c32_7341_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_7341_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_7341_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c32_7341_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l99_c22_fb65] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l99_c22_fb65_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_fb65_left;
     BIN_OP_EQ_uxn_opcodes_h_l99_c22_fb65_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_fb65_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_fb65_return_output := BIN_OP_EQ_uxn_opcodes_h_l99_c22_fb65_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l85_c11_329b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l85_c11_329b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_329b_left;
     BIN_OP_EQ_uxn_opcodes_h_l85_c11_329b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_329b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_329b_return_output := BIN_OP_EQ_uxn_opcodes_h_l85_c11_329b_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l90_l96_DUPLICATE_a4ac LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l90_l96_DUPLICATE_a4ac_return_output := result.u16_value;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_db2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_e767_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_db2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_e767_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_db2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_e767_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_db2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_e767_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_db2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_e767_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_db2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_e767_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_db2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_e767_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_db2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_e767_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_db2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_e767_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_db2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_e767_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_db2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_e767_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_48a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_329b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_48a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_329b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_48a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_329b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_48a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_329b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_48a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_329b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_48a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_329b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_48a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_329b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a47c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_8e7d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a47c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_8e7d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_a47c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_8e7d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_a47c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_8e7d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_a47c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_8e7d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_a47c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_8e7d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_865b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_7b0d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_865b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_7b0d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_865b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_7b0d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_865b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_7b0d_return_output;
     VAR_MUX_uxn_opcodes_h_l99_c22_2525_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_fb65_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l88_c3_71b5 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_e584_return_output, 16);
     VAR_MUX_uxn_opcodes_h_l99_c22_2525_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_7341_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_7a45_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l97_l92_DUPLICATE_e56f_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_8c52_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l97_l92_DUPLICATE_e56f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_a47c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l90_l96_DUPLICATE_a4ac_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_865b_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l90_l96_DUPLICATE_a4ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_48a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l85_l90_l96_DUPLICATE_1ba5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a47c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l85_l90_l96_DUPLICATE_1ba5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_865b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l85_l90_l96_DUPLICATE_1ba5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_48a7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l85_l90_l96_DUPLICATE_7388_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a47c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l85_l90_l96_DUPLICATE_7388_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_865b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l85_l90_l96_DUPLICATE_7388_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l71_c2_db2d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l71_c2_db2d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l71_c2_db2d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l71_c2_db2d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_a47c_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l90_c7_a47c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_48a7_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l85_c7_48a7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_48a7_iftrue := VAR_result_u16_value_uxn_opcodes_h_l88_c3_71b5;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l96_c7_865b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_865b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_865b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_865b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_865b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_865b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_865b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_865b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_865b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l90_c7_a47c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_a47c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_a47c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_a47c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_a47c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_a47c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_a47c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_a47c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_a47c_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l71_c2_db2d] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_db2d_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_db2d_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_db2d_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_db2d_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l71_c2_db2d] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_db2d_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_db2d_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_db2d_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_db2d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l71_c2_db2d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_db2d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_db2d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_db2d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_db2d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l85_c7_48a7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_48a7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_48a7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_48a7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_48a7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_48a7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_48a7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_48a7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_48a7_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l93_c3_8c52] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l93_c3_8c52_x <= VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_8c52_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_8c52_return_output := CONST_SL_8_uxn_opcodes_h_l93_c3_8c52_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l97_c3_7a45] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l97_c3_7a45_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_7a45_left;
     BIN_OP_OR_uxn_opcodes_h_l97_c3_7a45_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_7a45_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_7a45_return_output := BIN_OP_OR_uxn_opcodes_h_l97_c3_7a45_return_output;

     -- t8_MUX[uxn_opcodes_h_l90_c7_a47c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l90_c7_a47c_cond <= VAR_t8_MUX_uxn_opcodes_h_l90_c7_a47c_cond;
     t8_MUX_uxn_opcodes_h_l90_c7_a47c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l90_c7_a47c_iftrue;
     t8_MUX_uxn_opcodes_h_l90_c7_a47c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l90_c7_a47c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_a47c_return_output := t8_MUX_uxn_opcodes_h_l90_c7_a47c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l96_c7_865b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_865b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_865b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_865b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_865b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_865b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_865b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_865b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_865b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l71_c2_db2d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_db2d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_db2d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_db2d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_db2d_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2853_right := VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_7a45_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_865b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_7a45_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_a47c_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_8c52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a47c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_865b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a47c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_865b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_48a7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_a47c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_48a7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_48a7_iffalse := VAR_t8_MUX_uxn_opcodes_h_l90_c7_a47c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_a47c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a47c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a47c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a47c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a47c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a47c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a47c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a47c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a47c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_a47c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a47c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a47c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a47c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a47c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a47c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a47c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a47c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a47c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l71_c2_db2d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_db2d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_db2d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_db2d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_db2d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l85_c7_48a7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_48a7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_48a7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_48a7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_48a7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_48a7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_48a7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_48a7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_48a7_return_output;

     -- t8_MUX[uxn_opcodes_h_l85_c7_48a7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l85_c7_48a7_cond <= VAR_t8_MUX_uxn_opcodes_h_l85_c7_48a7_cond;
     t8_MUX_uxn_opcodes_h_l85_c7_48a7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l85_c7_48a7_iftrue;
     t8_MUX_uxn_opcodes_h_l85_c7_48a7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l85_c7_48a7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_48a7_return_output := t8_MUX_uxn_opcodes_h_l85_c7_48a7_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_2853] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2853_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2853_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2853_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2853_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2853_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2853_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l96_c7_865b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l96_c7_865b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_865b_cond;
     tmp16_MUX_uxn_opcodes_h_l96_c7_865b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_865b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l96_c7_865b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_865b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_865b_return_output := tmp16_MUX_uxn_opcodes_h_l96_c7_865b_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_71cc_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2853_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_48a7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_a47c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_48a7_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_a47c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_48a7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l85_c7_48a7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_a47c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_865b_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l85_c7_48a7] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_48a7_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_48a7_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_48a7_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_48a7_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_48a7_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_48a7_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_48a7_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_48a7_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_71cc] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_71cc_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_71cc_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_71cc_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_71cc_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_71cc_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c42_71cc_return_output;

     -- t8_MUX[uxn_opcodes_h_l71_c2_db2d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l71_c2_db2d_cond <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_db2d_cond;
     t8_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue;
     t8_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_db2d_return_output := t8_MUX_uxn_opcodes_h_l71_c2_db2d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l85_c7_48a7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_48a7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_48a7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_48a7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_48a7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_48a7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_48a7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_48a7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_48a7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l71_c2_db2d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_db2d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_db2d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_db2d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_db2d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l90_c7_a47c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l90_c7_a47c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_a47c_cond;
     tmp16_MUX_uxn_opcodes_h_l90_c7_a47c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_a47c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l90_c7_a47c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_a47c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_a47c_return_output := tmp16_MUX_uxn_opcodes_h_l90_c7_a47c_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_opcodes_h_l99_c22_2525_iffalse := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_71cc_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_48a7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_48a7_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l71_c2_db2d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_48a7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_a47c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l71_c2_db2d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_db2d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_db2d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_db2d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_db2d_return_output;

     -- MUX[uxn_opcodes_h_l99_c22_2525] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l99_c22_2525_cond <= VAR_MUX_uxn_opcodes_h_l99_c22_2525_cond;
     MUX_uxn_opcodes_h_l99_c22_2525_iftrue <= VAR_MUX_uxn_opcodes_h_l99_c22_2525_iftrue;
     MUX_uxn_opcodes_h_l99_c22_2525_iffalse <= VAR_MUX_uxn_opcodes_h_l99_c22_2525_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l99_c22_2525_return_output := MUX_uxn_opcodes_h_l99_c22_2525_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l71_c2_db2d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_db2d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_db2d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_db2d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_db2d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l85_c7_48a7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l85_c7_48a7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_48a7_cond;
     tmp16_MUX_uxn_opcodes_h_l85_c7_48a7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_48a7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l85_c7_48a7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_48a7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_48a7_return_output := tmp16_MUX_uxn_opcodes_h_l85_c7_48a7_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_865b_iftrue := VAR_MUX_uxn_opcodes_h_l99_c22_2525_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_48a7_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l71_c2_db2d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l71_c2_db2d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_db2d_cond;
     tmp16_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_db2d_return_output := tmp16_MUX_uxn_opcodes_h_l71_c2_db2d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l96_c7_865b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l96_c7_865b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_865b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l96_c7_865b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_865b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l96_c7_865b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_865b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_865b_return_output := result_u16_value_MUX_uxn_opcodes_h_l96_c7_865b_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_a47c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_865b_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_db2d_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l90_c7_a47c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_a47c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_a47c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_a47c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_a47c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_a47c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_a47c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_a47c_return_output := result_u16_value_MUX_uxn_opcodes_h_l90_c7_a47c_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_48a7_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_a47c_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l85_c7_48a7] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_48a7_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_48a7_cond;
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_48a7_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_48a7_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_48a7_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_48a7_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_48a7_return_output := result_u16_value_MUX_uxn_opcodes_h_l85_c7_48a7_return_output;

     -- Submodule level 8
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_48a7_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l71_c2_db2d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_db2d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_db2d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_db2d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_db2d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_db2d_return_output := result_u16_value_MUX_uxn_opcodes_h_l71_c2_db2d_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6c0a_uxn_opcodes_h_l66_l103_DUPLICATE_ae65 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6c0a_uxn_opcodes_h_l66_l103_DUPLICATE_ae65_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6c0a(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_db2d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_db2d_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_db2d_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_db2d_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_db2d_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_db2d_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_db2d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_db2d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_db2d_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6c0a_uxn_opcodes_h_l66_l103_DUPLICATE_ae65_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6c0a_uxn_opcodes_h_l66_l103_DUPLICATE_ae65_return_output;
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
