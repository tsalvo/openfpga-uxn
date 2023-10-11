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
-- Submodules: 35
entity jmp_0CLK_e573058b is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jmp_0CLK_e573058b;
architecture arch of jmp_0CLK_e573058b is
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
-- BIN_OP_EQ[uxn_opcodes_h_l628_c6_c857]
signal BIN_OP_EQ_uxn_opcodes_h_l628_c6_c857_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l628_c6_c857_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l628_c6_c857_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l628_c1_c789]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_c789_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_c789_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_c789_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_c789_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l628_c2_aa6f]
signal t8_MUX_uxn_opcodes_h_l628_c2_aa6f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l628_c2_aa6f_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l628_c2_aa6f_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output : signed(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l628_c2_aa6f]
signal result_pc_MUX_uxn_opcodes_h_l628_c2_aa6f_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l628_c2_aa6f_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l628_c2_aa6f_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l628_c2_aa6f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l628_c2_aa6f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_aa6f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_aa6f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_aa6f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l628_c2_aa6f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output : signed(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l628_c2_aa6f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_aa6f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_aa6f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_aa6f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l628_c2_aa6f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_aa6f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_aa6f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_aa6f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l629_c3_1d47[uxn_opcodes_h_l629_c3_1d47]
signal printf_uxn_opcodes_h_l629_c3_1d47_uxn_opcodes_h_l629_c3_1d47_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l633_c11_d89a]
signal BIN_OP_EQ_uxn_opcodes_h_l633_c11_d89a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l633_c11_d89a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l633_c11_d89a_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l633_c7_f3d1]
signal t8_MUX_uxn_opcodes_h_l633_c7_f3d1_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l633_c7_f3d1_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l633_c7_f3d1_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output : signed(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l633_c7_f3d1]
signal result_pc_MUX_uxn_opcodes_h_l633_c7_f3d1_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l633_c7_f3d1_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l633_c7_f3d1_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l633_c7_f3d1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l633_c7_f3d1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_f3d1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_f3d1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_f3d1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l633_c7_f3d1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output : signed(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l633_c7_f3d1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_f3d1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_f3d1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_f3d1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l633_c7_f3d1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_f3d1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_f3d1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_f3d1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l636_c11_918d]
signal BIN_OP_EQ_uxn_opcodes_h_l636_c11_918d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l636_c11_918d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l636_c11_918d_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l636_c7_0d70]
signal t8_MUX_uxn_opcodes_h_l636_c7_0d70_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l636_c7_0d70_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l636_c7_0d70_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l636_c7_0d70_return_output : signed(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l636_c7_0d70]
signal result_pc_MUX_uxn_opcodes_h_l636_c7_0d70_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l636_c7_0d70_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l636_c7_0d70_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l636_c7_0d70_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l636_c7_0d70]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_0d70_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_0d70_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_0d70_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_0d70_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l636_c7_0d70]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_0d70_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_0d70_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_0d70_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_0d70_return_output : signed(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l636_c7_0d70]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_0d70_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_0d70_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_0d70_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_0d70_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l636_c7_0d70]
signal result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_0d70_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_0d70_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_0d70_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_0d70_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l639_c32_b00a]
signal BIN_OP_AND_uxn_opcodes_h_l639_c32_b00a_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l639_c32_b00a_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l639_c32_b00a_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l639_c32_6aad]
signal BIN_OP_GT_uxn_opcodes_h_l639_c32_6aad_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l639_c32_6aad_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l639_c32_6aad_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l639_c32_b575]
signal MUX_uxn_opcodes_h_l639_c32_b575_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l639_c32_b575_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l639_c32_b575_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l639_c32_b575_return_output : signed(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l641_c15_0c4c]
signal BIN_OP_PLUS_uxn_opcodes_h_l641_c15_0c4c_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l641_c15_0c4c_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l641_c15_0c4c_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l643_c11_497b]
signal BIN_OP_EQ_uxn_opcodes_h_l643_c11_497b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l643_c11_497b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l643_c11_497b_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l643_c7_9804]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9804_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9804_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9804_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9804_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l643_c7_9804]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9804_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9804_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9804_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9804_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l643_c7_9804]
signal result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9804_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9804_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9804_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9804_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_f87d( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.pc := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.is_pc_updated := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l628_c6_c857
BIN_OP_EQ_uxn_opcodes_h_l628_c6_c857 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l628_c6_c857_left,
BIN_OP_EQ_uxn_opcodes_h_l628_c6_c857_right,
BIN_OP_EQ_uxn_opcodes_h_l628_c6_c857_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_c789
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_c789 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_c789_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_c789_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_c789_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_c789_return_output);

