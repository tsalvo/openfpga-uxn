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
-- Submodules: 28
entity jmp_0CLK_348f0530 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jmp_0CLK_348f0530;
architecture arch of jmp_0CLK_348f0530 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l586_c6_f714]
signal BIN_OP_EQ_uxn_opcodes_h_l586_c6_f714_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l586_c6_f714_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l586_c6_f714_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l586_c2_cb4d]
signal result_u16_value_MUX_uxn_opcodes_h_l586_c2_cb4d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l586_c2_cb4d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l586_c2_cb4d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l586_c2_cb4d_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l586_c2_cb4d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l586_c2_cb4d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l586_c2_cb4d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l586_c2_cb4d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l586_c2_cb4d_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l586_c2_cb4d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l586_c2_cb4d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l586_c2_cb4d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l586_c2_cb4d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l586_c2_cb4d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l586_c2_cb4d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c2_cb4d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c2_cb4d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c2_cb4d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c2_cb4d_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l586_c2_cb4d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c2_cb4d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c2_cb4d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c2_cb4d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c2_cb4d_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l586_c2_cb4d]
signal t8_MUX_uxn_opcodes_h_l586_c2_cb4d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l586_c2_cb4d_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l586_c2_cb4d_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l586_c2_cb4d_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l593_c11_aafc]
signal BIN_OP_EQ_uxn_opcodes_h_l593_c11_aafc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l593_c11_aafc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l593_c11_aafc_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l593_c7_36c0]
signal result_u16_value_MUX_uxn_opcodes_h_l593_c7_36c0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l593_c7_36c0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l593_c7_36c0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l593_c7_36c0_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l593_c7_36c0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_36c0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_36c0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_36c0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_36c0_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l593_c7_36c0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_36c0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_36c0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_36c0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_36c0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l593_c7_36c0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c7_36c0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c7_36c0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c7_36c0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c7_36c0_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l593_c7_36c0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_36c0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_36c0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_36c0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_36c0_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l593_c7_36c0]
signal t8_MUX_uxn_opcodes_h_l593_c7_36c0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l593_c7_36c0_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l593_c7_36c0_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l593_c7_36c0_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l596_c11_0d58]
signal BIN_OP_EQ_uxn_opcodes_h_l596_c11_0d58_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l596_c11_0d58_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l596_c11_0d58_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l596_c7_e41c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l596_c7_e41c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l596_c7_e41c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l596_c7_e41c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l596_c7_e41c_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l596_c7_e41c]
signal result_u16_value_MUX_uxn_opcodes_h_l596_c7_e41c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l596_c7_e41c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l596_c7_e41c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l596_c7_e41c_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l596_c7_e41c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l596_c7_e41c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l596_c7_e41c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l596_c7_e41c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l596_c7_e41c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l596_c7_e41c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c7_e41c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c7_e41c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c7_e41c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c7_e41c_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l596_c7_e41c]
signal t8_MUX_uxn_opcodes_h_l596_c7_e41c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l596_c7_e41c_iftrue : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l596_c7_e41c_iffalse : signed(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l596_c7_e41c_return_output : signed(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l599_c30_4d03]
signal sp_relative_shift_uxn_opcodes_h_l599_c30_4d03_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l599_c30_4d03_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l599_c30_4d03_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l599_c30_4d03_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l601_c22_dd01]
signal BIN_OP_PLUS_uxn_opcodes_h_l601_c22_dd01_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l601_c22_dd01_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l601_c22_dd01_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l603_c11_14d7]
signal BIN_OP_EQ_uxn_opcodes_h_l603_c11_14d7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l603_c11_14d7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l603_c11_14d7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l603_c7_a7fa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_a7fa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_a7fa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_a7fa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_a7fa_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l603_c7_a7fa]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l603_c7_a7fa_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l603_c7_a7fa_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l603_c7_a7fa_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l603_c7_a7fa_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l603_c7_a7fa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l603_c7_a7fa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l603_c7_a7fa_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l603_c7_a7fa_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l603_c7_a7fa_return_output : signed(3 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l586_c6_f714
BIN_OP_EQ_uxn_opcodes_h_l586_c6_f714 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l586_c6_f714_left,
BIN_OP_EQ_uxn_opcodes_h_l586_c6_f714_right,
BIN_OP_EQ_uxn_opcodes_h_l586_c6_f714_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l586_c2_cb4d
result_u16_value_MUX_uxn_opcodes_h_l586_c2_cb4d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l586_c2_cb4d_cond,
result_u16_value_MUX_uxn_opcodes_h_l586_c2_cb4d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l586_c2_cb4d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l586_c2_cb4d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l586_c2_cb4d
result_is_opc_done_MUX_uxn_opcodes_h_l586_c2_cb4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l586_c2_cb4d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l586_c2_cb4d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l586_c2_cb4d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l586_c2_cb4d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l586_c2_cb4d
result_is_pc_updated_MUX_uxn_opcodes_h_l586_c2_cb4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l586_c2_cb4d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l586_c2_cb4d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l586_c2_cb4d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l586_c2_cb4d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c2_cb4d
result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c2_cb4d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c2_cb4d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c2_cb4d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c2_cb4d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c2_cb4d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c2_cb4d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c2_cb4d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c2_cb4d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c2_cb4d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c2_cb4d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c2_cb4d_return_output);

