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
-- BIN_OP_EQ[uxn_opcodes_h_l1262_c6_536d]
signal BIN_OP_EQ_uxn_opcodes_h_l1262_c6_536d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1262_c6_536d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1262_c6_536d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1262_c1_9ef9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_9ef9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_9ef9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_9ef9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_9ef9_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1262_c2_992c]
signal t8_MUX_uxn_opcodes_h_l1262_c2_992c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1262_c2_992c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1262_c2_992c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1262_c2_992c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1262_c2_992c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_992c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_992c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_992c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_992c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1262_c2_992c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_992c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_992c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_992c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_992c_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1262_c2_992c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_992c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_992c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_992c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_992c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1262_c2_992c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_992c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_992c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_992c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_992c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1262_c2_992c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_992c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_992c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_992c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_992c_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1262_c2_992c]
signal result_u8_value_MUX_uxn_opcodes_h_l1262_c2_992c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1262_c2_992c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1262_c2_992c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1262_c2_992c_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1263_c3_0c60[uxn_opcodes_h_l1263_c3_0c60]
signal printf_uxn_opcodes_h_l1263_c3_0c60_uxn_opcodes_h_l1263_c3_0c60_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1267_c11_de71]
signal BIN_OP_EQ_uxn_opcodes_h_l1267_c11_de71_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1267_c11_de71_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1267_c11_de71_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1267_c7_294a]
signal t8_MUX_uxn_opcodes_h_l1267_c7_294a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1267_c7_294a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1267_c7_294a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1267_c7_294a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1267_c7_294a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_294a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_294a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_294a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_294a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1267_c7_294a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_294a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_294a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_294a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_294a_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1267_c7_294a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_294a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_294a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_294a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_294a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1267_c7_294a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_294a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_294a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_294a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_294a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1267_c7_294a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_294a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_294a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_294a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_294a_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1267_c7_294a]
signal result_u8_value_MUX_uxn_opcodes_h_l1267_c7_294a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1267_c7_294a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1267_c7_294a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1267_c7_294a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1270_c11_7813]
signal BIN_OP_EQ_uxn_opcodes_h_l1270_c11_7813_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1270_c11_7813_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1270_c11_7813_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1270_c7_3520]
signal t8_MUX_uxn_opcodes_h_l1270_c7_3520_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1270_c7_3520_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1270_c7_3520_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1270_c7_3520_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1270_c7_3520]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3520_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3520_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3520_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3520_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1270_c7_3520]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3520_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3520_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3520_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3520_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1270_c7_3520]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3520_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3520_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3520_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3520_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1270_c7_3520]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3520_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3520_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3520_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3520_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1270_c7_3520]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3520_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3520_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3520_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3520_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1270_c7_3520]
signal result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3520_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3520_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3520_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3520_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1273_c30_f95f]
signal sp_relative_shift_uxn_opcodes_h_l1273_c30_f95f_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1273_c30_f95f_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1273_c30_f95f_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1273_c30_f95f_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1276_c21_f140]
signal BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_f140_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_f140_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_f140_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1278_c11_a37d]
signal BIN_OP_EQ_uxn_opcodes_h_l1278_c11_a37d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1278_c11_a37d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1278_c11_a37d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1278_c7_34e4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_34e4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_34e4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_34e4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_34e4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1278_c7_34e4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_34e4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_34e4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_34e4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_34e4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1278_c7_34e4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_34e4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_34e4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_34e4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_34e4_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_5b93( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1262_c6_536d
BIN_OP_EQ_uxn_opcodes_h_l1262_c6_536d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1262_c6_536d_left,
BIN_OP_EQ_uxn_opcodes_h_l1262_c6_536d_right,
BIN_OP_EQ_uxn_opcodes_h_l1262_c6_536d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_9ef9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_9ef9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_9ef9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_9ef9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_9ef9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_9ef9_return_output);

