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
-- BIN_OP_EQ[uxn_opcodes_h_l71_c6_1ea7]
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_1ea7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_1ea7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_1ea7_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l71_c2_b30e]
signal t8_MUX_uxn_opcodes_h_l71_c2_b30e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_b30e_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l71_c2_b30e]
signal tmp16_MUX_uxn_opcodes_h_l71_c2_b30e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_b30e_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l71_c2_b30e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_b30e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_b30e_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l71_c2_b30e]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_b30e_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_b30e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l71_c2_b30e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_b30e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_b30e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l71_c2_b30e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_b30e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_b30e_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l71_c2_b30e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_b30e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_b30e_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l71_c2_b30e]
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_b30e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_b30e_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l71_c2_b30e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_b30e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_b30e_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l71_c2_b30e]
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_b30e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_b30e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l71_c2_b30e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_b30e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_b30e_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l85_c11_8a97]
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_8a97_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_8a97_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_8a97_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l85_c7_49cd]
signal t8_MUX_uxn_opcodes_h_l85_c7_49cd_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l85_c7_49cd_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l85_c7_49cd_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l85_c7_49cd_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l85_c7_49cd]
signal tmp16_MUX_uxn_opcodes_h_l85_c7_49cd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_49cd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_49cd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_49cd_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l85_c7_49cd]
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_49cd_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_49cd_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_49cd_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_49cd_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l85_c7_49cd]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_49cd_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_49cd_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_49cd_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_49cd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l85_c7_49cd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_49cd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_49cd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_49cd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_49cd_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l85_c7_49cd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_49cd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_49cd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_49cd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_49cd_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l85_c7_49cd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_49cd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_49cd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_49cd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_49cd_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l88_c22_796f]
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_796f_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_796f_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l88_c22_796f_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l90_c11_5a13]
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_5a13_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_5a13_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l90_c11_5a13_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l90_c7_661b]
signal t8_MUX_uxn_opcodes_h_l90_c7_661b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l90_c7_661b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l90_c7_661b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l90_c7_661b_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l90_c7_661b]
signal tmp16_MUX_uxn_opcodes_h_l90_c7_661b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_661b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_661b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l90_c7_661b_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l90_c7_661b]
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_661b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_661b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_661b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l90_c7_661b_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l90_c7_661b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_661b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_661b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_661b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_661b_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_661b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_661b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_661b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_661b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_661b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_661b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_661b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_661b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_661b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_661b_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l93_c3_433e]
signal CONST_SL_8_uxn_opcodes_h_l93_c3_433e_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l93_c3_433e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l96_c11_1153]
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_1153_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_1153_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_1153_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l96_c7_5662]
signal tmp16_MUX_uxn_opcodes_h_l96_c7_5662_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_5662_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_5662_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l96_c7_5662_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l96_c7_5662]
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_5662_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_5662_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_5662_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l96_c7_5662_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l96_c7_5662]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_5662_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_5662_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_5662_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_5662_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l96_c7_5662]
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_5662_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_5662_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_5662_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_5662_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l97_c3_ebdf]
signal BIN_OP_OR_uxn_opcodes_h_l97_c3_ebdf_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l97_c3_ebdf_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l97_c3_ebdf_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l99_c22_40df]
signal BIN_OP_EQ_uxn_opcodes_h_l99_c22_40df_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c22_40df_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l99_c22_40df_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c32_13c1]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c32_13c1_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c32_13c1_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c32_13c1_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_d754]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_d754_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_d754_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_d754_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_9763]
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_9763_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_9763_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l99_c42_9763_return_output : unsigned(17 downto 0);

-- MUX[uxn_opcodes_h_l99_c22_5392]
signal MUX_uxn_opcodes_h_l99_c22_5392_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l99_c22_5392_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l99_c22_5392_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l99_c22_5392_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_8098( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_pc_updated := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.u16_value := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.is_vram_write := ref_toks_8;
      base.sp_relative_shift := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l71_c6_1ea7
BIN_OP_EQ_uxn_opcodes_h_l71_c6_1ea7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l71_c6_1ea7_left,
BIN_OP_EQ_uxn_opcodes_h_l71_c6_1ea7_right,
BIN_OP_EQ_uxn_opcodes_h_l71_c6_1ea7_return_output);