-- t8_MUX_uxn_opcodes_h_l586_c2_cb4d
t8_MUX_uxn_opcodes_h_l586_c2_cb4d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l586_c2_cb4d_cond,
t8_MUX_uxn_opcodes_h_l586_c2_cb4d_iftrue,
t8_MUX_uxn_opcodes_h_l586_c2_cb4d_iffalse,
t8_MUX_uxn_opcodes_h_l586_c2_cb4d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l593_c11_aafc
BIN_OP_EQ_uxn_opcodes_h_l593_c11_aafc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l593_c11_aafc_left,
BIN_OP_EQ_uxn_opcodes_h_l593_c11_aafc_right,
BIN_OP_EQ_uxn_opcodes_h_l593_c11_aafc_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l593_c7_36c0
result_u16_value_MUX_uxn_opcodes_h_l593_c7_36c0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l593_c7_36c0_cond,
result_u16_value_MUX_uxn_opcodes_h_l593_c7_36c0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l593_c7_36c0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l593_c7_36c0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_36c0
result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_36c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_36c0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_36c0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_36c0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_36c0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_36c0
result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_36c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_36c0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_36c0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_36c0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_36c0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c7_36c0
result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c7_36c0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c7_36c0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c7_36c0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c7_36c0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c7_36c0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_36c0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_36c0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_36c0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_36c0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_36c0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_36c0_return_output);

-- t8_MUX_uxn_opcodes_h_l593_c7_36c0
t8_MUX_uxn_opcodes_h_l593_c7_36c0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l593_c7_36c0_cond,
t8_MUX_uxn_opcodes_h_l593_c7_36c0_iftrue,
t8_MUX_uxn_opcodes_h_l593_c7_36c0_iffalse,
t8_MUX_uxn_opcodes_h_l593_c7_36c0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l596_c11_0d58
BIN_OP_EQ_uxn_opcodes_h_l596_c11_0d58 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l596_c11_0d58_left,
BIN_OP_EQ_uxn_opcodes_h_l596_c11_0d58_right,
BIN_OP_EQ_uxn_opcodes_h_l596_c11_0d58_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l596_c7_e41c
result_is_opc_done_MUX_uxn_opcodes_h_l596_c7_e41c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l596_c7_e41c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l596_c7_e41c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l596_c7_e41c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l596_c7_e41c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l596_c7_e41c
result_u16_value_MUX_uxn_opcodes_h_l596_c7_e41c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l596_c7_e41c_cond,
result_u16_value_MUX_uxn_opcodes_h_l596_c7_e41c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l596_c7_e41c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l596_c7_e41c_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l596_c7_e41c
result_is_pc_updated_MUX_uxn_opcodes_h_l596_c7_e41c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l596_c7_e41c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l596_c7_e41c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l596_c7_e41c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l596_c7_e41c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c7_e41c
result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c7_e41c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c7_e41c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c7_e41c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c7_e41c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c7_e41c_return_output);

-- t8_MUX_uxn_opcodes_h_l596_c7_e41c
t8_MUX_uxn_opcodes_h_l596_c7_e41c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l596_c7_e41c_cond,
t8_MUX_uxn_opcodes_h_l596_c7_e41c_iftrue,
t8_MUX_uxn_opcodes_h_l596_c7_e41c_iffalse,
t8_MUX_uxn_opcodes_h_l596_c7_e41c_return_output);

