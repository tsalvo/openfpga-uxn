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
-- Submodules: 38
entity jcn_0CLK_0d289325 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(15 downto 0);
 return_output : out opcode_result_t);
end jcn_0CLK_0d289325;
architecture arch of jcn_0CLK_0d289325 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l632_c6_6654]
signal BIN_OP_EQ_uxn_opcodes_h_l632_c6_6654_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l632_c6_6654_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l632_c6_6654_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l632_c2_3f08]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l632_c2_3f08_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l632_c2_3f08_return_output : unsigned(0 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l632_c2_3f08]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l632_c2_3f08_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l632_c2_3f08_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l632_c2_3f08]
signal result_u16_value_MUX_uxn_opcodes_h_l632_c2_3f08_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l632_c2_3f08_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l632_c2_3f08]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l632_c2_3f08_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l632_c2_3f08_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l632_c2_3f08]
signal result_is_opc_done_MUX_uxn_opcodes_h_l632_c2_3f08_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l632_c2_3f08_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l632_c2_3f08]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c2_3f08_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c2_3f08_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l632_c2_3f08]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c2_3f08_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c2_3f08_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l632_c2_3f08]
signal t8_MUX_uxn_opcodes_h_l632_c2_3f08_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l632_c2_3f08_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l632_c2_3f08]
signal n8_MUX_uxn_opcodes_h_l632_c2_3f08_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l632_c2_3f08_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l640_c11_9721]
signal BIN_OP_EQ_uxn_opcodes_h_l640_c11_9721_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l640_c11_9721_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l640_c11_9721_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l640_c7_2f00]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_2f00_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_2f00_return_output : unsigned(0 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l640_c7_2f00]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l640_c7_2f00_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l640_c7_2f00_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l640_c7_2f00]
signal result_u16_value_MUX_uxn_opcodes_h_l640_c7_2f00_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l640_c7_2f00_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l640_c7_2f00]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_2f00_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_2f00_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l640_c7_2f00]
signal result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_2f00_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_2f00_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l640_c7_2f00]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_2f00_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_2f00_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l640_c7_2f00]
signal t8_MUX_uxn_opcodes_h_l640_c7_2f00_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l640_c7_2f00_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l640_c7_2f00]
signal n8_MUX_uxn_opcodes_h_l640_c7_2f00_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l640_c7_2f00_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l643_c30_80a1]
signal sp_relative_shift_uxn_opcodes_h_l643_c30_80a1_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l643_c30_80a1_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l643_c30_80a1_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l643_c30_80a1_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l645_c11_3dd0]
signal BIN_OP_EQ_uxn_opcodes_h_l645_c11_3dd0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l645_c11_3dd0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l645_c11_3dd0_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l645_c7_39d8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l645_c7_39d8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l645_c7_39d8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l645_c7_39d8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l645_c7_39d8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l645_c7_39d8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l645_c7_39d8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l645_c7_39d8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l645_c7_39d8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l645_c7_39d8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l645_c7_39d8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l645_c7_39d8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l645_c7_39d8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l645_c7_39d8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l645_c7_39d8_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l645_c7_39d8]
signal result_u16_value_MUX_uxn_opcodes_h_l645_c7_39d8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l645_c7_39d8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l645_c7_39d8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l645_c7_39d8_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l645_c7_39d8]
signal t8_MUX_uxn_opcodes_h_l645_c7_39d8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l645_c7_39d8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l645_c7_39d8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l645_c7_39d8_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l645_c7_39d8]
signal n8_MUX_uxn_opcodes_h_l645_c7_39d8_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l645_c7_39d8_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l645_c7_39d8_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l645_c7_39d8_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l647_c18_a40e]
signal CONST_SR_8_uxn_opcodes_h_l647_c18_a40e_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l647_c18_a40e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l650_c22_8020]
signal BIN_OP_EQ_uxn_opcodes_h_l650_c22_8020_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l650_c22_8020_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l650_c22_8020_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l650_c37_421b]
signal BIN_OP_PLUS_uxn_opcodes_h_l650_c37_421b_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l650_c37_421b_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l650_c37_421b_return_output : signed(17 downto 0);

