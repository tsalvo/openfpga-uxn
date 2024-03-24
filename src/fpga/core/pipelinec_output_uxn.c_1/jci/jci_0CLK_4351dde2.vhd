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
-- BIN_OP_EQ[uxn_opcodes_h_l71_c6_c4c2]
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_c4c2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_c4c2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_c4c2_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l71_c2_0626]
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_0626_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_0626_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_0626_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_0626_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l71_c2_0626]
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0626_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0626_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0626_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0626_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l71_c2_0626]
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0626_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0626_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0626_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0626_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l71_c2_0626]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0626_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0626_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0626_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0626_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l71_c2_0626]
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0626_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0626_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0626_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0626_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l71_c2_0626]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0626_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0626_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0626_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0626_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l71_c2_0626]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0626_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0626_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0626_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0626_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l71_c2_0626]
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0626_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0626_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0626_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0626_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l71_c2_0626]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0626_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0626_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0626_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0626_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l71_c2_0626]
signal tmp16_MUX_uxn_opcodes_h_l71_c2_0626_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_0626_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_0626_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_0626_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l71_c2_0626]
signal t8_MUX_uxn_opcodes_h_l71_c2_0626_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_0626_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_0626_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_0626_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l85_c11_080c]
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_080c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_080c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_080c_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l85_c7_c7d1]
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_c7d1_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_c7d1_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_c7d1_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l85_c7_c7d1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c7d1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c7d1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c7d1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l85_c7_c7d1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c7d1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c7d1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c7d1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l85_c7_c7d1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c7d1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c7d1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c7d1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l85_c7_c7d1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c7d1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c7d1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c7d1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l85_c7_c7d1]
signal tmp16_MUX_uxn_opcodes_h_l85_c7_c7d1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_c7d1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_c7d1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l85_c7_c7d1]
signal t8_MUX_uxn_opcodes_h_l85_c7_c7d1_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l85_c7_c7d1_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l85_c7_c7d1_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l88_c22_3cfe]
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_3cfe_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_3cfe_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_3cfe_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l90_c11_368c]
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_368c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_368c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_368c_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l90_c7_c8ed]
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_c8ed_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_c8ed_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_c8ed_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_c8ed_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_c8ed]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_c8ed_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_c8ed_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_c8ed_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_c8ed_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l90_c7_c8ed]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_c8ed_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_c8ed_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_c8ed_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_c8ed_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_c8ed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_c8ed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_c8ed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_c8ed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_c8ed_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l90_c7_c8ed]
signal tmp16_MUX_uxn_opcodes_h_l90_c7_c8ed_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_c8ed_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_c8ed_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_c8ed_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l90_c7_c8ed]
signal t8_MUX_uxn_opcodes_h_l90_c7_c8ed_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l90_c7_c8ed_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l90_c7_c8ed_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l90_c7_c8ed_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l93_c3_2941]
signal CONST_SL_8_uxn_opcodes_h_l93_c3_2941_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l93_c3_2941_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l96_c11_1030]
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_1030_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_1030_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_1030_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l96_c7_395f]
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_395f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_395f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_395f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_395f_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l96_c7_395f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_395f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_395f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_395f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_395f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l96_c7_395f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_395f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_395f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_395f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_395f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l96_c7_395f]
signal tmp16_MUX_uxn_opcodes_h_l96_c7_395f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_395f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_395f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_395f_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l97_c3_7ccd]
signal BIN_OP_OR_uxn_opcodes_h_l97_c3_7ccd_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l97_c3_7ccd_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l97_c3_7ccd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l99_c22_8f10]
signal BIN_OP_EQ_uxn_opcodes_h_l99_c22_8f10_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c22_8f10_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c22_8f10_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c32_6f79]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c32_6f79_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c32_6f79_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c32_6f79_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_5080]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_5080_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_5080_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_5080_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_79a6]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_79a6_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_79a6_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_79a6_return_output : unsigned(17 downto 0);

