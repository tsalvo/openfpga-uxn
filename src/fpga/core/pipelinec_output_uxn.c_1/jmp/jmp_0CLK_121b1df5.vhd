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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 31
entity jmp_0CLK_121b1df5 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jmp_0CLK_121b1df5;
architecture arch of jmp_0CLK_121b1df5 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l624_c6_7f89]
signal BIN_OP_EQ_uxn_opcodes_h_l624_c6_7f89_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l624_c6_7f89_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l624_c6_7f89_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l624_c2_df17]
signal t8_MUX_uxn_opcodes_h_l624_c2_df17_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l624_c2_df17_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l624_c2_df17_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l624_c2_df17_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l624_c2_df17]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_df17_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_df17_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_df17_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_df17_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l624_c2_df17]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_df17_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_df17_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_df17_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_df17_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l624_c2_df17]
signal result_u16_value_MUX_uxn_opcodes_h_l624_c2_df17_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l624_c2_df17_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l624_c2_df17_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l624_c2_df17_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l624_c2_df17]
signal result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_df17_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_df17_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_df17_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_df17_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l624_c2_df17]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_df17_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_df17_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_df17_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_df17_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l624_c2_df17]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_df17_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_df17_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_df17_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_df17_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l629_c11_6e57]
signal BIN_OP_EQ_uxn_opcodes_h_l629_c11_6e57_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l629_c11_6e57_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l629_c11_6e57_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l629_c7_08b4]
signal t8_MUX_uxn_opcodes_h_l629_c7_08b4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l629_c7_08b4_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l629_c7_08b4_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l629_c7_08b4_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l629_c7_08b4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_08b4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_08b4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_08b4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_08b4_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l629_c7_08b4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_08b4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_08b4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_08b4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_08b4_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l629_c7_08b4]
signal result_u16_value_MUX_uxn_opcodes_h_l629_c7_08b4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l629_c7_08b4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l629_c7_08b4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l629_c7_08b4_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l629_c7_08b4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_08b4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_08b4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_08b4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_08b4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l629_c7_08b4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_08b4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_08b4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_08b4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_08b4_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l629_c7_08b4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_08b4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_08b4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_08b4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_08b4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l632_c11_4c60]
signal BIN_OP_EQ_uxn_opcodes_h_l632_c11_4c60_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l632_c11_4c60_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l632_c11_4c60_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l632_c7_3129]
signal t8_MUX_uxn_opcodes_h_l632_c7_3129_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l632_c7_3129_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l632_c7_3129_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l632_c7_3129_return_output : signed(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l632_c7_3129]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_3129_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_3129_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_3129_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_3129_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l632_c7_3129]
signal result_u16_value_MUX_uxn_opcodes_h_l632_c7_3129_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l632_c7_3129_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l632_c7_3129_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l632_c7_3129_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l632_c7_3129]
signal result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3129_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3129_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3129_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3129_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l632_c7_3129]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3129_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3129_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3129_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3129_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l632_c7_3129]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3129_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3129_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3129_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3129_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l635_c30_260a]
signal sp_relative_shift_uxn_opcodes_h_l635_c30_260a_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l635_c30_260a_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l635_c30_260a_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l635_c30_260a_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l637_c22_288c]
signal BIN_OP_PLUS_uxn_opcodes_h_l637_c22_288c_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l637_c22_288c_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l637_c22_288c_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l639_c11_8bdf]
signal BIN_OP_EQ_uxn_opcodes_h_l639_c11_8bdf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l639_c11_8bdf_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l639_c11_8bdf_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l639_c7_fc1b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_fc1b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_fc1b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_fc1b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_fc1b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l639_c7_fc1b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_fc1b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_fc1b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_fc1b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_fc1b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l639_c7_fc1b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_fc1b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_fc1b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_fc1b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_fc1b_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_cc5c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l624_c6_7f89
BIN_OP_EQ_uxn_opcodes_h_l624_c6_7f89 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l624_c6_7f89_left,
BIN_OP_EQ_uxn_opcodes_h_l624_c6_7f89_right,
BIN_OP_EQ_uxn_opcodes_h_l624_c6_7f89_return_output);

