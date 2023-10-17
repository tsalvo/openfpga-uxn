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
-- BIN_OP_EQ[uxn_opcodes_h_l621_c6_c8ba]
signal BIN_OP_EQ_uxn_opcodes_h_l621_c6_c8ba_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l621_c6_c8ba_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l621_c6_c8ba_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l621_c1_ecd2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c1_ecd2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c1_ecd2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c1_ecd2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c1_ecd2_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l621_c2_ddb6]
signal t8_MUX_uxn_opcodes_h_l621_c2_ddb6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l621_c2_ddb6_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l621_c2_ddb6_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output : signed(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l621_c2_ddb6]
signal result_u16_value_MUX_uxn_opcodes_h_l621_c2_ddb6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l621_c2_ddb6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l621_c2_ddb6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l621_c2_ddb6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l621_c2_ddb6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l621_c2_ddb6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l621_c2_ddb6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l621_c2_ddb6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l621_c2_ddb6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l621_c2_ddb6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c2_ddb6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c2_ddb6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c2_ddb6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l621_c2_ddb6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l621_c2_ddb6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l621_c2_ddb6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l621_c2_ddb6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l622_c3_01a4[uxn_opcodes_h_l622_c3_01a4]
signal printf_uxn_opcodes_h_l622_c3_01a4_uxn_opcodes_h_l622_c3_01a4_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l626_c11_a987]
signal BIN_OP_EQ_uxn_opcodes_h_l626_c11_a987_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l626_c11_a987_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l626_c11_a987_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l626_c7_51d0]
signal t8_MUX_uxn_opcodes_h_l626_c7_51d0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l626_c7_51d0_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l626_c7_51d0_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l626_c7_51d0_return_output : signed(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l626_c7_51d0]
signal result_u16_value_MUX_uxn_opcodes_h_l626_c7_51d0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l626_c7_51d0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l626_c7_51d0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l626_c7_51d0_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l626_c7_51d0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_51d0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_51d0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_51d0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_51d0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l626_c7_51d0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_51d0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_51d0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_51d0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_51d0_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l626_c7_51d0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l626_c7_51d0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l626_c7_51d0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l626_c7_51d0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l626_c7_51d0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l626_c7_51d0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l626_c7_51d0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l626_c7_51d0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l626_c7_51d0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l626_c7_51d0_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l626_c7_51d0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_51d0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_51d0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_51d0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_51d0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l629_c11_d607]
signal BIN_OP_EQ_uxn_opcodes_h_l629_c11_d607_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l629_c11_d607_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l629_c11_d607_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l629_c7_38ab]
signal t8_MUX_uxn_opcodes_h_l629_c7_38ab_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l629_c7_38ab_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l629_c7_38ab_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l629_c7_38ab_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l629_c7_38ab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_38ab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_38ab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_38ab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_38ab_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l629_c7_38ab]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_38ab_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_38ab_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_38ab_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_38ab_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l629_c7_38ab]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_38ab_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_38ab_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_38ab_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_38ab_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l629_c7_38ab]
signal result_u16_value_MUX_uxn_opcodes_h_l629_c7_38ab_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l629_c7_38ab_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l629_c7_38ab_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l629_c7_38ab_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l629_c7_38ab]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_38ab_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_38ab_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_38ab_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_38ab_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l632_c30_d712]
signal sp_relative_shift_uxn_opcodes_h_l632_c30_d712_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l632_c30_d712_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l632_c30_d712_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l632_c30_d712_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l634_c22_ac21]
signal BIN_OP_PLUS_uxn_opcodes_h_l634_c22_ac21_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l634_c22_ac21_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l634_c22_ac21_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l636_c11_6829]
signal BIN_OP_EQ_uxn_opcodes_h_l636_c11_6829_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l636_c11_6829_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l636_c11_6829_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l636_c7_d61b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_d61b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_d61b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_d61b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_d61b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l636_c7_d61b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_d61b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_d61b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_d61b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_d61b_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l636_c7_d61b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_d61b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_d61b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_d61b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_d61b_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_43dc( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_pc_updated := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l621_c6_c8ba
BIN_OP_EQ_uxn_opcodes_h_l621_c6_c8ba : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l621_c6_c8ba_left,
BIN_OP_EQ_uxn_opcodes_h_l621_c6_c8ba_right,
BIN_OP_EQ_uxn_opcodes_h_l621_c6_c8ba_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c1_ecd2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c1_ecd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c1_ecd2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c1_ecd2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c1_ecd2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c1_ecd2_return_output);

