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
-- Submodules: 33
entity jmp_0CLK_b7103d16 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jmp_0CLK_b7103d16;
architecture arch of jmp_0CLK_b7103d16 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : signed(7 downto 0) := to_signed(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : signed(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l584_c6_c390]
signal BIN_OP_EQ_uxn_opcodes_h_l584_c6_c390_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l584_c6_c390_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l584_c6_c390_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l584_c1_1106]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_1106_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_1106_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_1106_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_1106_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l584_c2_5cef]
signal t8_MUX_uxn_opcodes_h_l584_c2_5cef_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l584_c2_5cef_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l584_c2_5cef_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l584_c2_5cef_return_output : signed(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l584_c2_5cef]
signal result_u16_value_MUX_uxn_opcodes_h_l584_c2_5cef_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l584_c2_5cef_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l584_c2_5cef_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l584_c2_5cef_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l584_c2_5cef]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_5cef_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_5cef_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_5cef_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_5cef_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l584_c2_5cef]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5cef_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5cef_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5cef_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5cef_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l584_c2_5cef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5cef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5cef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5cef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5cef_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l584_c2_5cef]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5cef_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5cef_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5cef_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5cef_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l584_c2_5cef]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5cef_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5cef_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5cef_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5cef_return_output : signed(3 downto 0);

-- printf_uxn_opcodes_h_l585_c3_c098[uxn_opcodes_h_l585_c3_c098]
signal printf_uxn_opcodes_h_l585_c3_c098_uxn_opcodes_h_l585_c3_c098_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l589_c11_8756]
signal BIN_OP_EQ_uxn_opcodes_h_l589_c11_8756_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l589_c11_8756_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l589_c11_8756_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l589_c7_1c89]
signal t8_MUX_uxn_opcodes_h_l589_c7_1c89_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l589_c7_1c89_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l589_c7_1c89_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l589_c7_1c89_return_output : signed(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l589_c7_1c89]
signal result_u16_value_MUX_uxn_opcodes_h_l589_c7_1c89_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l589_c7_1c89_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l589_c7_1c89_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l589_c7_1c89_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l589_c7_1c89]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_1c89_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_1c89_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_1c89_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_1c89_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l589_c7_1c89]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_1c89_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_1c89_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_1c89_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_1c89_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l589_c7_1c89]
signal result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_1c89_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_1c89_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_1c89_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_1c89_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l589_c7_1c89]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_1c89_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_1c89_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_1c89_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_1c89_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l589_c7_1c89]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_1c89_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_1c89_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_1c89_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_1c89_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l592_c11_ac0a]
signal BIN_OP_EQ_uxn_opcodes_h_l592_c11_ac0a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l592_c11_ac0a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l592_c11_ac0a_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l592_c7_d7e7]
signal t8_MUX_uxn_opcodes_h_l592_c7_d7e7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l592_c7_d7e7_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l592_c7_d7e7_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l592_c7_d7e7_return_output : signed(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l592_c7_d7e7]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_d7e7_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_d7e7_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_d7e7_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_d7e7_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l592_c7_d7e7]
signal result_u16_value_MUX_uxn_opcodes_h_l592_c7_d7e7_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l592_c7_d7e7_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l592_c7_d7e7_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l592_c7_d7e7_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l592_c7_d7e7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l592_c7_d7e7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_d7e7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_d7e7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_d7e7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_d7e7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l592_c7_d7e7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_return_output : signed(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l595_c30_34c6]
signal sp_relative_shift_uxn_opcodes_h_l595_c30_34c6_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l595_c30_34c6_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l595_c30_34c6_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l595_c30_34c6_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l597_c22_59df]
signal BIN_OP_PLUS_uxn_opcodes_h_l597_c22_59df_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l597_c22_59df_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l597_c22_59df_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l599_c11_01c1]
signal BIN_OP_EQ_uxn_opcodes_h_l599_c11_01c1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l599_c11_01c1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l599_c11_01c1_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l599_c7_5ef8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_5ef8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_5ef8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_5ef8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_5ef8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l599_c7_5ef8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_5ef8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_5ef8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_5ef8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_5ef8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l599_c7_5ef8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_5ef8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_5ef8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_5ef8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_5ef8_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_660c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l584_c6_c390
BIN_OP_EQ_uxn_opcodes_h_l584_c6_c390 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l584_c6_c390_left,
BIN_OP_EQ_uxn_opcodes_h_l584_c6_c390_right,
BIN_OP_EQ_uxn_opcodes_h_l584_c6_c390_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_1106
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_1106 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_1106_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_1106_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_1106_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_1106_return_output);