-- t8_MUX_uxn_opcodes_h_l624_c2_df17
t8_MUX_uxn_opcodes_h_l624_c2_df17 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l624_c2_df17_cond,
t8_MUX_uxn_opcodes_h_l624_c2_df17_iftrue,
t8_MUX_uxn_opcodes_h_l624_c2_df17_iffalse,
t8_MUX_uxn_opcodes_h_l624_c2_df17_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_df17
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_df17 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_df17_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_df17_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_df17_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_df17_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_df17
result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_df17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_df17_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_df17_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_df17_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_df17_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l624_c2_df17
result_u16_value_MUX_uxn_opcodes_h_l624_c2_df17 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l624_c2_df17_cond,
result_u16_value_MUX_uxn_opcodes_h_l624_c2_df17_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l624_c2_df17_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l624_c2_df17_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_df17
result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_df17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_df17_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_df17_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_df17_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_df17_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_df17
result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_df17 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_df17_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_df17_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_df17_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_df17_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_df17
result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_df17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_df17_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_df17_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_df17_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_df17_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l629_c11_6e57
BIN_OP_EQ_uxn_opcodes_h_l629_c11_6e57 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l629_c11_6e57_left,
BIN_OP_EQ_uxn_opcodes_h_l629_c11_6e57_right,
BIN_OP_EQ_uxn_opcodes_h_l629_c11_6e57_return_output);

-- t8_MUX_uxn_opcodes_h_l629_c7_08b4
t8_MUX_uxn_opcodes_h_l629_c7_08b4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l629_c7_08b4_cond,
t8_MUX_uxn_opcodes_h_l629_c7_08b4_iftrue,
t8_MUX_uxn_opcodes_h_l629_c7_08b4_iffalse,
t8_MUX_uxn_opcodes_h_l629_c7_08b4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_08b4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_08b4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_08b4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_08b4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_08b4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_08b4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_08b4
result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_08b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_08b4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_08b4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_08b4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_08b4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l629_c7_08b4
result_u16_value_MUX_uxn_opcodes_h_l629_c7_08b4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l629_c7_08b4_cond,
result_u16_value_MUX_uxn_opcodes_h_l629_c7_08b4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l629_c7_08b4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l629_c7_08b4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_08b4
result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_08b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_08b4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_08b4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_08b4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_08b4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_08b4
result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_08b4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_08b4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_08b4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_08b4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_08b4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_08b4
result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_08b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_08b4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_08b4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_08b4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_08b4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l632_c11_4c60
BIN_OP_EQ_uxn_opcodes_h_l632_c11_4c60 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l632_c11_4c60_left,
BIN_OP_EQ_uxn_opcodes_h_l632_c11_4c60_right,
BIN_OP_EQ_uxn_opcodes_h_l632_c11_4c60_return_output);

-- t8_MUX_uxn_opcodes_h_l632_c7_3129
t8_MUX_uxn_opcodes_h_l632_c7_3129 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l632_c7_3129_cond,
t8_MUX_uxn_opcodes_h_l632_c7_3129_iftrue,
t8_MUX_uxn_opcodes_h_l632_c7_3129_iffalse,
t8_MUX_uxn_opcodes_h_l632_c7_3129_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_3129
result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_3129 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_3129_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_3129_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_3129_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_3129_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l632_c7_3129
result_u16_value_MUX_uxn_opcodes_h_l632_c7_3129 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l632_c7_3129_cond,
result_u16_value_MUX_uxn_opcodes_h_l632_c7_3129_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l632_c7_3129_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l632_c7_3129_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3129
result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3129 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3129_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3129_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3129_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3129_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3129
result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3129 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3129_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3129_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3129_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3129_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3129
result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3129 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3129_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3129_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3129_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3129_return_output);