-- t8_MUX_uxn_opcodes_h_l628_c2_aa6f
t8_MUX_uxn_opcodes_h_l628_c2_aa6f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l628_c2_aa6f_cond,
t8_MUX_uxn_opcodes_h_l628_c2_aa6f_iftrue,
t8_MUX_uxn_opcodes_h_l628_c2_aa6f_iffalse,
t8_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output);

-- result_pc_MUX_uxn_opcodes_h_l628_c2_aa6f
result_pc_MUX_uxn_opcodes_h_l628_c2_aa6f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l628_c2_aa6f_cond,
result_pc_MUX_uxn_opcodes_h_l628_c2_aa6f_iftrue,
result_pc_MUX_uxn_opcodes_h_l628_c2_aa6f_iffalse,
result_pc_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_aa6f
result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_aa6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_aa6f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_aa6f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_aa6f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_aa6f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_aa6f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_aa6f
result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_aa6f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_aa6f
result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_aa6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_aa6f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_aa6f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_aa6f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_aa6f
result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_aa6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_aa6f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_aa6f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_aa6f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output);

-- printf_uxn_opcodes_h_l629_c3_1d47_uxn_opcodes_h_l629_c3_1d47
printf_uxn_opcodes_h_l629_c3_1d47_uxn_opcodes_h_l629_c3_1d47 : entity work.printf_uxn_opcodes_h_l629_c3_1d47_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l629_c3_1d47_uxn_opcodes_h_l629_c3_1d47_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l633_c11_d89a
BIN_OP_EQ_uxn_opcodes_h_l633_c11_d89a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l633_c11_d89a_left,
BIN_OP_EQ_uxn_opcodes_h_l633_c11_d89a_right,
BIN_OP_EQ_uxn_opcodes_h_l633_c11_d89a_return_output);

-- t8_MUX_uxn_opcodes_h_l633_c7_f3d1
t8_MUX_uxn_opcodes_h_l633_c7_f3d1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l633_c7_f3d1_cond,
t8_MUX_uxn_opcodes_h_l633_c7_f3d1_iftrue,
t8_MUX_uxn_opcodes_h_l633_c7_f3d1_iffalse,
t8_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output);

-- result_pc_MUX_uxn_opcodes_h_l633_c7_f3d1
result_pc_MUX_uxn_opcodes_h_l633_c7_f3d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l633_c7_f3d1_cond,
result_pc_MUX_uxn_opcodes_h_l633_c7_f3d1_iftrue,
result_pc_MUX_uxn_opcodes_h_l633_c7_f3d1_iffalse,
result_pc_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_f3d1
result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_f3d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_f3d1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_f3d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_f3d1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_f3d1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_f3d1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_f3d1
result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_f3d1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_f3d1
result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_f3d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_f3d1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_f3d1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_f3d1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_f3d1
result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_f3d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_f3d1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_f3d1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_f3d1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l636_c11_918d
BIN_OP_EQ_uxn_opcodes_h_l636_c11_918d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l636_c11_918d_left,
BIN_OP_EQ_uxn_opcodes_h_l636_c11_918d_right,
BIN_OP_EQ_uxn_opcodes_h_l636_c11_918d_return_output);

-- t8_MUX_uxn_opcodes_h_l636_c7_0d70
t8_MUX_uxn_opcodes_h_l636_c7_0d70 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l636_c7_0d70_cond,
t8_MUX_uxn_opcodes_h_l636_c7_0d70_iftrue,
t8_MUX_uxn_opcodes_h_l636_c7_0d70_iffalse,
t8_MUX_uxn_opcodes_h_l636_c7_0d70_return_output);

