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
-- BIN_OP_EQ[uxn_opcodes_h_l71_c6_ce76]
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_ce76_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_ce76_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_ce76_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l71_c2_87b8]
signal t8_MUX_uxn_opcodes_h_l71_c2_87b8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_87b8_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l71_c2_87b8]
signal tmp16_MUX_uxn_opcodes_h_l71_c2_87b8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_87b8_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l71_c2_87b8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_87b8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_87b8_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l71_c2_87b8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_87b8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_87b8_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l71_c2_87b8]
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_87b8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_87b8_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l71_c2_87b8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_87b8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_87b8_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l71_c2_87b8]
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_87b8_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_87b8_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l71_c2_87b8]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_87b8_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_87b8_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l71_c2_87b8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_87b8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_87b8_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l71_c2_87b8]
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_87b8_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_87b8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l71_c2_87b8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_87b8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_87b8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l85_c11_f409]
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_f409_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_f409_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_f409_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l85_c7_52b5]
signal t8_MUX_uxn_opcodes_h_l85_c7_52b5_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l85_c7_52b5_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l85_c7_52b5_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l85_c7_52b5_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l85_c7_52b5]
signal tmp16_MUX_uxn_opcodes_h_l85_c7_52b5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_52b5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_52b5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_52b5_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l85_c7_52b5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_52b5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_52b5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_52b5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_52b5_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l85_c7_52b5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_52b5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_52b5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_52b5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_52b5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l85_c7_52b5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_52b5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_52b5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_52b5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_52b5_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l85_c7_52b5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_52b5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_52b5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_52b5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_52b5_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l85_c7_52b5]
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_52b5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_52b5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_52b5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_52b5_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l88_c22_2fd1]
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_2fd1_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_2fd1_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_2fd1_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l90_c11_627b]
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_627b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_627b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_627b_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l90_c7_6b26]
signal t8_MUX_uxn_opcodes_h_l90_c7_6b26_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l90_c7_6b26_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l90_c7_6b26_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l90_c7_6b26_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l90_c7_6b26]
signal tmp16_MUX_uxn_opcodes_h_l90_c7_6b26_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_6b26_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_6b26_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_6b26_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l90_c7_6b26]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_6b26_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_6b26_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_6b26_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_6b26_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l90_c7_6b26]
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_6b26_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_6b26_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_6b26_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_6b26_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_6b26]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_6b26_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_6b26_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_6b26_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_6b26_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_6b26]
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_6b26_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_6b26_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_6b26_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_6b26_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l93_c3_61d8]
signal CONST_SL_8_uxn_opcodes_h_l93_c3_61d8_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l93_c3_61d8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l96_c11_2889]
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_2889_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_2889_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_2889_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l96_c7_cff3]
signal tmp16_MUX_uxn_opcodes_h_l96_c7_cff3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_cff3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_cff3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_cff3_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l96_c7_cff3]
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_cff3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_cff3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_cff3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_cff3_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l96_c7_cff3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cff3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cff3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cff3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cff3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l96_c7_cff3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cff3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cff3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cff3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cff3_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l97_c3_9884]
signal BIN_OP_OR_uxn_opcodes_h_l97_c3_9884_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l97_c3_9884_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l97_c3_9884_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l99_c22_0008]
signal BIN_OP_EQ_uxn_opcodes_h_l99_c22_0008_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c22_0008_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c22_0008_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c32_0370]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c32_0370_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c32_0370_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c32_0370_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_129d]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_129d_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_129d_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_129d_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_2b9e]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2b9e_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2b9e_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2b9e_return_output : unsigned(17 downto 0);

