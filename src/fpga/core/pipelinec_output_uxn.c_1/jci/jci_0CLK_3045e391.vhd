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
-- Submodules: 41
entity jci_0CLK_3045e391 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jci_0CLK_3045e391;
architecture arch of jci_0CLK_3045e391 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l71_c6_15d5]
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_15d5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_15d5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l71_c6_15d5_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l71_c2_8fb1]
signal tmp16_MUX_uxn_opcodes_h_l71_c2_8fb1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_8fb1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_8fb1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l71_c2_8fb1]
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_8fb1_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_8fb1_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_8fb1_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l71_c2_8fb1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_8fb1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_8fb1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_8fb1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l71_c2_8fb1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_8fb1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_8fb1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_8fb1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l71_c2_8fb1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_8fb1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_8fb1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_8fb1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l71_c2_8fb1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_8fb1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_8fb1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_8fb1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l71_c2_8fb1]
signal t8_MUX_uxn_opcodes_h_l71_c2_8fb1_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_8fb1_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_8fb1_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l79_c11_0ef6]
signal BIN_OP_EQ_uxn_opcodes_h_l79_c11_0ef6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l79_c11_0ef6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l79_c11_0ef6_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l79_c7_92e9]
signal tmp16_MUX_uxn_opcodes_h_l79_c7_92e9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l79_c7_92e9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l79_c7_92e9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l79_c7_92e9_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l79_c7_92e9]
signal result_u16_value_MUX_uxn_opcodes_h_l79_c7_92e9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l79_c7_92e9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l79_c7_92e9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l79_c7_92e9_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l79_c7_92e9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_92e9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_92e9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_92e9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_92e9_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l79_c7_92e9]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_92e9_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_92e9_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_92e9_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_92e9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l79_c7_92e9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_92e9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_92e9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_92e9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_92e9_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l79_c7_92e9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l79_c7_92e9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l79_c7_92e9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l79_c7_92e9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l79_c7_92e9_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l79_c7_92e9]
signal t8_MUX_uxn_opcodes_h_l79_c7_92e9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l79_c7_92e9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l79_c7_92e9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l79_c7_92e9_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l83_c22_94aa]
signal BIN_OP_PLUS_uxn_opcodes_h_l83_c22_94aa_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l83_c22_94aa_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l83_c22_94aa_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l85_c11_f9d5]
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_f9d5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_f9d5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l85_c11_f9d5_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l85_c7_e6f6]
signal tmp16_MUX_uxn_opcodes_h_l85_c7_e6f6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_e6f6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_e6f6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l85_c7_e6f6_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l85_c7_e6f6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e6f6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e6f6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e6f6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e6f6_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l85_c7_e6f6]
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_e6f6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_e6f6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_e6f6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l85_c7_e6f6_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l85_c7_e6f6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e6f6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e6f6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e6f6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e6f6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l85_c7_e6f6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_e6f6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_e6f6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_e6f6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_e6f6_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l85_c7_e6f6]
signal t8_MUX_uxn_opcodes_h_l85_c7_e6f6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l85_c7_e6f6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l85_c7_e6f6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l85_c7_e6f6_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l88_c3_ce63]
signal CONST_SL_8_uxn_opcodes_h_l88_c3_ce63_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l88_c3_ce63_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l91_c11_5cca]
signal BIN_OP_EQ_uxn_opcodes_h_l91_c11_5cca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l91_c11_5cca_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l91_c11_5cca_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l91_c7_ea4f]
signal tmp16_MUX_uxn_opcodes_h_l91_c7_ea4f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l91_c7_ea4f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l91_c7_ea4f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l91_c7_ea4f_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l91_c7_ea4f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_ea4f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_ea4f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_ea4f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_ea4f_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l91_c7_ea4f]
signal result_u16_value_MUX_uxn_opcodes_h_l91_c7_ea4f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l91_c7_ea4f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l91_c7_ea4f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l91_c7_ea4f_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l91_c7_ea4f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_ea4f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_ea4f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_ea4f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_ea4f_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l92_c3_9727]
signal BIN_OP_OR_uxn_opcodes_h_l92_c3_9727_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l92_c3_9727_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l92_c3_9727_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l94_c22_834e]
signal BIN_OP_EQ_uxn_opcodes_h_l94_c22_834e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l94_c22_834e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l94_c22_834e_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l94_c32_12fd]
signal BIN_OP_PLUS_uxn_opcodes_h_l94_c32_12fd_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l94_c32_12fd_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l94_c32_12fd_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l94_c42_4ab2]
signal BIN_OP_PLUS_uxn_opcodes_h_l94_c42_4ab2_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l94_c42_4ab2_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l94_c42_4ab2_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l94_c42_59ae]
signal BIN_OP_PLUS_uxn_opcodes_h_l94_c42_59ae_left : unsigned(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l94_c42_59ae_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l94_c42_59ae_return_output : unsigned(17 downto 0);

-- MUX[uxn_opcodes_h_l94_c22_7f84]
signal MUX_uxn_opcodes_h_l94_c22_7f84_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l94_c22_7f84_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l94_c22_7f84_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l94_c22_7f84_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l96_c11_a69d]
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_a69d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_a69d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l96_c11_a69d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l96_c7_0b07]
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0b07_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0b07_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0b07_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0b07_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l96_c7_0b07]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0b07_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0b07_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0b07_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0b07_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_6e0b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.is_pc_updated := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l71_c6_15d5
BIN_OP_EQ_uxn_opcodes_h_l71_c6_15d5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l71_c6_15d5_left,
BIN_OP_EQ_uxn_opcodes_h_l71_c6_15d5_right,
BIN_OP_EQ_uxn_opcodes_h_l71_c6_15d5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l71_c2_8fb1
tmp16_MUX_uxn_opcodes_h_l71_c2_8fb1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l71_c2_8fb1_cond,
tmp16_MUX_uxn_opcodes_h_l71_c2_8fb1_iftrue,
tmp16_MUX_uxn_opcodes_h_l71_c2_8fb1_iffalse,
tmp16_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l71_c2_8fb1
result_u16_value_MUX_uxn_opcodes_h_l71_c2_8fb1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l71_c2_8fb1_cond,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_8fb1_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_8fb1_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_8fb1
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_8fb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_8fb1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_8fb1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_8fb1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_8fb1
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_8fb1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_8fb1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_8fb1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_8fb1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_8fb1
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_8fb1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_8fb1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_8fb1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_8fb1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_8fb1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_8fb1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_8fb1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_8fb1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_8fb1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output);

