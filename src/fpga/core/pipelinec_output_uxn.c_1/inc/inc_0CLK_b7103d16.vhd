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
entity inc_0CLK_b7103d16 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end inc_0CLK_b7103d16;
architecture arch of inc_0CLK_b7103d16 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1262_c6_460c]
signal BIN_OP_EQ_uxn_opcodes_h_l1262_c6_460c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1262_c6_460c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1262_c6_460c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1262_c1_4c1e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_4c1e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_4c1e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_4c1e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_4c1e_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1262_c2_4b56]
signal t8_MUX_uxn_opcodes_h_l1262_c2_4b56_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1262_c2_4b56_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1262_c2_4b56_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1262_c2_4b56]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_4b56_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_4b56_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_4b56_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1262_c2_4b56]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1262_c2_4b56]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_4b56_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_4b56_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_4b56_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1262_c2_4b56]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_4b56_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_4b56_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_4b56_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1262_c2_4b56]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1262_c2_4b56]
signal result_u8_value_MUX_uxn_opcodes_h_l1262_c2_4b56_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1262_c2_4b56_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1262_c2_4b56_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1263_c3_94d8[uxn_opcodes_h_l1263_c3_94d8]
signal printf_uxn_opcodes_h_l1263_c3_94d8_uxn_opcodes_h_l1263_c3_94d8_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1267_c11_aaef]
signal BIN_OP_EQ_uxn_opcodes_h_l1267_c11_aaef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1267_c11_aaef_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1267_c11_aaef_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1267_c7_130a]
signal t8_MUX_uxn_opcodes_h_l1267_c7_130a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1267_c7_130a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1267_c7_130a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1267_c7_130a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1267_c7_130a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_130a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_130a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_130a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_130a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1267_c7_130a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_130a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_130a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_130a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_130a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1267_c7_130a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_130a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_130a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_130a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_130a_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1267_c7_130a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_130a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_130a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_130a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_130a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1267_c7_130a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_130a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_130a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_130a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_130a_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1267_c7_130a]
signal result_u8_value_MUX_uxn_opcodes_h_l1267_c7_130a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1267_c7_130a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1267_c7_130a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1267_c7_130a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1270_c11_e5a0]
signal BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e5a0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e5a0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e5a0_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1270_c7_3ef4]
signal t8_MUX_uxn_opcodes_h_l1270_c7_3ef4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1270_c7_3ef4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1270_c7_3ef4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1270_c7_3ef4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3ef4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3ef4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3ef4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1270_c7_3ef4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1270_c7_3ef4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3ef4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3ef4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3ef4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1270_c7_3ef4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3ef4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3ef4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3ef4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1270_c7_3ef4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1270_c7_3ef4]
signal result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3ef4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3ef4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3ef4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1273_c30_a6b8]
signal sp_relative_shift_uxn_opcodes_h_l1273_c30_a6b8_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1273_c30_a6b8_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1273_c30_a6b8_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1273_c30_a6b8_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1276_c21_43e6]
signal BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_43e6_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_43e6_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_43e6_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1278_c11_d73b]
signal BIN_OP_EQ_uxn_opcodes_h_l1278_c11_d73b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1278_c11_d73b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1278_c11_d73b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1278_c7_7bb9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_7bb9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_7bb9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_7bb9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_7bb9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1278_c7_7bb9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_7bb9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_7bb9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_7bb9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_7bb9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1278_c7_7bb9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_7bb9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_7bb9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_7bb9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_7bb9_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_8c29( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1262_c6_460c
BIN_OP_EQ_uxn_opcodes_h_l1262_c6_460c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1262_c6_460c_left,
BIN_OP_EQ_uxn_opcodes_h_l1262_c6_460c_right,
BIN_OP_EQ_uxn_opcodes_h_l1262_c6_460c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_4c1e
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_4c1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_4c1e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_4c1e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_4c1e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_4c1e_return_output);