-- MUX[uxn_opcodes_h_l99_c22_1503]
signal MUX_uxn_opcodes_h_l99_c22_1503_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l99_c22_1503_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l99_c22_1503_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l99_c22_1503_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_6063( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_vram_write := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.is_stack_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l71_c6_ce76
BIN_OP_EQ_uxn_opcodes_h_l71_c6_ce76 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l71_c6_ce76_left,
BIN_OP_EQ_uxn_opcodes_h_l71_c6_ce76_right,
BIN_OP_EQ_uxn_opcodes_h_l71_c6_ce76_return_output);

-- t8_MUX_uxn_opcodes_h_l71_c2_87b8
t8_MUX_uxn_opcodes_h_l71_c2_87b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l71_c2_87b8_cond,
t8_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue,
t8_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse,
t8_MUX_uxn_opcodes_h_l71_c2_87b8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l71_c2_87b8
tmp16_MUX_uxn_opcodes_h_l71_c2_87b8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l71_c2_87b8_cond,
tmp16_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue,
tmp16_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse,
tmp16_MUX_uxn_opcodes_h_l71_c2_87b8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_87b8
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_87b8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_87b8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_87b8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_87b8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_87b8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_87b8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_87b8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l71_c2_87b8
result_u16_value_MUX_uxn_opcodes_h_l71_c2_87b8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l71_c2_87b8_cond,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_87b8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_87b8
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_87b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_87b8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_87b8_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_87b8
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_87b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_87b8_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_87b8_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_87b8
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_87b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_87b8_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_87b8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_87b8
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_87b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_87b8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_87b8_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_87b8
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_87b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_87b8_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_87b8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_87b8
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_87b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_87b8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_87b8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l85_c11_f409
BIN_OP_EQ_uxn_opcodes_h_l85_c11_f409 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l85_c11_f409_left,
BIN_OP_EQ_uxn_opcodes_h_l85_c11_f409_right,
BIN_OP_EQ_uxn_opcodes_h_l85_c11_f409_return_output);

-- t8_MUX_uxn_opcodes_h_l85_c7_52b5
t8_MUX_uxn_opcodes_h_l85_c7_52b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l85_c7_52b5_cond,
t8_MUX_uxn_opcodes_h_l85_c7_52b5_iftrue,
t8_MUX_uxn_opcodes_h_l85_c7_52b5_iffalse,
t8_MUX_uxn_opcodes_h_l85_c7_52b5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l85_c7_52b5
tmp16_MUX_uxn_opcodes_h_l85_c7_52b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l85_c7_52b5_cond,
tmp16_MUX_uxn_opcodes_h_l85_c7_52b5_iftrue,
tmp16_MUX_uxn_opcodes_h_l85_c7_52b5_iffalse,
tmp16_MUX_uxn_opcodes_h_l85_c7_52b5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_52b5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_52b5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_52b5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_52b5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_52b5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_52b5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_52b5
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_52b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_52b5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_52b5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_52b5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_52b5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_52b5
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_52b5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_52b5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_52b5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_52b5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_52b5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_52b5
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_52b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_52b5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_52b5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_52b5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_52b5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l85_c7_52b5
result_u16_value_MUX_uxn_opcodes_h_l85_c7_52b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l85_c7_52b5_cond,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_52b5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_52b5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_52b5_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l88_c22_2fd1
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_2fd1 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_2fd1_left,
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_2fd1_right,
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_2fd1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l90_c11_627b
BIN_OP_EQ_uxn_opcodes_h_l90_c11_627b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l90_c11_627b_left,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_627b_right,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_627b_return_output);

-- t8_MUX_uxn_opcodes_h_l90_c7_6b26
t8_MUX_uxn_opcodes_h_l90_c7_6b26 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l90_c7_6b26_cond,
t8_MUX_uxn_opcodes_h_l90_c7_6b26_iftrue,
t8_MUX_uxn_opcodes_h_l90_c7_6b26_iffalse,
t8_MUX_uxn_opcodes_h_l90_c7_6b26_return_output);