-- sp_relative_shift_uxn_opcodes_h_l635_c30_260a
sp_relative_shift_uxn_opcodes_h_l635_c30_260a : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l635_c30_260a_ins,
sp_relative_shift_uxn_opcodes_h_l635_c30_260a_x,
sp_relative_shift_uxn_opcodes_h_l635_c30_260a_y,
sp_relative_shift_uxn_opcodes_h_l635_c30_260a_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l637_c22_288c
BIN_OP_PLUS_uxn_opcodes_h_l637_c22_288c : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l637_c22_288c_left,
BIN_OP_PLUS_uxn_opcodes_h_l637_c22_288c_right,
BIN_OP_PLUS_uxn_opcodes_h_l637_c22_288c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l639_c11_8bdf
BIN_OP_EQ_uxn_opcodes_h_l639_c11_8bdf : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l639_c11_8bdf_left,
BIN_OP_EQ_uxn_opcodes_h_l639_c11_8bdf_right,
BIN_OP_EQ_uxn_opcodes_h_l639_c11_8bdf_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_fc1b
result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_fc1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_fc1b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_fc1b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_fc1b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_fc1b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_fc1b
result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_fc1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_fc1b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_fc1b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_fc1b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_fc1b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_fc1b
result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_fc1b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_fc1b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_fc1b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_fc1b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_fc1b_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l624_c6_7f89_return_output,
 t8_MUX_uxn_opcodes_h_l624_c2_df17_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_df17_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_df17_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l624_c2_df17_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_df17_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_df17_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_df17_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l629_c11_6e57_return_output,
 t8_MUX_uxn_opcodes_h_l629_c7_08b4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_08b4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_08b4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l629_c7_08b4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_08b4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_08b4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_08b4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l632_c11_4c60_return_output,
 t8_MUX_uxn_opcodes_h_l632_c7_3129_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_3129_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l632_c7_3129_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3129_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3129_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3129_return_output,
 sp_relative_shift_uxn_opcodes_h_l635_c30_260a_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l637_c22_288c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l639_c11_8bdf_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_fc1b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_fc1b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_fc1b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_7f89_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_7f89_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_7f89_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l624_c2_df17_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l624_c2_df17_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l629_c7_08b4_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l624_c2_df17_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l624_c2_df17_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_df17_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l626_c3_cf4e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_df17_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_08b4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_df17_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_df17_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_df17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_df17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_08b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_df17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_df17_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c2_df17_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c2_df17_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l629_c7_08b4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c2_df17_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c2_df17_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_df17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_df17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_08b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_df17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_df17_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_df17_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_df17_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_08b4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_df17_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_df17_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_df17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_df17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_08b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_df17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_df17_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_6e57_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_6e57_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_6e57_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l629_c7_08b4_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l629_c7_08b4_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l632_c7_3129_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l629_c7_08b4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_08b4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l630_c3_052d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_08b4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l629_c7_08b4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_08b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_08b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_08b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_3129_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_08b4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l629_c7_08b4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l629_c7_08b4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l632_c7_3129_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l629_c7_08b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_08b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_08b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3129_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_08b4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_08b4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_08b4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3129_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_08b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_08b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_08b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3129_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_08b4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_4c60_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_4c60_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_4c60_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l632_c7_3129_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l632_c7_3129_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l632_c7_3129_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_3129_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_3129_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_fc1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_3129_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l632_c7_3129_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l637_c3_499b : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l632_c7_3129_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l632_c7_3129_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3129_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3129_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_fc1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3129_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3129_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3129_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3129_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3129_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3129_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_fc1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3129_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l633_c8_05e7_return_output : signed(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l635_c30_260a_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l635_c30_260a_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l635_c30_260a_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l635_c30_260a_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l637_c22_288c_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l637_c22_288c_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l637_c22_288c_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_8bdf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_8bdf_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_8bdf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_fc1b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_fc1b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_fc1b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_fc1b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_fc1b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_fc1b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_fc1b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_fc1b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_fc1b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l629_l624_l639_DUPLICATE_aa8d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l632_l629_l624_DUPLICATE_940c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l632_l629_l624_DUPLICATE_1cab_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l629_l624_l639_DUPLICATE_bb05_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l632_l629_l639_DUPLICATE_5b16_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cc5c_uxn_opcodes_h_l645_l620_DUPLICATE_9c8b_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_fc1b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_4c60_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l635_c30_260a_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_8bdf_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_6e57_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_df17_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l630_c3_052d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_08b4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l630_c3_052d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l626_c3_cf4e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_df17_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l626_c3_cf4e;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_3129_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3129_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_fc1b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_7f89_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l635_c30_260a_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_fc1b_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l635_c30_260a_ins := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l637_c22_288c_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_7f89_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_6e57_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_4c60_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_8bdf_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l624_c2_df17_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l629_c7_08b4_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l632_c7_3129_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l639_c11_8bdf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l639_c11_8bdf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_8bdf_left;
     BIN_OP_EQ_uxn_opcodes_h_l639_c11_8bdf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_8bdf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_8bdf_return_output := BIN_OP_EQ_uxn_opcodes_h_l639_c11_8bdf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l632_c11_4c60] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l632_c11_4c60_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_4c60_left;
     BIN_OP_EQ_uxn_opcodes_h_l632_c11_4c60_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_4c60_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_4c60_return_output := BIN_OP_EQ_uxn_opcodes_h_l632_c11_4c60_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l629_l624_l639_DUPLICATE_bb05 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l629_l624_l639_DUPLICATE_bb05_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l624_c6_7f89] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l624_c6_7f89_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_7f89_left;
     BIN_OP_EQ_uxn_opcodes_h_l624_c6_7f89_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_7f89_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_7f89_return_output := BIN_OP_EQ_uxn_opcodes_h_l624_c6_7f89_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l633_c8_05e7] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l633_c8_05e7_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l629_l624_l639_DUPLICATE_aa8d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l629_l624_l639_DUPLICATE_aa8d_return_output := result.is_pc_updated;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l629_c7_08b4] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l629_c7_08b4_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l632_l629_l624_DUPLICATE_1cab LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l632_l629_l624_DUPLICATE_1cab_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l629_c11_6e57] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l629_c11_6e57_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_6e57_left;
     BIN_OP_EQ_uxn_opcodes_h_l629_c11_6e57_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_6e57_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_6e57_return_output := BIN_OP_EQ_uxn_opcodes_h_l629_c11_6e57_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l635_c30_260a] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l635_c30_260a_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l635_c30_260a_ins;
     sp_relative_shift_uxn_opcodes_h_l635_c30_260a_x <= VAR_sp_relative_shift_uxn_opcodes_h_l635_c30_260a_x;
     sp_relative_shift_uxn_opcodes_h_l635_c30_260a_y <= VAR_sp_relative_shift_uxn_opcodes_h_l635_c30_260a_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l635_c30_260a_return_output := sp_relative_shift_uxn_opcodes_h_l635_c30_260a_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l632_l629_l624_DUPLICATE_940c LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l632_l629_l624_DUPLICATE_940c_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l632_l629_l639_DUPLICATE_5b16 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l632_l629_l639_DUPLICATE_5b16_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_df17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_7f89_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_df17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_7f89_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_df17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_7f89_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_df17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_7f89_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_df17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_7f89_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c2_df17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_7f89_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l624_c2_df17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l624_c6_7f89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_08b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_6e57_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_08b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_6e57_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_08b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_6e57_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_08b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_6e57_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_08b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_6e57_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l629_c7_08b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_6e57_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l629_c7_08b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_6e57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3129_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_4c60_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_3129_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_4c60_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3129_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_4c60_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3129_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_4c60_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l632_c7_3129_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_4c60_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l632_c7_3129_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l632_c11_4c60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_fc1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_8bdf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_fc1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_8bdf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_fc1b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l639_c11_8bdf_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l637_c22_288c_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l633_c8_05e7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l632_c7_3129_iftrue := VAR_CAST_TO_int8_t_uxn_opcodes_h_l633_c8_05e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_df17_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l632_l629_l624_DUPLICATE_1cab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_08b4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l632_l629_l624_DUPLICATE_1cab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3129_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l632_l629_l624_DUPLICATE_1cab_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c2_df17_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l632_l629_l624_DUPLICATE_940c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l629_c7_08b4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l632_l629_l624_DUPLICATE_940c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l632_c7_3129_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l632_l629_l624_DUPLICATE_940c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_08b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l632_l629_l639_DUPLICATE_5b16_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3129_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l632_l629_l639_DUPLICATE_5b16_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_fc1b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l632_l629_l639_DUPLICATE_5b16_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_df17_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l629_l624_l639_DUPLICATE_aa8d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_08b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l629_l624_l639_DUPLICATE_aa8d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_fc1b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l629_l624_l639_DUPLICATE_aa8d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_df17_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l629_l624_l639_DUPLICATE_bb05_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_08b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l629_l624_l639_DUPLICATE_bb05_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_fc1b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l629_l624_l639_DUPLICATE_bb05_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_08b4_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l629_c7_08b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3129_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l635_c30_260a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l629_c7_08b4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_08b4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_08b4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_08b4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_08b4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_08b4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_08b4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_08b4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_08b4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l639_c7_fc1b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_fc1b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_fc1b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_fc1b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_fc1b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_fc1b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_fc1b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_fc1b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_fc1b_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l637_c22_288c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l637_c22_288c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l637_c22_288c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l637_c22_288c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l637_c22_288c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l637_c22_288c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l637_c22_288c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l632_c7_3129] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3129_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3129_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3129_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3129_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3129_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3129_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3129_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3129_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l639_c7_fc1b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_fc1b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_fc1b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_fc1b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_fc1b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_fc1b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_fc1b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_fc1b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_fc1b_return_output;

     -- t8_MUX[uxn_opcodes_h_l632_c7_3129] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l632_c7_3129_cond <= VAR_t8_MUX_uxn_opcodes_h_l632_c7_3129_cond;
     t8_MUX_uxn_opcodes_h_l632_c7_3129_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l632_c7_3129_iftrue;
     t8_MUX_uxn_opcodes_h_l632_c7_3129_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l632_c7_3129_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l632_c7_3129_return_output := t8_MUX_uxn_opcodes_h_l632_c7_3129_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l639_c7_fc1b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_fc1b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_fc1b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_fc1b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_fc1b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_fc1b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_fc1b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_fc1b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_fc1b_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l637_c3_499b := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l637_c22_288c_return_output)),16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3129_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l639_c7_fc1b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_3129_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l639_c7_fc1b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3129_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l639_c7_fc1b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_08b4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l632_c7_3129_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_df17_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l629_c7_08b4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l629_c7_08b4_iffalse := VAR_t8_MUX_uxn_opcodes_h_l632_c7_3129_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l632_c7_3129_iftrue := VAR_result_u16_value_uxn_opcodes_h_l637_c3_499b;
     -- result_u16_value_MUX[uxn_opcodes_h_l632_c7_3129] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l632_c7_3129_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l632_c7_3129_cond;
     result_u16_value_MUX_uxn_opcodes_h_l632_c7_3129_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l632_c7_3129_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l632_c7_3129_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l632_c7_3129_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l632_c7_3129_return_output := result_u16_value_MUX_uxn_opcodes_h_l632_c7_3129_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l632_c7_3129] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3129_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3129_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3129_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3129_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3129_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3129_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3129_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3129_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l624_c2_df17] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_df17_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_df17_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_df17_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_df17_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_df17_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_df17_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_df17_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_df17_return_output;

     -- t8_MUX[uxn_opcodes_h_l629_c7_08b4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l629_c7_08b4_cond <= VAR_t8_MUX_uxn_opcodes_h_l629_c7_08b4_cond;
     t8_MUX_uxn_opcodes_h_l629_c7_08b4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l629_c7_08b4_iftrue;
     t8_MUX_uxn_opcodes_h_l629_c7_08b4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l629_c7_08b4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l629_c7_08b4_return_output := t8_MUX_uxn_opcodes_h_l629_c7_08b4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l632_c7_3129] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3129_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3129_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3129_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3129_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3129_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3129_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3129_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3129_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l629_c7_08b4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_08b4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_08b4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_08b4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_08b4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_08b4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_08b4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_08b4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_08b4_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l632_c7_3129] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_3129_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_3129_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_3129_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_3129_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_3129_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_3129_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_3129_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_3129_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_08b4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l632_c7_3129_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_08b4_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l632_c7_3129_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_08b4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l632_c7_3129_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_df17_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_08b4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l629_c7_08b4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l632_c7_3129_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l624_c2_df17_iffalse := VAR_t8_MUX_uxn_opcodes_h_l629_c7_08b4_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l629_c7_08b4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l629_c7_08b4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l629_c7_08b4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l629_c7_08b4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l629_c7_08b4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l629_c7_08b4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l629_c7_08b4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l629_c7_08b4_return_output := result_u16_value_MUX_uxn_opcodes_h_l629_c7_08b4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l629_c7_08b4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_08b4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_08b4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_08b4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_08b4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_08b4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_08b4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_08b4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_08b4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l629_c7_08b4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_08b4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_08b4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_08b4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_08b4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_08b4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_08b4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_08b4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_08b4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l624_c2_df17] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_df17_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_df17_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_df17_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_df17_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_df17_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_df17_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_df17_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_df17_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l629_c7_08b4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_08b4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_08b4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_08b4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_08b4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_08b4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_08b4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_08b4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_08b4_return_output;

     -- t8_MUX[uxn_opcodes_h_l624_c2_df17] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l624_c2_df17_cond <= VAR_t8_MUX_uxn_opcodes_h_l624_c2_df17_cond;
     t8_MUX_uxn_opcodes_h_l624_c2_df17_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l624_c2_df17_iftrue;
     t8_MUX_uxn_opcodes_h_l624_c2_df17_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l624_c2_df17_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l624_c2_df17_return_output := t8_MUX_uxn_opcodes_h_l624_c2_df17_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_df17_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_08b4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_df17_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_08b4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_df17_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_08b4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c2_df17_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l629_c7_08b4_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l624_c2_df17_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l624_c2_df17] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_df17_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_df17_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_df17_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_df17_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_df17_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_df17_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_df17_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_df17_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l624_c2_df17] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_df17_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_df17_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_df17_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_df17_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_df17_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_df17_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_df17_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_df17_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l624_c2_df17] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l624_c2_df17_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c2_df17_cond;
     result_u16_value_MUX_uxn_opcodes_h_l624_c2_df17_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c2_df17_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l624_c2_df17_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c2_df17_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c2_df17_return_output := result_u16_value_MUX_uxn_opcodes_h_l624_c2_df17_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l624_c2_df17] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_df17_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_df17_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_df17_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_df17_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_df17_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_df17_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_df17_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_df17_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_cc5c_uxn_opcodes_h_l645_l620_DUPLICATE_9c8b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cc5c_uxn_opcodes_h_l645_l620_DUPLICATE_9c8b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_cc5c(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l624_c2_df17_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l624_c2_df17_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l624_c2_df17_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l624_c2_df17_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l624_c2_df17_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l624_c2_df17_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cc5c_uxn_opcodes_h_l645_l620_DUPLICATE_9c8b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_cc5c_uxn_opcodes_h_l645_l620_DUPLICATE_9c8b_return_output;
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