-- t8_MUX_uxn_opcodes_h_l621_c2_ddb6
t8_MUX_uxn_opcodes_h_l621_c2_ddb6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l621_c2_ddb6_cond,
t8_MUX_uxn_opcodes_h_l621_c2_ddb6_iftrue,
t8_MUX_uxn_opcodes_h_l621_c2_ddb6_iffalse,
t8_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l621_c2_ddb6
result_u16_value_MUX_uxn_opcodes_h_l621_c2_ddb6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l621_c2_ddb6_cond,
result_u16_value_MUX_uxn_opcodes_h_l621_c2_ddb6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l621_c2_ddb6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l621_c2_ddb6
result_is_opc_done_MUX_uxn_opcodes_h_l621_c2_ddb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l621_c2_ddb6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l621_c2_ddb6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l621_c2_ddb6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c2_ddb6
result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c2_ddb6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l621_c2_ddb6
result_is_sp_shift_MUX_uxn_opcodes_h_l621_c2_ddb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c2_ddb6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c2_ddb6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c2_ddb6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c2_ddb6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c2_ddb6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l621_c2_ddb6
result_is_pc_updated_MUX_uxn_opcodes_h_l621_c2_ddb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l621_c2_ddb6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l621_c2_ddb6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l621_c2_ddb6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output);

-- printf_uxn_opcodes_h_l622_c3_01a4_uxn_opcodes_h_l622_c3_01a4
printf_uxn_opcodes_h_l622_c3_01a4_uxn_opcodes_h_l622_c3_01a4 : entity work.printf_uxn_opcodes_h_l622_c3_01a4_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l622_c3_01a4_uxn_opcodes_h_l622_c3_01a4_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l626_c11_a987
BIN_OP_EQ_uxn_opcodes_h_l626_c11_a987 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l626_c11_a987_left,
BIN_OP_EQ_uxn_opcodes_h_l626_c11_a987_right,
BIN_OP_EQ_uxn_opcodes_h_l626_c11_a987_return_output);

-- t8_MUX_uxn_opcodes_h_l626_c7_51d0
t8_MUX_uxn_opcodes_h_l626_c7_51d0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l626_c7_51d0_cond,
t8_MUX_uxn_opcodes_h_l626_c7_51d0_iftrue,
t8_MUX_uxn_opcodes_h_l626_c7_51d0_iffalse,
t8_MUX_uxn_opcodes_h_l626_c7_51d0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l626_c7_51d0
result_u16_value_MUX_uxn_opcodes_h_l626_c7_51d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l626_c7_51d0_cond,
result_u16_value_MUX_uxn_opcodes_h_l626_c7_51d0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l626_c7_51d0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l626_c7_51d0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_51d0
result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_51d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_51d0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_51d0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_51d0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_51d0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_51d0
result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_51d0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_51d0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_51d0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_51d0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_51d0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l626_c7_51d0
result_is_sp_shift_MUX_uxn_opcodes_h_l626_c7_51d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l626_c7_51d0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l626_c7_51d0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l626_c7_51d0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l626_c7_51d0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l626_c7_51d0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l626_c7_51d0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l626_c7_51d0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l626_c7_51d0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l626_c7_51d0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l626_c7_51d0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_51d0
result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_51d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_51d0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_51d0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_51d0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_51d0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l629_c11_d607
BIN_OP_EQ_uxn_opcodes_h_l629_c11_d607 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l629_c11_d607_left,
BIN_OP_EQ_uxn_opcodes_h_l629_c11_d607_right,
BIN_OP_EQ_uxn_opcodes_h_l629_c11_d607_return_output);

-- t8_MUX_uxn_opcodes_h_l629_c7_38ab
t8_MUX_uxn_opcodes_h_l629_c7_38ab : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l629_c7_38ab_cond,
t8_MUX_uxn_opcodes_h_l629_c7_38ab_iftrue,
t8_MUX_uxn_opcodes_h_l629_c7_38ab_iffalse,
t8_MUX_uxn_opcodes_h_l629_c7_38ab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_38ab
result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_38ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_38ab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_38ab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_38ab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_38ab_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_38ab
result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_38ab : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_38ab_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_38ab_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_38ab_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_38ab_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_38ab
result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_38ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_38ab_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_38ab_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_38ab_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_38ab_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l629_c7_38ab
result_u16_value_MUX_uxn_opcodes_h_l629_c7_38ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l629_c7_38ab_cond,
result_u16_value_MUX_uxn_opcodes_h_l629_c7_38ab_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l629_c7_38ab_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l629_c7_38ab_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_38ab
result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_38ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_38ab_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_38ab_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_38ab_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_38ab_return_output);