-- t8_MUX_uxn_opcodes_h_l71_c2_b30e
t8_MUX_uxn_opcodes_h_l71_c2_b30e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l71_c2_b30e_cond,
t8_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue,
t8_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse,
t8_MUX_uxn_opcodes_h_l71_c2_b30e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l71_c2_b30e
tmp16_MUX_uxn_opcodes_h_l71_c2_b30e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l71_c2_b30e_cond,
tmp16_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue,
tmp16_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse,
tmp16_MUX_uxn_opcodes_h_l71_c2_b30e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_b30e
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_b30e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_b30e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_b30e_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_b30e
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_b30e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_b30e_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_b30e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_b30e
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_b30e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_b30e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_b30e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_b30e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_b30e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_b30e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_b30e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_b30e
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_b30e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_b30e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_b30e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l71_c2_b30e
result_u16_value_MUX_uxn_opcodes_h_l71_c2_b30e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l71_c2_b30e_cond,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_b30e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_b30e
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_b30e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_b30e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_b30e_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_b30e
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_b30e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_b30e_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_b30e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_b30e
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_b30e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_b30e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_b30e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l85_c11_8a97
BIN_OP_EQ_uxn_opcodes_h_l85_c11_8a97 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l85_c11_8a97_left,
BIN_OP_EQ_uxn_opcodes_h_l85_c11_8a97_right,
BIN_OP_EQ_uxn_opcodes_h_l85_c11_8a97_return_output);

-- t8_MUX_uxn_opcodes_h_l85_c7_49cd
t8_MUX_uxn_opcodes_h_l85_c7_49cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l85_c7_49cd_cond,
t8_MUX_uxn_opcodes_h_l85_c7_49cd_iftrue,
t8_MUX_uxn_opcodes_h_l85_c7_49cd_iffalse,
t8_MUX_uxn_opcodes_h_l85_c7_49cd_return_output);

-- tmp16_MUX_uxn_opcodes_h_l85_c7_49cd
tmp16_MUX_uxn_opcodes_h_l85_c7_49cd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l85_c7_49cd_cond,
tmp16_MUX_uxn_opcodes_h_l85_c7_49cd_iftrue,
tmp16_MUX_uxn_opcodes_h_l85_c7_49cd_iffalse,
tmp16_MUX_uxn_opcodes_h_l85_c7_49cd_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l85_c7_49cd
result_u16_value_MUX_uxn_opcodes_h_l85_c7_49cd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l85_c7_49cd_cond,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_49cd_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_49cd_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_49cd_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_49cd
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_49cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_49cd_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_49cd_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_49cd_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_49cd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_49cd
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_49cd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_49cd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_49cd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_49cd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_49cd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_49cd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_49cd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_49cd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_49cd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_49cd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_49cd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_49cd
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_49cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_49cd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_49cd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_49cd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_49cd_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l88_c22_796f
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_796f : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_796f_left,
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_796f_right,
BIN_OP_PLUS_uxn_opcodes_h_l88_c22_796f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l90_c11_5a13
BIN_OP_EQ_uxn_opcodes_h_l90_c11_5a13 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l90_c11_5a13_left,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_5a13_right,
BIN_OP_EQ_uxn_opcodes_h_l90_c11_5a13_return_output);