-- sp_relative_shift_uxn_opcodes_h_l599_c30_4d03
sp_relative_shift_uxn_opcodes_h_l599_c30_4d03 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l599_c30_4d03_ins,
sp_relative_shift_uxn_opcodes_h_l599_c30_4d03_x,
sp_relative_shift_uxn_opcodes_h_l599_c30_4d03_y,
sp_relative_shift_uxn_opcodes_h_l599_c30_4d03_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l601_c22_dd01
BIN_OP_PLUS_uxn_opcodes_h_l601_c22_dd01 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l601_c22_dd01_left,
BIN_OP_PLUS_uxn_opcodes_h_l601_c22_dd01_right,
BIN_OP_PLUS_uxn_opcodes_h_l601_c22_dd01_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l603_c11_14d7
BIN_OP_EQ_uxn_opcodes_h_l603_c11_14d7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l603_c11_14d7_left,
BIN_OP_EQ_uxn_opcodes_h_l603_c11_14d7_right,
BIN_OP_EQ_uxn_opcodes_h_l603_c11_14d7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_a7fa
result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_a7fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_a7fa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_a7fa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_a7fa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_a7fa_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l603_c7_a7fa
result_is_pc_updated_MUX_uxn_opcodes_h_l603_c7_a7fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l603_c7_a7fa_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l603_c7_a7fa_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l603_c7_a7fa_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l603_c7_a7fa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l603_c7_a7fa
result_sp_relative_shift_MUX_uxn_opcodes_h_l603_c7_a7fa : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l603_c7_a7fa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l603_c7_a7fa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l603_c7_a7fa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l603_c7_a7fa_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l586_c6_f714_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l586_c2_cb4d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l586_c2_cb4d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l586_c2_cb4d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c2_cb4d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c2_cb4d_return_output,
 t8_MUX_uxn_opcodes_h_l586_c2_cb4d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l593_c11_aafc_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l593_c7_36c0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_36c0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_36c0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c7_36c0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_36c0_return_output,
 t8_MUX_uxn_opcodes_h_l593_c7_36c0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l596_c11_0d58_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l596_c7_e41c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l596_c7_e41c_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l596_c7_e41c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c7_e41c_return_output,
 t8_MUX_uxn_opcodes_h_l596_c7_e41c_return_output,
 sp_relative_shift_uxn_opcodes_h_l599_c30_4d03_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l601_c22_dd01_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l603_c11_14d7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_a7fa_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l603_c7_a7fa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l603_c7_a7fa_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l586_c6_f714_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l586_c6_f714_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l586_c6_f714_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l586_c2_cb4d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l586_c2_cb4d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l593_c7_36c0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l586_c2_cb4d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l586_c2_cb4d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l586_c2_cb4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l586_c2_cb4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_36c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l586_c2_cb4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l586_c2_cb4d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l586_c2_cb4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l586_c2_cb4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_36c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l586_c2_cb4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l586_c2_cb4d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c2_cb4d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c2_cb4d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c7_36c0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c2_cb4d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c2_cb4d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c2_cb4d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l590_c3_66d2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c2_cb4d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_36c0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c2_cb4d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c2_cb4d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l586_c2_cb4d_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l586_c2_cb4d_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l593_c7_36c0_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l586_c2_cb4d_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l586_c2_cb4d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c11_aafc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c11_aafc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c11_aafc_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l593_c7_36c0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l593_c7_36c0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l596_c7_e41c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l593_c7_36c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_36c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_36c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l596_c7_e41c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_36c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_36c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_36c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l596_c7_e41c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_36c0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c7_36c0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c7_36c0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c7_e41c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c7_36c0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_36c0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l594_c3_c4f5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_36c0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l593_c7_36c0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_36c0_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l593_c7_36c0_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l593_c7_36c0_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l596_c7_e41c_return_output : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l593_c7_36c0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c11_0d58_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c11_0d58_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c11_0d58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l596_c7_e41c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l596_c7_e41c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_a7fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l596_c7_e41c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l596_c7_e41c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l601_c3_cf01 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l596_c7_e41c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l596_c7_e41c_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l596_c7_e41c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l596_c7_e41c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l603_c7_a7fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l596_c7_e41c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c7_e41c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c7_e41c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l603_c7_a7fa_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c7_e41c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l596_c7_e41c_iftrue : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l596_c7_e41c_iffalse : signed(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l596_c7_e41c_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l597_c8_20b2_return_output : signed(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l599_c30_4d03_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l599_c30_4d03_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l599_c30_4d03_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l599_c30_4d03_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l601_c22_dd01_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l601_c22_dd01_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l601_c22_dd01_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l603_c11_14d7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l603_c11_14d7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l603_c11_14d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_a7fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_a7fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_a7fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l603_c7_a7fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l603_c7_a7fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l603_c7_a7fa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l603_c7_a7fa_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l604_c3_1114 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l603_c7_a7fa_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l603_c7_a7fa_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l593_l596_l586_DUPLICATE_810a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l593_l586_l603_DUPLICATE_f11b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l593_l586_l603_DUPLICATE_7e6c_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l593_l596_l603_DUPLICATE_b3d4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6e0b_uxn_opcodes_h_l609_l582_DUPLICATE_7ce1_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l594_c3_c4f5 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_36c0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l594_c3_c4f5;
     VAR_sp_relative_shift_uxn_opcodes_h_l599_c30_4d03_y := resize(to_signed(-1, 2), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c11_aafc_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l586_c6_f714_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_a7fa_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l604_c3_1114 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l603_c7_a7fa_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l604_c3_1114;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c11_0d58_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l599_c30_4d03_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l603_c7_a7fa_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l586_c2_cb4d_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l596_c7_e41c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l603_c11_14d7_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l590_c3_66d2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c2_cb4d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l590_c3_66d2;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l599_c30_4d03_ins := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l601_c22_dd01_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l586_c6_f714_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c11_aafc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c11_0d58_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l603_c11_14d7_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l586_c2_cb4d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l593_c7_36c0_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l596_c7_e41c_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l593_l596_l603_DUPLICATE_b3d4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l593_l596_l603_DUPLICATE_b3d4_return_output := result.is_opc_done;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l593_l586_l603_DUPLICATE_7e6c LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l593_l586_l603_DUPLICATE_7e6c_return_output := result.sp_relative_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l593_c7_36c0] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l593_c7_36c0_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l593_c11_aafc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l593_c11_aafc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c11_aafc_left;
     BIN_OP_EQ_uxn_opcodes_h_l593_c11_aafc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c11_aafc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c11_aafc_return_output := BIN_OP_EQ_uxn_opcodes_h_l593_c11_aafc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l586_c6_f714] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l586_c6_f714_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l586_c6_f714_left;
     BIN_OP_EQ_uxn_opcodes_h_l586_c6_f714_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l586_c6_f714_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l586_c6_f714_return_output := BIN_OP_EQ_uxn_opcodes_h_l586_c6_f714_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l597_c8_20b2] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l597_c8_20b2_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- sp_relative_shift[uxn_opcodes_h_l599_c30_4d03] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l599_c30_4d03_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l599_c30_4d03_ins;
     sp_relative_shift_uxn_opcodes_h_l599_c30_4d03_x <= VAR_sp_relative_shift_uxn_opcodes_h_l599_c30_4d03_x;
     sp_relative_shift_uxn_opcodes_h_l599_c30_4d03_y <= VAR_sp_relative_shift_uxn_opcodes_h_l599_c30_4d03_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l599_c30_4d03_return_output := sp_relative_shift_uxn_opcodes_h_l599_c30_4d03_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l603_c11_14d7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l603_c11_14d7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l603_c11_14d7_left;
     BIN_OP_EQ_uxn_opcodes_h_l603_c11_14d7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l603_c11_14d7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l603_c11_14d7_return_output := BIN_OP_EQ_uxn_opcodes_h_l603_c11_14d7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l596_c11_0d58] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l596_c11_0d58_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c11_0d58_left;
     BIN_OP_EQ_uxn_opcodes_h_l596_c11_0d58_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c11_0d58_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c11_0d58_return_output := BIN_OP_EQ_uxn_opcodes_h_l596_c11_0d58_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l593_l586_l603_DUPLICATE_f11b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l593_l586_l603_DUPLICATE_f11b_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l593_l596_l586_DUPLICATE_810a LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l593_l596_l586_DUPLICATE_810a_return_output := result.u16_value;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l586_c2_cb4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l586_c6_f714_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l586_c2_cb4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l586_c6_f714_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c2_cb4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l586_c6_f714_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c2_cb4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l586_c6_f714_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l586_c2_cb4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l586_c6_f714_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l586_c2_cb4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l586_c6_f714_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_36c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c11_aafc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_36c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c11_aafc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c7_36c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c11_aafc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_36c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c11_aafc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l593_c7_36c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c11_aafc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l593_c7_36c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c11_aafc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l596_c7_e41c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c11_0d58_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l596_c7_e41c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c11_0d58_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c7_e41c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c11_0d58_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l596_c7_e41c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c11_0d58_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l596_c7_e41c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l596_c11_0d58_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_a7fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l603_c11_14d7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l603_c7_a7fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l603_c11_14d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l603_c7_a7fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l603_c11_14d7_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l601_c22_dd01_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l597_c8_20b2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l596_c7_e41c_iftrue := VAR_CAST_TO_int8_t_uxn_opcodes_h_l597_c8_20b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c2_cb4d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l593_l586_l603_DUPLICATE_7e6c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c7_36c0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l593_l586_l603_DUPLICATE_7e6c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l603_c7_a7fa_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l593_l586_l603_DUPLICATE_7e6c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l586_c2_cb4d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l593_l596_l586_DUPLICATE_810a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l593_c7_36c0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l593_l596_l586_DUPLICATE_810a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l596_c7_e41c_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l593_l596_l586_DUPLICATE_810a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_36c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l593_l596_l603_DUPLICATE_b3d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l596_c7_e41c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l593_l596_l603_DUPLICATE_b3d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_a7fa_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l593_l596_l603_DUPLICATE_b3d4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l586_c2_cb4d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l593_l586_l603_DUPLICATE_f11b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_36c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l593_l586_l603_DUPLICATE_f11b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l603_c7_a7fa_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l593_l586_l603_DUPLICATE_f11b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_36c0_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l593_c7_36c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c7_e41c_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l599_c30_4d03_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l603_c7_a7fa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_a7fa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_a7fa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_a7fa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_a7fa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_a7fa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_a7fa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_a7fa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_a7fa_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l601_c22_dd01] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l601_c22_dd01_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l601_c22_dd01_left;
     BIN_OP_PLUS_uxn_opcodes_h_l601_c22_dd01_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l601_c22_dd01_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l601_c22_dd01_return_output := BIN_OP_PLUS_uxn_opcodes_h_l601_c22_dd01_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l603_c7_a7fa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l603_c7_a7fa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l603_c7_a7fa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l603_c7_a7fa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l603_c7_a7fa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l603_c7_a7fa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l603_c7_a7fa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l603_c7_a7fa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l603_c7_a7fa_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l603_c7_a7fa] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l603_c7_a7fa_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l603_c7_a7fa_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l603_c7_a7fa_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l603_c7_a7fa_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l603_c7_a7fa_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l603_c7_a7fa_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l603_c7_a7fa_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l603_c7_a7fa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l593_c7_36c0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_36c0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_36c0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_36c0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_36c0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_36c0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_36c0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_36c0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_36c0_return_output;

     -- t8_MUX[uxn_opcodes_h_l596_c7_e41c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l596_c7_e41c_cond <= VAR_t8_MUX_uxn_opcodes_h_l596_c7_e41c_cond;
     t8_MUX_uxn_opcodes_h_l596_c7_e41c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l596_c7_e41c_iftrue;
     t8_MUX_uxn_opcodes_h_l596_c7_e41c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l596_c7_e41c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l596_c7_e41c_return_output := t8_MUX_uxn_opcodes_h_l596_c7_e41c_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l601_c3_cf01 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l601_c22_dd01_return_output)),16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l596_c7_e41c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l603_c7_a7fa_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l596_c7_e41c_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l603_c7_a7fa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c7_e41c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l603_c7_a7fa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c2_cb4d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c7_36c0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l593_c7_36c0_iffalse := VAR_t8_MUX_uxn_opcodes_h_l596_c7_e41c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l596_c7_e41c_iftrue := VAR_result_u16_value_uxn_opcodes_h_l601_c3_cf01;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l596_c7_e41c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l596_c7_e41c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l596_c7_e41c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l596_c7_e41c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l596_c7_e41c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l596_c7_e41c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l596_c7_e41c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l596_c7_e41c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l596_c7_e41c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l586_c2_cb4d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c2_cb4d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c2_cb4d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c2_cb4d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c2_cb4d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c2_cb4d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c2_cb4d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c2_cb4d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c2_cb4d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l596_c7_e41c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l596_c7_e41c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l596_c7_e41c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l596_c7_e41c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l596_c7_e41c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l596_c7_e41c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l596_c7_e41c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l596_c7_e41c_return_output := result_u16_value_MUX_uxn_opcodes_h_l596_c7_e41c_return_output;

     -- t8_MUX[uxn_opcodes_h_l593_c7_36c0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l593_c7_36c0_cond <= VAR_t8_MUX_uxn_opcodes_h_l593_c7_36c0_cond;
     t8_MUX_uxn_opcodes_h_l593_c7_36c0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l593_c7_36c0_iftrue;
     t8_MUX_uxn_opcodes_h_l593_c7_36c0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l593_c7_36c0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l593_c7_36c0_return_output := t8_MUX_uxn_opcodes_h_l593_c7_36c0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l596_c7_e41c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l596_c7_e41c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l596_c7_e41c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l596_c7_e41c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l596_c7_e41c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l596_c7_e41c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l596_c7_e41c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l596_c7_e41c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l596_c7_e41c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l596_c7_e41c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c7_e41c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c7_e41c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c7_e41c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c7_e41c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c7_e41c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c7_e41c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c7_e41c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c7_e41c_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_36c0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l596_c7_e41c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_36c0_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l596_c7_e41c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c7_36c0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l596_c7_e41c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l593_c7_36c0_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l596_c7_e41c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l586_c2_cb4d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l593_c7_36c0_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l593_c7_36c0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c7_36c0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c7_36c0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c7_36c0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c7_36c0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c7_36c0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c7_36c0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c7_36c0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c7_36c0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l593_c7_36c0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_36c0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_36c0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_36c0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_36c0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_36c0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_36c0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_36c0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_36c0_return_output;

     -- t8_MUX[uxn_opcodes_h_l586_c2_cb4d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l586_c2_cb4d_cond <= VAR_t8_MUX_uxn_opcodes_h_l586_c2_cb4d_cond;
     t8_MUX_uxn_opcodes_h_l586_c2_cb4d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l586_c2_cb4d_iftrue;
     t8_MUX_uxn_opcodes_h_l586_c2_cb4d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l586_c2_cb4d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l586_c2_cb4d_return_output := t8_MUX_uxn_opcodes_h_l586_c2_cb4d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l593_c7_36c0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l593_c7_36c0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l593_c7_36c0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l593_c7_36c0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l593_c7_36c0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l593_c7_36c0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l593_c7_36c0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l593_c7_36c0_return_output := result_u16_value_MUX_uxn_opcodes_h_l593_c7_36c0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l593_c7_36c0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_36c0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_36c0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_36c0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_36c0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_36c0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_36c0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_36c0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_36c0_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l586_c2_cb4d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c7_36c0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l586_c2_cb4d_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c7_36c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c2_cb4d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c7_36c0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l586_c2_cb4d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l593_c7_36c0_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l586_c2_cb4d_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l586_c2_cb4d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l586_c2_cb4d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l586_c2_cb4d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l586_c2_cb4d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l586_c2_cb4d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l586_c2_cb4d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l586_c2_cb4d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l586_c2_cb4d_return_output := result_u16_value_MUX_uxn_opcodes_h_l586_c2_cb4d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l586_c2_cb4d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c2_cb4d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c2_cb4d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c2_cb4d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c2_cb4d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c2_cb4d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c2_cb4d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c2_cb4d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c2_cb4d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l586_c2_cb4d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l586_c2_cb4d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l586_c2_cb4d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l586_c2_cb4d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l586_c2_cb4d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l586_c2_cb4d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l586_c2_cb4d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l586_c2_cb4d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l586_c2_cb4d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l586_c2_cb4d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l586_c2_cb4d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l586_c2_cb4d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l586_c2_cb4d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l586_c2_cb4d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l586_c2_cb4d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l586_c2_cb4d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l586_c2_cb4d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l586_c2_cb4d_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6e0b_uxn_opcodes_h_l609_l582_DUPLICATE_7ce1 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6e0b_uxn_opcodes_h_l609_l582_DUPLICATE_7ce1_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6e0b(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l586_c2_cb4d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l586_c2_cb4d_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l586_c2_cb4d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l586_c2_cb4d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l586_c2_cb4d_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6e0b_uxn_opcodes_h_l609_l582_DUPLICATE_7ce1_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6e0b_uxn_opcodes_h_l609_l582_DUPLICATE_7ce1_return_output;
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