-- sp_relative_shift_uxn_opcodes_h_l632_c30_d712
sp_relative_shift_uxn_opcodes_h_l632_c30_d712 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l632_c30_d712_ins,
sp_relative_shift_uxn_opcodes_h_l632_c30_d712_x,
sp_relative_shift_uxn_opcodes_h_l632_c30_d712_y,
sp_relative_shift_uxn_opcodes_h_l632_c30_d712_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l634_c22_ac21
BIN_OP_PLUS_uxn_opcodes_h_l634_c22_ac21 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l634_c22_ac21_left,
BIN_OP_PLUS_uxn_opcodes_h_l634_c22_ac21_right,
BIN_OP_PLUS_uxn_opcodes_h_l634_c22_ac21_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l636_c11_6829
BIN_OP_EQ_uxn_opcodes_h_l636_c11_6829 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l636_c11_6829_left,
BIN_OP_EQ_uxn_opcodes_h_l636_c11_6829_right,
BIN_OP_EQ_uxn_opcodes_h_l636_c11_6829_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_d61b
result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_d61b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_d61b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_d61b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_d61b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_d61b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_d61b
result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_d61b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_d61b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_d61b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_d61b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_d61b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_d61b
result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_d61b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_d61b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_d61b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_d61b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_d61b_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l621_c6_c8ba_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c1_ecd2_return_output,
 t8_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l626_c11_a987_return_output,
 t8_MUX_uxn_opcodes_h_l626_c7_51d0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l626_c7_51d0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_51d0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_51d0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l626_c7_51d0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l626_c7_51d0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_51d0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l629_c11_d607_return_output,
 t8_MUX_uxn_opcodes_h_l629_c7_38ab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_38ab_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_38ab_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_38ab_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l629_c7_38ab_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_38ab_return_output,
 sp_relative_shift_uxn_opcodes_h_l632_c30_d712_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l634_c22_ac21_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l636_c11_6829_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_d61b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_d61b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_d61b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c6_c8ba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c6_c8ba_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c6_c8ba_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c1_ecd2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c1_ecd2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c1_ecd2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c1_ecd2_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l621_c2_ddb6_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l621_c2_ddb6_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l626_c7_51d0_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l621_c2_ddb6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l621_c2_ddb6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l621_c2_ddb6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l626_c7_51d0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l621_c2_ddb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c2_ddb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c2_ddb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_51d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c2_ddb6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_51d0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l626_c7_51d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c2_ddb6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l623_c3_ac8d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c2_ddb6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l626_c7_51d0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c2_ddb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l621_c2_ddb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l621_c2_ddb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_51d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l621_c2_ddb6_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l622_c3_01a4_uxn_opcodes_h_l622_c3_01a4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l626_c11_a987_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l626_c11_a987_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l626_c11_a987_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l626_c7_51d0_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l626_c7_51d0_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l629_c7_38ab_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l626_c7_51d0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l626_c7_51d0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l626_c7_51d0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l629_c7_38ab_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l626_c7_51d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_51d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_51d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_38ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_51d0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_51d0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_51d0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_38ab_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_51d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l626_c7_51d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l626_c7_51d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_38ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l626_c7_51d0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l626_c7_51d0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l627_c3_a46f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l626_c7_51d0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l626_c7_51d0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l626_c7_51d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_51d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_51d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_38ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_51d0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_d607_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_d607_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_d607_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l629_c7_38ab_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l629_c7_38ab_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l629_c7_38ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_38ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_38ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_d61b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_38ab_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_38ab_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_38ab_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_38ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_38ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_38ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_d61b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_38ab_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l629_c7_38ab_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l634_c3_2c92 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l629_c7_38ab_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l629_c7_38ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_38ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_38ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_d61b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_38ab_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l630_c8_cbd0_return_output : signed(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l632_c30_d712_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l632_c30_d712_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l632_c30_d712_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l632_c30_d712_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l634_c22_ac21_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l634_c22_ac21_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l634_c22_ac21_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_6829_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_6829_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_6829_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_d61b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_d61b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_d61b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_d61b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_d61b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_d61b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_d61b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_d61b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_d61b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l629_l621_l626_DUPLICATE_1b5d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l629_l621_l626_DUPLICATE_2295_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l621_l626_l636_DUPLICATE_6d47_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l621_l626_l636_DUPLICATE_2c7a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l629_l626_l636_DUPLICATE_406c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_43dc_uxn_opcodes_h_l642_l617_DUPLICATE_67fc_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c2_ddb6_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l632_c30_d712_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_d61b_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l632_c30_d712_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_d61b_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c1_ecd2_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_6829_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_d607_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c6_c8ba_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l623_c3_ac8d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c2_ddb6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l623_c3_ac8d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l627_c3_a46f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l626_c7_51d0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l627_c3_a46f;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_38ab_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_38ab_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_d61b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l626_c11_a987_right := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c1_ecd2_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l632_c30_d712_ins := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l634_c22_ac21_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c6_c8ba_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l626_c11_a987_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_d607_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_6829_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l621_c2_ddb6_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l626_c7_51d0_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l629_c7_38ab_iffalse := t8;
     -- CAST_TO_int8_t[uxn_opcodes_h_l630_c8_cbd0] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l630_c8_cbd0_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l621_l626_l636_DUPLICATE_2c7a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l621_l626_l636_DUPLICATE_2c7a_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l621_l626_l636_DUPLICATE_6d47 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l621_l626_l636_DUPLICATE_6d47_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l636_c11_6829] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l636_c11_6829_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_6829_left;
     BIN_OP_EQ_uxn_opcodes_h_l636_c11_6829_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_6829_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_6829_return_output := BIN_OP_EQ_uxn_opcodes_h_l636_c11_6829_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l621_c6_c8ba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l621_c6_c8ba_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c6_c8ba_left;
     BIN_OP_EQ_uxn_opcodes_h_l621_c6_c8ba_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c6_c8ba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c6_c8ba_return_output := BIN_OP_EQ_uxn_opcodes_h_l621_c6_c8ba_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l632_c30_d712] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l632_c30_d712_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l632_c30_d712_ins;
     sp_relative_shift_uxn_opcodes_h_l632_c30_d712_x <= VAR_sp_relative_shift_uxn_opcodes_h_l632_c30_d712_x;
     sp_relative_shift_uxn_opcodes_h_l632_c30_d712_y <= VAR_sp_relative_shift_uxn_opcodes_h_l632_c30_d712_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l632_c30_d712_return_output := sp_relative_shift_uxn_opcodes_h_l632_c30_d712_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l629_c11_d607] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l629_c11_d607_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_d607_left;
     BIN_OP_EQ_uxn_opcodes_h_l629_c11_d607_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_d607_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_d607_return_output := BIN_OP_EQ_uxn_opcodes_h_l629_c11_d607_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l629_l621_l626_DUPLICATE_2295 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l629_l621_l626_DUPLICATE_2295_return_output := result.sp_relative_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l626_c7_51d0] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l626_c7_51d0_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l629_l626_l636_DUPLICATE_406c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l629_l626_l636_DUPLICATE_406c_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l629_l621_l626_DUPLICATE_1b5d LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l629_l621_l626_DUPLICATE_1b5d_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l626_c11_a987] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l626_c11_a987_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l626_c11_a987_left;
     BIN_OP_EQ_uxn_opcodes_h_l626_c11_a987_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l626_c11_a987_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l626_c11_a987_return_output := BIN_OP_EQ_uxn_opcodes_h_l626_c11_a987_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c1_ecd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c6_c8ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c2_ddb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c6_c8ba_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l621_c2_ddb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c6_c8ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c6_c8ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c6_c8ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c2_ddb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c6_c8ba_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l621_c2_ddb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c6_c8ba_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l621_c2_ddb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c6_c8ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_51d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l626_c11_a987_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_51d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l626_c11_a987_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l626_c7_51d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l626_c11_a987_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_51d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l626_c11_a987_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l626_c7_51d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l626_c11_a987_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l626_c7_51d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l626_c11_a987_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l626_c7_51d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l626_c11_a987_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_38ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_d607_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_38ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_d607_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_38ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_d607_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_38ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_d607_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l629_c7_38ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_d607_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l629_c7_38ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l629_c11_d607_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_d61b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_6829_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_d61b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_6829_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_d61b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_6829_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l634_c22_ac21_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l630_c8_cbd0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l629_c7_38ab_iftrue := VAR_CAST_TO_int8_t_uxn_opcodes_h_l630_c8_cbd0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l629_l621_l626_DUPLICATE_2295_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_51d0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l629_l621_l626_DUPLICATE_2295_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_38ab_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l629_l621_l626_DUPLICATE_2295_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l621_c2_ddb6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l629_l621_l626_DUPLICATE_1b5d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l626_c7_51d0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l629_l621_l626_DUPLICATE_1b5d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l629_c7_38ab_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l629_l621_l626_DUPLICATE_1b5d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_51d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l629_l626_l636_DUPLICATE_406c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_38ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l629_l626_l636_DUPLICATE_406c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_d61b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l629_l626_l636_DUPLICATE_406c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l621_c2_ddb6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l621_l626_l636_DUPLICATE_2c7a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_51d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l621_l626_l636_DUPLICATE_2c7a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_d61b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l621_l626_l636_DUPLICATE_2c7a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l621_l626_l636_DUPLICATE_6d47_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l626_c7_51d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l621_l626_l636_DUPLICATE_6d47_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_d61b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l621_l626_l636_DUPLICATE_6d47_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l626_c7_51d0_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l626_c7_51d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_38ab_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l632_c30_d712_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l634_c22_ac21] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l634_c22_ac21_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l634_c22_ac21_left;
     BIN_OP_PLUS_uxn_opcodes_h_l634_c22_ac21_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l634_c22_ac21_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l634_c22_ac21_return_output := BIN_OP_PLUS_uxn_opcodes_h_l634_c22_ac21_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l629_c7_38ab] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_38ab_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_38ab_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_38ab_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_38ab_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_38ab_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_38ab_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_38ab_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_38ab_return_output;

     -- t8_MUX[uxn_opcodes_h_l629_c7_38ab] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l629_c7_38ab_cond <= VAR_t8_MUX_uxn_opcodes_h_l629_c7_38ab_cond;
     t8_MUX_uxn_opcodes_h_l629_c7_38ab_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l629_c7_38ab_iftrue;
     t8_MUX_uxn_opcodes_h_l629_c7_38ab_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l629_c7_38ab_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l629_c7_38ab_return_output := t8_MUX_uxn_opcodes_h_l629_c7_38ab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l636_c7_d61b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_d61b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_d61b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_d61b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_d61b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_d61b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_d61b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_d61b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_d61b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l621_c1_ecd2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c1_ecd2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c1_ecd2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c1_ecd2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c1_ecd2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c1_ecd2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c1_ecd2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c1_ecd2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c1_ecd2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l636_c7_d61b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_d61b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_d61b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_d61b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_d61b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_d61b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_d61b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_d61b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_d61b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l626_c7_51d0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l626_c7_51d0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l626_c7_51d0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l626_c7_51d0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l626_c7_51d0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l626_c7_51d0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l626_c7_51d0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l626_c7_51d0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l626_c7_51d0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l636_c7_d61b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_d61b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_d61b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_d61b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_d61b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_d61b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_d61b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_d61b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_d61b_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l634_c3_2c92 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l634_c22_ac21_return_output)),16);
     VAR_printf_uxn_opcodes_h_l622_c3_01a4_uxn_opcodes_h_l622_c3_01a4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l621_c1_ecd2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_38ab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_d61b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_38ab_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_d61b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_38ab_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_d61b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_51d0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l629_c7_38ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c2_ddb6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l626_c7_51d0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l626_c7_51d0_iffalse := VAR_t8_MUX_uxn_opcodes_h_l629_c7_38ab_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l629_c7_38ab_iftrue := VAR_result_u16_value_uxn_opcodes_h_l634_c3_2c92;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l629_c7_38ab] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_38ab_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_38ab_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_38ab_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_38ab_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_38ab_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_38ab_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_38ab_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_38ab_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l629_c7_38ab] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l629_c7_38ab_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l629_c7_38ab_cond;
     result_u16_value_MUX_uxn_opcodes_h_l629_c7_38ab_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l629_c7_38ab_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l629_c7_38ab_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l629_c7_38ab_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l629_c7_38ab_return_output := result_u16_value_MUX_uxn_opcodes_h_l629_c7_38ab_return_output;

     -- printf_uxn_opcodes_h_l622_c3_01a4[uxn_opcodes_h_l622_c3_01a4] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l622_c3_01a4_uxn_opcodes_h_l622_c3_01a4_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l622_c3_01a4_uxn_opcodes_h_l622_c3_01a4_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t8_MUX[uxn_opcodes_h_l626_c7_51d0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l626_c7_51d0_cond <= VAR_t8_MUX_uxn_opcodes_h_l626_c7_51d0_cond;
     t8_MUX_uxn_opcodes_h_l626_c7_51d0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l626_c7_51d0_iftrue;
     t8_MUX_uxn_opcodes_h_l626_c7_51d0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l626_c7_51d0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l626_c7_51d0_return_output := t8_MUX_uxn_opcodes_h_l626_c7_51d0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l629_c7_38ab] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_38ab_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_38ab_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_38ab_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_38ab_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_38ab_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_38ab_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_38ab_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_38ab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l626_c7_51d0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_51d0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_51d0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_51d0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_51d0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_51d0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_51d0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_51d0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_51d0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l629_c7_38ab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_38ab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_38ab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_38ab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_38ab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_38ab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_38ab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_38ab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_38ab_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l621_c2_ddb6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c2_ddb6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c2_ddb6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c2_ddb6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c2_ddb6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c2_ddb6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c2_ddb6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_51d0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l629_c7_38ab_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_51d0_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l629_c7_38ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l626_c7_51d0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l629_c7_38ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l626_c7_51d0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l626_c7_51d0_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l629_c7_38ab_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l621_c2_ddb6_iffalse := VAR_t8_MUX_uxn_opcodes_h_l626_c7_51d0_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l626_c7_51d0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l626_c7_51d0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l626_c7_51d0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l626_c7_51d0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l626_c7_51d0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l626_c7_51d0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l626_c7_51d0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l626_c7_51d0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l626_c7_51d0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l621_c2_ddb6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l626_c7_51d0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_51d0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_51d0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_51d0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_51d0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_51d0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_51d0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_51d0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_51d0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l626_c7_51d0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_51d0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_51d0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_51d0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_51d0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_51d0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_51d0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_51d0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_51d0_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l626_c7_51d0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l626_c7_51d0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l626_c7_51d0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l626_c7_51d0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l626_c7_51d0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l626_c7_51d0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l626_c7_51d0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l626_c7_51d0_return_output := result_u16_value_MUX_uxn_opcodes_h_l626_c7_51d0_return_output;

     -- t8_MUX[uxn_opcodes_h_l621_c2_ddb6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l621_c2_ddb6_cond <= VAR_t8_MUX_uxn_opcodes_h_l621_c2_ddb6_cond;
     t8_MUX_uxn_opcodes_h_l621_c2_ddb6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l621_c2_ddb6_iftrue;
     t8_MUX_uxn_opcodes_h_l621_c2_ddb6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l621_c2_ddb6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output := t8_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c2_ddb6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l626_c7_51d0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l621_c2_ddb6_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l626_c7_51d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l626_c7_51d0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l621_c2_ddb6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l626_c7_51d0_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l621_c2_ddb6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l621_c2_ddb6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l621_c2_ddb6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c2_ddb6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l621_c2_ddb6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c2_ddb6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l621_c2_ddb6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c2_ddb6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l621_c2_ddb6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l621_c2_ddb6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l621_c2_ddb6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l621_c2_ddb6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l621_c2_ddb6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l621_c2_ddb6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l621_c2_ddb6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output := result_u16_value_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l621_c2_ddb6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l621_c2_ddb6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l621_c2_ddb6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l621_c2_ddb6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l621_c2_ddb6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l621_c2_ddb6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l621_c2_ddb6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_43dc_uxn_opcodes_h_l642_l617_DUPLICATE_67fc LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_43dc_uxn_opcodes_h_l642_l617_DUPLICATE_67fc_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_43dc(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l621_c2_ddb6_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_43dc_uxn_opcodes_h_l642_l617_DUPLICATE_67fc_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_43dc_uxn_opcodes_h_l642_l617_DUPLICATE_67fc_return_output;
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