-- t8_MUX_uxn_opcodes_h_l90_c7_661b
t8_MUX_uxn_opcodes_h_l90_c7_661b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l90_c7_661b_cond,
t8_MUX_uxn_opcodes_h_l90_c7_661b_iftrue,
t8_MUX_uxn_opcodes_h_l90_c7_661b_iffalse,
t8_MUX_uxn_opcodes_h_l90_c7_661b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l90_c7_661b
tmp16_MUX_uxn_opcodes_h_l90_c7_661b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l90_c7_661b_cond,
tmp16_MUX_uxn_opcodes_h_l90_c7_661b_iftrue,
tmp16_MUX_uxn_opcodes_h_l90_c7_661b_iffalse,
tmp16_MUX_uxn_opcodes_h_l90_c7_661b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l90_c7_661b
result_u16_value_MUX_uxn_opcodes_h_l90_c7_661b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l90_c7_661b_cond,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_661b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_661b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l90_c7_661b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_661b
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_661b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_661b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_661b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_661b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_661b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_661b
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_661b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_661b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_661b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_661b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_661b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_661b
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_661b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_661b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_661b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_661b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_661b_return_output);

-- CONST_SL_8_uxn_opcodes_h_l93_c3_433e
CONST_SL_8_uxn_opcodes_h_l93_c3_433e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l93_c3_433e_x,
CONST_SL_8_uxn_opcodes_h_l93_c3_433e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l96_c11_1153
BIN_OP_EQ_uxn_opcodes_h_l96_c11_1153 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l96_c11_1153_left,
BIN_OP_EQ_uxn_opcodes_h_l96_c11_1153_right,
BIN_OP_EQ_uxn_opcodes_h_l96_c11_1153_return_output);

-- tmp16_MUX_uxn_opcodes_h_l96_c7_5662
tmp16_MUX_uxn_opcodes_h_l96_c7_5662 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l96_c7_5662_cond,
tmp16_MUX_uxn_opcodes_h_l96_c7_5662_iftrue,
tmp16_MUX_uxn_opcodes_h_l96_c7_5662_iffalse,
tmp16_MUX_uxn_opcodes_h_l96_c7_5662_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l96_c7_5662
result_u16_value_MUX_uxn_opcodes_h_l96_c7_5662 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l96_c7_5662_cond,
result_u16_value_MUX_uxn_opcodes_h_l96_c7_5662_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l96_c7_5662_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l96_c7_5662_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_5662
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_5662 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_5662_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_5662_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_5662_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_5662_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_5662
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_5662 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_5662_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_5662_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_5662_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_5662_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l97_c3_ebdf
BIN_OP_OR_uxn_opcodes_h_l97_c3_ebdf : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l97_c3_ebdf_left,
BIN_OP_OR_uxn_opcodes_h_l97_c3_ebdf_right,
BIN_OP_OR_uxn_opcodes_h_l97_c3_ebdf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l99_c22_40df
BIN_OP_EQ_uxn_opcodes_h_l99_c22_40df : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l99_c22_40df_left,
BIN_OP_EQ_uxn_opcodes_h_l99_c22_40df_right,
BIN_OP_EQ_uxn_opcodes_h_l99_c22_40df_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c32_13c1
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_13c1 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_13c1_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_13c1_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c32_13c1_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c42_d754
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_d754 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_d754_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_d754_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_d754_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l99_c42_9763
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_9763 : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_9763_left,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_9763_right,
BIN_OP_PLUS_uxn_opcodes_h_l99_c42_9763_return_output);