-- result_pc_MUX_uxn_opcodes_h_l636_c7_0d70
result_pc_MUX_uxn_opcodes_h_l636_c7_0d70 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l636_c7_0d70_cond,
result_pc_MUX_uxn_opcodes_h_l636_c7_0d70_iftrue,
result_pc_MUX_uxn_opcodes_h_l636_c7_0d70_iffalse,
result_pc_MUX_uxn_opcodes_h_l636_c7_0d70_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_0d70
result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_0d70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_0d70_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_0d70_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_0d70_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_0d70_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_0d70
result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_0d70 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_0d70_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_0d70_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_0d70_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_0d70_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_0d70
result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_0d70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_0d70_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_0d70_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_0d70_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_0d70_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_0d70
result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_0d70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_0d70_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_0d70_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_0d70_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_0d70_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l639_c32_b00a
BIN_OP_AND_uxn_opcodes_h_l639_c32_b00a : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l639_c32_b00a_left,
BIN_OP_AND_uxn_opcodes_h_l639_c32_b00a_right,
BIN_OP_AND_uxn_opcodes_h_l639_c32_b00a_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l639_c32_6aad
BIN_OP_GT_uxn_opcodes_h_l639_c32_6aad : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l639_c32_6aad_left,
BIN_OP_GT_uxn_opcodes_h_l639_c32_6aad_right,
BIN_OP_GT_uxn_opcodes_h_l639_c32_6aad_return_output);