-- t8_MUX_uxn_opcodes_h_l71_c2_8fb1
t8_MUX_uxn_opcodes_h_l71_c2_8fb1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l71_c2_8fb1_cond,
t8_MUX_uxn_opcodes_h_l71_c2_8fb1_iftrue,
t8_MUX_uxn_opcodes_h_l71_c2_8fb1_iffalse,
t8_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l79_c11_0ef6
BIN_OP_EQ_uxn_opcodes_h_l79_c11_0ef6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l79_c11_0ef6_left,
BIN_OP_EQ_uxn_opcodes_h_l79_c11_0ef6_right,
BIN_OP_EQ_uxn_opcodes_h_l79_c11_0ef6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l79_c7_92e9
tmp16_MUX_uxn_opcodes_h_l79_c7_92e9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l79_c7_92e9_cond,
tmp16_MUX_uxn_opcodes_h_l79_c7_92e9_iftrue,
tmp16_MUX_uxn_opcodes_h_l79_c7_92e9_iffalse,
tmp16_MUX_uxn_opcodes_h_l79_c7_92e9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l79_c7_92e9
result_u16_value_MUX_uxn_opcodes_h_l79_c7_92e9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l79_c7_92e9_cond,
result_u16_value_MUX_uxn_opcodes_h_l79_c7_92e9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l79_c7_92e9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l79_c7_92e9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_92e9
result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_92e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_92e9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_92e9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_92e9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_92e9_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_92e9
result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_92e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_92e9_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_92e9_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_92e9_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_92e9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_92e9
result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_92e9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_92e9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_92e9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_92e9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_92e9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l79_c7_92e9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l79_c7_92e9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l79_c7_92e9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l79_c7_92e9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l79_c7_92e9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l79_c7_92e9_return_output);