-- t8_MUX_uxn_opcodes_h_l584_c2_5cef
t8_MUX_uxn_opcodes_h_l584_c2_5cef : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l584_c2_5cef_cond,
t8_MUX_uxn_opcodes_h_l584_c2_5cef_iftrue,
t8_MUX_uxn_opcodes_h_l584_c2_5cef_iffalse,
t8_MUX_uxn_opcodes_h_l584_c2_5cef_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l584_c2_5cef
result_u16_value_MUX_uxn_opcodes_h_l584_c2_5cef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l584_c2_5cef_cond,
result_u16_value_MUX_uxn_opcodes_h_l584_c2_5cef_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l584_c2_5cef_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l584_c2_5cef_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_5cef
result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_5cef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_5cef_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_5cef_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_5cef_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_5cef_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5cef
result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5cef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5cef_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5cef_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5cef_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5cef_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5cef
result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5cef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5cef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5cef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5cef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5cef_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5cef
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5cef : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5cef_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5cef_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5cef_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5cef_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5cef
result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5cef : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5cef_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5cef_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5cef_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5cef_return_output);

-- printf_uxn_opcodes_h_l585_c3_c098_uxn_opcodes_h_l585_c3_c098
printf_uxn_opcodes_h_l585_c3_c098_uxn_opcodes_h_l585_c3_c098 : entity work.printf_uxn_opcodes_h_l585_c3_c098_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l585_c3_c098_uxn_opcodes_h_l585_c3_c098_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l589_c11_8756
BIN_OP_EQ_uxn_opcodes_h_l589_c11_8756 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l589_c11_8756_left,
BIN_OP_EQ_uxn_opcodes_h_l589_c11_8756_right,
BIN_OP_EQ_uxn_opcodes_h_l589_c11_8756_return_output);

-- t8_MUX_uxn_opcodes_h_l589_c7_1c89
t8_MUX_uxn_opcodes_h_l589_c7_1c89 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l589_c7_1c89_cond,
t8_MUX_uxn_opcodes_h_l589_c7_1c89_iftrue,
t8_MUX_uxn_opcodes_h_l589_c7_1c89_iffalse,
t8_MUX_uxn_opcodes_h_l589_c7_1c89_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l589_c7_1c89
result_u16_value_MUX_uxn_opcodes_h_l589_c7_1c89 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l589_c7_1c89_cond,
result_u16_value_MUX_uxn_opcodes_h_l589_c7_1c89_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l589_c7_1c89_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l589_c7_1c89_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_1c89
result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_1c89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_1c89_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_1c89_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_1c89_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_1c89_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_1c89
result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_1c89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_1c89_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_1c89_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_1c89_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_1c89_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_1c89
result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_1c89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_1c89_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_1c89_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_1c89_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_1c89_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_1c89
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_1c89 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_1c89_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_1c89_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_1c89_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_1c89_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_1c89
result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_1c89 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_1c89_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_1c89_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_1c89_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_1c89_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l592_c11_ac0a
BIN_OP_EQ_uxn_opcodes_h_l592_c11_ac0a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l592_c11_ac0a_left,
BIN_OP_EQ_uxn_opcodes_h_l592_c11_ac0a_right,
BIN_OP_EQ_uxn_opcodes_h_l592_c11_ac0a_return_output);

-- t8_MUX_uxn_opcodes_h_l592_c7_d7e7
t8_MUX_uxn_opcodes_h_l592_c7_d7e7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l592_c7_d7e7_cond,
t8_MUX_uxn_opcodes_h_l592_c7_d7e7_iftrue,
t8_MUX_uxn_opcodes_h_l592_c7_d7e7_iffalse,
t8_MUX_uxn_opcodes_h_l592_c7_d7e7_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_d7e7
result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_d7e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_d7e7_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_d7e7_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_d7e7_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_d7e7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l592_c7_d7e7
result_u16_value_MUX_uxn_opcodes_h_l592_c7_d7e7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l592_c7_d7e7_cond,
result_u16_value_MUX_uxn_opcodes_h_l592_c7_d7e7_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l592_c7_d7e7_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l592_c7_d7e7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_d7e7
result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_d7e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_d7e7
result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_d7e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_d7e7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_d7e7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_d7e7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_d7e7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_d7e7
result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_d7e7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_return_output);