-- MUX_uxn_opcodes_h_l639_c32_b575
MUX_uxn_opcodes_h_l639_c32_b575 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l639_c32_b575_cond,
MUX_uxn_opcodes_h_l639_c32_b575_iftrue,
MUX_uxn_opcodes_h_l639_c32_b575_iffalse,
MUX_uxn_opcodes_h_l639_c32_b575_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l641_c15_0c4c
BIN_OP_PLUS_uxn_opcodes_h_l641_c15_0c4c : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l641_c15_0c4c_left,
BIN_OP_PLUS_uxn_opcodes_h_l641_c15_0c4c_right,
BIN_OP_PLUS_uxn_opcodes_h_l641_c15_0c4c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l643_c11_497b
BIN_OP_EQ_uxn_opcodes_h_l643_c11_497b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l643_c11_497b_left,
BIN_OP_EQ_uxn_opcodes_h_l643_c11_497b_right,
BIN_OP_EQ_uxn_opcodes_h_l643_c11_497b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9804
result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9804 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9804_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9804_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9804_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9804_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9804
result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9804 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9804_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9804_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9804_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9804_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9804
result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9804 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9804_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9804_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9804_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9804_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l628_c6_c857_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_c789_return_output,
 t8_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output,
 result_pc_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l633_c11_d89a_return_output,
 t8_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output,
 result_pc_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l636_c11_918d_return_output,
 t8_MUX_uxn_opcodes_h_l636_c7_0d70_return_output,
 result_pc_MUX_uxn_opcodes_h_l636_c7_0d70_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_0d70_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_0d70_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_0d70_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_0d70_return_output,
 BIN_OP_AND_uxn_opcodes_h_l639_c32_b00a_return_output,
 BIN_OP_GT_uxn_opcodes_h_l639_c32_6aad_return_output,
 MUX_uxn_opcodes_h_l639_c32_b575_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l641_c15_0c4c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l643_c11_497b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9804_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9804_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9804_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c6_c857_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c6_c857_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c6_c857_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_c789_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_c789_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_c789_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_c789_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l628_c2_aa6f_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l628_c2_aa6f_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l628_c2_aa6f_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l628_c2_aa6f_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l628_c2_aa6f_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l628_c2_aa6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_aa6f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l630_c3_2446 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_aa6f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_aa6f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_aa6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_aa6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_aa6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_aa6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_aa6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_aa6f_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l629_c3_1d47_uxn_opcodes_h_l629_c3_1d47_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c11_d89a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c11_d89a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c11_d89a_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l633_c7_f3d1_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l633_c7_f3d1_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l636_c7_0d70_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l633_c7_f3d1_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l633_c7_f3d1_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l633_c7_f3d1_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l636_c7_0d70_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l633_c7_f3d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_0d70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_f3d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l634_c3_5118 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_f3d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l633_c7_f3d1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_f3d1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_0d70_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_f3d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_f3d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_0d70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_f3d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_f3d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_f3d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_0d70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_f3d1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_918d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_918d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_918d_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l636_c7_0d70_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l636_c7_0d70_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l636_c7_0d70_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l636_c7_0d70_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_uxn_opcodes_h_l641_c3_0ef1 : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l636_c7_0d70_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l636_c7_0d70_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_0d70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_0d70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9804_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_0d70_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_0d70_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_0d70_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_0d70_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_0d70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_0d70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9804_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_0d70_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_0d70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_0d70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9804_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_0d70_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l637_c8_e3ed_return_output : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l639_c32_b575_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l639_c32_b575_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l639_c32_b575_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l639_c32_b00a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l639_c32_b00a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l639_c32_b00a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l639_c32_6aad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l639_c32_6aad_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l639_c32_6aad_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l639_c32_b575_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l641_c15_0c4c_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l641_c15_0c4c_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l641_c15_0c4c_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_497b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_497b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_497b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9804_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9804_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9804_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9804_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9804_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9804_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9804_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9804_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9804_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l628_l636_l633_DUPLICATE_efc3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l628_l643_l633_DUPLICATE_35c3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l628_l636_l633_DUPLICATE_2743_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l628_l643_l633_DUPLICATE_d791_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l643_l636_l633_DUPLICATE_ca49_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f87d_uxn_opcodes_h_l649_l624_DUPLICATE_be46_return_output : opcode_result_t;
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
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9804_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c11_d89a_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9804_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l639_c32_b575_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_497b_right := to_unsigned(3, 2);
     VAR_BIN_OP_AND_uxn_opcodes_h_l639_c32_b00a_right := to_unsigned(128, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_c789_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l630_c3_2446 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_aa6f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l630_c3_2446;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_918d_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_aa6f_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9804_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_0d70_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l639_c32_b575_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_0d70_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c6_c857_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l634_c3_5118 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_f3d1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l634_c3_5118;
     VAR_BIN_OP_GT_uxn_opcodes_h_l639_c32_6aad_right := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_c789_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l639_c32_b00a_left := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l641_c15_0c4c_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c6_c857_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c11_d89a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_918d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_497b_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l628_c2_aa6f_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l633_c7_f3d1_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l636_c7_0d70_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l628_l643_l633_DUPLICATE_35c3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l628_l643_l633_DUPLICATE_35c3_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l628_c6_c857] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l628_c6_c857_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c6_c857_left;
     BIN_OP_EQ_uxn_opcodes_h_l628_c6_c857_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c6_c857_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c6_c857_return_output := BIN_OP_EQ_uxn_opcodes_h_l628_c6_c857_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l628_l636_l633_DUPLICATE_2743 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l628_l636_l633_DUPLICATE_2743_return_output := result.sp_relative_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l639_c32_b00a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l639_c32_b00a_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l639_c32_b00a_left;
     BIN_OP_AND_uxn_opcodes_h_l639_c32_b00a_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l639_c32_b00a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l639_c32_b00a_return_output := BIN_OP_AND_uxn_opcodes_h_l639_c32_b00a_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l628_l636_l633_DUPLICATE_efc3 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l628_l636_l633_DUPLICATE_efc3_return_output := result.pc;

     -- BIN_OP_EQ[uxn_opcodes_h_l636_c11_918d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l636_c11_918d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_918d_left;
     BIN_OP_EQ_uxn_opcodes_h_l636_c11_918d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_918d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_918d_return_output := BIN_OP_EQ_uxn_opcodes_h_l636_c11_918d_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l637_c8_e3ed] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l637_c8_e3ed_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l643_l636_l633_DUPLICATE_ca49 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l643_l636_l633_DUPLICATE_ca49_return_output := result.is_opc_done;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l633_c7_f3d1] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l633_c7_f3d1_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l633_c11_d89a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l633_c11_d89a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c11_d89a_left;
     BIN_OP_EQ_uxn_opcodes_h_l633_c11_d89a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c11_d89a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c11_d89a_return_output := BIN_OP_EQ_uxn_opcodes_h_l633_c11_d89a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l643_c11_497b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l643_c11_497b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_497b_left;
     BIN_OP_EQ_uxn_opcodes_h_l643_c11_497b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_497b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_497b_return_output := BIN_OP_EQ_uxn_opcodes_h_l643_c11_497b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l628_l643_l633_DUPLICATE_d791 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l628_l643_l633_DUPLICATE_d791_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l639_c32_6aad_left := VAR_BIN_OP_AND_uxn_opcodes_h_l639_c32_b00a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_c789_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c6_c857_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_aa6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c6_c857_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_aa6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c6_c857_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c6_c857_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l628_c2_aa6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c6_c857_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c6_c857_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_aa6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c6_c857_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l628_c2_aa6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l628_c6_c857_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_f3d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c11_d89a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_f3d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c11_d89a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c11_d89a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l633_c7_f3d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c11_d89a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c11_d89a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_f3d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c11_d89a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l633_c7_f3d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l633_c11_d89a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_0d70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_918d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_0d70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_918d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_0d70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_918d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l636_c7_0d70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_918d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_0d70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_918d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l636_c7_0d70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l636_c11_918d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9804_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_497b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9804_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_497b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9804_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l643_c11_497b_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l641_c15_0c4c_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l637_c8_e3ed_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l636_c7_0d70_iftrue := VAR_CAST_TO_int8_t_uxn_opcodes_h_l637_c8_e3ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l628_l636_l633_DUPLICATE_2743_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l628_l636_l633_DUPLICATE_2743_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_0d70_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l628_l636_l633_DUPLICATE_2743_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l628_c2_aa6f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l628_l636_l633_DUPLICATE_efc3_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l633_c7_f3d1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l628_l636_l633_DUPLICATE_efc3_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l636_c7_0d70_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l628_l636_l633_DUPLICATE_efc3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_f3d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l643_l636_l633_DUPLICATE_ca49_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_0d70_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l643_l636_l633_DUPLICATE_ca49_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9804_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l643_l636_l633_DUPLICATE_ca49_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_aa6f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l628_l643_l633_DUPLICATE_d791_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_f3d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l628_l643_l633_DUPLICATE_d791_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9804_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l628_l643_l633_DUPLICATE_d791_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l628_l643_l633_DUPLICATE_35c3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l628_l643_l633_DUPLICATE_35c3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9804_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l628_l643_l633_DUPLICATE_35c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_f3d1_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l633_c7_f3d1_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l628_c1_c789] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_c789_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_c789_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_c789_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_c789_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_c789_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_c789_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_c789_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_c789_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l639_c32_6aad] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l639_c32_6aad_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l639_c32_6aad_left;
     BIN_OP_GT_uxn_opcodes_h_l639_c32_6aad_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l639_c32_6aad_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l639_c32_6aad_return_output := BIN_OP_GT_uxn_opcodes_h_l639_c32_6aad_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l643_c7_9804] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9804_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9804_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9804_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9804_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9804_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9804_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9804_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9804_return_output;

     -- t8_MUX[uxn_opcodes_h_l636_c7_0d70] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l636_c7_0d70_cond <= VAR_t8_MUX_uxn_opcodes_h_l636_c7_0d70_cond;
     t8_MUX_uxn_opcodes_h_l636_c7_0d70_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l636_c7_0d70_iftrue;
     t8_MUX_uxn_opcodes_h_l636_c7_0d70_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l636_c7_0d70_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l636_c7_0d70_return_output := t8_MUX_uxn_opcodes_h_l636_c7_0d70_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l641_c15_0c4c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l641_c15_0c4c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l641_c15_0c4c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l641_c15_0c4c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l641_c15_0c4c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l641_c15_0c4c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l641_c15_0c4c_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l643_c7_9804] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9804_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9804_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9804_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9804_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9804_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9804_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9804_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9804_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l643_c7_9804] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9804_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9804_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9804_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9804_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9804_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9804_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9804_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9804_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l633_c7_f3d1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_f3d1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_f3d1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_f3d1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_f3d1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_f3d1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_f3d1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l639_c32_b575_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l639_c32_6aad_return_output;
     VAR_result_pc_uxn_opcodes_h_l641_c3_0ef1 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l641_c15_0c4c_return_output)),16);
     VAR_printf_uxn_opcodes_h_l629_c3_1d47_uxn_opcodes_h_l629_c3_1d47_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l628_c1_c789_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_0d70_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l643_c7_9804_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_0d70_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l643_c7_9804_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_0d70_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l643_c7_9804_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_aa6f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l633_c7_f3d1_iffalse := VAR_t8_MUX_uxn_opcodes_h_l636_c7_0d70_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l636_c7_0d70_iftrue := VAR_result_pc_uxn_opcodes_h_l641_c3_0ef1;
     -- MUX[uxn_opcodes_h_l639_c32_b575] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l639_c32_b575_cond <= VAR_MUX_uxn_opcodes_h_l639_c32_b575_cond;
     MUX_uxn_opcodes_h_l639_c32_b575_iftrue <= VAR_MUX_uxn_opcodes_h_l639_c32_b575_iftrue;
     MUX_uxn_opcodes_h_l639_c32_b575_iffalse <= VAR_MUX_uxn_opcodes_h_l639_c32_b575_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l639_c32_b575_return_output := MUX_uxn_opcodes_h_l639_c32_b575_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l636_c7_0d70] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_0d70_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_0d70_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_0d70_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_0d70_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_0d70_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_0d70_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_0d70_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_0d70_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l636_c7_0d70] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_0d70_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_0d70_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_0d70_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_0d70_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_0d70_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_0d70_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_0d70_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_0d70_return_output;

     -- printf_uxn_opcodes_h_l629_c3_1d47[uxn_opcodes_h_l629_c3_1d47] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l629_c3_1d47_uxn_opcodes_h_l629_c3_1d47_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l629_c3_1d47_uxn_opcodes_h_l629_c3_1d47_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_pc_MUX[uxn_opcodes_h_l636_c7_0d70] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l636_c7_0d70_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l636_c7_0d70_cond;
     result_pc_MUX_uxn_opcodes_h_l636_c7_0d70_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l636_c7_0d70_iftrue;
     result_pc_MUX_uxn_opcodes_h_l636_c7_0d70_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l636_c7_0d70_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l636_c7_0d70_return_output := result_pc_MUX_uxn_opcodes_h_l636_c7_0d70_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l636_c7_0d70] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_0d70_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_0d70_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_0d70_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_0d70_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_0d70_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_0d70_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_0d70_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_0d70_return_output;

     -- t8_MUX[uxn_opcodes_h_l633_c7_f3d1] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l633_c7_f3d1_cond <= VAR_t8_MUX_uxn_opcodes_h_l633_c7_f3d1_cond;
     t8_MUX_uxn_opcodes_h_l633_c7_f3d1_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l633_c7_f3d1_iftrue;
     t8_MUX_uxn_opcodes_h_l633_c7_f3d1_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l633_c7_f3d1_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output := t8_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l628_c2_aa6f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_aa6f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_aa6f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_aa6f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_aa6f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_aa6f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_aa6f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_0d70_iftrue := VAR_MUX_uxn_opcodes_h_l639_c32_b575_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_f3d1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l636_c7_0d70_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_f3d1_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l636_c7_0d70_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l636_c7_0d70_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l633_c7_f3d1_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l636_c7_0d70_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l628_c2_aa6f_iffalse := VAR_t8_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l633_c7_f3d1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_f3d1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_f3d1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_f3d1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_f3d1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_f3d1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_f3d1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l633_c7_f3d1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_f3d1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_f3d1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_f3d1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_f3d1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_f3d1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_f3d1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l636_c7_0d70] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_0d70_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_0d70_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_0d70_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_0d70_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_0d70_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_0d70_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_0d70_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_0d70_return_output;

     -- t8_MUX[uxn_opcodes_h_l628_c2_aa6f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l628_c2_aa6f_cond <= VAR_t8_MUX_uxn_opcodes_h_l628_c2_aa6f_cond;
     t8_MUX_uxn_opcodes_h_l628_c2_aa6f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l628_c2_aa6f_iftrue;
     t8_MUX_uxn_opcodes_h_l628_c2_aa6f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l628_c2_aa6f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output := t8_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l633_c7_f3d1] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l633_c7_f3d1_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l633_c7_f3d1_cond;
     result_pc_MUX_uxn_opcodes_h_l633_c7_f3d1_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l633_c7_f3d1_iftrue;
     result_pc_MUX_uxn_opcodes_h_l633_c7_f3d1_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l633_c7_f3d1_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output := result_pc_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l633_c7_f3d1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_aa6f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_aa6f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l628_c2_aa6f_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l636_c7_0d70_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l628_c2_aa6f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_aa6f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_aa6f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_aa6f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_aa6f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_aa6f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_aa6f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l633_c7_f3d1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l628_c2_aa6f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_aa6f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_aa6f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_aa6f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_aa6f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_aa6f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_aa6f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l628_c2_aa6f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l628_c2_aa6f] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l628_c2_aa6f_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l628_c2_aa6f_cond;
     result_pc_MUX_uxn_opcodes_h_l628_c2_aa6f_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l628_c2_aa6f_iftrue;
     result_pc_MUX_uxn_opcodes_h_l628_c2_aa6f_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l628_c2_aa6f_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output := result_pc_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output;

     -- Submodule level 5
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l633_c7_f3d1_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l628_c2_aa6f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output;

     -- Submodule level 6
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_f87d_uxn_opcodes_h_l649_l624_DUPLICATE_be46 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f87d_uxn_opcodes_h_l649_l624_DUPLICATE_be46_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_f87d(
     result,
     VAR_result_pc_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l628_c2_aa6f_return_output);

     -- Submodule level 7
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f87d_uxn_opcodes_h_l649_l624_DUPLICATE_be46_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f87d_uxn_opcodes_h_l649_l624_DUPLICATE_be46_return_output;
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