-- t8_MUX_uxn_opcodes_h_l1262_c2_992c
t8_MUX_uxn_opcodes_h_l1262_c2_992c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1262_c2_992c_cond,
t8_MUX_uxn_opcodes_h_l1262_c2_992c_iftrue,
t8_MUX_uxn_opcodes_h_l1262_c2_992c_iffalse,
t8_MUX_uxn_opcodes_h_l1262_c2_992c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_992c
result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_992c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_992c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_992c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_992c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_992c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_992c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_992c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_992c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_992c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_992c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_992c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_992c
result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_992c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_992c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_992c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_992c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_992c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_992c
result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_992c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_992c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_992c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_992c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_992c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_992c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_992c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_992c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_992c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_992c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_992c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1262_c2_992c
result_u8_value_MUX_uxn_opcodes_h_l1262_c2_992c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1262_c2_992c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1262_c2_992c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1262_c2_992c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1262_c2_992c_return_output);

-- printf_uxn_opcodes_h_l1263_c3_0c60_uxn_opcodes_h_l1263_c3_0c60
printf_uxn_opcodes_h_l1263_c3_0c60_uxn_opcodes_h_l1263_c3_0c60 : entity work.printf_uxn_opcodes_h_l1263_c3_0c60_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1263_c3_0c60_uxn_opcodes_h_l1263_c3_0c60_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1267_c11_de71
BIN_OP_EQ_uxn_opcodes_h_l1267_c11_de71 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1267_c11_de71_left,
BIN_OP_EQ_uxn_opcodes_h_l1267_c11_de71_right,
BIN_OP_EQ_uxn_opcodes_h_l1267_c11_de71_return_output);

-- t8_MUX_uxn_opcodes_h_l1267_c7_294a
t8_MUX_uxn_opcodes_h_l1267_c7_294a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1267_c7_294a_cond,
t8_MUX_uxn_opcodes_h_l1267_c7_294a_iftrue,
t8_MUX_uxn_opcodes_h_l1267_c7_294a_iffalse,
t8_MUX_uxn_opcodes_h_l1267_c7_294a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_294a
result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_294a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_294a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_294a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_294a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_294a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_294a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_294a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_294a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_294a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_294a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_294a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_294a
result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_294a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_294a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_294a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_294a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_294a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_294a
result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_294a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_294a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_294a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_294a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_294a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_294a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_294a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_294a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_294a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_294a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_294a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1267_c7_294a
result_u8_value_MUX_uxn_opcodes_h_l1267_c7_294a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1267_c7_294a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1267_c7_294a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1267_c7_294a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1267_c7_294a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1270_c11_7813
BIN_OP_EQ_uxn_opcodes_h_l1270_c11_7813 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1270_c11_7813_left,
BIN_OP_EQ_uxn_opcodes_h_l1270_c11_7813_right,
BIN_OP_EQ_uxn_opcodes_h_l1270_c11_7813_return_output);