-- MUX[uxn_opcodes_h_l99_c22_6f7e]
signal MUX_uxn_opcodes_h_l99_c22_6f7e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l99_c22_6f7e_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l99_c22_6f7e_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l99_c22_6f7e_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_3dff( ref_toks_0 : opcode_result_t;
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
      base.u16_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_vram_write := ref_toks_8;
      base.is_pc_updated := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l71_c6_c4c2
BIN_OP_EQ_uxn_opcodes_h_l71_c6_c4c2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l71_c6_c4c2_left,
BIN_OP_EQ_uxn_opcodes_h_l71_c6_c4c2_right,
BIN_OP_EQ_uxn_opcodes_h_l71_c6_c4c2_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l71_c2_0626
result_u16_value_MUX_uxn_opcodes_h_l71_c2_0626 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l71_c2_0626_cond,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_0626_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_0626_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_0626_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0626
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0626 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0626_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0626_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0626_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0626_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0626
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0626 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0626_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0626_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0626_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0626_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0626
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0626 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0626_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0626_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0626_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0626_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0626
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0626 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0626_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0626_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0626_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0626_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0626
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0626 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0626_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0626_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0626_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0626_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0626
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0626 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0626_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0626_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0626_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0626_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0626
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0626 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0626_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0626_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0626_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0626_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0626
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0626 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0626_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0626_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0626_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0626_return_output);

-- tmp16_MUX_uxn_opcodes_h_l71_c2_0626
tmp16_MUX_uxn_opcodes_h_l71_c2_0626 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l71_c2_0626_cond,
tmp16_MUX_uxn_opcodes_h_l71_c2_0626_iftrue,
tmp16_MUX_uxn_opcodes_h_l71_c2_0626_iffalse,
tmp16_MUX_uxn_opcodes_h_l71_c2_0626_return_output);

-- t8_MUX_uxn_opcodes_h_l71_c2_0626
t8_MUX_uxn_opcodes_h_l71_c2_0626 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l71_c2_0626_cond,
t8_MUX_uxn_opcodes_h_l71_c2_0626_iftrue,
t8_MUX_uxn_opcodes_h_l71_c2_0626_iffalse,
t8_MUX_uxn_opcodes_h_l71_c2_0626_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l85_c11_080c
BIN_OP_EQ_uxn_opcodes_h_l85_c11_080c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l85_c11_080c_left,
BIN_OP_EQ_uxn_opcodes_h_l85_c11_080c_right,
BIN_OP_EQ_uxn_opcodes_h_l85_c11_080c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l85_c7_c7d1
result_u16_value_MUX_uxn_opcodes_h_l85_c7_c7d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l85_c7_c7d1_cond,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_c7d1_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_c7d1_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c7d1
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c7d1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c7d1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c7d1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c7d1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c7d1
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c7d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c7d1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c7d1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c7d1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c7d1
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c7d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c7d1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c7d1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c7d1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c7d1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c7d1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c7d1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c7d1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c7d1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l85_c7_c7d1
tmp16_MUX_uxn_opcodes_h_l85_c7_c7d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l85_c7_c7d1_cond,
tmp16_MUX_uxn_opcodes_h_l85_c7_c7d1_iftrue,
tmp16_MUX_uxn_opcodes_h_l85_c7_c7d1_iffalse,
tmp16_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output);

-- t8_MUX_uxn_opcodes_h_l85_c7_c7d1
t8_MUX_uxn_opcodes_h_l85_c7_c7d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l85_c7_c7d1_cond,
t8_MUX_uxn_opcodes_h_l85_c7_c7d1_iftrue,
t8_MUX_uxn_opcodes_h_l85_c7_c7d1_iffalse,
t8_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l88_c22_3cfe
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_3cfe : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_3cfe_left,
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_3cfe_right,
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_3cfe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l90_c11_368c
BIN_OP_EQ_uxn_opcodes_h_l90_c11_368c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l90_c11_368c_left,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_368c_right,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_368c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l90_c7_c8ed
result_u16_value_MUX_uxn_opcodes_h_l90_c7_c8ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l90_c7_c8ed_cond,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_c8ed_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_c8ed_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_c8ed_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_c8ed
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_c8ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_c8ed_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_c8ed_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_c8ed_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_c8ed_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_c8ed
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_c8ed : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_c8ed_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_c8ed_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_c8ed_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_c8ed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_c8ed
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_c8ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_c8ed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_c8ed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_c8ed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_c8ed_return_output);