-- t8_MUX_uxn_opcodes_h_l79_c7_92e9
t8_MUX_uxn_opcodes_h_l79_c7_92e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l79_c7_92e9_cond,
t8_MUX_uxn_opcodes_h_l79_c7_92e9_iftrue,
t8_MUX_uxn_opcodes_h_l79_c7_92e9_iffalse,
t8_MUX_uxn_opcodes_h_l79_c7_92e9_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l83_c22_94aa
BIN_OP_PLUS_uxn_opcodes_h_l83_c22_94aa : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l83_c22_94aa_left,
BIN_OP_PLUS_uxn_opcodes_h_l83_c22_94aa_right,
BIN_OP_PLUS_uxn_opcodes_h_l83_c22_94aa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l85_c11_f9d5
BIN_OP_EQ_uxn_opcodes_h_l85_c11_f9d5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l85_c11_f9d5_left,
BIN_OP_EQ_uxn_opcodes_h_l85_c11_f9d5_right,
BIN_OP_EQ_uxn_opcodes_h_l85_c11_f9d5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l85_c7_e6f6
tmp16_MUX_uxn_opcodes_h_l85_c7_e6f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l85_c7_e6f6_cond,
tmp16_MUX_uxn_opcodes_h_l85_c7_e6f6_iftrue,
tmp16_MUX_uxn_opcodes_h_l85_c7_e6f6_iffalse,
tmp16_MUX_uxn_opcodes_h_l85_c7_e6f6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e6f6
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e6f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e6f6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e6f6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e6f6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e6f6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l85_c7_e6f6
result_u16_value_MUX_uxn_opcodes_h_l85_c7_e6f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l85_c7_e6f6_cond,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_e6f6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_e6f6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l85_c7_e6f6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e6f6
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e6f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e6f6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e6f6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e6f6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e6f6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_e6f6
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_e6f6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_e6f6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_e6f6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_e6f6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_e6f6_return_output);

-- t8_MUX_uxn_opcodes_h_l85_c7_e6f6
t8_MUX_uxn_opcodes_h_l85_c7_e6f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l85_c7_e6f6_cond,
t8_MUX_uxn_opcodes_h_l85_c7_e6f6_iftrue,
t8_MUX_uxn_opcodes_h_l85_c7_e6f6_iffalse,
t8_MUX_uxn_opcodes_h_l85_c7_e6f6_return_output);

-- CONST_SL_8_uxn_opcodes_h_l88_c3_ce63
CONST_SL_8_uxn_opcodes_h_l88_c3_ce63 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l88_c3_ce63_x,
CONST_SL_8_uxn_opcodes_h_l88_c3_ce63_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l91_c11_5cca
BIN_OP_EQ_uxn_opcodes_h_l91_c11_5cca : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l91_c11_5cca_left,
BIN_OP_EQ_uxn_opcodes_h_l91_c11_5cca_right,
BIN_OP_EQ_uxn_opcodes_h_l91_c11_5cca_return_output);

-- tmp16_MUX_uxn_opcodes_h_l91_c7_ea4f
tmp16_MUX_uxn_opcodes_h_l91_c7_ea4f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l91_c7_ea4f_cond,
tmp16_MUX_uxn_opcodes_h_l91_c7_ea4f_iftrue,
tmp16_MUX_uxn_opcodes_h_l91_c7_ea4f_iffalse,
tmp16_MUX_uxn_opcodes_h_l91_c7_ea4f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_ea4f
result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_ea4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_ea4f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_ea4f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_ea4f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_ea4f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l91_c7_ea4f
result_u16_value_MUX_uxn_opcodes_h_l91_c7_ea4f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l91_c7_ea4f_cond,
result_u16_value_MUX_uxn_opcodes_h_l91_c7_ea4f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l91_c7_ea4f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l91_c7_ea4f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_ea4f
result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_ea4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_ea4f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_ea4f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_ea4f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_ea4f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l92_c3_9727
BIN_OP_OR_uxn_opcodes_h_l92_c3_9727 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l92_c3_9727_left,
BIN_OP_OR_uxn_opcodes_h_l92_c3_9727_right,
BIN_OP_OR_uxn_opcodes_h_l92_c3_9727_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l94_c22_834e
BIN_OP_EQ_uxn_opcodes_h_l94_c22_834e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l94_c22_834e_left,
BIN_OP_EQ_uxn_opcodes_h_l94_c22_834e_right,
BIN_OP_EQ_uxn_opcodes_h_l94_c22_834e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l94_c32_12fd
BIN_OP_PLUS_uxn_opcodes_h_l94_c32_12fd : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l94_c32_12fd_left,
BIN_OP_PLUS_uxn_opcodes_h_l94_c32_12fd_right,
BIN_OP_PLUS_uxn_opcodes_h_l94_c32_12fd_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l94_c42_4ab2
BIN_OP_PLUS_uxn_opcodes_h_l94_c42_4ab2 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l94_c42_4ab2_left,
BIN_OP_PLUS_uxn_opcodes_h_l94_c42_4ab2_right,
BIN_OP_PLUS_uxn_opcodes_h_l94_c42_4ab2_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l94_c42_59ae
BIN_OP_PLUS_uxn_opcodes_h_l94_c42_59ae : entity work.BIN_OP_PLUS_uint17_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l94_c42_59ae_left,
BIN_OP_PLUS_uxn_opcodes_h_l94_c42_59ae_right,
BIN_OP_PLUS_uxn_opcodes_h_l94_c42_59ae_return_output);