-- MUX_uxn_opcodes_h_l99_c22_5392
MUX_uxn_opcodes_h_l99_c22_5392 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l99_c22_5392_cond,
MUX_uxn_opcodes_h_l99_c22_5392_iftrue,
MUX_uxn_opcodes_h_l99_c22_5392_iffalse,
MUX_uxn_opcodes_h_l99_c22_5392_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l71_c6_1ea7_return_output,
 t8_MUX_uxn_opcodes_h_l71_c2_b30e_return_output,
 tmp16_MUX_uxn_opcodes_h_l71_c2_b30e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_b30e_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_b30e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_b30e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_b30e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_b30e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l71_c2_b30e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_b30e_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_b30e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_b30e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l85_c11_8a97_return_output,
 t8_MUX_uxn_opcodes_h_l85_c7_49cd_return_output,
 tmp16_MUX_uxn_opcodes_h_l85_c7_49cd_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l85_c7_49cd_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_49cd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_49cd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_49cd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_49cd_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l88_c22_796f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l90_c11_5a13_return_output,
 t8_MUX_uxn_opcodes_h_l90_c7_661b_return_output,
 tmp16_MUX_uxn_opcodes_h_l90_c7_661b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l90_c7_661b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_661b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_661b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_661b_return_output,
 CONST_SL_8_uxn_opcodes_h_l93_c3_433e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l96_c11_1153_return_output,
 tmp16_MUX_uxn_opcodes_h_l96_c7_5662_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l96_c7_5662_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_5662_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_5662_return_output,
 BIN_OP_OR_uxn_opcodes_h_l97_c3_ebdf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l99_c22_40df_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c32_13c1_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c42_d754_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l99_c42_9763_return_output,
 MUX_uxn_opcodes_h_l99_c22_5392_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_1ea7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_1ea7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_1ea7_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_49cd_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_b30e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_b30e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_49cd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_b30e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_b30e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_49cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_b30e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_b30e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l71_c2_b30e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_b30e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_b30e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l71_c2_b30e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_b30e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_b30e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_86d0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_49cd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_b30e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_b30e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_49cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_b30e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_b30e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_49cd_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_b30e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_b30e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l71_c2_b30e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_b30e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_b30e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l71_c2_b30e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_b30e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_b30e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l76_c3_2308 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_49cd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_b30e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_b30e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_8a97_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_8a97_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_8a97_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_49cd_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_49cd_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_661b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_49cd_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_49cd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_49cd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_661b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_49cd_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_49cd_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l88_c3_9aee : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_49cd_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_661b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_49cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_49cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_49cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_661b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_49cd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_49cd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l87_c3_62f8 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_49cd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_661b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_49cd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_49cd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l86_c3_5874 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_49cd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l85_c7_49cd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_49cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_49cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_49cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_661b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_49cd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_796f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_796f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_796f_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_5a13_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_5a13_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_5a13_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_661b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_661b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l90_c7_661b_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_661b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_661b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_5662_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_661b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_661b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_661b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_5662_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_661b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_661b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l94_c3_d386 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_661b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l90_c7_661b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_661b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_661b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_661b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_5662_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_661b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_661b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_661b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_5662_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_661b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_433e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_433e_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_1153_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_1153_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_1153_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_5662_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_5662_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_5662_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_5662_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_5662_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_5662_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_5662_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_5662_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_5662_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_5662_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_5662_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_5662_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_ebdf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_ebdf_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_ebdf_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_5392_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_40df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_40df_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_40df_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_5392_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_5392_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_13c1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_13c1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_13c1_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_d754_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_d754_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_d754_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_9763_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_9763_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_9763_return_output : unsigned(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l99_c22_5392_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l85_l96_l90_DUPLICATE_06d0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l85_l96_l90_DUPLICATE_217f_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l97_l92_DUPLICATE_45a5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l96_l90_DUPLICATE_4cb5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8098_uxn_opcodes_h_l103_l66_DUPLICATE_86c7_return_output : opcode_result_t;
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
     VAR_result_sp_relative_shift_uxn_opcodes_h_l76_c3_2308 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l76_c3_2308;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_13c1_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_9763_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_8a97_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_86d0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l81_c3_86d0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_40df_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_5a13_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_5662_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l94_c3_d386 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_661b_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l94_c3_d386;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_796f_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l87_c3_62f8 := resize(to_signed(-1, 2), 4);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_49cd_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l87_c3_62f8;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_1ea7_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l86_c3_5874 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_49cd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l86_c3_5874;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_1153_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_5662_iftrue := to_unsigned(1, 1);

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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_796f_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_13c1_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_d754_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_1ea7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_8a97_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_5a13_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_1153_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_661b_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_40df_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_49cd_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_661b_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_ebdf_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_49cd_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_5662_iffalse := tmp16;
     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l96_l90_DUPLICATE_4cb5 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l96_l90_DUPLICATE_4cb5_return_output := result.u16_value;

     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c32_13c1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c32_13c1_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_13c1_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c32_13c1_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_13c1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_13c1_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c32_13c1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l85_c11_8a97] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l85_c11_8a97_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_8a97_left;
     BIN_OP_EQ_uxn_opcodes_h_l85_c11_8a97_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_8a97_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_8a97_return_output := BIN_OP_EQ_uxn_opcodes_h_l85_c11_8a97_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l85_l96_l90_DUPLICATE_06d0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l85_l96_l90_DUPLICATE_06d0_return_output := result.is_pc_updated;

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l71_c2_b30e] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l71_c2_b30e_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l97_l92_DUPLICATE_45a5 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l97_l92_DUPLICATE_45a5_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l96_c11_1153] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l96_c11_1153_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_1153_left;
     BIN_OP_EQ_uxn_opcodes_h_l96_c11_1153_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_1153_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_1153_return_output := BIN_OP_EQ_uxn_opcodes_h_l96_c11_1153_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l88_c22_796f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l88_c22_796f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_796f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l88_c22_796f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_796f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_796f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l88_c22_796f_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l90_c7_661b] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l90_c7_661b_return_output := result.sp_relative_shift;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l71_c2_b30e] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l71_c2_b30e_return_output := result.is_vram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l71_c2_b30e] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l71_c2_b30e_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l90_c11_5a13] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_5a13_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_5a13_left;
     BIN_OP_EQ_uxn_opcodes_h_l90_c11_5a13_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_5a13_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_5a13_return_output := BIN_OP_EQ_uxn_opcodes_h_l90_c11_5a13_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l71_c6_1ea7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l71_c6_1ea7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_1ea7_left;
     BIN_OP_EQ_uxn_opcodes_h_l71_c6_1ea7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_1ea7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_1ea7_return_output := BIN_OP_EQ_uxn_opcodes_h_l71_c6_1ea7_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l71_c2_b30e] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l71_c2_b30e_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l85_l96_l90_DUPLICATE_217f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l85_l96_l90_DUPLICATE_217f_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l99_c22_40df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l99_c22_40df_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_40df_left;
     BIN_OP_EQ_uxn_opcodes_h_l99_c22_40df_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_40df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_40df_return_output := BIN_OP_EQ_uxn_opcodes_h_l99_c22_40df_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l85_c7_49cd] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l85_c7_49cd_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_b30e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_1ea7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_b30e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_1ea7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_b30e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_1ea7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_b30e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_1ea7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_b30e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_1ea7_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_b30e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_1ea7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_b30e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_1ea7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_b30e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_1ea7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_b30e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_1ea7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_b30e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_1ea7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_b30e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_1ea7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_49cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_8a97_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_49cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_8a97_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_49cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_8a97_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_49cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_8a97_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_49cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_8a97_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_49cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_8a97_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_49cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_8a97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_661b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_5a13_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_661b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_5a13_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_661b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_5a13_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_661b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_5a13_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_661b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_5a13_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_661b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l90_c11_5a13_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_5662_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_1153_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_5662_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_1153_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_5662_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_1153_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_5662_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_1153_return_output;
     VAR_MUX_uxn_opcodes_h_l99_c22_5392_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l99_c22_40df_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l88_c3_9aee := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l88_c22_796f_return_output, 16);
     VAR_MUX_uxn_opcodes_h_l99_c22_5392_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c32_13c1_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_ebdf_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l97_l92_DUPLICATE_45a5_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_433e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l97_l92_DUPLICATE_45a5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_661b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l96_l90_DUPLICATE_4cb5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_5662_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l96_l90_DUPLICATE_4cb5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_49cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l85_l96_l90_DUPLICATE_217f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_661b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l85_l96_l90_DUPLICATE_217f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_5662_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l85_l96_l90_DUPLICATE_217f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_49cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l85_l96_l90_DUPLICATE_06d0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_661b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l85_l96_l90_DUPLICATE_06d0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_5662_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l85_l96_l90_DUPLICATE_06d0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l71_c2_b30e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l71_c2_b30e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l71_c2_b30e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l71_c2_b30e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_661b_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l90_c7_661b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_49cd_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l85_c7_49cd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_49cd_iftrue := VAR_result_u16_value_uxn_opcodes_h_l88_c3_9aee;
     -- t8_MUX[uxn_opcodes_h_l90_c7_661b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l90_c7_661b_cond <= VAR_t8_MUX_uxn_opcodes_h_l90_c7_661b_cond;
     t8_MUX_uxn_opcodes_h_l90_c7_661b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l90_c7_661b_iftrue;
     t8_MUX_uxn_opcodes_h_l90_c7_661b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l90_c7_661b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l90_c7_661b_return_output := t8_MUX_uxn_opcodes_h_l90_c7_661b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l85_c7_49cd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_49cd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_49cd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_49cd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_49cd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_49cd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_49cd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_49cd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_49cd_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l71_c2_b30e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_b30e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_b30e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_b30e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_b30e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l90_c7_661b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_661b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_661b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_661b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_661b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_661b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_661b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_661b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_661b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l96_c7_5662] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_5662_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_5662_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_5662_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_5662_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_5662_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_5662_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_5662_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_5662_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l97_c3_ebdf] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l97_c3_ebdf_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_ebdf_left;
     BIN_OP_OR_uxn_opcodes_h_l97_c3_ebdf_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_ebdf_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_ebdf_return_output := BIN_OP_OR_uxn_opcodes_h_l97_c3_ebdf_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l71_c2_b30e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_b30e_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_b30e_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_b30e_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_b30e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l96_c7_5662] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_5662_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_5662_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_5662_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_5662_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_5662_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_5662_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_5662_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_5662_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l71_c2_b30e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_b30e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_b30e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_b30e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_b30e_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l71_c2_b30e] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_b30e_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_b30e_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_b30e_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_b30e_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l93_c3_433e] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l93_c3_433e_x <= VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_433e_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_433e_return_output := CONST_SL_8_uxn_opcodes_h_l93_c3_433e_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_d754_right := VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_ebdf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_5662_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l97_c3_ebdf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_661b_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l93_c3_433e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_661b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_5662_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_661b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_5662_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_49cd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l90_c7_661b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l85_c7_49cd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_49cd_iffalse := VAR_t8_MUX_uxn_opcodes_h_l90_c7_661b_return_output;
     -- t8_MUX[uxn_opcodes_h_l85_c7_49cd] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l85_c7_49cd_cond <= VAR_t8_MUX_uxn_opcodes_h_l85_c7_49cd_cond;
     t8_MUX_uxn_opcodes_h_l85_c7_49cd_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l85_c7_49cd_iftrue;
     t8_MUX_uxn_opcodes_h_l85_c7_49cd_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l85_c7_49cd_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_49cd_return_output := t8_MUX_uxn_opcodes_h_l85_c7_49cd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l85_c7_49cd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_49cd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_49cd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_49cd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_49cd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_49cd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_49cd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_49cd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_49cd_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l90_c7_661b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_661b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_661b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_661b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_661b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_661b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_661b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_661b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_661b_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_d754] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_d754_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_d754_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_d754_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_d754_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_d754_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c42_d754_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l96_c7_5662] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l96_c7_5662_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_5662_cond;
     tmp16_MUX_uxn_opcodes_h_l96_c7_5662_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_5662_iftrue;
     tmp16_MUX_uxn_opcodes_h_l96_c7_5662_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_5662_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_5662_return_output := tmp16_MUX_uxn_opcodes_h_l96_c7_5662_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l71_c2_b30e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_b30e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_b30e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_b30e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_b30e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l90_c7_661b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_661b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_661b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_661b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_661b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_661b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_661b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_661b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_661b_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_9763_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_d754_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_49cd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l90_c7_661b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_49cd_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l90_c7_661b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_49cd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse := VAR_t8_MUX_uxn_opcodes_h_l85_c7_49cd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_661b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l96_c7_5662_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l71_c2_b30e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_b30e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_b30e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_b30e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_b30e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l90_c7_661b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l90_c7_661b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_661b_cond;
     tmp16_MUX_uxn_opcodes_h_l90_c7_661b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_661b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l90_c7_661b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_661b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_661b_return_output := tmp16_MUX_uxn_opcodes_h_l90_c7_661b_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l99_c42_9763] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_9763_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_9763_left;
     BIN_OP_PLUS_uxn_opcodes_h_l99_c42_9763_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_9763_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_9763_return_output := BIN_OP_PLUS_uxn_opcodes_h_l99_c42_9763_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l85_c7_49cd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_49cd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_49cd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_49cd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_49cd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_49cd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_49cd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_49cd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_49cd_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l85_c7_49cd] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_49cd_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_49cd_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_49cd_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_49cd_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_49cd_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_49cd_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_49cd_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_49cd_return_output;

     -- t8_MUX[uxn_opcodes_h_l71_c2_b30e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l71_c2_b30e_cond <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_b30e_cond;
     t8_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue;
     t8_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_b30e_return_output := t8_MUX_uxn_opcodes_h_l71_c2_b30e_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_opcodes_h_l99_c22_5392_iffalse := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l99_c42_9763_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_49cd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_49cd_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l71_c2_b30e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_49cd_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l90_c7_661b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l71_c2_b30e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_b30e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_b30e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_b30e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_b30e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l71_c2_b30e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_b30e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_b30e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_b30e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_b30e_return_output;

     -- MUX[uxn_opcodes_h_l99_c22_5392] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l99_c22_5392_cond <= VAR_MUX_uxn_opcodes_h_l99_c22_5392_cond;
     MUX_uxn_opcodes_h_l99_c22_5392_iftrue <= VAR_MUX_uxn_opcodes_h_l99_c22_5392_iftrue;
     MUX_uxn_opcodes_h_l99_c22_5392_iffalse <= VAR_MUX_uxn_opcodes_h_l99_c22_5392_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l99_c22_5392_return_output := MUX_uxn_opcodes_h_l99_c22_5392_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l85_c7_49cd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l85_c7_49cd_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_49cd_cond;
     tmp16_MUX_uxn_opcodes_h_l85_c7_49cd_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_49cd_iftrue;
     tmp16_MUX_uxn_opcodes_h_l85_c7_49cd_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_49cd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_49cd_return_output := tmp16_MUX_uxn_opcodes_h_l85_c7_49cd_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_5662_iftrue := VAR_MUX_uxn_opcodes_h_l99_c22_5392_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_49cd_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l71_c2_b30e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l71_c2_b30e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_b30e_cond;
     tmp16_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_b30e_return_output := tmp16_MUX_uxn_opcodes_h_l71_c2_b30e_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l96_c7_5662] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l96_c7_5662_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_5662_cond;
     result_u16_value_MUX_uxn_opcodes_h_l96_c7_5662_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_5662_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l96_c7_5662_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_5662_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_5662_return_output := result_u16_value_MUX_uxn_opcodes_h_l96_c7_5662_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_661b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l96_c7_5662_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_b30e_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l90_c7_661b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_661b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_661b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_661b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_661b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l90_c7_661b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_661b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_661b_return_output := result_u16_value_MUX_uxn_opcodes_h_l90_c7_661b_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_49cd_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l90_c7_661b_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l85_c7_49cd] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_49cd_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_49cd_cond;
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_49cd_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_49cd_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_49cd_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_49cd_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_49cd_return_output := result_u16_value_MUX_uxn_opcodes_h_l85_c7_49cd_return_output;

     -- Submodule level 8
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_49cd_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l71_c2_b30e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_b30e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_b30e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_b30e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_b30e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_b30e_return_output := result_u16_value_MUX_uxn_opcodes_h_l71_c2_b30e_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8098_uxn_opcodes_h_l103_l66_DUPLICATE_86c7 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8098_uxn_opcodes_h_l103_l66_DUPLICATE_86c7_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8098(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_b30e_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l71_c2_b30e_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l71_c2_b30e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_b30e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_b30e_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_b30e_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l71_c2_b30e_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l71_c2_b30e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_b30e_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8098_uxn_opcodes_h_l103_l66_DUPLICATE_86c7_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8098_uxn_opcodes_h_l103_l66_DUPLICATE_86c7_return_output;
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