-- tmp16_MUX_uxn_opcodes_h_l90_c7_c8ed
tmp16_MUX_uxn_opcodes_h_l90_c7_c8ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l90_c7_c8ed_cond,
tmp16_MUX_uxn_opcodes_h_l90_c7_c8ed_iftrue,
tmp16_MUX_uxn_opcodes_h_l90_c7_c8ed_iffalse,
tmp16_MUX_uxn_opcodes_h_l90_c7_c8ed_return_output);

-- t8_MUX_uxn_opcodes_h_l90_c7_c8ed
t8_MUX_uxn_opcodes_h_l90_c7_c8ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l90_c7_c8ed_cond,
t8_MUX_uxn_opcodes_h_l90_c7_c8ed_iftrue,
t8_MUX_uxn_opcodes_h_l90_c7_c8ed_iffalse,
t8_MUX_uxn_opcodes_h_l90_c7_c8ed_return_output);

-- CONST_SL_8_uxn_opcodes_h_l93_c3_2941
CONST_SL_8_uxn_opcodes_h_l93_c3_2941 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l93_c3_2941_x,
CONST_SL_8_uxn_opcodes_h_l93_c3_2941_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l96_c11_1030
BIN_OP_EQ_uxn_opcodes_h_l96_c11_1030 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l96_c11_1030_left,
BIN_OP_EQ_uxn_opcodes_h_l96_c11_1030_right,
BIN_OP_EQ_uxn_opcodes_h_l96_c11_1030_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l96_c7_395f
result_u16_value_MUX_uxn_opcodes_h_l96_c7_395f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l96_c7_395f_cond,
result_u16_value_MUX_uxn_opcodes_h_l96_c7_395f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l96_c7_395f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l96_c7_395f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_395f
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_395f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_395f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_395f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_395f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_395f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_395f
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_395f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_395f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_395f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_395f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_395f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l96_c7_395f
tmp16_MUX_uxn_opcodes_h_l96_c7_395f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l96_c7_395f_cond,
tmp16_MUX_uxn_opcodes_h_l96_c7_395f_iftrue,
tmp16_MUX_uxn_opcodes_h_l96_c7_395f_iffalse,
tmp16_MUX_uxn_opcodes_h_l96_c7_395f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l97_c3_7ccd
BIN_OP_OR_uxn_opcodes_h_l97_c3_7ccd : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l97_c3_7ccd_left,
BIN_OP_OR_uxn_opcodes_h_l97_c3_7ccd_right,
BIN_OP_OR_uxn_opcodes_h_l97_c3_7ccd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l99_c22_8f10
BIN_OP_EQ_uxn_opcodes_h_l99_c22_8f10 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l99_c22_8f10_left,
BIN_OP_EQ_uxn_opcodes_h_l99_c22_8f10_right,
BIN_OP_EQ_uxn_opcodes_h_l99_c22_8f10_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c32_6f79
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_6f79 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_6f79_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_6f79_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_6f79_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c42_5080
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_5080 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_5080_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_5080_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_5080_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c42_79a6
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_79a6 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_79a6_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_79a6_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_79a6_return_output);