-- MUX_uxn_opcodes_h_l94_c22_7f84
MUX_uxn_opcodes_h_l94_c22_7f84 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l94_c22_7f84_cond,
MUX_uxn_opcodes_h_l94_c22_7f84_iftrue,
MUX_uxn_opcodes_h_l94_c22_7f84_iffalse,
MUX_uxn_opcodes_h_l94_c22_7f84_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l96_c11_a69d
BIN_OP_EQ_uxn_opcodes_h_l96_c11_a69d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l96_c11_a69d_left,
BIN_OP_EQ_uxn_opcodes_h_l96_c11_a69d_right,
BIN_OP_EQ_uxn_opcodes_h_l96_c11_a69d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0b07
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0b07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0b07_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0b07_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0b07_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0b07_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0b07
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0b07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0b07_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0b07_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0b07_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0b07_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l71_c6_15d5_return_output,
 tmp16_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output,
 t8_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l79_c11_0ef6_return_output,
 tmp16_MUX_uxn_opcodes_h_l79_c7_92e9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l79_c7_92e9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_92e9_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_92e9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_92e9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l79_c7_92e9_return_output,
 t8_MUX_uxn_opcodes_h_l79_c7_92e9_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l83_c22_94aa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l85_c11_f9d5_return_output,
 tmp16_MUX_uxn_opcodes_h_l85_c7_e6f6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e6f6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l85_c7_e6f6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e6f6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_e6f6_return_output,
 t8_MUX_uxn_opcodes_h_l85_c7_e6f6_return_output,
 CONST_SL_8_uxn_opcodes_h_l88_c3_ce63_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l91_c11_5cca_return_output,
 tmp16_MUX_uxn_opcodes_h_l91_c7_ea4f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_ea4f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l91_c7_ea4f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_ea4f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l92_c3_9727_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l94_c22_834e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l94_c32_12fd_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l94_c42_4ab2_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l94_c42_59ae_return_output,
 MUX_uxn_opcodes_h_l94_c22_7f84_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l96_c11_a69d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0b07_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0b07_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_15d5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_15d5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_15d5_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_8fb1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_8fb1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_92e9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_8fb1_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_8fb1_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_8fb1_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l79_c7_92e9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_8fb1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_8fb1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_8fb1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_92e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_8fb1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_8fb1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_8fb1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_92e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_8fb1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_8fb1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_8fb1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_92e9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_8fb1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_8fb1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l75_c3_501c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_8fb1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l79_c7_92e9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_8fb1_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_8fb1_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_8fb1_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l79_c7_92e9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l71_c2_8fb1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_0ef6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_0ef6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_0ef6_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_92e9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_92e9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_e6f6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_92e9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l79_c7_92e9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l83_c3_e3b6 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l79_c7_92e9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_e6f6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l79_c7_92e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_92e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_92e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e6f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_92e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_92e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_92e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e6f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_92e9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_92e9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l82_c3_5219 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_92e9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_e6f6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_92e9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l79_c7_92e9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l80_c3_e904 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l79_c7_92e9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l79_c7_92e9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l79_c7_92e9_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l79_c7_92e9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l79_c7_92e9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_e6f6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l79_c7_92e9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l83_c22_94aa_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l83_c22_94aa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l83_c22_94aa_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_f9d5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_f9d5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_f9d5_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_e6f6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_e6f6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_ea4f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_e6f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e6f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e6f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_ea4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e6f6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_e6f6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_e6f6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l91_c7_ea4f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_e6f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e6f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e6f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_ea4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e6f6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_e6f6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l89_c3_309c : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_e6f6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_e6f6_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_e6f6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_e6f6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l85_c7_e6f6_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l88_c3_ce63_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l88_c3_ce63_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_5cca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_5cca_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_5cca_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_ea4f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_ea4f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_ea4f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_ea4f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_ea4f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0b07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_ea4f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l91_c7_ea4f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l91_c7_ea4f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l91_c7_ea4f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_ea4f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_ea4f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0b07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_ea4f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l92_c3_9727_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l92_c3_9727_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l92_c3_9727_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l94_c22_7f84_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c22_834e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c22_834e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c22_834e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l94_c22_7f84_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l94_c22_7f84_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l94_c32_12fd_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l94_c32_12fd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l94_c32_12fd_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l94_c42_4ab2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l94_c42_4ab2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l94_c42_4ab2_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l94_c42_59ae_left : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l94_c42_59ae_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l94_c42_59ae_return_output : unsigned(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l94_c22_7f84_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_a69d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_a69d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_a69d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0b07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0b07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0b07_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0b07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0b07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0b07_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l85_l71_l79_l96_DUPLICATE_3463_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l85_l71_DUPLICATE_502d_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l85_l91_l79_l96_DUPLICATE_fdc7_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l87_l92_DUPLICATE_5807_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l85_l91_DUPLICATE_2a32_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6e0b_uxn_opcodes_h_l66_l101_DUPLICATE_193b_return_output : opcode_result_t;
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
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_ea4f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_5cca_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_0ef6_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_f9d5_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c22_834e_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_8fb1_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0b07_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l80_c3_e904 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l79_c7_92e9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l80_c3_e904;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l83_c22_94aa_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_15d5_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l82_c3_5219 := resize(to_signed(-1, 2), 4);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_92e9_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l82_c3_5219;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_a69d_right := to_unsigned(4, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0b07_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l94_c42_59ae_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l94_c32_12fd_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l75_c3_501c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_8fb1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l75_c3_501c;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l89_c3_309c := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_e6f6_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l89_c3_309c;

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
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l83_c22_94aa_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l94_c32_12fd_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l94_c42_4ab2_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_8fb1_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_15d5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_0ef6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_f9d5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_5cca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_a69d_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_e6f6_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c22_834e_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_8fb1_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l79_c7_92e9_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_e6f6_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l92_c3_9727_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_8fb1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_92e9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_ea4f_iffalse := tmp16;
     -- BIN_OP_PLUS[uxn_opcodes_h_l94_c32_12fd] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l94_c32_12fd_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l94_c32_12fd_left;
     BIN_OP_PLUS_uxn_opcodes_h_l94_c32_12fd_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l94_c32_12fd_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l94_c32_12fd_return_output := BIN_OP_PLUS_uxn_opcodes_h_l94_c32_12fd_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l83_c22_94aa] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l83_c22_94aa_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l83_c22_94aa_left;
     BIN_OP_PLUS_uxn_opcodes_h_l83_c22_94aa_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l83_c22_94aa_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l83_c22_94aa_return_output := BIN_OP_PLUS_uxn_opcodes_h_l83_c22_94aa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l94_c22_834e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l94_c22_834e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c22_834e_left;
     BIN_OP_EQ_uxn_opcodes_h_l94_c22_834e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c22_834e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c22_834e_return_output := BIN_OP_EQ_uxn_opcodes_h_l94_c22_834e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l71_c6_15d5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l71_c6_15d5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_15d5_left;
     BIN_OP_EQ_uxn_opcodes_h_l71_c6_15d5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_15d5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_15d5_return_output := BIN_OP_EQ_uxn_opcodes_h_l71_c6_15d5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l85_l91_l79_l96_DUPLICATE_fdc7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l85_l91_l79_l96_DUPLICATE_fdc7_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l79_c11_0ef6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l79_c11_0ef6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_0ef6_left;
     BIN_OP_EQ_uxn_opcodes_h_l79_c11_0ef6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_0ef6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_0ef6_return_output := BIN_OP_EQ_uxn_opcodes_h_l79_c11_0ef6_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l79_c7_92e9] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l79_c7_92e9_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l87_l92_DUPLICATE_5807 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l87_l92_DUPLICATE_5807_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l85_c11_f9d5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l85_c11_f9d5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_f9d5_left;
     BIN_OP_EQ_uxn_opcodes_h_l85_c11_f9d5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_f9d5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_f9d5_return_output := BIN_OP_EQ_uxn_opcodes_h_l85_c11_f9d5_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l85_l91_DUPLICATE_2a32 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l85_l91_DUPLICATE_2a32_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l96_c11_a69d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l96_c11_a69d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_a69d_left;
     BIN_OP_EQ_uxn_opcodes_h_l96_c11_a69d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_a69d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_a69d_return_output := BIN_OP_EQ_uxn_opcodes_h_l96_c11_a69d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l91_c11_5cca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l91_c11_5cca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_5cca_left;
     BIN_OP_EQ_uxn_opcodes_h_l91_c11_5cca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_5cca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_5cca_return_output := BIN_OP_EQ_uxn_opcodes_h_l91_c11_5cca_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l85_l71_l79_l96_DUPLICATE_3463 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l85_l71_l79_l96_DUPLICATE_3463_return_output := result.is_pc_updated;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l85_l71_DUPLICATE_502d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l85_l71_DUPLICATE_502d_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_8fb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_15d5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_8fb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_15d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_8fb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_15d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_8fb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_15d5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_8fb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_15d5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_8fb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_15d5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_8fb1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l71_c6_15d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_92e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_0ef6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_92e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_0ef6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_92e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_0ef6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l79_c7_92e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_0ef6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l79_c7_92e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_0ef6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l79_c7_92e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_0ef6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_92e9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l79_c11_0ef6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e6f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_f9d5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e6f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_f9d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_e6f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_f9d5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_e6f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_f9d5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_e6f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_f9d5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_e6f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l85_c11_f9d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_ea4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_5cca_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_ea4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_5cca_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l91_c7_ea4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_5cca_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_ea4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l91_c11_5cca_return_output;
     VAR_MUX_uxn_opcodes_h_l94_c22_7f84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l94_c22_834e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0b07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_a69d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0b07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l96_c11_a69d_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l83_c3_e3b6 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l83_c22_94aa_return_output, 16);
     VAR_MUX_uxn_opcodes_h_l94_c22_7f84_iftrue := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l94_c32_12fd_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l92_c3_9727_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l87_l92_DUPLICATE_5807_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l88_c3_ce63_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l87_l92_DUPLICATE_5807_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_8fb1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l85_l71_DUPLICATE_502d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_e6f6_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l85_l71_DUPLICATE_502d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_e6f6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l85_l91_DUPLICATE_2a32_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l91_c7_ea4f_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l85_l91_DUPLICATE_2a32_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_92e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l85_l91_l79_l96_DUPLICATE_fdc7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e6f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l85_l91_l79_l96_DUPLICATE_fdc7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_ea4f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l85_l91_l79_l96_DUPLICATE_fdc7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0b07_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l85_l91_l79_l96_DUPLICATE_fdc7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_8fb1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l85_l71_l79_l96_DUPLICATE_3463_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_92e9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l85_l71_l79_l96_DUPLICATE_3463_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e6f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l85_l71_l79_l96_DUPLICATE_3463_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0b07_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l85_l71_l79_l96_DUPLICATE_3463_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l79_c7_92e9_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l79_c7_92e9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l79_c7_92e9_iftrue := VAR_result_u16_value_uxn_opcodes_h_l83_c3_e3b6;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l85_c7_e6f6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_e6f6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_e6f6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_e6f6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_e6f6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_e6f6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_e6f6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_e6f6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_e6f6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l96_c7_0b07] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0b07_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0b07_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0b07_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0b07_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0b07_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0b07_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0b07_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0b07_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l96_c7_0b07] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0b07_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0b07_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0b07_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0b07_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0b07_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0b07_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0b07_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0b07_return_output;

     -- t8_MUX[uxn_opcodes_h_l85_c7_e6f6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l85_c7_e6f6_cond <= VAR_t8_MUX_uxn_opcodes_h_l85_c7_e6f6_cond;
     t8_MUX_uxn_opcodes_h_l85_c7_e6f6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l85_c7_e6f6_iftrue;
     t8_MUX_uxn_opcodes_h_l85_c7_e6f6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l85_c7_e6f6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l85_c7_e6f6_return_output := t8_MUX_uxn_opcodes_h_l85_c7_e6f6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l79_c7_92e9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l79_c7_92e9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l79_c7_92e9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l79_c7_92e9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l79_c7_92e9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l79_c7_92e9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l79_c7_92e9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l79_c7_92e9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l79_c7_92e9_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l88_c3_ce63] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l88_c3_ce63_x <= VAR_CONST_SL_8_uxn_opcodes_h_l88_c3_ce63_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l88_c3_ce63_return_output := CONST_SL_8_uxn_opcodes_h_l88_c3_ce63_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l92_c3_9727] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l92_c3_9727_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l92_c3_9727_left;
     BIN_OP_OR_uxn_opcodes_h_l92_c3_9727_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l92_c3_9727_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l92_c3_9727_return_output := BIN_OP_OR_uxn_opcodes_h_l92_c3_9727_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l94_c42_4ab2_right := VAR_BIN_OP_OR_uxn_opcodes_h_l92_c3_9727_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_ea4f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l92_c3_9727_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_e6f6_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l88_c3_ce63_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_ea4f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l96_c7_0b07_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_ea4f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l96_c7_0b07_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_92e9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l85_c7_e6f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_8fb1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l79_c7_92e9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l79_c7_92e9_iffalse := VAR_t8_MUX_uxn_opcodes_h_l85_c7_e6f6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l91_c7_ea4f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_ea4f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_ea4f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_ea4f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_ea4f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_ea4f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_ea4f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_ea4f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_ea4f_return_output;

     -- t8_MUX[uxn_opcodes_h_l79_c7_92e9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l79_c7_92e9_cond <= VAR_t8_MUX_uxn_opcodes_h_l79_c7_92e9_cond;
     t8_MUX_uxn_opcodes_h_l79_c7_92e9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l79_c7_92e9_iftrue;
     t8_MUX_uxn_opcodes_h_l79_c7_92e9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l79_c7_92e9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l79_c7_92e9_return_output := t8_MUX_uxn_opcodes_h_l79_c7_92e9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l79_c7_92e9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_92e9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_92e9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_92e9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_92e9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_92e9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_92e9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_92e9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_92e9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l91_c7_ea4f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l91_c7_ea4f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_ea4f_cond;
     tmp16_MUX_uxn_opcodes_h_l91_c7_ea4f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_ea4f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l91_c7_ea4f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_ea4f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_ea4f_return_output := tmp16_MUX_uxn_opcodes_h_l91_c7_ea4f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l71_c2_8fb1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_8fb1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_8fb1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_8fb1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_8fb1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_8fb1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_8fb1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l91_c7_ea4f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_ea4f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_ea4f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_ea4f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_ea4f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_ea4f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_ea4f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_ea4f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_ea4f_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l94_c42_4ab2] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l94_c42_4ab2_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l94_c42_4ab2_left;
     BIN_OP_PLUS_uxn_opcodes_h_l94_c42_4ab2_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l94_c42_4ab2_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l94_c42_4ab2_return_output := BIN_OP_PLUS_uxn_opcodes_h_l94_c42_4ab2_return_output;

     -- Submodule level 3
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l94_c42_59ae_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l94_c42_4ab2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e6f6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l91_c7_ea4f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e6f6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l91_c7_ea4f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_8fb1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l79_c7_92e9_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_8fb1_iffalse := VAR_t8_MUX_uxn_opcodes_h_l79_c7_92e9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_e6f6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l91_c7_ea4f_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l85_c7_e6f6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l85_c7_e6f6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_e6f6_cond;
     tmp16_MUX_uxn_opcodes_h_l85_c7_e6f6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_e6f6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l85_c7_e6f6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_e6f6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_e6f6_return_output := tmp16_MUX_uxn_opcodes_h_l85_c7_e6f6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l85_c7_e6f6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e6f6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e6f6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e6f6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e6f6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e6f6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e6f6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e6f6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e6f6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l85_c7_e6f6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e6f6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e6f6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e6f6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e6f6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e6f6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e6f6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e6f6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e6f6_return_output;

     -- t8_MUX[uxn_opcodes_h_l71_c2_8fb1] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l71_c2_8fb1_cond <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_8fb1_cond;
     t8_MUX_uxn_opcodes_h_l71_c2_8fb1_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_8fb1_iftrue;
     t8_MUX_uxn_opcodes_h_l71_c2_8fb1_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l71_c2_8fb1_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output := t8_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l94_c42_59ae] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l94_c42_59ae_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l94_c42_59ae_left;
     BIN_OP_PLUS_uxn_opcodes_h_l94_c42_59ae_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l94_c42_59ae_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l94_c42_59ae_return_output := BIN_OP_PLUS_uxn_opcodes_h_l94_c42_59ae_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l71_c2_8fb1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_8fb1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_8fb1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_8fb1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_8fb1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_8fb1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_8fb1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output;

     -- Submodule level 4
     VAR_MUX_uxn_opcodes_h_l94_c22_7f84_iffalse := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l94_c42_59ae_return_output, 16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_92e9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l85_c7_e6f6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_92e9_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l85_c7_e6f6_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_92e9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l85_c7_e6f6_return_output;
     -- MUX[uxn_opcodes_h_l94_c22_7f84] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l94_c22_7f84_cond <= VAR_MUX_uxn_opcodes_h_l94_c22_7f84_cond;
     MUX_uxn_opcodes_h_l94_c22_7f84_iftrue <= VAR_MUX_uxn_opcodes_h_l94_c22_7f84_iftrue;
     MUX_uxn_opcodes_h_l94_c22_7f84_iffalse <= VAR_MUX_uxn_opcodes_h_l94_c22_7f84_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l94_c22_7f84_return_output := MUX_uxn_opcodes_h_l94_c22_7f84_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l79_c7_92e9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l79_c7_92e9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_92e9_cond;
     tmp16_MUX_uxn_opcodes_h_l79_c7_92e9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_92e9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l79_c7_92e9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_92e9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_92e9_return_output := tmp16_MUX_uxn_opcodes_h_l79_c7_92e9_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l79_c7_92e9] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_92e9_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_92e9_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_92e9_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_92e9_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_92e9_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_92e9_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_92e9_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_92e9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l79_c7_92e9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_92e9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_92e9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_92e9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_92e9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_92e9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_92e9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_92e9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_92e9_return_output;

     -- Submodule level 5
     VAR_result_u16_value_MUX_uxn_opcodes_h_l91_c7_ea4f_iftrue := VAR_MUX_uxn_opcodes_h_l94_c22_7f84_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_8fb1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l79_c7_92e9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_8fb1_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l79_c7_92e9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_8fb1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l79_c7_92e9_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l71_c2_8fb1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_8fb1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_8fb1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_8fb1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_8fb1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_8fb1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_8fb1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l71_c2_8fb1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_8fb1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_8fb1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_8fb1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_8fb1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_8fb1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_8fb1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l71_c2_8fb1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l71_c2_8fb1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_8fb1_cond;
     tmp16_MUX_uxn_opcodes_h_l71_c2_8fb1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_8fb1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l71_c2_8fb1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_8fb1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output := tmp16_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l91_c7_ea4f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l91_c7_ea4f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l91_c7_ea4f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l91_c7_ea4f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l91_c7_ea4f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l91_c7_ea4f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l91_c7_ea4f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l91_c7_ea4f_return_output := result_u16_value_MUX_uxn_opcodes_h_l91_c7_ea4f_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_e6f6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l91_c7_ea4f_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l85_c7_e6f6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_e6f6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_e6f6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_e6f6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_e6f6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l85_c7_e6f6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_e6f6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_e6f6_return_output := result_u16_value_MUX_uxn_opcodes_h_l85_c7_e6f6_return_output;

     -- Submodule level 7
     VAR_result_u16_value_MUX_uxn_opcodes_h_l79_c7_92e9_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l85_c7_e6f6_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l79_c7_92e9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l79_c7_92e9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l79_c7_92e9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l79_c7_92e9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l79_c7_92e9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l79_c7_92e9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l79_c7_92e9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l79_c7_92e9_return_output := result_u16_value_MUX_uxn_opcodes_h_l79_c7_92e9_return_output;

     -- Submodule level 8
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_8fb1_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l79_c7_92e9_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l71_c2_8fb1] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_8fb1_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_8fb1_cond;
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_8fb1_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_8fb1_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l71_c2_8fb1_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_8fb1_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output := result_u16_value_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6e0b_uxn_opcodes_h_l66_l101_DUPLICATE_193b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6e0b_uxn_opcodes_h_l66_l101_DUPLICATE_193b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6e0b(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l71_c2_8fb1_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6e0b_uxn_opcodes_h_l66_l101_DUPLICATE_193b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6e0b_uxn_opcodes_h_l66_l101_DUPLICATE_193b_return_output;
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