-- tmp16_MUX_uxn_opcodes_h_l90_c7_6b26
tmp16_MUX_uxn_opcodes_h_l90_c7_6b26 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l90_c7_6b26_cond,
tmp16_MUX_uxn_opcodes_h_l90_c7_6b26_iftrue,
tmp16_MUX_uxn_opcodes_h_l90_c7_6b26_iffalse,
tmp16_MUX_uxn_opcodes_h_l90_c7_6b26_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_6b26
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_6b26 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_6b26_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_6b26_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_6b26_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_6b26_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l90_c7_6b26
result_u16_value_MUX_uxn_opcodes_h_l90_c7_6b26 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l90_c7_6b26_cond,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_6b26_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_6b26_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_6b26_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_6b26
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_6b26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_6b26_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_6b26_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_6b26_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_6b26_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_6b26
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_6b26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_6b26_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_6b26_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_6b26_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_6b26_return_output);

-- CONST_SL_8_uxn_opcodes_h_l93_c3_61d8
CONST_SL_8_uxn_opcodes_h_l93_c3_61d8 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l93_c3_61d8_x,
CONST_SL_8_uxn_opcodes_h_l93_c3_61d8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l96_c11_2889
BIN_OP_EQ_uxn_opcodes_h_l96_c11_2889 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l96_c11_2889_left,
BIN_OP_EQ_uxn_opcodes_h_l96_c11_2889_right,
BIN_OP_EQ_uxn_opcodes_h_l96_c11_2889_return_output);

-- tmp16_MUX_uxn_opcodes_h_l96_c7_cff3
tmp16_MUX_uxn_opcodes_h_l96_c7_cff3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l96_c7_cff3_cond,
tmp16_MUX_uxn_opcodes_h_l96_c7_cff3_iftrue,
tmp16_MUX_uxn_opcodes_h_l96_c7_cff3_iffalse,
tmp16_MUX_uxn_opcodes_h_l96_c7_cff3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l96_c7_cff3
result_u16_value_MUX_uxn_opcodes_h_l96_c7_cff3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l96_c7_cff3_cond,
result_u16_value_MUX_uxn_opcodes_h_l96_c7_cff3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l96_c7_cff3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l96_c7_cff3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cff3
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cff3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cff3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cff3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cff3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cff3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cff3
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cff3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cff3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cff3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cff3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cff3_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l97_c3_9884
BIN_OP_OR_uxn_opcodes_h_l97_c3_9884 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l97_c3_9884_left,
BIN_OP_OR_uxn_opcodes_h_l97_c3_9884_right,
BIN_OP_OR_uxn_opcodes_h_l97_c3_9884_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l99_c22_0008
BIN_OP_EQ_uxn_opcodes_h_l99_c22_0008 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l99_c22_0008_left,
BIN_OP_EQ_uxn_opcodes_h_l99_c22_0008_right,
BIN_OP_EQ_uxn_opcodes_h_l99_c22_0008_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c32_0370
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_0370 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_0370_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_0370_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_0370_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c42_129d
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_129d : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_129d_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_129d_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_129d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2b9e
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2b9e : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2b9e_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2b9e_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2b9e_return_output);

