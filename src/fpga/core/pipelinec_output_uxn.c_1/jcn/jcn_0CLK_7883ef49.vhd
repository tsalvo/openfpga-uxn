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
-- Submodules: 39
entity jcn_0CLK_7883ef49 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jcn_0CLK_7883ef49;
architecture arch of jcn_0CLK_7883ef49 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l650_c6_efb7]
signal BIN_OP_EQ_uxn_opcodes_h_l650_c6_efb7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l650_c6_efb7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l650_c6_efb7_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l650_c2_8867]
signal n8_MUX_uxn_opcodes_h_l650_c2_8867_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l650_c2_8867_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l650_c2_8867_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l650_c2_8867_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l650_c2_8867]
signal result_u16_value_MUX_uxn_opcodes_h_l650_c2_8867_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l650_c2_8867_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l650_c2_8867_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l650_c2_8867_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l650_c2_8867]
signal result_is_opc_done_MUX_uxn_opcodes_h_l650_c2_8867_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l650_c2_8867_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l650_c2_8867_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l650_c2_8867_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l650_c2_8867]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l650_c2_8867_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l650_c2_8867_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l650_c2_8867_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l650_c2_8867_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l650_c2_8867]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c2_8867_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c2_8867_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c2_8867_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c2_8867_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l650_c2_8867]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c2_8867_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c2_8867_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c2_8867_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c2_8867_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l650_c2_8867]
signal t8_MUX_uxn_opcodes_h_l650_c2_8867_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l650_c2_8867_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l650_c2_8867_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l650_c2_8867_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l657_c11_0bb8]
signal BIN_OP_EQ_uxn_opcodes_h_l657_c11_0bb8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l657_c11_0bb8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l657_c11_0bb8_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l657_c7_661b]
signal n8_MUX_uxn_opcodes_h_l657_c7_661b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l657_c7_661b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l657_c7_661b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l657_c7_661b_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l657_c7_661b]
signal result_u16_value_MUX_uxn_opcodes_h_l657_c7_661b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l657_c7_661b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l657_c7_661b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l657_c7_661b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l657_c7_661b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_661b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_661b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_661b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_661b_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l657_c7_661b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l657_c7_661b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l657_c7_661b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l657_c7_661b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l657_c7_661b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l657_c7_661b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l657_c7_661b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l657_c7_661b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l657_c7_661b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l657_c7_661b_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l657_c7_661b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l657_c7_661b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l657_c7_661b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l657_c7_661b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l657_c7_661b_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l657_c7_661b]
signal t8_MUX_uxn_opcodes_h_l657_c7_661b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l657_c7_661b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l657_c7_661b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l657_c7_661b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l660_c11_4d5e]
signal BIN_OP_EQ_uxn_opcodes_h_l660_c11_4d5e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l660_c11_4d5e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l660_c11_4d5e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l660_c7_fca4]
signal n8_MUX_uxn_opcodes_h_l660_c7_fca4_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l660_c7_fca4_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l660_c7_fca4_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l660_c7_fca4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l660_c7_fca4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_fca4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_fca4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_fca4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_fca4_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l660_c7_fca4]
signal result_u16_value_MUX_uxn_opcodes_h_l660_c7_fca4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l660_c7_fca4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l660_c7_fca4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l660_c7_fca4_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l660_c7_fca4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_fca4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_fca4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_fca4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_fca4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l660_c7_fca4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_fca4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_fca4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_fca4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_fca4_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l660_c7_fca4]
signal t8_MUX_uxn_opcodes_h_l660_c7_fca4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l660_c7_fca4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l660_c7_fca4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l660_c7_fca4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l663_c11_048b]
signal BIN_OP_EQ_uxn_opcodes_h_l663_c11_048b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l663_c11_048b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l663_c11_048b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l663_c7_e852]
signal n8_MUX_uxn_opcodes_h_l663_c7_e852_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l663_c7_e852_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l663_c7_e852_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l663_c7_e852_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l663_c7_e852]
signal result_is_opc_done_MUX_uxn_opcodes_h_l663_c7_e852_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l663_c7_e852_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l663_c7_e852_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l663_c7_e852_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l663_c7_e852]
signal result_u16_value_MUX_uxn_opcodes_h_l663_c7_e852_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l663_c7_e852_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l663_c7_e852_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l663_c7_e852_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l663_c7_e852]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l663_c7_e852_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l663_c7_e852_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l663_c7_e852_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l663_c7_e852_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l663_c7_e852]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c7_e852_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c7_e852_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c7_e852_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c7_e852_return_output : signed(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l666_c30_a979]
signal sp_relative_shift_uxn_opcodes_h_l666_c30_a979_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l666_c30_a979_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l666_c30_a979_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l666_c30_a979_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l668_c22_ccbf]
signal BIN_OP_EQ_uxn_opcodes_h_l668_c22_ccbf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l668_c22_ccbf_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l668_c22_ccbf_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l668_c37_284c]
signal BIN_OP_PLUS_uxn_opcodes_h_l668_c37_284c_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l668_c37_284c_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l668_c37_284c_return_output : signed(17 downto 0);