-- MUX_uxn_opcodes_h_l99_c22_6f7e
MUX_uxn_opcodes_h_l99_c22_6f7e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l99_c22_6f7e_cond,
MUX_uxn_opcodes_h_l99_c22_6f7e_iftrue,
MUX_uxn_opcodes_h_l99_c22_6f7e_iffalse,
MUX_uxn_opcodes_h_l99_c22_6f7e_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l71_c6_c4c2_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l71_c2_0626_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0626_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0626_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0626_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0626_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0626_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0626_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0626_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0626_return_output,
 tmp16_MUX_uxn_opcodes_h_l71_c2_0626_return_output,
 t8_MUX_uxn_opcodes_h_l71_c2_0626_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l85_c11_080c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output,
 tmp16_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output,
 t8_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l88_c22_3cfe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l90_c11_368c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l90_c7_c8ed_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_c8ed_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_c8ed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_c8ed_return_output,
 tmp16_MUX_uxn_opcodes_h_l90_c7_c8ed_return_output,
 t8_MUX_uxn_opcodes_h_l90_c7_c8ed_return_output,
 CONST_SL_8_uxn_opcodes_h_l93_c3_2941_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l96_c11_1030_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l96_c7_395f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_395f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_395f_return_output,
 tmp16_MUX_uxn_opcodes_h_l96_c7_395f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l97_c3_7ccd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l99_c22_8f10_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c32_6f79_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c42_5080_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c42_79a6_return_output,
 MUX_uxn_opcodes_h_l99_c22_6f7e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_c4c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_c4c2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_c4c2_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_0626_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_0626_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_0626_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_0626_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0626_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0626_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0626_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0626_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0626_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0626_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l71_c2_0626_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0626_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0626_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0626_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_68c1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0626_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0626_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0626_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0626_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0626_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l71_c2_0626_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0626_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0626_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0626_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0626_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l71_c2_0626_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0626_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0626_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0626_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l76_c3_407b : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0626_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0626_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0626_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0626_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0626_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l71_c2_0626_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0626_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0626_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0626_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0626_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0626_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0626_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_0626_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_0626_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_0626_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_0626_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_0626_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_0626_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_0626_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_0626_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_080c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_080c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_080c_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_c7d1_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l88_c3_6017 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_c7d1_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_c8ed_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_c7d1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c7d1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l87_c3_4432 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c7d1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_c8ed_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c7d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c7d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c7d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_c8ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c7d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c7d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c7d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_c8ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c7d1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c7d1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l86_c3_4bb6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c7d1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l85_c7_c7d1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c7d1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_c7d1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_c7d1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_c8ed_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_c7d1_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_c7d1_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_c7d1_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_c8ed_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_c7d1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_3cfe_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_3cfe_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_3cfe_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_368c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_368c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_368c_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_c8ed_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_c8ed_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_395f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_c8ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_c8ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_c8ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_395f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_c8ed_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_c8ed_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l94_c3_e0e5 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_c8ed_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l90_c7_c8ed_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_c8ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_c8ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_c8ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_395f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_c8ed_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_c8ed_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_c8ed_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_395f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_c8ed_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_c8ed_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_c8ed_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_c8ed_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_2941_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_2941_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_1030_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_1030_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_1030_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_395f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_395f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_395f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_395f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_395f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_395f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_395f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_395f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_395f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_395f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_395f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_395f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_7ccd_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_7ccd_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_7ccd_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_6f7e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_8f10_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_8f10_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_8f10_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_6f7e_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_6f7e_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_6f79_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_6f79_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_6f79_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_5080_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_5080_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_5080_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_79a6_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_79a6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_79a6_return_output : unsigned(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_6f7e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_b856_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_d8a1_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l92_l97_DUPLICATE_5243_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l96_l90_DUPLICATE_5584_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3dff_uxn_opcodes_h_l103_l66_DUPLICATE_60e6_return_output : opcode_result_t;
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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_79a6_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_68c1 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0626_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_68c1;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l76_c3_407b := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0626_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l76_c3_407b;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_395f_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0626_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_368c_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_395f_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l86_c3_4bb6 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c7d1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l86_c3_4bb6;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0626_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_8f10_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_6f79_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_080c_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0626_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l94_c3_e0e5 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_c8ed_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l94_c3_e0e5;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0626_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_c4c2_right := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0626_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0626_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_1030_right := to_unsigned(3, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_3cfe_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l87_c3_4432 := resize(to_signed(-1, 2), 4);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c7d1_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l87_c3_4432;

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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_3cfe_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_6f79_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_5080_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_0626_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_c4c2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_080c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_368c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_1030_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_c8ed_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_8f10_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_0626_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_c7d1_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_c8ed_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_7ccd_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_0626_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_c7d1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_395f_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l99_c22_8f10] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l99_c22_8f10_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_8f10_left;
     BIN_OP_EQ_uxn_opcodes_h_l99_c22_8f10_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_8f10_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_8f10_return_output := BIN_OP_EQ_uxn_opcodes_h_l99_c22_8f10_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l90_c7_c8ed] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l90_c7_c8ed_return_output := result.sp_relative_shift;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l71_c2_0626] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l71_c2_0626_return_output := result.is_stack_index_flipped;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l71_c2_0626] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l71_c2_0626_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l90_c11_368c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_368c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_368c_left;
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_368c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_368c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_368c_return_output := BIN_OP_EQ_uxn_opcodes_h_l90_c11_368c_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l85_c7_c7d1] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l85_c7_c7d1_return_output := result.stack_address_sp_offset;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l71_c2_0626] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l71_c2_0626_return_output := result.is_vram_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l92_l97_DUPLICATE_5243 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l92_l97_DUPLICATE_5243_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l96_c11_1030] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l96_c11_1030_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_1030_left;
     BIN_OP_EQ_uxn_opcodes_h_l96_c11_1030_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_1030_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_1030_return_output := BIN_OP_EQ_uxn_opcodes_h_l96_c11_1030_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l71_c6_c4c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l71_c6_c4c2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_c4c2_left;
     BIN_OP_EQ_uxn_opcodes_h_l71_c6_c4c2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_c4c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_c4c2_return_output := BIN_OP_EQ_uxn_opcodes_h_l71_c6_c4c2_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l96_l90_DUPLICATE_5584 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l96_l90_DUPLICATE_5584_return_output := result.u16_value;

     -- BIN_OP_PLUS[uxn_opcodes_h_l88_c22_3cfe] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l88_c22_3cfe_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_3cfe_left;
     BIN_OP_PLUS_uxn_opcodes_h_l88_c22_3cfe_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_3cfe_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_3cfe_return_output := BIN_OP_PLUS_uxn_opcodes_h_l88_c22_3cfe_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_d8a1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_d8a1_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_b856 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_b856_return_output := result.is_opc_done;

     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c32_6f79] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c32_6f79_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_6f79_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c32_6f79_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_6f79_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_6f79_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c32_6f79_return_output;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l71_c2_0626] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l71_c2_0626_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l85_c11_080c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l85_c11_080c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_080c_left;
     BIN_OP_EQ_uxn_opcodes_h_l85_c11_080c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_080c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_080c_return_output := BIN_OP_EQ_uxn_opcodes_h_l85_c11_080c_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0626_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_c4c2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0626_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_c4c2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0626_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_c4c2_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0626_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_c4c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0626_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_c4c2_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0626_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_c4c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0626_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_c4c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0626_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_c4c2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_0626_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_c4c2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_0626_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_c4c2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_0626_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_c4c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c7d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_080c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c7d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_080c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c7d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_080c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c7d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_080c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_c7d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_080c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_c7d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_080c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_c7d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_080c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_c8ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_368c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_c8ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_368c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_c8ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_368c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_c8ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_368c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_c8ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_368c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_c8ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_368c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_395f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_1030_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_395f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_1030_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_395f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_1030_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_395f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_1030_return_output;
     VAR_MUX_uxn_opcodes_h_l99_c22_6f7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_8f10_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l88_c3_6017 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_3cfe_return_output, 16);
     VAR_MUX_uxn_opcodes_h_l99_c22_6f7e_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_6f79_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_7ccd_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l92_l97_DUPLICATE_5243_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_2941_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l92_l97_DUPLICATE_5243_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_c8ed_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l96_l90_DUPLICATE_5584_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_395f_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l96_l90_DUPLICATE_5584_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c7d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_b856_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_c8ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_b856_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_395f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_b856_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c7d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_d8a1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_c8ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_d8a1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_395f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l96_l85_l90_DUPLICATE_d8a1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0626_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l71_c2_0626_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0626_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l71_c2_0626_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0626_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l71_c2_0626_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0626_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l71_c2_0626_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_c8ed_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l90_c7_c8ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c7d1_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l85_c7_c7d1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_c7d1_iftrue := VAR_result_u16_value_uxn_opcodes_h_l88_c3_6017;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l71_c2_0626] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0626_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0626_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0626_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0626_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0626_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0626_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0626_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0626_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l85_c7_c7d1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c7d1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c7d1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c7d1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c7d1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c7d1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c7d1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l96_c7_395f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_395f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_395f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_395f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_395f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_395f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_395f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_395f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_395f_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l71_c2_0626] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0626_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0626_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0626_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0626_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0626_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0626_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0626_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0626_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l96_c7_395f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_395f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_395f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_395f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_395f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_395f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_395f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_395f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_395f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l71_c2_0626] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0626_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0626_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0626_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0626_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0626_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0626_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0626_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0626_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l93_c3_2941] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l93_c3_2941_x <= VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_2941_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_2941_return_output := CONST_SL_8_uxn_opcodes_h_l93_c3_2941_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l71_c2_0626] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0626_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0626_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0626_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0626_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0626_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0626_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0626_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0626_return_output;

     -- t8_MUX[uxn_opcodes_h_l90_c7_c8ed] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l90_c7_c8ed_cond <= VAR_t8_MUX_uxn_opcodes_h_l90_c7_c8ed_cond;
     t8_MUX_uxn_opcodes_h_l90_c7_c8ed_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l90_c7_c8ed_iftrue;
     t8_MUX_uxn_opcodes_h_l90_c7_c8ed_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l90_c7_c8ed_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_c8ed_return_output := t8_MUX_uxn_opcodes_h_l90_c7_c8ed_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l97_c3_7ccd] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l97_c3_7ccd_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_7ccd_left;
     BIN_OP_OR_uxn_opcodes_h_l97_c3_7ccd_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_7ccd_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_7ccd_return_output := BIN_OP_OR_uxn_opcodes_h_l97_c3_7ccd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l90_c7_c8ed] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_c8ed_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_c8ed_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_c8ed_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_c8ed_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_c8ed_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_c8ed_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_c8ed_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_c8ed_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_5080_right := VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_7ccd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_395f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_7ccd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_c8ed_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_2941_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_c8ed_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_395f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_c8ed_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_395f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c7d1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_c8ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0626_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_c7d1_iffalse := VAR_t8_MUX_uxn_opcodes_h_l90_c7_c8ed_return_output;
     -- t8_MUX[uxn_opcodes_h_l85_c7_c7d1] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l85_c7_c7d1_cond <= VAR_t8_MUX_uxn_opcodes_h_l85_c7_c7d1_cond;
     t8_MUX_uxn_opcodes_h_l85_c7_c7d1_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l85_c7_c7d1_iftrue;
     t8_MUX_uxn_opcodes_h_l85_c7_c7d1_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l85_c7_c7d1_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output := t8_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_c8ed] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_c8ed_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_c8ed_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_c8ed_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_c8ed_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_c8ed_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_c8ed_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_c8ed_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_c8ed_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_5080] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_5080_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_5080_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_5080_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_5080_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_5080_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c42_5080_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_c8ed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_c8ed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_c8ed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_c8ed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_c8ed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_c8ed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_c8ed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_c8ed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_c8ed_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l85_c7_c7d1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c7d1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c7d1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c7d1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c7d1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c7d1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c7d1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l96_c7_395f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l96_c7_395f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_395f_cond;
     tmp16_MUX_uxn_opcodes_h_l96_c7_395f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_395f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l96_c7_395f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_395f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_395f_return_output := tmp16_MUX_uxn_opcodes_h_l96_c7_395f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l71_c2_0626] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0626_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0626_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0626_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0626_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0626_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0626_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0626_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0626_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_79a6_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_5080_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c7d1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_c8ed_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c7d1_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_c8ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0626_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_0626_iffalse := VAR_t8_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_c8ed_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_395f_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_79a6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_79a6_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_79a6_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_79a6_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_79a6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_79a6_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c42_79a6_return_output;

     -- t8_MUX[uxn_opcodes_h_l71_c2_0626] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l71_c2_0626_cond <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_0626_cond;
     t8_MUX_uxn_opcodes_h_l71_c2_0626_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_0626_iftrue;
     t8_MUX_uxn_opcodes_h_l71_c2_0626_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_0626_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_0626_return_output := t8_MUX_uxn_opcodes_h_l71_c2_0626_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l90_c7_c8ed] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l90_c7_c8ed_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_c8ed_cond;
     tmp16_MUX_uxn_opcodes_h_l90_c7_c8ed_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_c8ed_iftrue;
     tmp16_MUX_uxn_opcodes_h_l90_c7_c8ed_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_c8ed_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_c8ed_return_output := tmp16_MUX_uxn_opcodes_h_l90_c7_c8ed_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l71_c2_0626] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0626_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0626_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0626_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0626_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0626_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0626_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0626_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0626_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l85_c7_c7d1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c7d1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c7d1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c7d1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c7d1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c7d1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c7d1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l85_c7_c7d1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c7d1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c7d1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c7d1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c7d1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c7d1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c7d1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_opcodes_h_l99_c22_6f7e_iffalse := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_79a6_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0626_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0626_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l71_c2_0626_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_c7d1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_c8ed_return_output;
     -- MUX[uxn_opcodes_h_l99_c22_6f7e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l99_c22_6f7e_cond <= VAR_MUX_uxn_opcodes_h_l99_c22_6f7e_cond;
     MUX_uxn_opcodes_h_l99_c22_6f7e_iftrue <= VAR_MUX_uxn_opcodes_h_l99_c22_6f7e_iftrue;
     MUX_uxn_opcodes_h_l99_c22_6f7e_iffalse <= VAR_MUX_uxn_opcodes_h_l99_c22_6f7e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l99_c22_6f7e_return_output := MUX_uxn_opcodes_h_l99_c22_6f7e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l71_c2_0626] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0626_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0626_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0626_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0626_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0626_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0626_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0626_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0626_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l85_c7_c7d1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l85_c7_c7d1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_c7d1_cond;
     tmp16_MUX_uxn_opcodes_h_l85_c7_c7d1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_c7d1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l85_c7_c7d1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_c7d1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output := tmp16_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l71_c2_0626] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0626_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0626_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0626_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0626_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0626_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0626_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0626_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0626_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_395f_iftrue := VAR_MUX_uxn_opcodes_h_l99_c22_6f7e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_0626_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l71_c2_0626] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l71_c2_0626_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_0626_cond;
     tmp16_MUX_uxn_opcodes_h_l71_c2_0626_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_0626_iftrue;
     tmp16_MUX_uxn_opcodes_h_l71_c2_0626_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_0626_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_0626_return_output := tmp16_MUX_uxn_opcodes_h_l71_c2_0626_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l96_c7_395f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l96_c7_395f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_395f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l96_c7_395f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_395f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l96_c7_395f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_395f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_395f_return_output := result_u16_value_MUX_uxn_opcodes_h_l96_c7_395f_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_c8ed_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_395f_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_0626_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l90_c7_c8ed] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_c8ed_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_c8ed_cond;
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_c8ed_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_c8ed_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_c8ed_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_c8ed_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_c8ed_return_output := result_u16_value_MUX_uxn_opcodes_h_l90_c7_c8ed_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_c7d1_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_c8ed_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l85_c7_c7d1] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_c7d1_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_c7d1_cond;
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_c7d1_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_c7d1_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_c7d1_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_c7d1_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output := result_u16_value_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output;

     -- Submodule level 8
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_0626_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_c7d1_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l71_c2_0626] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_0626_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_0626_cond;
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_0626_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_0626_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_0626_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_0626_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_0626_return_output := result_u16_value_MUX_uxn_opcodes_h_l71_c2_0626_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3dff_uxn_opcodes_h_l103_l66_DUPLICATE_60e6 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3dff_uxn_opcodes_h_l103_l66_DUPLICATE_60e6_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3dff(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_0626_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_0626_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_0626_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_0626_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_0626_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_0626_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_0626_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_0626_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_0626_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3dff_uxn_opcodes_h_l103_l66_DUPLICATE_60e6_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3dff_uxn_opcodes_h_l103_l66_DUPLICATE_60e6_return_output;
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