-- sp_relative_shift_uxn_opcodes_h_l595_c30_34c6
sp_relative_shift_uxn_opcodes_h_l595_c30_34c6 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l595_c30_34c6_ins,
sp_relative_shift_uxn_opcodes_h_l595_c30_34c6_x,
sp_relative_shift_uxn_opcodes_h_l595_c30_34c6_y,
sp_relative_shift_uxn_opcodes_h_l595_c30_34c6_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l597_c22_59df
BIN_OP_PLUS_uxn_opcodes_h_l597_c22_59df : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l597_c22_59df_left,
BIN_OP_PLUS_uxn_opcodes_h_l597_c22_59df_right,
BIN_OP_PLUS_uxn_opcodes_h_l597_c22_59df_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l599_c11_01c1
BIN_OP_EQ_uxn_opcodes_h_l599_c11_01c1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l599_c11_01c1_left,
BIN_OP_EQ_uxn_opcodes_h_l599_c11_01c1_right,
BIN_OP_EQ_uxn_opcodes_h_l599_c11_01c1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_5ef8
result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_5ef8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_5ef8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_5ef8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_5ef8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_5ef8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_5ef8
result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_5ef8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_5ef8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_5ef8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_5ef8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_5ef8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_5ef8
result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_5ef8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_5ef8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_5ef8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_5ef8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_5ef8_return_output);



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
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l584_c6_c390_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_1106_return_output,
 t8_MUX_uxn_opcodes_h_l584_c2_5cef_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l584_c2_5cef_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_5cef_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5cef_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5cef_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5cef_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5cef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l589_c11_8756_return_output,
 t8_MUX_uxn_opcodes_h_l589_c7_1c89_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l589_c7_1c89_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_1c89_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_1c89_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_1c89_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_1c89_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_1c89_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l592_c11_ac0a_return_output,
 t8_MUX_uxn_opcodes_h_l592_c7_d7e7_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_d7e7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l592_c7_d7e7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_d7e7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_return_output,
 sp_relative_shift_uxn_opcodes_h_l595_c30_34c6_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l597_c22_59df_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l599_c11_01c1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_5ef8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_5ef8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_5ef8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_c390_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_c390_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_c390_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_1106_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_1106_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_1106_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_1106_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l584_c2_5cef_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l584_c2_5cef_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l589_c7_1c89_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l584_c2_5cef_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l584_c2_5cef_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l584_c2_5cef_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l584_c2_5cef_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_1c89_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l584_c2_5cef_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l584_c2_5cef_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_5cef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_5cef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_1c89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_5cef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_5cef_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5cef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5cef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_1c89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5cef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5cef_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5cef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5cef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_1c89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5cef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5cef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5cef_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l586_c3_cef2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5cef_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_1c89_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5cef_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5cef_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5cef_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5cef_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_1c89_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5cef_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5cef_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l585_c3_c098_uxn_opcodes_h_l585_c3_c098_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_8756_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_8756_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_8756_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l589_c7_1c89_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l589_c7_1c89_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l592_c7_d7e7_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l589_c7_1c89_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_1c89_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_1c89_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_d7e7_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_1c89_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_1c89_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_1c89_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_d7e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_1c89_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_1c89_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_1c89_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_1c89_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_1c89_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_1c89_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_d7e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_1c89_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_1c89_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l590_c3_c7ae : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_1c89_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l589_c7_1c89_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_1c89_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_1c89_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_1c89_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_1c89_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_ac0a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_ac0a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_ac0a_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l592_c7_d7e7_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l592_c7_d7e7_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l592_c7_d7e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_d7e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_d7e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_5ef8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_d7e7_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_d7e7_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l597_c3_8778 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_d7e7_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_d7e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_5ef8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_d7e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_d7e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_5ef8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_d7e7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l593_c8_6293_return_output : signed(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_34c6_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_34c6_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_34c6_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_34c6_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l597_c22_59df_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l597_c22_59df_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l597_c22_59df_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_01c1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_01c1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_01c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_5ef8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_5ef8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_5ef8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_5ef8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_5ef8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_5ef8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_5ef8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_5ef8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_5ef8_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l584_l592_l589_DUPLICATE_0881_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l584_l589_l599_DUPLICATE_767b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l584_l589_l599_DUPLICATE_f2c1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l584_l592_l589_DUPLICATE_a873_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l592_l589_l599_DUPLICATE_2239_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_660c_uxn_opcodes_h_l605_l580_DUPLICATE_2a24_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : signed(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_8756_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l590_c3_c7ae := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_1c89_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l590_c3_c7ae;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l586_c3_cef2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5cef_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l586_c3_cef2;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_01c1_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_d7e7_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_5ef8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_ac0a_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_5ef8_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_1106_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5cef_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_c390_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_34c6_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_5ef8_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_34c6_y := resize(to_signed(-1, 2), 4);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_1106_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_34c6_ins := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l597_c22_59df_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_c390_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_8756_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_ac0a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_01c1_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l584_c2_5cef_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l589_c7_1c89_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l592_c7_d7e7_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l584_l589_l599_DUPLICATE_f2c1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l584_l589_l599_DUPLICATE_f2c1_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l599_c11_01c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l599_c11_01c1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_01c1_left;
     BIN_OP_EQ_uxn_opcodes_h_l599_c11_01c1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_01c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_01c1_return_output := BIN_OP_EQ_uxn_opcodes_h_l599_c11_01c1_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l584_l589_l599_DUPLICATE_767b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l584_l589_l599_DUPLICATE_767b_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l592_l589_l599_DUPLICATE_2239 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l592_l589_l599_DUPLICATE_2239_return_output := result.is_opc_done;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l584_l592_l589_DUPLICATE_a873 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l584_l592_l589_DUPLICATE_a873_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l592_c11_ac0a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l592_c11_ac0a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_ac0a_left;
     BIN_OP_EQ_uxn_opcodes_h_l592_c11_ac0a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_ac0a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_ac0a_return_output := BIN_OP_EQ_uxn_opcodes_h_l592_c11_ac0a_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l584_l592_l589_DUPLICATE_0881 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l584_l592_l589_DUPLICATE_0881_return_output := result.u16_value;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l589_c7_1c89] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l589_c7_1c89_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l589_c11_8756] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l589_c11_8756_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_8756_left;
     BIN_OP_EQ_uxn_opcodes_h_l589_c11_8756_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_8756_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_8756_return_output := BIN_OP_EQ_uxn_opcodes_h_l589_c11_8756_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l584_c6_c390] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l584_c6_c390_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_c390_left;
     BIN_OP_EQ_uxn_opcodes_h_l584_c6_c390_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_c390_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_c390_return_output := BIN_OP_EQ_uxn_opcodes_h_l584_c6_c390_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l595_c30_34c6] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l595_c30_34c6_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_34c6_ins;
     sp_relative_shift_uxn_opcodes_h_l595_c30_34c6_x <= VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_34c6_x;
     sp_relative_shift_uxn_opcodes_h_l595_c30_34c6_y <= VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_34c6_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_34c6_return_output := sp_relative_shift_uxn_opcodes_h_l595_c30_34c6_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l593_c8_6293] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l593_c8_6293_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_1106_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_c390_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5cef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_c390_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_5cef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_c390_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5cef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_c390_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5cef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_c390_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5cef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_c390_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l584_c2_5cef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_c390_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l584_c2_5cef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l584_c6_c390_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_1c89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_8756_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_1c89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_8756_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_1c89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_8756_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_1c89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_8756_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_1c89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_8756_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_1c89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_8756_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l589_c7_1c89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l589_c11_8756_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_d7e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_ac0a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_d7e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_ac0a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_ac0a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_ac0a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_d7e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_ac0a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l592_c7_d7e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l592_c11_ac0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_5ef8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_01c1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_5ef8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_01c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_5ef8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_01c1_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l597_c22_59df_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l593_c8_6293_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l592_c7_d7e7_iftrue := VAR_CAST_TO_int8_t_uxn_opcodes_h_l593_c8_6293_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5cef_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l584_l592_l589_DUPLICATE_a873_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_1c89_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l584_l592_l589_DUPLICATE_a873_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l584_l592_l589_DUPLICATE_a873_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l584_c2_5cef_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l584_l592_l589_DUPLICATE_0881_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_1c89_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l584_l592_l589_DUPLICATE_0881_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_d7e7_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l584_l592_l589_DUPLICATE_0881_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_1c89_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l592_l589_l599_DUPLICATE_2239_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_d7e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l592_l589_l599_DUPLICATE_2239_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_5ef8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l592_l589_l599_DUPLICATE_2239_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_5cef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l584_l589_l599_DUPLICATE_767b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_1c89_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l584_l589_l599_DUPLICATE_767b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_5ef8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l584_l589_l599_DUPLICATE_767b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5cef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l584_l589_l599_DUPLICATE_f2c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_1c89_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l584_l589_l599_DUPLICATE_f2c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_5ef8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l584_l589_l599_DUPLICATE_f2c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_1c89_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l589_c7_1c89_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l595_c30_34c6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l599_c7_5ef8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_5ef8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_5ef8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_5ef8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_5ef8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_5ef8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_5ef8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_5ef8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_5ef8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l589_c7_1c89] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_1c89_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_1c89_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_1c89_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_1c89_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_1c89_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_1c89_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_1c89_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_1c89_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l599_c7_5ef8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_5ef8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_5ef8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_5ef8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_5ef8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_5ef8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_5ef8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_5ef8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_5ef8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l584_c1_1106] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_1106_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_1106_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_1106_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_1106_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_1106_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_1106_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_1106_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_1106_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l599_c7_5ef8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_5ef8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_5ef8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_5ef8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_5ef8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_5ef8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_5ef8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_5ef8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_5ef8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l592_c7_d7e7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_return_output;

     -- t8_MUX[uxn_opcodes_h_l592_c7_d7e7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l592_c7_d7e7_cond <= VAR_t8_MUX_uxn_opcodes_h_l592_c7_d7e7_cond;
     t8_MUX_uxn_opcodes_h_l592_c7_d7e7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l592_c7_d7e7_iftrue;
     t8_MUX_uxn_opcodes_h_l592_c7_d7e7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l592_c7_d7e7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l592_c7_d7e7_return_output := t8_MUX_uxn_opcodes_h_l592_c7_d7e7_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l597_c22_59df] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l597_c22_59df_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l597_c22_59df_left;
     BIN_OP_PLUS_uxn_opcodes_h_l597_c22_59df_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l597_c22_59df_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l597_c22_59df_return_output := BIN_OP_PLUS_uxn_opcodes_h_l597_c22_59df_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l597_c3_8778 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l597_c22_59df_return_output)),16);
     VAR_printf_uxn_opcodes_h_l585_c3_c098_uxn_opcodes_h_l585_c3_c098_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l584_c1_1106_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_d7e7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_5ef8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_d7e7_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_5ef8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_5ef8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_1c89_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5cef_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l589_c7_1c89_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l589_c7_1c89_iffalse := VAR_t8_MUX_uxn_opcodes_h_l592_c7_d7e7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_d7e7_iftrue := VAR_result_u16_value_uxn_opcodes_h_l597_c3_8778;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l592_c7_d7e7] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_d7e7_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_d7e7_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_d7e7_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_d7e7_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_d7e7_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_d7e7_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_d7e7_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_d7e7_return_output;

     -- printf_uxn_opcodes_h_l585_c3_c098[uxn_opcodes_h_l585_c3_c098] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l585_c3_c098_uxn_opcodes_h_l585_c3_c098_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l585_c3_c098_uxn_opcodes_h_l585_c3_c098_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l584_c2_5cef] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5cef_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5cef_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5cef_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5cef_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5cef_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5cef_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5cef_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5cef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l592_c7_d7e7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_d7e7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_d7e7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_d7e7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_d7e7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_d7e7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_d7e7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_d7e7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_d7e7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l592_c7_d7e7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l592_c7_d7e7] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l592_c7_d7e7_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_d7e7_cond;
     result_u16_value_MUX_uxn_opcodes_h_l592_c7_d7e7_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_d7e7_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l592_c7_d7e7_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_d7e7_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_d7e7_return_output := result_u16_value_MUX_uxn_opcodes_h_l592_c7_d7e7_return_output;

     -- t8_MUX[uxn_opcodes_h_l589_c7_1c89] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l589_c7_1c89_cond <= VAR_t8_MUX_uxn_opcodes_h_l589_c7_1c89_cond;
     t8_MUX_uxn_opcodes_h_l589_c7_1c89_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l589_c7_1c89_iftrue;
     t8_MUX_uxn_opcodes_h_l589_c7_1c89_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l589_c7_1c89_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l589_c7_1c89_return_output := t8_MUX_uxn_opcodes_h_l589_c7_1c89_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l589_c7_1c89] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_1c89_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_1c89_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_1c89_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_1c89_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_1c89_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_1c89_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_1c89_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_1c89_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_1c89_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l592_c7_d7e7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_1c89_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l592_c7_d7e7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_1c89_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l592_c7_d7e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5cef_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l589_c7_1c89_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_1c89_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l592_c7_d7e7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l584_c2_5cef_iffalse := VAR_t8_MUX_uxn_opcodes_h_l589_c7_1c89_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l589_c7_1c89] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l589_c7_1c89_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_1c89_cond;
     result_u16_value_MUX_uxn_opcodes_h_l589_c7_1c89_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_1c89_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l589_c7_1c89_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_1c89_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_1c89_return_output := result_u16_value_MUX_uxn_opcodes_h_l589_c7_1c89_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l589_c7_1c89] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_1c89_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_1c89_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_1c89_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_1c89_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_1c89_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_1c89_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_1c89_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_1c89_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l589_c7_1c89] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_1c89_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_1c89_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_1c89_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_1c89_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_1c89_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_1c89_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_1c89_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_1c89_return_output;

     -- t8_MUX[uxn_opcodes_h_l584_c2_5cef] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l584_c2_5cef_cond <= VAR_t8_MUX_uxn_opcodes_h_l584_c2_5cef_cond;
     t8_MUX_uxn_opcodes_h_l584_c2_5cef_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l584_c2_5cef_iftrue;
     t8_MUX_uxn_opcodes_h_l584_c2_5cef_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l584_c2_5cef_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l584_c2_5cef_return_output := t8_MUX_uxn_opcodes_h_l584_c2_5cef_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l584_c2_5cef] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5cef_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5cef_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5cef_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5cef_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5cef_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5cef_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5cef_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5cef_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l589_c7_1c89] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_1c89_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_1c89_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_1c89_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_1c89_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_1c89_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_1c89_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_1c89_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_1c89_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5cef_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l589_c7_1c89_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_5cef_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l589_c7_1c89_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5cef_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l589_c7_1c89_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l584_c2_5cef_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l589_c7_1c89_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l584_c2_5cef_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l584_c2_5cef] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5cef_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5cef_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5cef_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5cef_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5cef_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5cef_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5cef_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5cef_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l584_c2_5cef] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l584_c2_5cef_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l584_c2_5cef_cond;
     result_u16_value_MUX_uxn_opcodes_h_l584_c2_5cef_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l584_c2_5cef_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l584_c2_5cef_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l584_c2_5cef_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l584_c2_5cef_return_output := result_u16_value_MUX_uxn_opcodes_h_l584_c2_5cef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l584_c2_5cef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5cef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5cef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5cef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5cef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5cef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5cef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5cef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5cef_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l584_c2_5cef] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_5cef_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_5cef_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_5cef_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_5cef_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_5cef_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_5cef_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_5cef_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_5cef_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_660c_uxn_opcodes_h_l605_l580_DUPLICATE_2a24 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_660c_uxn_opcodes_h_l605_l580_DUPLICATE_2a24_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_660c(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l584_c2_5cef_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l584_c2_5cef_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l584_c2_5cef_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l584_c2_5cef_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l584_c2_5cef_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l584_c2_5cef_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_660c_uxn_opcodes_h_l605_l580_DUPLICATE_2a24_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_660c_uxn_opcodes_h_l605_l580_DUPLICATE_2a24_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