-- MUX[uxn_opcodes_h_l668_c22_ad27]
signal MUX_uxn_opcodes_h_l668_c22_ad27_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l668_c22_ad27_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l668_c22_ad27_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l668_c22_ad27_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l670_c11_2002]
signal BIN_OP_EQ_uxn_opcodes_h_l670_c11_2002_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l670_c11_2002_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l670_c11_2002_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l670_c7_3b8f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_3b8f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_3b8f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_3b8f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_3b8f_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l670_c7_3b8f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_3b8f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_3b8f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_3b8f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_3b8f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l670_c7_3b8f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c7_3b8f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c7_3b8f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c7_3b8f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c7_3b8f_return_output : signed(3 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
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
-- BIN_OP_EQ_uxn_opcodes_h_l650_c6_efb7
BIN_OP_EQ_uxn_opcodes_h_l650_c6_efb7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l650_c6_efb7_left,
BIN_OP_EQ_uxn_opcodes_h_l650_c6_efb7_right,
BIN_OP_EQ_uxn_opcodes_h_l650_c6_efb7_return_output);

-- n8_MUX_uxn_opcodes_h_l650_c2_8867
n8_MUX_uxn_opcodes_h_l650_c2_8867 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l650_c2_8867_cond,
n8_MUX_uxn_opcodes_h_l650_c2_8867_iftrue,
n8_MUX_uxn_opcodes_h_l650_c2_8867_iffalse,
n8_MUX_uxn_opcodes_h_l650_c2_8867_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l650_c2_8867
result_u16_value_MUX_uxn_opcodes_h_l650_c2_8867 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l650_c2_8867_cond,
result_u16_value_MUX_uxn_opcodes_h_l650_c2_8867_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l650_c2_8867_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l650_c2_8867_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l650_c2_8867
result_is_opc_done_MUX_uxn_opcodes_h_l650_c2_8867 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l650_c2_8867_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l650_c2_8867_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l650_c2_8867_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l650_c2_8867_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l650_c2_8867
result_is_pc_updated_MUX_uxn_opcodes_h_l650_c2_8867 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l650_c2_8867_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l650_c2_8867_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l650_c2_8867_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l650_c2_8867_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c2_8867
result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c2_8867 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c2_8867_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c2_8867_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c2_8867_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c2_8867_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c2_8867
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c2_8867 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c2_8867_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c2_8867_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c2_8867_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c2_8867_return_output);

-- t8_MUX_uxn_opcodes_h_l650_c2_8867
t8_MUX_uxn_opcodes_h_l650_c2_8867 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l650_c2_8867_cond,
t8_MUX_uxn_opcodes_h_l650_c2_8867_iftrue,
t8_MUX_uxn_opcodes_h_l650_c2_8867_iffalse,
t8_MUX_uxn_opcodes_h_l650_c2_8867_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l657_c11_0bb8
BIN_OP_EQ_uxn_opcodes_h_l657_c11_0bb8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l657_c11_0bb8_left,
BIN_OP_EQ_uxn_opcodes_h_l657_c11_0bb8_right,
BIN_OP_EQ_uxn_opcodes_h_l657_c11_0bb8_return_output);

-- n8_MUX_uxn_opcodes_h_l657_c7_661b
n8_MUX_uxn_opcodes_h_l657_c7_661b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l657_c7_661b_cond,
n8_MUX_uxn_opcodes_h_l657_c7_661b_iftrue,
n8_MUX_uxn_opcodes_h_l657_c7_661b_iffalse,
n8_MUX_uxn_opcodes_h_l657_c7_661b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l657_c7_661b
result_u16_value_MUX_uxn_opcodes_h_l657_c7_661b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l657_c7_661b_cond,
result_u16_value_MUX_uxn_opcodes_h_l657_c7_661b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l657_c7_661b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l657_c7_661b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_661b
result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_661b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_661b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_661b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_661b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_661b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l657_c7_661b
result_is_pc_updated_MUX_uxn_opcodes_h_l657_c7_661b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l657_c7_661b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l657_c7_661b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l657_c7_661b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l657_c7_661b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l657_c7_661b
result_sp_relative_shift_MUX_uxn_opcodes_h_l657_c7_661b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l657_c7_661b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l657_c7_661b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l657_c7_661b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l657_c7_661b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l657_c7_661b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l657_c7_661b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l657_c7_661b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l657_c7_661b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l657_c7_661b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l657_c7_661b_return_output);