-- t8_MUX_uxn_opcodes_h_l1262_c2_4b56
t8_MUX_uxn_opcodes_h_l1262_c2_4b56 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1262_c2_4b56_cond,
t8_MUX_uxn_opcodes_h_l1262_c2_4b56_iftrue,
t8_MUX_uxn_opcodes_h_l1262_c2_4b56_iffalse,
t8_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_4b56
result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_4b56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_4b56_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_4b56_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_4b56_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_4b56
result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_4b56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_4b56
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_4b56 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_4b56_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_4b56_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_4b56_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_4b56
result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_4b56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_4b56_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_4b56_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_4b56_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_4b56
result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_4b56 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1262_c2_4b56
result_u8_value_MUX_uxn_opcodes_h_l1262_c2_4b56 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1262_c2_4b56_cond,
result_u8_value_MUX_uxn_opcodes_h_l1262_c2_4b56_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1262_c2_4b56_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output);

-- printf_uxn_opcodes_h_l1263_c3_94d8_uxn_opcodes_h_l1263_c3_94d8
printf_uxn_opcodes_h_l1263_c3_94d8_uxn_opcodes_h_l1263_c3_94d8 : entity work.printf_uxn_opcodes_h_l1263_c3_94d8_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1263_c3_94d8_uxn_opcodes_h_l1263_c3_94d8_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1267_c11_aaef
BIN_OP_EQ_uxn_opcodes_h_l1267_c11_aaef : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1267_c11_aaef_left,
BIN_OP_EQ_uxn_opcodes_h_l1267_c11_aaef_right,
BIN_OP_EQ_uxn_opcodes_h_l1267_c11_aaef_return_output);

-- t8_MUX_uxn_opcodes_h_l1267_c7_130a
t8_MUX_uxn_opcodes_h_l1267_c7_130a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1267_c7_130a_cond,
t8_MUX_uxn_opcodes_h_l1267_c7_130a_iftrue,
t8_MUX_uxn_opcodes_h_l1267_c7_130a_iffalse,
t8_MUX_uxn_opcodes_h_l1267_c7_130a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_130a
result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_130a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_130a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_130a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_130a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_130a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_130a
result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_130a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_130a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_130a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_130a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_130a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_130a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_130a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_130a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_130a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_130a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_130a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_130a
result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_130a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_130a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_130a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_130a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_130a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_130a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_130a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_130a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_130a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_130a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_130a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1267_c7_130a
result_u8_value_MUX_uxn_opcodes_h_l1267_c7_130a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1267_c7_130a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1267_c7_130a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1267_c7_130a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1267_c7_130a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e5a0
BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e5a0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e5a0_left,
BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e5a0_right,
BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e5a0_return_output);