-- MUX[uxn_opcodes_h_l650_c22_2dea]
signal MUX_uxn_opcodes_h_l650_c22_2dea_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l650_c22_2dea_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l650_c22_2dea_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l650_c22_2dea_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l652_c11_9f66]
signal BIN_OP_EQ_uxn_opcodes_h_l652_c11_9f66_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l652_c11_9f66_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l652_c11_9f66_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l652_c7_d553]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_d553_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_d553_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_d553_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_d553_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l652_c7_d553]
signal result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_d553_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_d553_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_d553_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_d553_return_output : unsigned(0 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_ce21( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.is_stack_operation_16bit := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l632_c6_6654
BIN_OP_EQ_uxn_opcodes_h_l632_c6_6654 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l632_c6_6654_left,
BIN_OP_EQ_uxn_opcodes_h_l632_c6_6654_right,
BIN_OP_EQ_uxn_opcodes_h_l632_c6_6654_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l632_c2_3f08
result_is_sp_shift_MUX_uxn_opcodes_h_l632_c2_3f08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l632_c2_3f08_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l632_c2_3f08_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l632_c2_3f08
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l632_c2_3f08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l632_c2_3f08_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l632_c2_3f08_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l632_c2_3f08
result_u16_value_MUX_uxn_opcodes_h_l632_c2_3f08 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l632_c2_3f08_cond,
result_u16_value_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l632_c2_3f08_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l632_c2_3f08
result_is_pc_updated_MUX_uxn_opcodes_h_l632_c2_3f08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l632_c2_3f08_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l632_c2_3f08_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l632_c2_3f08
result_is_opc_done_MUX_uxn_opcodes_h_l632_c2_3f08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l632_c2_3f08_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l632_c2_3f08_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c2_3f08
result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c2_3f08 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c2_3f08_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c2_3f08_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c2_3f08
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c2_3f08 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c2_3f08_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c2_3f08_return_output);

-- t8_MUX_uxn_opcodes_h_l632_c2_3f08
t8_MUX_uxn_opcodes_h_l632_c2_3f08 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l632_c2_3f08_cond,
t8_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue,
t8_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse,
t8_MUX_uxn_opcodes_h_l632_c2_3f08_return_output);

-- n8_MUX_uxn_opcodes_h_l632_c2_3f08
n8_MUX_uxn_opcodes_h_l632_c2_3f08 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l632_c2_3f08_cond,
n8_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue,
n8_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse,
n8_MUX_uxn_opcodes_h_l632_c2_3f08_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l640_c11_9721
BIN_OP_EQ_uxn_opcodes_h_l640_c11_9721 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l640_c11_9721_left,
BIN_OP_EQ_uxn_opcodes_h_l640_c11_9721_right,
BIN_OP_EQ_uxn_opcodes_h_l640_c11_9721_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_2f00
result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_2f00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_2f00_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_2f00_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l640_c7_2f00
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l640_c7_2f00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l640_c7_2f00_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l640_c7_2f00_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l640_c7_2f00
result_u16_value_MUX_uxn_opcodes_h_l640_c7_2f00 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l640_c7_2f00_cond,
result_u16_value_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l640_c7_2f00_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_2f00
result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_2f00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_2f00_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_2f00_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_2f00
result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_2f00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_2f00_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_2f00_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_2f00
result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_2f00 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_2f00_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_2f00_return_output);

-- t8_MUX_uxn_opcodes_h_l640_c7_2f00
t8_MUX_uxn_opcodes_h_l640_c7_2f00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l640_c7_2f00_cond,
t8_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue,
t8_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse,
t8_MUX_uxn_opcodes_h_l640_c7_2f00_return_output);

-- n8_MUX_uxn_opcodes_h_l640_c7_2f00
n8_MUX_uxn_opcodes_h_l640_c7_2f00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l640_c7_2f00_cond,
n8_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue,
n8_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse,
n8_MUX_uxn_opcodes_h_l640_c7_2f00_return_output);