-- t8_MUX_uxn_opcodes_h_l657_c7_661b
t8_MUX_uxn_opcodes_h_l657_c7_661b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l657_c7_661b_cond,
t8_MUX_uxn_opcodes_h_l657_c7_661b_iftrue,
t8_MUX_uxn_opcodes_h_l657_c7_661b_iffalse,
t8_MUX_uxn_opcodes_h_l657_c7_661b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l660_c11_4d5e
BIN_OP_EQ_uxn_opcodes_h_l660_c11_4d5e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l660_c11_4d5e_left,
BIN_OP_EQ_uxn_opcodes_h_l660_c11_4d5e_right,
BIN_OP_EQ_uxn_opcodes_h_l660_c11_4d5e_return_output);

-- n8_MUX_uxn_opcodes_h_l660_c7_fca4
n8_MUX_uxn_opcodes_h_l660_c7_fca4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l660_c7_fca4_cond,
n8_MUX_uxn_opcodes_h_l660_c7_fca4_iftrue,
n8_MUX_uxn_opcodes_h_l660_c7_fca4_iffalse,
n8_MUX_uxn_opcodes_h_l660_c7_fca4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_fca4
result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_fca4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_fca4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_fca4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_fca4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_fca4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l660_c7_fca4
result_u16_value_MUX_uxn_opcodes_h_l660_c7_fca4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l660_c7_fca4_cond,
result_u16_value_MUX_uxn_opcodes_h_l660_c7_fca4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l660_c7_fca4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l660_c7_fca4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_fca4
result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_fca4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_fca4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_fca4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_fca4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_fca4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_fca4
result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_fca4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_fca4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_fca4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_fca4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_fca4_return_output);

-- t8_MUX_uxn_opcodes_h_l660_c7_fca4
t8_MUX_uxn_opcodes_h_l660_c7_fca4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l660_c7_fca4_cond,
t8_MUX_uxn_opcodes_h_l660_c7_fca4_iftrue,
t8_MUX_uxn_opcodes_h_l660_c7_fca4_iffalse,
t8_MUX_uxn_opcodes_h_l660_c7_fca4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l663_c11_048b
BIN_OP_EQ_uxn_opcodes_h_l663_c11_048b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l663_c11_048b_left,
BIN_OP_EQ_uxn_opcodes_h_l663_c11_048b_right,
BIN_OP_EQ_uxn_opcodes_h_l663_c11_048b_return_output);

-- n8_MUX_uxn_opcodes_h_l663_c7_e852
n8_MUX_uxn_opcodes_h_l663_c7_e852 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l663_c7_e852_cond,
n8_MUX_uxn_opcodes_h_l663_c7_e852_iftrue,
n8_MUX_uxn_opcodes_h_l663_c7_e852_iffalse,
n8_MUX_uxn_opcodes_h_l663_c7_e852_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l663_c7_e852
result_is_opc_done_MUX_uxn_opcodes_h_l663_c7_e852 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l663_c7_e852_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l663_c7_e852_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l663_c7_e852_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l663_c7_e852_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l663_c7_e852
result_u16_value_MUX_uxn_opcodes_h_l663_c7_e852 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l663_c7_e852_cond,
result_u16_value_MUX_uxn_opcodes_h_l663_c7_e852_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l663_c7_e852_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l663_c7_e852_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l663_c7_e852
result_is_pc_updated_MUX_uxn_opcodes_h_l663_c7_e852 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l663_c7_e852_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l663_c7_e852_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l663_c7_e852_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l663_c7_e852_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c7_e852
result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c7_e852 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c7_e852_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c7_e852_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c7_e852_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c7_e852_return_output);

-- sp_relative_shift_uxn_opcodes_h_l666_c30_a979
sp_relative_shift_uxn_opcodes_h_l666_c30_a979 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l666_c30_a979_ins,
sp_relative_shift_uxn_opcodes_h_l666_c30_a979_x,
sp_relative_shift_uxn_opcodes_h_l666_c30_a979_y,
sp_relative_shift_uxn_opcodes_h_l666_c30_a979_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l668_c22_ccbf
BIN_OP_EQ_uxn_opcodes_h_l668_c22_ccbf : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l668_c22_ccbf_left,
BIN_OP_EQ_uxn_opcodes_h_l668_c22_ccbf_right,
BIN_OP_EQ_uxn_opcodes_h_l668_c22_ccbf_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l668_c37_284c
BIN_OP_PLUS_uxn_opcodes_h_l668_c37_284c : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l668_c37_284c_left,
BIN_OP_PLUS_uxn_opcodes_h_l668_c37_284c_right,
BIN_OP_PLUS_uxn_opcodes_h_l668_c37_284c_return_output);