-- t8_MUX_uxn_opcodes_h_l1270_c7_3ef4
t8_MUX_uxn_opcodes_h_l1270_c7_3ef4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1270_c7_3ef4_cond,
t8_MUX_uxn_opcodes_h_l1270_c7_3ef4_iftrue,
t8_MUX_uxn_opcodes_h_l1270_c7_3ef4_iffalse,
t8_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3ef4
result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3ef4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3ef4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3ef4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3ef4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4
result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3ef4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3ef4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3ef4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3ef4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3ef4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3ef4
result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3ef4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3ef4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3ef4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3ef4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3ef4
result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3ef4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3ef4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3ef4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3ef4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1273_c30_a6b8
sp_relative_shift_uxn_opcodes_h_l1273_c30_a6b8 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1273_c30_a6b8_ins,
sp_relative_shift_uxn_opcodes_h_l1273_c30_a6b8_x,
sp_relative_shift_uxn_opcodes_h_l1273_c30_a6b8_y,
sp_relative_shift_uxn_opcodes_h_l1273_c30_a6b8_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_43e6
BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_43e6 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_43e6_left,
BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_43e6_right,
BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_43e6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1278_c11_d73b
BIN_OP_EQ_uxn_opcodes_h_l1278_c11_d73b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1278_c11_d73b_left,
BIN_OP_EQ_uxn_opcodes_h_l1278_c11_d73b_right,
BIN_OP_EQ_uxn_opcodes_h_l1278_c11_d73b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_7bb9
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_7bb9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_7bb9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_7bb9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_7bb9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_7bb9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_7bb9
result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_7bb9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_7bb9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_7bb9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_7bb9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_7bb9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_7bb9
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_7bb9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_7bb9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_7bb9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_7bb9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_7bb9_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1262_c6_460c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_4c1e_return_output,
 t8_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1267_c11_aaef_return_output,
 t8_MUX_uxn_opcodes_h_l1267_c7_130a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_130a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_130a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_130a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_130a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_130a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1267_c7_130a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e5a0_return_output,
 t8_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output,
 sp_relative_shift_uxn_opcodes_h_l1273_c30_a6b8_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_43e6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1278_c11_d73b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_7bb9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_7bb9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_7bb9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_460c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_460c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_460c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_4c1e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_4c1e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_4c1e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_4c1e_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1262_c2_4b56_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1262_c2_4b56_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1267_c7_130a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1262_c2_4b56_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_4b56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_4b56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_130a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_4b56_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_130a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_4b56_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1264_c3_a483 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_4b56_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_130a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_4b56_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_4b56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_4b56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_130a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_4b56_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_130a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_4b56_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_4b56_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_130a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_4b56_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1263_c3_94d8_uxn_opcodes_h_l1263_c3_94d8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_aaef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_aaef_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_aaef_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1267_c7_130a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1267_c7_130a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1267_c7_130a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_130a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_130a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_130a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_130a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_130a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_130a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_130a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1268_c3_94f2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_130a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_130a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_130a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_130a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_130a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_130a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_130a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_130a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_130a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_130a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_130a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e5a0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e5a0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e5a0_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1270_c7_3ef4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1270_c7_3ef4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1270_c7_3ef4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3ef4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3ef4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_7bb9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3ef4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_7bb9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3ef4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1275_c3_3fb6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3ef4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1270_c7_3ef4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3ef4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3ef4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3ef4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_7bb9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3ef4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3ef4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_opcodes_h_l1276_c3_887d : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3ef4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3ef4_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1273_c30_a6b8_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1273_c30_a6b8_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1273_c30_a6b8_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1273_c30_a6b8_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_43e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_43e6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_43e6_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_d73b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_d73b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_d73b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_7bb9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_7bb9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_7bb9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_7bb9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_7bb9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_7bb9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_7bb9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_7bb9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_7bb9_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1278_l1267_l1262_DUPLICATE_7c8a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1278_l1267_l1262_DUPLICATE_29de_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1267_l1270_l1262_DUPLICATE_70ef_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1267_l1270_l1262_DUPLICATE_7ef7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1278_l1267_l1270_DUPLICATE_d78a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l1258_l1284_DUPLICATE_1596_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_4c1e_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1264_c3_a483 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_4b56_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1264_c3_a483;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e5a0_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_43e6_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_aaef_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_d73b_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3ef4_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1268_c3_94f2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_130a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1268_c3_94f2;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_7bb9_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_7bb9_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_460c_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_4b56_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_7bb9_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1275_c3_3fb6 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3ef4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1275_c3_3fb6;
     VAR_sp_relative_shift_uxn_opcodes_h_l1273_c30_a6b8_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_sp_relative_shift_uxn_opcodes_h_l1273_c30_a6b8_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_4c1e_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1273_c30_a6b8_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_460c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_aaef_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e5a0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_d73b_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_43e6_left := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1270_c7_3ef4_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1262_c2_4b56_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1267_c7_130a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1270_c7_3ef4_iffalse := t8;
     -- sp_relative_shift[uxn_opcodes_h_l1273_c30_a6b8] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1273_c30_a6b8_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1273_c30_a6b8_ins;
     sp_relative_shift_uxn_opcodes_h_l1273_c30_a6b8_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1273_c30_a6b8_x;
     sp_relative_shift_uxn_opcodes_h_l1273_c30_a6b8_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1273_c30_a6b8_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1273_c30_a6b8_return_output := sp_relative_shift_uxn_opcodes_h_l1273_c30_a6b8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1278_l1267_l1262_DUPLICATE_7c8a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1278_l1267_l1262_DUPLICATE_7c8a_return_output := result.is_sp_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1270_c7_3ef4] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1270_c7_3ef4_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1267_c11_aaef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1267_c11_aaef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_aaef_left;
     BIN_OP_EQ_uxn_opcodes_h_l1267_c11_aaef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_aaef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_aaef_return_output := BIN_OP_EQ_uxn_opcodes_h_l1267_c11_aaef_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1262_c6_460c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1262_c6_460c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_460c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1262_c6_460c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_460c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_460c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1262_c6_460c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1278_l1267_l1270_DUPLICATE_d78a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1278_l1267_l1270_DUPLICATE_d78a_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1278_c11_d73b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1278_c11_d73b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_d73b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1278_c11_d73b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_d73b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_d73b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1278_c11_d73b_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1267_l1270_l1262_DUPLICATE_70ef LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1267_l1270_l1262_DUPLICATE_70ef_return_output := result.sp_relative_shift;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1276_c21_43e6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_43e6_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_43e6_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_43e6_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_43e6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_43e6_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_43e6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1278_l1267_l1262_DUPLICATE_29de LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1278_l1267_l1262_DUPLICATE_29de_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1267_l1270_l1262_DUPLICATE_7ef7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1267_l1270_l1262_DUPLICATE_7ef7_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1270_c11_e5a0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e5a0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e5a0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e5a0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e5a0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e5a0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e5a0_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_4c1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_460c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_4b56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_460c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_460c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_4b56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_460c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_460c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_4b56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_460c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_4b56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_460c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1262_c2_4b56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_460c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_130a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_aaef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_130a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_aaef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_130a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_aaef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_130a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_aaef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_130a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_aaef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_130a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_aaef_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1267_c7_130a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_aaef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3ef4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e5a0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e5a0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3ef4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e5a0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e5a0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3ef4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e5a0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3ef4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e5a0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1270_c7_3ef4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e5a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_7bb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_d73b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_7bb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_d73b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_7bb9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_d73b_return_output;
     VAR_result_u8_value_uxn_opcodes_h_l1276_c3_887d := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_43e6_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1267_l1270_l1262_DUPLICATE_70ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_130a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1267_l1270_l1262_DUPLICATE_70ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1267_l1270_l1262_DUPLICATE_70ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_130a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1278_l1267_l1270_DUPLICATE_d78a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3ef4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1278_l1267_l1270_DUPLICATE_d78a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_7bb9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1278_l1267_l1270_DUPLICATE_d78a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1278_l1267_l1262_DUPLICATE_7c8a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_130a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1278_l1267_l1262_DUPLICATE_7c8a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_7bb9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1278_l1267_l1262_DUPLICATE_7c8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_4b56_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1278_l1267_l1262_DUPLICATE_29de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_130a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1278_l1267_l1262_DUPLICATE_29de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_7bb9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1278_l1267_l1262_DUPLICATE_29de_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_4b56_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1267_l1270_l1262_DUPLICATE_7ef7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_130a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1267_l1270_l1262_DUPLICATE_7ef7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3ef4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1267_l1270_l1262_DUPLICATE_7ef7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3ef4_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1270_c7_3ef4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1273_c30_a6b8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3ef4_iftrue := VAR_result_u8_value_uxn_opcodes_h_l1276_c3_887d;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1278_c7_7bb9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_7bb9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_7bb9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_7bb9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_7bb9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_7bb9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_7bb9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_7bb9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_7bb9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1270_c7_3ef4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3ef4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3ef4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3ef4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3ef4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3ef4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3ef4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1262_c1_4c1e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_4c1e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_4c1e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_4c1e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_4c1e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_4c1e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_4c1e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_4c1e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_4c1e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1270_c7_3ef4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1278_c7_7bb9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_7bb9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_7bb9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_7bb9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_7bb9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_7bb9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_7bb9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_7bb9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_7bb9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1278_c7_7bb9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_7bb9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_7bb9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_7bb9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_7bb9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_7bb9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_7bb9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_7bb9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_7bb9_return_output;

     -- t8_MUX[uxn_opcodes_h_l1270_c7_3ef4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1270_c7_3ef4_cond <= VAR_t8_MUX_uxn_opcodes_h_l1270_c7_3ef4_cond;
     t8_MUX_uxn_opcodes_h_l1270_c7_3ef4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1270_c7_3ef4_iftrue;
     t8_MUX_uxn_opcodes_h_l1270_c7_3ef4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1270_c7_3ef4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output := t8_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1270_c7_3ef4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3ef4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3ef4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3ef4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3ef4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3ef4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3ef4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output;

     -- Submodule level 2
     VAR_printf_uxn_opcodes_h_l1263_c3_94d8_uxn_opcodes_h_l1263_c3_94d8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_4c1e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3ef4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_7bb9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_7bb9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3ef4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_7bb9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_130a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_130a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_130a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1267_c7_130a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1267_c7_130a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_130a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_130a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_130a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_130a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_130a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_130a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_130a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_130a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1267_c7_130a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1267_c7_130a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_130a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1267_c7_130a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_130a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1267_c7_130a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_130a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_130a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1267_c7_130a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1270_c7_3ef4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3ef4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3ef4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3ef4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3ef4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3ef4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3ef4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1270_c7_3ef4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1267_c7_130a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_130a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_130a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_130a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_130a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_130a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_130a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_130a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_130a_return_output;

     -- printf_uxn_opcodes_h_l1263_c3_94d8[uxn_opcodes_h_l1263_c3_94d8] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1263_c3_94d8_uxn_opcodes_h_l1263_c3_94d8_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1263_c3_94d8_uxn_opcodes_h_l1263_c3_94d8_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t8_MUX[uxn_opcodes_h_l1267_c7_130a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1267_c7_130a_cond <= VAR_t8_MUX_uxn_opcodes_h_l1267_c7_130a_cond;
     t8_MUX_uxn_opcodes_h_l1267_c7_130a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1267_c7_130a_iftrue;
     t8_MUX_uxn_opcodes_h_l1267_c7_130a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1267_c7_130a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1267_c7_130a_return_output := t8_MUX_uxn_opcodes_h_l1267_c7_130a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1270_c7_3ef4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3ef4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3ef4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3ef4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3ef4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3ef4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3ef4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_130a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_130a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_130a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3ef4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_130a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_4b56_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_130a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_4b56_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_130a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1262_c2_4b56_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1267_c7_130a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1262_c2_4b56] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_4b56_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_4b56_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_4b56_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_4b56_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_4b56_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_4b56_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1267_c7_130a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_130a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_130a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_130a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_130a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_130a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_130a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_130a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_130a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1267_c7_130a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_130a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_130a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_130a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_130a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_130a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_130a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_130a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_130a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1262_c2_4b56] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1262_c2_4b56_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_4b56_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1262_c2_4b56_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_4b56_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1262_c2_4b56_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_4b56_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output := result_u8_value_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1267_c7_130a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_130a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_130a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_130a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_130a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_130a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_130a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_130a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_130a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1262_c2_4b56] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output;

     -- t8_MUX[uxn_opcodes_h_l1262_c2_4b56] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1262_c2_4b56_cond <= VAR_t8_MUX_uxn_opcodes_h_l1262_c2_4b56_cond;
     t8_MUX_uxn_opcodes_h_l1262_c2_4b56_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1262_c2_4b56_iftrue;
     t8_MUX_uxn_opcodes_h_l1262_c2_4b56_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1262_c2_4b56_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output := t8_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_4b56_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_130a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_130a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_4b56_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_130a_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1262_c2_4b56] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_4b56_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_4b56_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_4b56_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_4b56_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_4b56_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_4b56_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1262_c2_4b56] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_4b56_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_4b56_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_4b56_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_4b56_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_4b56_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_4b56_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1262_c2_4b56] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l1258_l1284_DUPLICATE_1596 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l1258_l1284_DUPLICATE_1596_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8c29(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_4b56_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l1258_l1284_DUPLICATE_1596_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l1258_l1284_DUPLICATE_1596_return_output;
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