-- sp_relative_shift_uxn_opcodes_h_l643_c30_80a1
sp_relative_shift_uxn_opcodes_h_l643_c30_80a1 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l643_c30_80a1_ins,
sp_relative_shift_uxn_opcodes_h_l643_c30_80a1_x,
sp_relative_shift_uxn_opcodes_h_l643_c30_80a1_y,
sp_relative_shift_uxn_opcodes_h_l643_c30_80a1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l645_c11_3dd0
BIN_OP_EQ_uxn_opcodes_h_l645_c11_3dd0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l645_c11_3dd0_left,
BIN_OP_EQ_uxn_opcodes_h_l645_c11_3dd0_right,
BIN_OP_EQ_uxn_opcodes_h_l645_c11_3dd0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l645_c7_39d8
result_is_pc_updated_MUX_uxn_opcodes_h_l645_c7_39d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l645_c7_39d8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l645_c7_39d8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l645_c7_39d8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l645_c7_39d8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l645_c7_39d8
result_is_sp_shift_MUX_uxn_opcodes_h_l645_c7_39d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l645_c7_39d8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l645_c7_39d8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l645_c7_39d8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l645_c7_39d8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l645_c7_39d8
result_is_opc_done_MUX_uxn_opcodes_h_l645_c7_39d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l645_c7_39d8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l645_c7_39d8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l645_c7_39d8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l645_c7_39d8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l645_c7_39d8
result_u16_value_MUX_uxn_opcodes_h_l645_c7_39d8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l645_c7_39d8_cond,
result_u16_value_MUX_uxn_opcodes_h_l645_c7_39d8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l645_c7_39d8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l645_c7_39d8_return_output);

-- t8_MUX_uxn_opcodes_h_l645_c7_39d8
t8_MUX_uxn_opcodes_h_l645_c7_39d8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l645_c7_39d8_cond,
t8_MUX_uxn_opcodes_h_l645_c7_39d8_iftrue,
t8_MUX_uxn_opcodes_h_l645_c7_39d8_iffalse,
t8_MUX_uxn_opcodes_h_l645_c7_39d8_return_output);

-- n8_MUX_uxn_opcodes_h_l645_c7_39d8
n8_MUX_uxn_opcodes_h_l645_c7_39d8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l645_c7_39d8_cond,
n8_MUX_uxn_opcodes_h_l645_c7_39d8_iftrue,
n8_MUX_uxn_opcodes_h_l645_c7_39d8_iffalse,
n8_MUX_uxn_opcodes_h_l645_c7_39d8_return_output);

-- CONST_SR_8_uxn_opcodes_h_l647_c18_a40e
CONST_SR_8_uxn_opcodes_h_l647_c18_a40e : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l647_c18_a40e_x,
CONST_SR_8_uxn_opcodes_h_l647_c18_a40e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l650_c22_8020
BIN_OP_EQ_uxn_opcodes_h_l650_c22_8020 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l650_c22_8020_left,
BIN_OP_EQ_uxn_opcodes_h_l650_c22_8020_right,
BIN_OP_EQ_uxn_opcodes_h_l650_c22_8020_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l650_c37_421b
BIN_OP_PLUS_uxn_opcodes_h_l650_c37_421b : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l650_c37_421b_left,
BIN_OP_PLUS_uxn_opcodes_h_l650_c37_421b_right,
BIN_OP_PLUS_uxn_opcodes_h_l650_c37_421b_return_output);