-- MUX_uxn_opcodes_h_l99_c22_1503
MUX_uxn_opcodes_h_l99_c22_1503 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l99_c22_1503_cond,
MUX_uxn_opcodes_h_l99_c22_1503_iftrue,
MUX_uxn_opcodes_h_l99_c22_1503_iffalse,
MUX_uxn_opcodes_h_l99_c22_1503_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l71_c6_ce76_return_output,
 t8_MUX_uxn_opcodes_h_l71_c2_87b8_return_output,
 tmp16_MUX_uxn_opcodes_h_l71_c2_87b8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_87b8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_87b8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l71_c2_87b8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_87b8_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_87b8_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_87b8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_87b8_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_87b8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_87b8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l85_c11_f409_return_output,
 t8_MUX_uxn_opcodes_h_l85_c7_52b5_return_output,
 tmp16_MUX_uxn_opcodes_h_l85_c7_52b5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_52b5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_52b5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_52b5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_52b5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l85_c7_52b5_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l88_c22_2fd1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l90_c11_627b_return_output,
 t8_MUX_uxn_opcodes_h_l90_c7_6b26_return_output,
 tmp16_MUX_uxn_opcodes_h_l90_c7_6b26_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_6b26_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l90_c7_6b26_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_6b26_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_6b26_return_output,
 CONST_SL_8_uxn_opcodes_h_l93_c3_61d8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l96_c11_2889_return_output,
 tmp16_MUX_uxn_opcodes_h_l96_c7_cff3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l96_c7_cff3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cff3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cff3_return_output,
 BIN_OP_OR_uxn_opcodes_h_l97_c3_9884_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l99_c22_0008_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c32_0370_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c42_129d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2b9e_return_output,
 MUX_uxn_opcodes_h_l99_c22_1503_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_ce76_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_ce76_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_ce76_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_52b5_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_87b8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_87b8_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_52b5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_87b8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_87b8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l76_c3_50de : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_52b5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_87b8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_87b8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_9dea : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_52b5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_87b8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_87b8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_52b5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_87b8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_87b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_52b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_87b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_87b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l71_c2_87b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_87b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_87b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l71_c2_87b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_87b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_87b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_52b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_87b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_87b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l71_c2_87b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_87b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_87b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l71_c2_87b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_87b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_87b8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_f409_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_f409_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_f409_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_52b5_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_52b5_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_6b26_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_52b5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_52b5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_52b5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_6b26_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_52b5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_52b5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l86_c3_f722 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_52b5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l85_c7_52b5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_52b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_52b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_52b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_6b26_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_52b5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_52b5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l87_c3_49c2 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_52b5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_6b26_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_52b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_52b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_52b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_6b26_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_52b5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_52b5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l88_c3_99a1 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_52b5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_6b26_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_52b5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_2fd1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_2fd1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_2fd1_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_627b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_627b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_627b_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_6b26_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_6b26_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_6b26_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_6b26_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_6b26_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_cff3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_6b26_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_6b26_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l94_c3_3b17 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_6b26_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l90_c7_6b26_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_6b26_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_6b26_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_6b26_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_cff3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_6b26_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_6b26_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_6b26_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cff3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_6b26_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_6b26_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_6b26_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cff3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_6b26_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_61d8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_61d8_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_2889_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_2889_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_2889_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_cff3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_cff3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_cff3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_cff3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_cff3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_cff3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cff3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cff3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cff3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cff3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cff3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cff3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_9884_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_9884_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_9884_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_1503_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_0008_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_0008_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_0008_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_1503_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_1503_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_0370_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_0370_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_0370_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_129d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_129d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_129d_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2b9e_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2b9e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2b9e_return_output : unsigned(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_1503_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_d7db_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_d109_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l97_l92_DUPLICATE_70c2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l90_l96_DUPLICATE_adcb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6063_uxn_opcodes_h_l66_l103_DUPLICATE_6171_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_2889_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_f409_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cff3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_ce76_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l94_c3_3b17 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_6b26_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l94_c3_3b17;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_2fd1_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2b9e_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_9dea := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_9dea;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l76_c3_50de := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l76_c3_50de;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_0370_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_0008_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l87_c3_49c2 := resize(to_signed(-1, 2), 4);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_52b5_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l87_c3_49c2;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l86_c3_f722 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_52b5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l86_c3_f722;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_627b_right := to_unsigned(2, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cff3_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue := to_unsigned(0, 1);

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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_2fd1_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_0370_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_129d_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_ce76_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_f409_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_627b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_2889_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_6b26_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_0008_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_52b5_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_6b26_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_9884_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_52b5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_cff3_iffalse := tmp16;
     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l71_c2_87b8] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l71_c2_87b8_return_output := result.is_ram_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l97_l92_DUPLICATE_70c2 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l97_l92_DUPLICATE_70c2_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_d109 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_d109_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l71_c6_ce76] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l71_c6_ce76_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_ce76_left;
     BIN_OP_EQ_uxn_opcodes_h_l71_c6_ce76_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_ce76_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_ce76_return_output := BIN_OP_EQ_uxn_opcodes_h_l71_c6_ce76_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l90_c7_6b26] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l90_c7_6b26_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l85_c11_f409] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l85_c11_f409_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_f409_left;
     BIN_OP_EQ_uxn_opcodes_h_l85_c11_f409_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_f409_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_f409_return_output := BIN_OP_EQ_uxn_opcodes_h_l85_c11_f409_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l85_c7_52b5] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l85_c7_52b5_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l99_c22_0008] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l99_c22_0008_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_0008_left;
     BIN_OP_EQ_uxn_opcodes_h_l99_c22_0008_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_0008_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_0008_return_output := BIN_OP_EQ_uxn_opcodes_h_l99_c22_0008_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l71_c2_87b8] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l71_c2_87b8_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l96_c11_2889] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l96_c11_2889_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_2889_left;
     BIN_OP_EQ_uxn_opcodes_h_l96_c11_2889_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_2889_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_2889_return_output := BIN_OP_EQ_uxn_opcodes_h_l96_c11_2889_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l71_c2_87b8] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l71_c2_87b8_return_output := result.is_stack_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c32_0370] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c32_0370_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_0370_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c32_0370_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_0370_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_0370_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c32_0370_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_d7db LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_d7db_return_output := result.is_opc_done;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l71_c2_87b8] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l71_c2_87b8_return_output := result.is_vram_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l88_c22_2fd1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l88_c22_2fd1_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_2fd1_left;
     BIN_OP_PLUS_uxn_opcodes_h_l88_c22_2fd1_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_2fd1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_2fd1_return_output := BIN_OP_PLUS_uxn_opcodes_h_l88_c22_2fd1_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l90_l96_DUPLICATE_adcb LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l90_l96_DUPLICATE_adcb_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l90_c11_627b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_627b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_627b_left;
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_627b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_627b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_627b_return_output := BIN_OP_EQ_uxn_opcodes_h_l90_c11_627b_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_87b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_ce76_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_87b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_ce76_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_87b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_ce76_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_87b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_ce76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_87b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_ce76_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_87b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_ce76_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_87b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_ce76_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_87b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_ce76_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_87b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_ce76_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_87b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_ce76_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_87b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_ce76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_52b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_f409_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_52b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_f409_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_52b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_f409_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_52b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_f409_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_52b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_f409_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_52b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_f409_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_52b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_f409_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_6b26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_627b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_6b26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_627b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_6b26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_627b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_6b26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_627b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_6b26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_627b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_6b26_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_627b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cff3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_2889_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cff3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_2889_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_cff3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_2889_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_cff3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_2889_return_output;
     VAR_MUX_uxn_opcodes_h_l99_c22_1503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_0008_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l88_c3_99a1 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_2fd1_return_output, 16);
     VAR_MUX_uxn_opcodes_h_l99_c22_1503_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_0370_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_9884_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l97_l92_DUPLICATE_70c2_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_61d8_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l97_l92_DUPLICATE_70c2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_6b26_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l90_l96_DUPLICATE_adcb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_cff3_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l90_l96_DUPLICATE_adcb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_52b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_d7db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_6b26_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_d7db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cff3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_d7db_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_52b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_d109_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_6b26_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_d109_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cff3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l90_l96_l85_DUPLICATE_d109_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l71_c2_87b8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l71_c2_87b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l71_c2_87b8_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l71_c2_87b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_6b26_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l90_c7_6b26_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_52b5_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l85_c7_52b5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_52b5_iftrue := VAR_result_u16_value_uxn_opcodes_h_l88_c3_99a1;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l96_c7_cff3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cff3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cff3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cff3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cff3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cff3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cff3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cff3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cff3_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l97_c3_9884] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l97_c3_9884_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_9884_left;
     BIN_OP_OR_uxn_opcodes_h_l97_c3_9884_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_9884_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_9884_return_output := BIN_OP_OR_uxn_opcodes_h_l97_c3_9884_return_output;

     -- t8_MUX[uxn_opcodes_h_l90_c7_6b26] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l90_c7_6b26_cond <= VAR_t8_MUX_uxn_opcodes_h_l90_c7_6b26_cond;
     t8_MUX_uxn_opcodes_h_l90_c7_6b26_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l90_c7_6b26_iftrue;
     t8_MUX_uxn_opcodes_h_l90_c7_6b26_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l90_c7_6b26_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_6b26_return_output := t8_MUX_uxn_opcodes_h_l90_c7_6b26_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l71_c2_87b8] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_87b8_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_87b8_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_87b8_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_87b8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l85_c7_52b5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_52b5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_52b5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_52b5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_52b5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_52b5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_52b5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_52b5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_52b5_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l96_c7_cff3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cff3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cff3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cff3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cff3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cff3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cff3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cff3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cff3_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l71_c2_87b8] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_87b8_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_87b8_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_87b8_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_87b8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l71_c2_87b8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_87b8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_87b8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_87b8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_87b8_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l93_c3_61d8] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l93_c3_61d8_x <= VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_61d8_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_61d8_return_output := CONST_SL_8_uxn_opcodes_h_l93_c3_61d8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l90_c7_6b26] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_6b26_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_6b26_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_6b26_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_6b26_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_6b26_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_6b26_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_6b26_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_6b26_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l71_c2_87b8] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_87b8_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_87b8_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_87b8_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_87b8_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_129d_right := VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_9884_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_cff3_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_9884_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_6b26_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_61d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_6b26_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_cff3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_6b26_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_cff3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_52b5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_6b26_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_52b5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_52b5_iffalse := VAR_t8_MUX_uxn_opcodes_h_l90_c7_6b26_return_output;
     -- t8_MUX[uxn_opcodes_h_l85_c7_52b5] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l85_c7_52b5_cond <= VAR_t8_MUX_uxn_opcodes_h_l85_c7_52b5_cond;
     t8_MUX_uxn_opcodes_h_l85_c7_52b5_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l85_c7_52b5_iftrue;
     t8_MUX_uxn_opcodes_h_l85_c7_52b5_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l85_c7_52b5_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_52b5_return_output := t8_MUX_uxn_opcodes_h_l85_c7_52b5_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_6b26] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_6b26_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_6b26_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_6b26_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_6b26_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_6b26_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_6b26_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_6b26_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_6b26_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_129d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_129d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_129d_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_129d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_129d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_129d_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c42_129d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l85_c7_52b5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_52b5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_52b5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_52b5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_52b5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_52b5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_52b5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_52b5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_52b5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l71_c2_87b8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_87b8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_87b8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_87b8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_87b8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_6b26] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_6b26_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_6b26_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_6b26_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_6b26_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_6b26_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_6b26_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_6b26_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_6b26_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l96_c7_cff3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l96_c7_cff3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_cff3_cond;
     tmp16_MUX_uxn_opcodes_h_l96_c7_cff3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_cff3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l96_c7_cff3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_cff3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_cff3_return_output := tmp16_MUX_uxn_opcodes_h_l96_c7_cff3_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2b9e_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_129d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_52b5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_6b26_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_52b5_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_6b26_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_52b5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse := VAR_t8_MUX_uxn_opcodes_h_l85_c7_52b5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_6b26_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_cff3_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_2b9e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2b9e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2b9e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2b9e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2b9e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2b9e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2b9e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l85_c7_52b5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_52b5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_52b5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_52b5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_52b5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_52b5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_52b5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_52b5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_52b5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l71_c2_87b8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_87b8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_87b8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_87b8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_87b8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l85_c7_52b5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_52b5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_52b5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_52b5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_52b5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_52b5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_52b5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_52b5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_52b5_return_output;

     -- t8_MUX[uxn_opcodes_h_l71_c2_87b8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l71_c2_87b8_cond <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_87b8_cond;
     t8_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue;
     t8_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_87b8_return_output := t8_MUX_uxn_opcodes_h_l71_c2_87b8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l90_c7_6b26] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l90_c7_6b26_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_6b26_cond;
     tmp16_MUX_uxn_opcodes_h_l90_c7_6b26_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_6b26_iftrue;
     tmp16_MUX_uxn_opcodes_h_l90_c7_6b26_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_6b26_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_6b26_return_output := tmp16_MUX_uxn_opcodes_h_l90_c7_6b26_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_opcodes_h_l99_c22_1503_iffalse := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_2b9e_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_52b5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_52b5_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l71_c2_87b8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_52b5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_6b26_return_output;
     -- MUX[uxn_opcodes_h_l99_c22_1503] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l99_c22_1503_cond <= VAR_MUX_uxn_opcodes_h_l99_c22_1503_cond;
     MUX_uxn_opcodes_h_l99_c22_1503_iftrue <= VAR_MUX_uxn_opcodes_h_l99_c22_1503_iftrue;
     MUX_uxn_opcodes_h_l99_c22_1503_iffalse <= VAR_MUX_uxn_opcodes_h_l99_c22_1503_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l99_c22_1503_return_output := MUX_uxn_opcodes_h_l99_c22_1503_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l71_c2_87b8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_87b8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_87b8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_87b8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_87b8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l85_c7_52b5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l85_c7_52b5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_52b5_cond;
     tmp16_MUX_uxn_opcodes_h_l85_c7_52b5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_52b5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l85_c7_52b5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_52b5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_52b5_return_output := tmp16_MUX_uxn_opcodes_h_l85_c7_52b5_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l71_c2_87b8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_87b8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_87b8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_87b8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_87b8_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_cff3_iftrue := VAR_MUX_uxn_opcodes_h_l99_c22_1503_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_52b5_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l96_c7_cff3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l96_c7_cff3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_cff3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l96_c7_cff3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_cff3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l96_c7_cff3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_cff3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_cff3_return_output := result_u16_value_MUX_uxn_opcodes_h_l96_c7_cff3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l71_c2_87b8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l71_c2_87b8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_87b8_cond;
     tmp16_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_87b8_return_output := tmp16_MUX_uxn_opcodes_h_l71_c2_87b8_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_6b26_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_cff3_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_87b8_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l90_c7_6b26] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_6b26_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_6b26_cond;
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_6b26_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_6b26_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_6b26_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_6b26_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_6b26_return_output := result_u16_value_MUX_uxn_opcodes_h_l90_c7_6b26_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_52b5_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_6b26_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l85_c7_52b5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_52b5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_52b5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_52b5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_52b5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_52b5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_52b5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_52b5_return_output := result_u16_value_MUX_uxn_opcodes_h_l85_c7_52b5_return_output;

     -- Submodule level 8
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_52b5_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l71_c2_87b8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_87b8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_87b8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_87b8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_87b8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_87b8_return_output := result_u16_value_MUX_uxn_opcodes_h_l71_c2_87b8_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6063_uxn_opcodes_h_l66_l103_DUPLICATE_6171 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6063_uxn_opcodes_h_l66_l103_DUPLICATE_6171_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6063(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_87b8_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_87b8_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_87b8_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_87b8_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_87b8_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_87b8_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_87b8_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_87b8_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_87b8_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6063_uxn_opcodes_h_l66_l103_DUPLICATE_6171_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6063_uxn_opcodes_h_l66_l103_DUPLICATE_6171_return_output;
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