-- t8_MUX_uxn_opcodes_h_l1270_c7_3520
t8_MUX_uxn_opcodes_h_l1270_c7_3520 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1270_c7_3520_cond,
t8_MUX_uxn_opcodes_h_l1270_c7_3520_iftrue,
t8_MUX_uxn_opcodes_h_l1270_c7_3520_iffalse,
t8_MUX_uxn_opcodes_h_l1270_c7_3520_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3520
result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3520 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3520_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3520_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3520_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3520_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3520
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3520 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3520_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3520_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3520_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3520_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3520
result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3520 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3520_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3520_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3520_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3520_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3520
result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3520 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3520_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3520_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3520_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3520_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3520
result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3520 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3520_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3520_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3520_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3520_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3520
result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3520 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3520_cond,
result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3520_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3520_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3520_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1273_c30_f95f
sp_relative_shift_uxn_opcodes_h_l1273_c30_f95f : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1273_c30_f95f_ins,
sp_relative_shift_uxn_opcodes_h_l1273_c30_f95f_x,
sp_relative_shift_uxn_opcodes_h_l1273_c30_f95f_y,
sp_relative_shift_uxn_opcodes_h_l1273_c30_f95f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_f140
BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_f140 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_f140_left,
BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_f140_right,
BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_f140_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1278_c11_a37d
BIN_OP_EQ_uxn_opcodes_h_l1278_c11_a37d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1278_c11_a37d_left,
BIN_OP_EQ_uxn_opcodes_h_l1278_c11_a37d_right,
BIN_OP_EQ_uxn_opcodes_h_l1278_c11_a37d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_34e4
result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_34e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_34e4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_34e4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_34e4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_34e4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_34e4
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_34e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_34e4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_34e4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_34e4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_34e4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_34e4
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_34e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_34e4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_34e4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_34e4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_34e4_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1262_c6_536d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_9ef9_return_output,
 t8_MUX_uxn_opcodes_h_l1262_c2_992c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_992c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_992c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_992c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_992c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_992c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1262_c2_992c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1267_c11_de71_return_output,
 t8_MUX_uxn_opcodes_h_l1267_c7_294a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_294a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_294a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_294a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_294a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_294a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1267_c7_294a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1270_c11_7813_return_output,
 t8_MUX_uxn_opcodes_h_l1270_c7_3520_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3520_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3520_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3520_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3520_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3520_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3520_return_output,
 sp_relative_shift_uxn_opcodes_h_l1273_c30_f95f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_f140_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1278_c11_a37d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_34e4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_34e4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_34e4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_536d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_536d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_536d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_9ef9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_9ef9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_9ef9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_9ef9_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1262_c2_992c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1262_c2_992c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1267_c7_294a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1262_c2_992c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1262_c2_992c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_992c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_992c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_294a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_992c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_992c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_992c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1264_c3_3fd0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_992c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_294a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_992c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_992c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_992c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_992c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_294a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_992c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_992c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_992c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_992c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_294a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_992c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_992c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_992c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_992c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_294a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_992c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_992c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_992c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_992c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_294a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_992c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_992c_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1263_c3_0c60_uxn_opcodes_h_l1263_c3_0c60_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_de71_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_de71_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_de71_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1267_c7_294a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1267_c7_294a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1270_c7_3520_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1267_c7_294a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_294a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_294a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3520_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_294a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_294a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1268_c3_d6e2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_294a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3520_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_294a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_294a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_294a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3520_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_294a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_294a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_294a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3520_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_294a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_294a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_294a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3520_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_294a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_294a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_294a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3520_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_294a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_7813_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_7813_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_7813_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1270_c7_3520_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1270_c7_3520_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1270_c7_3520_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3520_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3520_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_34e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3520_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3520_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1275_c3_fd49 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3520_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1270_c7_3520_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3520_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3520_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3520_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_34e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3520_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3520_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3520_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_34e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3520_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3520_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3520_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3520_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3520_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_opcodes_h_l1276_c3_a838 : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3520_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3520_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1273_c30_f95f_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1273_c30_f95f_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1273_c30_f95f_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1273_c30_f95f_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_f140_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_f140_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_f140_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_a37d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_a37d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_a37d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_34e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_34e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_34e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_34e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_34e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_34e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_34e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_34e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_34e4_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1278_l1267_l1262_DUPLICATE_0d45_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1278_l1267_l1262_DUPLICATE_43ec_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1267_l1270_l1262_DUPLICATE_6135_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1267_l1270_l1262_DUPLICATE_11ea_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1278_l1267_l1270_DUPLICATE_cfbe_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l1258_l1284_DUPLICATE_0787_return_output : opcode_result_t;
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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_9ef9_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1268_c3_d6e2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_294a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1268_c3_d6e2;
     VAR_sp_relative_shift_uxn_opcodes_h_l1273_c30_f95f_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_de71_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_34e4_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1264_c3_3fd0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_992c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1264_c3_3fd0;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_f140_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_536d_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3520_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_7813_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_34e4_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_992c_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3520_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1275_c3_fd49 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3520_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1275_c3_fd49;
     VAR_sp_relative_shift_uxn_opcodes_h_l1273_c30_f95f_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_34e4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_a37d_right := to_unsigned(3, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_9ef9_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1273_c30_f95f_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_536d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_de71_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_7813_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_a37d_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_f140_left := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1270_c7_3520_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1262_c2_992c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1267_c7_294a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1270_c7_3520_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1270_c11_7813] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1270_c11_7813_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_7813_left;
     BIN_OP_EQ_uxn_opcodes_h_l1270_c11_7813_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_7813_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_7813_return_output := BIN_OP_EQ_uxn_opcodes_h_l1270_c11_7813_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1267_c11_de71] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1267_c11_de71_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_de71_left;
     BIN_OP_EQ_uxn_opcodes_h_l1267_c11_de71_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_de71_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_de71_return_output := BIN_OP_EQ_uxn_opcodes_h_l1267_c11_de71_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1278_l1267_l1262_DUPLICATE_43ec LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1278_l1267_l1262_DUPLICATE_43ec_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1278_c11_a37d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1278_c11_a37d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_a37d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1278_c11_a37d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_a37d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_a37d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1278_c11_a37d_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1267_l1270_l1262_DUPLICATE_11ea LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1267_l1270_l1262_DUPLICATE_11ea_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1278_l1267_l1262_DUPLICATE_0d45 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1278_l1267_l1262_DUPLICATE_0d45_return_output := result.is_stack_write;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1270_c7_3520] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1270_c7_3520_return_output := result.stack_address_sp_offset;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1276_c21_f140] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_f140_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_f140_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_f140_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_f140_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_f140_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_f140_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1267_l1270_l1262_DUPLICATE_6135 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1267_l1270_l1262_DUPLICATE_6135_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1278_l1267_l1270_DUPLICATE_cfbe LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1278_l1267_l1270_DUPLICATE_cfbe_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1262_c6_536d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1262_c6_536d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_536d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1262_c6_536d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_536d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_536d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1262_c6_536d_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1273_c30_f95f] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1273_c30_f95f_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1273_c30_f95f_ins;
     sp_relative_shift_uxn_opcodes_h_l1273_c30_f95f_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1273_c30_f95f_x;
     sp_relative_shift_uxn_opcodes_h_l1273_c30_f95f_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1273_c30_f95f_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1273_c30_f95f_return_output := sp_relative_shift_uxn_opcodes_h_l1273_c30_f95f_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_9ef9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_536d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_992c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_536d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_992c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_536d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_992c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_536d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_992c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_536d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_992c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_536d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_992c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_536d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1262_c2_992c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_536d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_294a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_de71_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_294a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_de71_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_294a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_de71_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_294a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_de71_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_294a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_de71_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_294a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_de71_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1267_c7_294a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_de71_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3520_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_7813_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3520_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_7813_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3520_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_7813_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3520_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_7813_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3520_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_7813_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3520_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_7813_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1270_c7_3520_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_7813_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_34e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_a37d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_34e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_a37d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_34e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_a37d_return_output;
     VAR_result_u8_value_uxn_opcodes_h_l1276_c3_a838 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1276_c21_f140_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_992c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1267_l1270_l1262_DUPLICATE_6135_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_294a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1267_l1270_l1262_DUPLICATE_6135_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3520_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1267_l1270_l1262_DUPLICATE_6135_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_294a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1278_l1267_l1270_DUPLICATE_cfbe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3520_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1278_l1267_l1270_DUPLICATE_cfbe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_34e4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1278_l1267_l1270_DUPLICATE_cfbe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_992c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1278_l1267_l1262_DUPLICATE_43ec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_294a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1278_l1267_l1262_DUPLICATE_43ec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_34e4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1278_l1267_l1262_DUPLICATE_43ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_992c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1278_l1267_l1262_DUPLICATE_0d45_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_294a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1278_l1267_l1262_DUPLICATE_0d45_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_34e4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1278_l1267_l1262_DUPLICATE_0d45_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_992c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1267_l1270_l1262_DUPLICATE_11ea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_294a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1267_l1270_l1262_DUPLICATE_11ea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3520_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1267_l1270_l1262_DUPLICATE_11ea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3520_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1270_c7_3520_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3520_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1273_c30_f95f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3520_iftrue := VAR_result_u8_value_uxn_opcodes_h_l1276_c3_a838;
     -- t8_MUX[uxn_opcodes_h_l1270_c7_3520] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1270_c7_3520_cond <= VAR_t8_MUX_uxn_opcodes_h_l1270_c7_3520_cond;
     t8_MUX_uxn_opcodes_h_l1270_c7_3520_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1270_c7_3520_iftrue;
     t8_MUX_uxn_opcodes_h_l1270_c7_3520_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1270_c7_3520_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1270_c7_3520_return_output := t8_MUX_uxn_opcodes_h_l1270_c7_3520_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1270_c7_3520] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3520_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3520_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3520_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3520_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3520_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3520_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3520_return_output := result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3520_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1278_c7_34e4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_34e4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_34e4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_34e4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_34e4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_34e4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_34e4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_34e4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_34e4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1270_c7_3520] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3520_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3520_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3520_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3520_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3520_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3520_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3520_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3520_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1262_c1_9ef9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_9ef9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_9ef9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_9ef9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_9ef9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_9ef9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_9ef9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_9ef9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_9ef9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1278_c7_34e4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_34e4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_34e4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_34e4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_34e4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_34e4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_34e4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_34e4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_34e4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1270_c7_3520] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3520_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3520_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3520_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3520_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3520_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3520_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3520_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3520_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1278_c7_34e4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_34e4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_34e4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_34e4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_34e4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_34e4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_34e4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_34e4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_34e4_return_output;

     -- Submodule level 2
     VAR_printf_uxn_opcodes_h_l1263_c3_0c60_uxn_opcodes_h_l1263_c3_0c60_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_9ef9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3520_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_34e4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3520_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_34e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3520_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_34e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_294a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_3520_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_294a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_3520_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_294a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_3520_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1267_c7_294a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1270_c7_3520_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1270_c7_3520] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3520_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3520_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3520_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3520_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3520_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3520_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3520_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3520_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1270_c7_3520] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3520_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3520_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3520_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3520_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3520_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3520_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3520_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3520_return_output;

     -- t8_MUX[uxn_opcodes_h_l1267_c7_294a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1267_c7_294a_cond <= VAR_t8_MUX_uxn_opcodes_h_l1267_c7_294a_cond;
     t8_MUX_uxn_opcodes_h_l1267_c7_294a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1267_c7_294a_iftrue;
     t8_MUX_uxn_opcodes_h_l1267_c7_294a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1267_c7_294a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1267_c7_294a_return_output := t8_MUX_uxn_opcodes_h_l1267_c7_294a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1267_c7_294a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_294a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_294a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_294a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_294a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_294a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_294a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_294a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_294a_return_output;

     -- printf_uxn_opcodes_h_l1263_c3_0c60[uxn_opcodes_h_l1263_c3_0c60] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1263_c3_0c60_uxn_opcodes_h_l1263_c3_0c60_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1263_c3_0c60_uxn_opcodes_h_l1263_c3_0c60_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1267_c7_294a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_294a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_294a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_294a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_294a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_294a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_294a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_294a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_294a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1267_c7_294a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1267_c7_294a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_294a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1267_c7_294a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_294a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1267_c7_294a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_294a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_294a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1267_c7_294a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1270_c7_3520] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3520_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3520_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3520_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3520_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3520_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3520_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3520_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3520_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_294a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_3520_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_294a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_3520_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_294a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_3520_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_992c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_294a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_992c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_294a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_992c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_294a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1262_c2_992c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1267_c7_294a_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1267_c7_294a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_294a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_294a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_294a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_294a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_294a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_294a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_294a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_294a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1262_c2_992c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_992c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_992c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_992c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_992c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_992c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_992c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_992c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_992c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1262_c2_992c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1262_c2_992c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_992c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1262_c2_992c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_992c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1262_c2_992c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_992c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_992c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1262_c2_992c_return_output;

     -- t8_MUX[uxn_opcodes_h_l1262_c2_992c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1262_c2_992c_cond <= VAR_t8_MUX_uxn_opcodes_h_l1262_c2_992c_cond;
     t8_MUX_uxn_opcodes_h_l1262_c2_992c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1262_c2_992c_iftrue;
     t8_MUX_uxn_opcodes_h_l1262_c2_992c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1262_c2_992c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1262_c2_992c_return_output := t8_MUX_uxn_opcodes_h_l1262_c2_992c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1267_c7_294a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_294a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_294a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_294a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_294a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_294a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_294a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_294a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_294a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1267_c7_294a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_294a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_294a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_294a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_294a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_294a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_294a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_294a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_294a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1262_c2_992c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_992c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_992c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_992c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_992c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_992c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_992c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_992c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_992c_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_992c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_294a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_992c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_294a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_992c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_294a_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1262_c2_992c_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1262_c2_992c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_992c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_992c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_992c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_992c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_992c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_992c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_992c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_992c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1262_c2_992c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_992c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_992c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_992c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_992c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_992c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_992c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_992c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_992c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1262_c2_992c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_992c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_992c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_992c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_992c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_992c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_992c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_992c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_992c_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l1258_l1284_DUPLICATE_0787 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l1258_l1284_DUPLICATE_0787_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5b93(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_992c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_992c_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_992c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_992c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_992c_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_992c_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l1258_l1284_DUPLICATE_0787_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5b93_uxn_opcodes_h_l1258_l1284_DUPLICATE_0787_return_output;
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