-- MUX_uxn_opcodes_h_l668_c22_ad27
MUX_uxn_opcodes_h_l668_c22_ad27 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l668_c22_ad27_cond,
MUX_uxn_opcodes_h_l668_c22_ad27_iftrue,
MUX_uxn_opcodes_h_l668_c22_ad27_iffalse,
MUX_uxn_opcodes_h_l668_c22_ad27_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l670_c11_2002
BIN_OP_EQ_uxn_opcodes_h_l670_c11_2002 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l670_c11_2002_left,
BIN_OP_EQ_uxn_opcodes_h_l670_c11_2002_right,
BIN_OP_EQ_uxn_opcodes_h_l670_c11_2002_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_3b8f
result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_3b8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_3b8f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_3b8f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_3b8f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_3b8f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_3b8f
result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_3b8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_3b8f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_3b8f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_3b8f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_3b8f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c7_3b8f
result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c7_3b8f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c7_3b8f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c7_3b8f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c7_3b8f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c7_3b8f_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l650_c6_efb7_return_output,
 n8_MUX_uxn_opcodes_h_l650_c2_8867_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l650_c2_8867_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l650_c2_8867_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l650_c2_8867_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c2_8867_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c2_8867_return_output,
 t8_MUX_uxn_opcodes_h_l650_c2_8867_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l657_c11_0bb8_return_output,
 n8_MUX_uxn_opcodes_h_l657_c7_661b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l657_c7_661b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_661b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l657_c7_661b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l657_c7_661b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l657_c7_661b_return_output,
 t8_MUX_uxn_opcodes_h_l657_c7_661b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l660_c11_4d5e_return_output,
 n8_MUX_uxn_opcodes_h_l660_c7_fca4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_fca4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l660_c7_fca4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_fca4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_fca4_return_output,
 t8_MUX_uxn_opcodes_h_l660_c7_fca4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l663_c11_048b_return_output,
 n8_MUX_uxn_opcodes_h_l663_c7_e852_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l663_c7_e852_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l663_c7_e852_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l663_c7_e852_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c7_e852_return_output,
 sp_relative_shift_uxn_opcodes_h_l666_c30_a979_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l668_c22_ccbf_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l668_c37_284c_return_output,
 MUX_uxn_opcodes_h_l668_c22_ad27_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l670_c11_2002_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_3b8f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_3b8f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c7_3b8f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c6_efb7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c6_efb7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c6_efb7_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l650_c2_8867_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l650_c2_8867_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l657_c7_661b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l650_c2_8867_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l650_c2_8867_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l650_c2_8867_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l650_c2_8867_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l657_c7_661b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l650_c2_8867_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l650_c2_8867_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l650_c2_8867_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l650_c2_8867_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_661b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l650_c2_8867_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l650_c2_8867_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l650_c2_8867_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l650_c2_8867_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l657_c7_661b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l650_c2_8867_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l650_c2_8867_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c2_8867_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c2_8867_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l657_c7_661b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c2_8867_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c2_8867_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c2_8867_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l654_c3_d33e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c2_8867_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l657_c7_661b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c2_8867_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c2_8867_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l650_c2_8867_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l650_c2_8867_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l657_c7_661b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l650_c2_8867_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l650_c2_8867_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l657_c11_0bb8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l657_c11_0bb8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l657_c11_0bb8_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l657_c7_661b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l657_c7_661b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l660_c7_fca4_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l657_c7_661b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l657_c7_661b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l657_c7_661b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l660_c7_fca4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l657_c7_661b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_661b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_661b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_fca4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_661b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l657_c7_661b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l657_c7_661b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_fca4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l657_c7_661b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l657_c7_661b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l657_c7_661b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_fca4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l657_c7_661b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l657_c7_661b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l658_c3_f665 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l657_c7_661b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l657_c7_661b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l657_c7_661b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l657_c7_661b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l657_c7_661b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l660_c7_fca4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l657_c7_661b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_4d5e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_4d5e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_4d5e_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l660_c7_fca4_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l660_c7_fca4_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l663_c7_e852_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l660_c7_fca4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_fca4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_fca4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l663_c7_e852_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_fca4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l660_c7_fca4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l660_c7_fca4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l663_c7_e852_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l660_c7_fca4_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_fca4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_fca4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l663_c7_e852_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_fca4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_fca4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_fca4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c7_e852_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_fca4_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l660_c7_fca4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l660_c7_fca4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l660_c7_fca4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l663_c11_048b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l663_c11_048b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l663_c11_048b_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l663_c7_e852_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l663_c7_e852_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l663_c7_e852_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l663_c7_e852_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l663_c7_e852_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_3b8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l663_c7_e852_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l663_c7_e852_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l663_c7_e852_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l663_c7_e852_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l663_c7_e852_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l663_c7_e852_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_3b8f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l663_c7_e852_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c7_e852_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c7_e852_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c7_3b8f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c7_e852_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l666_c30_a979_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l666_c30_a979_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l666_c30_a979_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l666_c30_a979_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l668_c22_ad27_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l668_c22_ccbf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l668_c22_ccbf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l668_c22_ccbf_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l668_c22_ad27_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l668_c22_ad27_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l668_c37_284c_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l668_c42_a610_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l668_c37_284c_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l668_c37_284c_return_output : signed(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l668_c22_ad27_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c11_2002_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c11_2002_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c11_2002_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_3b8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_3b8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_3b8f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_3b8f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_3b8f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_3b8f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c7_3b8f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l671_c3_40a7 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c7_3b8f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c7_3b8f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l650_l663_l657_l660_DUPLICATE_34eb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l650_l657_l670_l660_DUPLICATE_9cce_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l650_l657_l670_l660_DUPLICATE_1dac_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l663_l657_l670_l660_DUPLICATE_1263_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6e0b_uxn_opcodes_h_l676_l646_DUPLICATE_04f5_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_4d5e_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l663_c7_e852_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l650_c2_8867_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l666_c30_a979_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c11_2002_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l654_c3_d33e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c2_8867_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l654_c3_d33e;
     VAR_sp_relative_shift_uxn_opcodes_h_l666_c30_a979_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_3b8f_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l658_c3_f665 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l657_c7_661b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l658_c3_f665;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l671_c3_40a7 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c7_3b8f_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l671_c3_40a7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c6_efb7_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_3b8f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l663_c11_048b_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l668_c22_ccbf_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l657_c11_0bb8_right := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l666_c30_a979_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l650_c2_8867_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l657_c7_661b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l660_c7_fca4_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l663_c7_e852_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l668_c37_284c_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_MUX_uxn_opcodes_h_l668_c22_ad27_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c6_efb7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l657_c11_0bb8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_4d5e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l663_c11_048b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c11_2002_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l668_c22_ccbf_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l663_c7_e852_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l660_c7_fca4_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l650_c2_8867_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l657_c7_661b_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l660_c7_fca4_iffalse := t8;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l650_l657_l670_l660_DUPLICATE_1dac LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l650_l657_l670_l660_DUPLICATE_1dac_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l650_c6_efb7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l650_c6_efb7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c6_efb7_left;
     BIN_OP_EQ_uxn_opcodes_h_l650_c6_efb7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c6_efb7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c6_efb7_return_output := BIN_OP_EQ_uxn_opcodes_h_l650_c6_efb7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l663_l657_l670_l660_DUPLICATE_1263 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l663_l657_l670_l660_DUPLICATE_1263_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l668_c22_ccbf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l668_c22_ccbf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l668_c22_ccbf_left;
     BIN_OP_EQ_uxn_opcodes_h_l668_c22_ccbf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l668_c22_ccbf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l668_c22_ccbf_return_output := BIN_OP_EQ_uxn_opcodes_h_l668_c22_ccbf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l657_c11_0bb8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l657_c11_0bb8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l657_c11_0bb8_left;
     BIN_OP_EQ_uxn_opcodes_h_l657_c11_0bb8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l657_c11_0bb8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l657_c11_0bb8_return_output := BIN_OP_EQ_uxn_opcodes_h_l657_c11_0bb8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l670_c11_2002] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l670_c11_2002_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c11_2002_left;
     BIN_OP_EQ_uxn_opcodes_h_l670_c11_2002_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c11_2002_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c11_2002_return_output := BIN_OP_EQ_uxn_opcodes_h_l670_c11_2002_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l657_c7_661b] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l657_c7_661b_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l663_c11_048b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l663_c11_048b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l663_c11_048b_left;
     BIN_OP_EQ_uxn_opcodes_h_l663_c11_048b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l663_c11_048b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l663_c11_048b_return_output := BIN_OP_EQ_uxn_opcodes_h_l663_c11_048b_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l666_c30_a979] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l666_c30_a979_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l666_c30_a979_ins;
     sp_relative_shift_uxn_opcodes_h_l666_c30_a979_x <= VAR_sp_relative_shift_uxn_opcodes_h_l666_c30_a979_x;
     sp_relative_shift_uxn_opcodes_h_l666_c30_a979_y <= VAR_sp_relative_shift_uxn_opcodes_h_l666_c30_a979_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l666_c30_a979_return_output := sp_relative_shift_uxn_opcodes_h_l666_c30_a979_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l650_l663_l657_l660_DUPLICATE_34eb LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l650_l663_l657_l660_DUPLICATE_34eb_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l650_l657_l670_l660_DUPLICATE_9cce LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l650_l657_l670_l660_DUPLICATE_9cce_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l660_c11_4d5e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l660_c11_4d5e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_4d5e_left;
     BIN_OP_EQ_uxn_opcodes_h_l660_c11_4d5e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_4d5e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_4d5e_return_output := BIN_OP_EQ_uxn_opcodes_h_l660_c11_4d5e_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l668_c42_a610] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l668_c42_a610_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l650_c2_8867_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c6_efb7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l650_c2_8867_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c6_efb7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l650_c2_8867_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c6_efb7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c2_8867_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c6_efb7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c2_8867_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c6_efb7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l650_c2_8867_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c6_efb7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l650_c2_8867_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c6_efb7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l657_c7_661b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l657_c11_0bb8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_661b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l657_c11_0bb8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l657_c7_661b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l657_c11_0bb8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l657_c7_661b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l657_c11_0bb8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l657_c7_661b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l657_c11_0bb8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l657_c7_661b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l657_c11_0bb8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l657_c7_661b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l657_c11_0bb8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l660_c7_fca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_4d5e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_fca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_4d5e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_fca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_4d5e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_fca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_4d5e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l660_c7_fca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_4d5e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l660_c7_fca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l660_c11_4d5e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l663_c7_e852_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l663_c11_048b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l663_c7_e852_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l663_c11_048b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l663_c7_e852_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l663_c11_048b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c7_e852_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l663_c11_048b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l663_c7_e852_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l663_c11_048b_return_output;
     VAR_MUX_uxn_opcodes_h_l668_c22_ad27_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l668_c22_ccbf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_3b8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c11_2002_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_3b8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c11_2002_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c7_3b8f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l670_c11_2002_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l668_c37_284c_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l668_c42_a610_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c2_8867_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l650_l657_l670_l660_DUPLICATE_1dac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l657_c7_661b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l650_l657_l670_l660_DUPLICATE_1dac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_fca4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l650_l657_l670_l660_DUPLICATE_1dac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c7_3b8f_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l650_l657_l670_l660_DUPLICATE_1dac_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l650_c2_8867_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l650_l663_l657_l660_DUPLICATE_34eb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l657_c7_661b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l650_l663_l657_l660_DUPLICATE_34eb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l660_c7_fca4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l650_l663_l657_l660_DUPLICATE_34eb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l663_c7_e852_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l650_l663_l657_l660_DUPLICATE_34eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_661b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l663_l657_l670_l660_DUPLICATE_1263_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_fca4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l663_l657_l670_l660_DUPLICATE_1263_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l663_c7_e852_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l663_l657_l670_l660_DUPLICATE_1263_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_3b8f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l663_l657_l670_l660_DUPLICATE_1263_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l650_c2_8867_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l650_l657_l670_l660_DUPLICATE_9cce_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l657_c7_661b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l650_l657_l670_l660_DUPLICATE_9cce_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_fca4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l650_l657_l670_l660_DUPLICATE_9cce_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_3b8f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l650_l657_l670_l660_DUPLICATE_9cce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l657_c7_661b_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l657_c7_661b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c7_e852_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l666_c30_a979_return_output;
     -- t8_MUX[uxn_opcodes_h_l660_c7_fca4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l660_c7_fca4_cond <= VAR_t8_MUX_uxn_opcodes_h_l660_c7_fca4_cond;
     t8_MUX_uxn_opcodes_h_l660_c7_fca4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l660_c7_fca4_iftrue;
     t8_MUX_uxn_opcodes_h_l660_c7_fca4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l660_c7_fca4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l660_c7_fca4_return_output := t8_MUX_uxn_opcodes_h_l660_c7_fca4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l670_c7_3b8f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c7_3b8f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c7_3b8f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c7_3b8f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c7_3b8f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c7_3b8f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c7_3b8f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c7_3b8f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c7_3b8f_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l668_c37_284c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l668_c37_284c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l668_c37_284c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l668_c37_284c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l668_c37_284c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l668_c37_284c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l668_c37_284c_return_output;

     -- n8_MUX[uxn_opcodes_h_l663_c7_e852] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l663_c7_e852_cond <= VAR_n8_MUX_uxn_opcodes_h_l663_c7_e852_cond;
     n8_MUX_uxn_opcodes_h_l663_c7_e852_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l663_c7_e852_iftrue;
     n8_MUX_uxn_opcodes_h_l663_c7_e852_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l663_c7_e852_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l663_c7_e852_return_output := n8_MUX_uxn_opcodes_h_l663_c7_e852_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l657_c7_661b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l657_c7_661b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l657_c7_661b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l657_c7_661b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l657_c7_661b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l657_c7_661b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l657_c7_661b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l657_c7_661b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l657_c7_661b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l670_c7_3b8f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_3b8f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_3b8f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_3b8f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_3b8f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_3b8f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_3b8f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_3b8f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_3b8f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l670_c7_3b8f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_3b8f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_3b8f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_3b8f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_3b8f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_3b8f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_3b8f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_3b8f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_3b8f_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l668_c22_ad27_iffalse := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l668_c37_284c_return_output)),16);
     VAR_n8_MUX_uxn_opcodes_h_l660_c7_fca4_iffalse := VAR_n8_MUX_uxn_opcodes_h_l663_c7_e852_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l663_c7_e852_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l670_c7_3b8f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l663_c7_e852_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l670_c7_3b8f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c7_e852_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l670_c7_3b8f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c2_8867_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l657_c7_661b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l657_c7_661b_iffalse := VAR_t8_MUX_uxn_opcodes_h_l660_c7_fca4_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l663_c7_e852] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c7_e852_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c7_e852_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c7_e852_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c7_e852_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c7_e852_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c7_e852_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c7_e852_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c7_e852_return_output;

     -- MUX[uxn_opcodes_h_l668_c22_ad27] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l668_c22_ad27_cond <= VAR_MUX_uxn_opcodes_h_l668_c22_ad27_cond;
     MUX_uxn_opcodes_h_l668_c22_ad27_iftrue <= VAR_MUX_uxn_opcodes_h_l668_c22_ad27_iftrue;
     MUX_uxn_opcodes_h_l668_c22_ad27_iffalse <= VAR_MUX_uxn_opcodes_h_l668_c22_ad27_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l668_c22_ad27_return_output := MUX_uxn_opcodes_h_l668_c22_ad27_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l663_c7_e852] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l663_c7_e852_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l663_c7_e852_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l663_c7_e852_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l663_c7_e852_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l663_c7_e852_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l663_c7_e852_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l663_c7_e852_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l663_c7_e852_return_output;

     -- t8_MUX[uxn_opcodes_h_l657_c7_661b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l657_c7_661b_cond <= VAR_t8_MUX_uxn_opcodes_h_l657_c7_661b_cond;
     t8_MUX_uxn_opcodes_h_l657_c7_661b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l657_c7_661b_iftrue;
     t8_MUX_uxn_opcodes_h_l657_c7_661b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l657_c7_661b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l657_c7_661b_return_output := t8_MUX_uxn_opcodes_h_l657_c7_661b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l663_c7_e852] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l663_c7_e852_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l663_c7_e852_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l663_c7_e852_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l663_c7_e852_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l663_c7_e852_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l663_c7_e852_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l663_c7_e852_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l663_c7_e852_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l650_c2_8867] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c2_8867_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c2_8867_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c2_8867_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c2_8867_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c2_8867_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c2_8867_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c2_8867_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c2_8867_return_output;

     -- n8_MUX[uxn_opcodes_h_l660_c7_fca4] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l660_c7_fca4_cond <= VAR_n8_MUX_uxn_opcodes_h_l660_c7_fca4_cond;
     n8_MUX_uxn_opcodes_h_l660_c7_fca4_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l660_c7_fca4_iftrue;
     n8_MUX_uxn_opcodes_h_l660_c7_fca4_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l660_c7_fca4_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l660_c7_fca4_return_output := n8_MUX_uxn_opcodes_h_l660_c7_fca4_return_output;

     -- Submodule level 3
     VAR_result_u16_value_MUX_uxn_opcodes_h_l663_c7_e852_iftrue := VAR_MUX_uxn_opcodes_h_l668_c22_ad27_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l657_c7_661b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l660_c7_fca4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_fca4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l663_c7_e852_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_fca4_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l663_c7_e852_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_fca4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l663_c7_e852_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l650_c2_8867_iffalse := VAR_t8_MUX_uxn_opcodes_h_l657_c7_661b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l660_c7_fca4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_fca4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_fca4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_fca4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_fca4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_fca4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_fca4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_fca4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_fca4_return_output;

     -- n8_MUX[uxn_opcodes_h_l657_c7_661b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l657_c7_661b_cond <= VAR_n8_MUX_uxn_opcodes_h_l657_c7_661b_cond;
     n8_MUX_uxn_opcodes_h_l657_c7_661b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l657_c7_661b_iftrue;
     n8_MUX_uxn_opcodes_h_l657_c7_661b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l657_c7_661b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l657_c7_661b_return_output := n8_MUX_uxn_opcodes_h_l657_c7_661b_return_output;

     -- t8_MUX[uxn_opcodes_h_l650_c2_8867] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l650_c2_8867_cond <= VAR_t8_MUX_uxn_opcodes_h_l650_c2_8867_cond;
     t8_MUX_uxn_opcodes_h_l650_c2_8867_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l650_c2_8867_iftrue;
     t8_MUX_uxn_opcodes_h_l650_c2_8867_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l650_c2_8867_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l650_c2_8867_return_output := t8_MUX_uxn_opcodes_h_l650_c2_8867_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l663_c7_e852] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l663_c7_e852_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l663_c7_e852_cond;
     result_u16_value_MUX_uxn_opcodes_h_l663_c7_e852_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l663_c7_e852_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l663_c7_e852_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l663_c7_e852_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l663_c7_e852_return_output := result_u16_value_MUX_uxn_opcodes_h_l663_c7_e852_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l660_c7_fca4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_fca4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_fca4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_fca4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_fca4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_fca4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_fca4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_fca4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_fca4_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l660_c7_fca4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_fca4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_fca4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_fca4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_fca4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_fca4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_fca4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_fca4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_fca4_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l650_c2_8867_iffalse := VAR_n8_MUX_uxn_opcodes_h_l657_c7_661b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_661b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l660_c7_fca4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l657_c7_661b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l660_c7_fca4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l657_c7_661b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l660_c7_fca4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l660_c7_fca4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l663_c7_e852_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l650_c2_8867_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l657_c7_661b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l657_c7_661b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l657_c7_661b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l657_c7_661b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l657_c7_661b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l657_c7_661b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l657_c7_661b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l657_c7_661b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l657_c7_661b_return_output;

     -- n8_MUX[uxn_opcodes_h_l650_c2_8867] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l650_c2_8867_cond <= VAR_n8_MUX_uxn_opcodes_h_l650_c2_8867_cond;
     n8_MUX_uxn_opcodes_h_l650_c2_8867_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l650_c2_8867_iftrue;
     n8_MUX_uxn_opcodes_h_l650_c2_8867_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l650_c2_8867_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l650_c2_8867_return_output := n8_MUX_uxn_opcodes_h_l650_c2_8867_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l660_c7_fca4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l660_c7_fca4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l660_c7_fca4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l660_c7_fca4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l660_c7_fca4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l660_c7_fca4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l660_c7_fca4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l660_c7_fca4_return_output := result_u16_value_MUX_uxn_opcodes_h_l660_c7_fca4_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l657_c7_661b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l657_c7_661b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l657_c7_661b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l657_c7_661b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l657_c7_661b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l657_c7_661b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l657_c7_661b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l657_c7_661b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l657_c7_661b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l657_c7_661b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_661b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_661b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_661b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_661b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_661b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_661b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_661b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_661b_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l650_c2_8867_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l650_c2_8867_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l657_c7_661b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l650_c2_8867_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l657_c7_661b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c2_8867_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l657_c7_661b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l657_c7_661b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l660_c7_fca4_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l650_c2_8867] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c2_8867_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c2_8867_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c2_8867_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c2_8867_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c2_8867_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c2_8867_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c2_8867_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c2_8867_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l657_c7_661b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l657_c7_661b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l657_c7_661b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l657_c7_661b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l657_c7_661b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l657_c7_661b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l657_c7_661b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l657_c7_661b_return_output := result_u16_value_MUX_uxn_opcodes_h_l657_c7_661b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l650_c2_8867] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l650_c2_8867_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l650_c2_8867_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l650_c2_8867_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l650_c2_8867_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l650_c2_8867_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l650_c2_8867_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l650_c2_8867_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l650_c2_8867_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l650_c2_8867] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l650_c2_8867_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l650_c2_8867_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l650_c2_8867_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l650_c2_8867_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l650_c2_8867_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l650_c2_8867_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l650_c2_8867_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l650_c2_8867_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l650_c2_8867_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l657_c7_661b_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l650_c2_8867] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l650_c2_8867_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l650_c2_8867_cond;
     result_u16_value_MUX_uxn_opcodes_h_l650_c2_8867_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l650_c2_8867_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l650_c2_8867_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l650_c2_8867_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l650_c2_8867_return_output := result_u16_value_MUX_uxn_opcodes_h_l650_c2_8867_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6e0b_uxn_opcodes_h_l676_l646_DUPLICATE_04f5 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6e0b_uxn_opcodes_h_l676_l646_DUPLICATE_04f5_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6e0b(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l650_c2_8867_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l650_c2_8867_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l650_c2_8867_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l650_c2_8867_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l650_c2_8867_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6e0b_uxn_opcodes_h_l676_l646_DUPLICATE_04f5_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6e0b_uxn_opcodes_h_l676_l646_DUPLICATE_04f5_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