-- MUX_uxn_opcodes_h_l650_c22_2dea
MUX_uxn_opcodes_h_l650_c22_2dea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l650_c22_2dea_cond,
MUX_uxn_opcodes_h_l650_c22_2dea_iftrue,
MUX_uxn_opcodes_h_l650_c22_2dea_iffalse,
MUX_uxn_opcodes_h_l650_c22_2dea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l652_c11_9f66
BIN_OP_EQ_uxn_opcodes_h_l652_c11_9f66 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l652_c11_9f66_left,
BIN_OP_EQ_uxn_opcodes_h_l652_c11_9f66_right,
BIN_OP_EQ_uxn_opcodes_h_l652_c11_9f66_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_d553
result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_d553 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_d553_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_d553_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_d553_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_d553_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_d553
result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_d553 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_d553_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_d553_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_d553_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_d553_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l632_c6_6654_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l632_c2_3f08_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l632_c2_3f08_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l632_c2_3f08_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l632_c2_3f08_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l632_c2_3f08_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c2_3f08_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c2_3f08_return_output,
 t8_MUX_uxn_opcodes_h_l632_c2_3f08_return_output,
 n8_MUX_uxn_opcodes_h_l632_c2_3f08_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l640_c11_9721_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_2f00_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l640_c7_2f00_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l640_c7_2f00_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_2f00_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_2f00_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_2f00_return_output,
 t8_MUX_uxn_opcodes_h_l640_c7_2f00_return_output,
 n8_MUX_uxn_opcodes_h_l640_c7_2f00_return_output,
 sp_relative_shift_uxn_opcodes_h_l643_c30_80a1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l645_c11_3dd0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l645_c7_39d8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l645_c7_39d8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l645_c7_39d8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l645_c7_39d8_return_output,
 t8_MUX_uxn_opcodes_h_l645_c7_39d8_return_output,
 n8_MUX_uxn_opcodes_h_l645_c7_39d8_return_output,
 CONST_SR_8_uxn_opcodes_h_l647_c18_a40e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l650_c22_8020_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l650_c37_421b_return_output,
 MUX_uxn_opcodes_h_l650_c22_2dea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l652_c11_9f66_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_d553_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_d553_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c6_6654_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c6_6654_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c6_6654_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_2f00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c2_3f08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c2_3f08_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l640_c7_2f00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l632_c2_3f08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l632_c2_3f08_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c7_2f00_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l632_c2_3f08_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l632_c2_3f08_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_2f00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l632_c2_3f08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l632_c2_3f08_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_2f00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c2_3f08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c2_3f08_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_2f00_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c2_3f08_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c2_3f08_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l637_c3_5f71 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l632_c2_3f08_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c2_3f08_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c2_3f08_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l640_c7_2f00_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l632_c2_3f08_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l632_c2_3f08_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l640_c7_2f00_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l632_c2_3f08_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l632_c2_3f08_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_9721_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_9721_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_9721_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l645_c7_39d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_2f00_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l640_c7_2f00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l640_c7_2f00_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l645_c7_39d8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c7_2f00_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l645_c7_39d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_2f00_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l645_c7_39d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_2f00_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_2f00_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l645_c7_39d8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l640_c7_2f00_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l645_c7_39d8_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l640_c7_2f00_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l643_c30_80a1_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l643_c30_80a1_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l643_c30_80a1_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l643_c30_80a1_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l645_c11_3dd0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l645_c11_3dd0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l645_c11_3dd0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l645_c7_39d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l645_c7_39d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_d553_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l645_c7_39d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l645_c7_39d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l645_c7_39d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l645_c7_39d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l645_c7_39d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l645_c7_39d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_d553_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l645_c7_39d8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l645_c7_39d8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l645_c7_39d8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l645_c7_39d8_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l645_c7_39d8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l645_c7_39d8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l645_c7_39d8_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l645_c7_39d8_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l645_c7_39d8_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l645_c7_39d8_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l646_c8_6a61_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l647_c18_a40e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l647_c18_a40e_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l647_c8_0db8_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l650_c22_2dea_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c22_8020_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c22_8020_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c22_8020_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l650_c22_2dea_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l650_c22_2dea_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l650_c37_421b_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l650_c42_5b24_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l650_c37_421b_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l650_c37_421b_return_output : signed(17 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l650_c22_2dea_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_9f66_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_9f66_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_9f66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_d553_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_d553_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_d553_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_d553_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_d553_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_d553_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l645_l632_DUPLICATE_8f98_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l645_l632_l640_DUPLICATE_14aa_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l632_l652_l640_DUPLICATE_b858_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l632_l640_DUPLICATE_c89b_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l645_l652_l640_DUPLICATE_dd2f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ce21_uxn_opcodes_h_l657_l628_DUPLICATE_e87c_return_output : opcode_result_t;
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
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_9f66_right := to_unsigned(3, 2);
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c22_8020_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c6_6654_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l637_c3_5f71 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l637_c3_5f71;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l645_c7_39d8_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l645_c7_39d8_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l643_c30_80a1_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l645_c11_3dd0_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l643_c30_80a1_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_d553_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_d553_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_9721_right := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l643_c30_80a1_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l645_c7_39d8_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l650_c37_421b_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_MUX_uxn_opcodes_h_l650_c22_2dea_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c6_6654_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_9721_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l645_c11_3dd0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_9f66_left := VAR_phase;
     VAR_CONST_SR_8_uxn_opcodes_h_l647_c18_a40e_x := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l645_c7_39d8_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l645_l652_l640_DUPLICATE_dd2f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l645_l652_l640_DUPLICATE_dd2f_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l640_c11_9721] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l640_c11_9721_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_9721_left;
     BIN_OP_EQ_uxn_opcodes_h_l640_c11_9721_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_9721_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_9721_return_output := BIN_OP_EQ_uxn_opcodes_h_l640_c11_9721_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l632_l640_DUPLICATE_c89b LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l632_l640_DUPLICATE_c89b_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l632_c6_6654] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l632_c6_6654_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c6_6654_left;
     BIN_OP_EQ_uxn_opcodes_h_l632_c6_6654_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c6_6654_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c6_6654_return_output := BIN_OP_EQ_uxn_opcodes_h_l632_c6_6654_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l647_c18_a40e] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l647_c18_a40e_x <= VAR_CONST_SR_8_uxn_opcodes_h_l647_c18_a40e_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l647_c18_a40e_return_output := CONST_SR_8_uxn_opcodes_h_l647_c18_a40e_return_output;

     -- result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d[uxn_opcodes_h_l640_c7_2f00] LATENCY=0
     VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l640_c7_2f00_return_output := result.is_stack_operation_16bit;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l645_l632_l640_DUPLICATE_14aa LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l645_l632_l640_DUPLICATE_14aa_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l652_c11_9f66] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l652_c11_9f66_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_9f66_left;
     BIN_OP_EQ_uxn_opcodes_h_l652_c11_9f66_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_9f66_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_9f66_return_output := BIN_OP_EQ_uxn_opcodes_h_l652_c11_9f66_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l645_l632_DUPLICATE_8f98 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l645_l632_DUPLICATE_8f98_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l645_c11_3dd0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l645_c11_3dd0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l645_c11_3dd0_left;
     BIN_OP_EQ_uxn_opcodes_h_l645_c11_3dd0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l645_c11_3dd0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l645_c11_3dd0_return_output := BIN_OP_EQ_uxn_opcodes_h_l645_c11_3dd0_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l643_c30_80a1] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l643_c30_80a1_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l643_c30_80a1_ins;
     sp_relative_shift_uxn_opcodes_h_l643_c30_80a1_x <= VAR_sp_relative_shift_uxn_opcodes_h_l643_c30_80a1_x;
     sp_relative_shift_uxn_opcodes_h_l643_c30_80a1_y <= VAR_sp_relative_shift_uxn_opcodes_h_l643_c30_80a1_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l643_c30_80a1_return_output := sp_relative_shift_uxn_opcodes_h_l643_c30_80a1_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l632_c2_3f08] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l632_c2_3f08_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l646_c8_6a61] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l646_c8_6a61_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l632_l652_l640_DUPLICATE_b858 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l632_l652_l640_DUPLICATE_b858_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l632_c2_3f08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c6_6654_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c2_3f08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c6_6654_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l632_c2_3f08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c6_6654_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c2_3f08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c6_6654_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l632_c2_3f08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c6_6654_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c2_3f08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c6_6654_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c2_3f08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c6_6654_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l632_c2_3f08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c6_6654_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l632_c2_3f08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c6_6654_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l640_c7_2f00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_9721_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_2f00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_9721_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_2f00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_9721_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_2f00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_9721_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l640_c7_2f00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_9721_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_2f00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_9721_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c7_2f00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_9721_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l640_c7_2f00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l640_c11_9721_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l645_c7_39d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l645_c11_3dd0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l645_c7_39d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l645_c11_3dd0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l645_c7_39d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l645_c11_3dd0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l645_c7_39d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l645_c11_3dd0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l645_c7_39d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l645_c11_3dd0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l645_c7_39d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l645_c11_3dd0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_d553_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_9f66_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_d553_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l652_c11_9f66_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l645_c7_39d8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l646_c8_6a61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l632_l640_DUPLICATE_c89b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l632_l640_DUPLICATE_c89b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l645_l632_l640_DUPLICATE_14aa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l645_l632_l640_DUPLICATE_14aa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l645_c7_39d8_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l645_l632_l640_DUPLICATE_14aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l645_l652_l640_DUPLICATE_dd2f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l645_c7_39d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l645_l652_l640_DUPLICATE_dd2f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_d553_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l645_l652_l640_DUPLICATE_dd2f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l632_l652_l640_DUPLICATE_b858_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l632_l652_l640_DUPLICATE_b858_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_d553_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l632_l652_l640_DUPLICATE_b858_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l645_l632_DUPLICATE_8f98_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l645_c7_39d8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l645_l632_DUPLICATE_8f98_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse := VAR_result_is_stack_operation_16bit_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l640_c7_2f00_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l632_c2_3f08_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l643_c30_80a1_return_output;
     -- CAST_TO_int8_t[uxn_opcodes_h_l650_c42_5b24] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l650_c42_5b24_return_output := CAST_TO_int8_t_uint8_t(
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l646_c8_6a61_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l652_c7_d553] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_d553_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_d553_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_d553_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_d553_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_d553_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_d553_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_d553_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_d553_return_output;

     -- t8_MUX[uxn_opcodes_h_l645_c7_39d8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l645_c7_39d8_cond <= VAR_t8_MUX_uxn_opcodes_h_l645_c7_39d8_cond;
     t8_MUX_uxn_opcodes_h_l645_c7_39d8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l645_c7_39d8_iftrue;
     t8_MUX_uxn_opcodes_h_l645_c7_39d8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l645_c7_39d8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l645_c7_39d8_return_output := t8_MUX_uxn_opcodes_h_l645_c7_39d8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l632_c2_3f08] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c2_3f08_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c2_3f08_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c2_3f08_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c2_3f08_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l652_c7_d553] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_d553_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_d553_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_d553_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_d553_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_d553_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_d553_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_d553_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_d553_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l640_c7_2f00] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l640_c7_2f00_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l640_c7_2f00_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l640_c7_2f00_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l640_c7_2f00_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l645_c7_39d8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l645_c7_39d8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l645_c7_39d8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l645_c7_39d8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l645_c7_39d8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l645_c7_39d8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l645_c7_39d8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l645_c7_39d8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l645_c7_39d8_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l647_c8_0db8] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l647_c8_0db8_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l647_c18_a40e_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l640_c7_2f00] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_2f00_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_2f00_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_2f00_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_2f00_return_output;

     -- Submodule level 2
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l650_c37_421b_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l650_c42_5b24_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c22_8020_left := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l647_c8_0db8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l645_c7_39d8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l647_c8_0db8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l645_c7_39d8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l652_c7_d553_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l645_c7_39d8_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l652_c7_d553_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l645_c7_39d8_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l640_c7_2f00_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l640_c7_2f00_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse := VAR_t8_MUX_uxn_opcodes_h_l645_c7_39d8_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l650_c37_421b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l650_c37_421b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l650_c37_421b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l650_c37_421b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l650_c37_421b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l650_c37_421b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l650_c37_421b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l645_c7_39d8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l645_c7_39d8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l645_c7_39d8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l645_c7_39d8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l645_c7_39d8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l645_c7_39d8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l645_c7_39d8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l645_c7_39d8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l645_c7_39d8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l632_c2_3f08] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c2_3f08_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c2_3f08_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c2_3f08_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c2_3f08_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l650_c22_8020] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l650_c22_8020_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c22_8020_left;
     BIN_OP_EQ_uxn_opcodes_h_l650_c22_8020_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c22_8020_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c22_8020_return_output := BIN_OP_EQ_uxn_opcodes_h_l650_c22_8020_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l645_c7_39d8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l645_c7_39d8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l645_c7_39d8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l645_c7_39d8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l645_c7_39d8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l645_c7_39d8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l645_c7_39d8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l645_c7_39d8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l645_c7_39d8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l640_c7_2f00] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_2f00_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_2f00_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_2f00_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_2f00_return_output;

     -- n8_MUX[uxn_opcodes_h_l645_c7_39d8] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l645_c7_39d8_cond <= VAR_n8_MUX_uxn_opcodes_h_l645_c7_39d8_cond;
     n8_MUX_uxn_opcodes_h_l645_c7_39d8_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l645_c7_39d8_iftrue;
     n8_MUX_uxn_opcodes_h_l645_c7_39d8_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l645_c7_39d8_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l645_c7_39d8_return_output := n8_MUX_uxn_opcodes_h_l645_c7_39d8_return_output;

     -- t8_MUX[uxn_opcodes_h_l640_c7_2f00] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l640_c7_2f00_cond <= VAR_t8_MUX_uxn_opcodes_h_l640_c7_2f00_cond;
     t8_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue;
     t8_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l640_c7_2f00_return_output := t8_MUX_uxn_opcodes_h_l640_c7_2f00_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l632_c2_3f08] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l632_c2_3f08_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l632_c2_3f08_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l632_c2_3f08_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l632_c2_3f08_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l650_c22_2dea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l650_c22_8020_return_output;
     VAR_MUX_uxn_opcodes_h_l650_c22_2dea_iffalse := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l650_c37_421b_return_output)),16);
     VAR_n8_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse := VAR_n8_MUX_uxn_opcodes_h_l645_c7_39d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l645_c7_39d8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l645_c7_39d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l640_c7_2f00_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse := VAR_t8_MUX_uxn_opcodes_h_l640_c7_2f00_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l640_c7_2f00] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_2f00_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_2f00_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_2f00_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_2f00_return_output;

     -- t8_MUX[uxn_opcodes_h_l632_c2_3f08] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l632_c2_3f08_cond <= VAR_t8_MUX_uxn_opcodes_h_l632_c2_3f08_cond;
     t8_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue;
     t8_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l632_c2_3f08_return_output := t8_MUX_uxn_opcodes_h_l632_c2_3f08_return_output;

     -- n8_MUX[uxn_opcodes_h_l640_c7_2f00] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l640_c7_2f00_cond <= VAR_n8_MUX_uxn_opcodes_h_l640_c7_2f00_cond;
     n8_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue;
     n8_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l640_c7_2f00_return_output := n8_MUX_uxn_opcodes_h_l640_c7_2f00_return_output;

     -- MUX[uxn_opcodes_h_l650_c22_2dea] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l650_c22_2dea_cond <= VAR_MUX_uxn_opcodes_h_l650_c22_2dea_cond;
     MUX_uxn_opcodes_h_l650_c22_2dea_iftrue <= VAR_MUX_uxn_opcodes_h_l650_c22_2dea_iftrue;
     MUX_uxn_opcodes_h_l650_c22_2dea_iffalse <= VAR_MUX_uxn_opcodes_h_l650_c22_2dea_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l650_c22_2dea_return_output := MUX_uxn_opcodes_h_l650_c22_2dea_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l640_c7_2f00] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_2f00_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_2f00_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_2f00_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_2f00_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l632_c2_3f08] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l632_c2_3f08_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c2_3f08_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c2_3f08_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l632_c2_3f08_return_output;

     -- Submodule level 4
     VAR_result_u16_value_MUX_uxn_opcodes_h_l645_c7_39d8_iftrue := VAR_MUX_uxn_opcodes_h_l650_c22_2dea_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse := VAR_n8_MUX_uxn_opcodes_h_l640_c7_2f00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l640_c7_2f00_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l640_c7_2f00_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l632_c2_3f08_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l632_c2_3f08] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l632_c2_3f08_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l632_c2_3f08_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l632_c2_3f08_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l632_c2_3f08_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l632_c2_3f08] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l632_c2_3f08_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c2_3f08_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c2_3f08_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l632_c2_3f08_return_output;

     -- n8_MUX[uxn_opcodes_h_l632_c2_3f08] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l632_c2_3f08_cond <= VAR_n8_MUX_uxn_opcodes_h_l632_c2_3f08_cond;
     n8_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue;
     n8_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l632_c2_3f08_return_output := n8_MUX_uxn_opcodes_h_l632_c2_3f08_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l645_c7_39d8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l645_c7_39d8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l645_c7_39d8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l645_c7_39d8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l645_c7_39d8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l645_c7_39d8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l645_c7_39d8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l645_c7_39d8_return_output := result_u16_value_MUX_uxn_opcodes_h_l645_c7_39d8_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l632_c2_3f08_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l645_c7_39d8_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l640_c7_2f00] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l640_c7_2f00_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c7_2f00_cond;
     result_u16_value_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c7_2f00_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c7_2f00_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c7_2f00_return_output := result_u16_value_MUX_uxn_opcodes_h_l640_c7_2f00_return_output;

     -- Submodule level 6
     VAR_result_u16_value_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l640_c7_2f00_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l632_c2_3f08] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l632_c2_3f08_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l632_c2_3f08_cond;
     result_u16_value_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l632_c2_3f08_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l632_c2_3f08_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l632_c2_3f08_return_output := result_u16_value_MUX_uxn_opcodes_h_l632_c2_3f08_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_ce21_uxn_opcodes_h_l657_l628_DUPLICATE_e87c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ce21_uxn_opcodes_h_l657_l628_DUPLICATE_e87c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_ce21(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c2_3f08_return_output,
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l632_c2_3f08_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l632_c2_3f08_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l632_c2_3f08_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c2_3f08_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c2_3f08_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l632_c2_3f08_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ce21_uxn_opcodes_h_l657_l628_DUPLICATE_e87c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ce21_uxn_opcodes_h_l657_l628_DUPLICATE_e87c_return_output;
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
