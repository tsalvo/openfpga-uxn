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
-- Submodules: 29
entity inc_0CLK_b6f89731 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end inc_0CLK_b6f89731;
architecture arch of inc_0CLK_b6f89731 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1198_c6_2b61]
signal BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b61_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b61_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b61_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1198_c2_d558]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_d558_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_d558_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_d558_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_d558_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1198_c2_d558]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c2_d558_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c2_d558_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c2_d558_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c2_d558_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1198_c2_d558]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_d558_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_d558_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_d558_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_d558_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1198_c2_d558]
signal result_u8_value_MUX_uxn_opcodes_h_l1198_c2_d558_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1198_c2_d558_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1198_c2_d558_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1198_c2_d558_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1198_c2_d558]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_d558_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_d558_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_d558_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_d558_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1198_c2_d558]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_d558_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_d558_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_d558_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_d558_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1198_c2_d558]
signal t8_MUX_uxn_opcodes_h_l1198_c2_d558_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1198_c2_d558_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1198_c2_d558_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1198_c2_d558_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1205_c11_56c4]
signal BIN_OP_EQ_uxn_opcodes_h_l1205_c11_56c4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1205_c11_56c4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1205_c11_56c4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1205_c7_7ab4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_7ab4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_7ab4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_7ab4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1205_c7_7ab4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1205_c7_7ab4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_7ab4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_7ab4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_7ab4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1205_c7_7ab4]
signal result_u8_value_MUX_uxn_opcodes_h_l1205_c7_7ab4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1205_c7_7ab4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1205_c7_7ab4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1205_c7_7ab4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1205_c7_7ab4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_7ab4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_7ab4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_7ab4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1205_c7_7ab4]
signal t8_MUX_uxn_opcodes_h_l1205_c7_7ab4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1205_c7_7ab4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1205_c7_7ab4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1207_c30_9972]
signal sp_relative_shift_uxn_opcodes_h_l1207_c30_9972_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1207_c30_9972_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1207_c30_9972_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1207_c30_9972_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1209_c11_5984]
signal BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5984_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5984_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5984_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1209_c7_c1aa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c1aa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c1aa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c1aa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c1aa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1209_c7_c1aa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c1aa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c1aa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c1aa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c1aa_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1209_c7_c1aa]
signal result_u8_value_MUX_uxn_opcodes_h_l1209_c7_c1aa_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1209_c7_c1aa_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1209_c7_c1aa_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1209_c7_c1aa_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1209_c7_c1aa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c1aa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c1aa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c1aa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c1aa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1209_c7_c1aa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c1aa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c1aa_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c1aa_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c1aa_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l1209_c7_c1aa]
signal t8_MUX_uxn_opcodes_h_l1209_c7_c1aa_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1209_c7_c1aa_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1209_c7_c1aa_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1209_c7_c1aa_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1214_c21_1ff6]
signal BIN_OP_PLUS_uxn_opcodes_h_l1214_c21_1ff6_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1214_c21_1ff6_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1214_c21_1ff6_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1216_c11_f3e0]
signal BIN_OP_EQ_uxn_opcodes_h_l1216_c11_f3e0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1216_c11_f3e0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1216_c11_f3e0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1216_c7_21ce]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_21ce_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_21ce_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_21ce_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_21ce_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1216_c7_21ce]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_21ce_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_21ce_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_21ce_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_21ce_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_8d93( ref_toks_0 : opcode_result_t;
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
      base.is_sp_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b61
BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b61 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b61_left,
BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b61_right,
BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b61_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_d558
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_d558 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_d558_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_d558_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_d558_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_d558_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c2_d558
result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c2_d558 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c2_d558_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c2_d558_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c2_d558_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c2_d558_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_d558
result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_d558 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_d558_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_d558_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_d558_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_d558_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1198_c2_d558
result_u8_value_MUX_uxn_opcodes_h_l1198_c2_d558 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1198_c2_d558_cond,
result_u8_value_MUX_uxn_opcodes_h_l1198_c2_d558_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1198_c2_d558_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1198_c2_d558_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_d558
result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_d558 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_d558_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_d558_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_d558_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_d558_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_d558
result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_d558 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_d558_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_d558_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_d558_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_d558_return_output);

-- t8_MUX_uxn_opcodes_h_l1198_c2_d558
t8_MUX_uxn_opcodes_h_l1198_c2_d558 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1198_c2_d558_cond,
t8_MUX_uxn_opcodes_h_l1198_c2_d558_iftrue,
t8_MUX_uxn_opcodes_h_l1198_c2_d558_iffalse,
t8_MUX_uxn_opcodes_h_l1198_c2_d558_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1205_c11_56c4
BIN_OP_EQ_uxn_opcodes_h_l1205_c11_56c4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1205_c11_56c4_left,
BIN_OP_EQ_uxn_opcodes_h_l1205_c11_56c4_right,
BIN_OP_EQ_uxn_opcodes_h_l1205_c11_56c4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_7ab4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_7ab4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_7ab4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_7ab4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_7ab4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4
result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_7ab4
result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_7ab4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_7ab4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_7ab4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_7ab4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1205_c7_7ab4
result_u8_value_MUX_uxn_opcodes_h_l1205_c7_7ab4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1205_c7_7ab4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1205_c7_7ab4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1205_c7_7ab4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_7ab4
result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_7ab4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_7ab4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_7ab4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_7ab4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output);

-- t8_MUX_uxn_opcodes_h_l1205_c7_7ab4
t8_MUX_uxn_opcodes_h_l1205_c7_7ab4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1205_c7_7ab4_cond,
t8_MUX_uxn_opcodes_h_l1205_c7_7ab4_iftrue,
t8_MUX_uxn_opcodes_h_l1205_c7_7ab4_iffalse,
t8_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1207_c30_9972
sp_relative_shift_uxn_opcodes_h_l1207_c30_9972 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1207_c30_9972_ins,
sp_relative_shift_uxn_opcodes_h_l1207_c30_9972_x,
sp_relative_shift_uxn_opcodes_h_l1207_c30_9972_y,
sp_relative_shift_uxn_opcodes_h_l1207_c30_9972_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5984
BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5984 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5984_left,
BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5984_right,
BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5984_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c1aa
result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c1aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c1aa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c1aa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c1aa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c1aa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c1aa
result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c1aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c1aa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c1aa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c1aa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c1aa_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1209_c7_c1aa
result_u8_value_MUX_uxn_opcodes_h_l1209_c7_c1aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1209_c7_c1aa_cond,
result_u8_value_MUX_uxn_opcodes_h_l1209_c7_c1aa_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1209_c7_c1aa_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1209_c7_c1aa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c1aa
result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c1aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c1aa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c1aa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c1aa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c1aa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c1aa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c1aa : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c1aa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c1aa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c1aa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c1aa_return_output);

-- t8_MUX_uxn_opcodes_h_l1209_c7_c1aa
t8_MUX_uxn_opcodes_h_l1209_c7_c1aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1209_c7_c1aa_cond,
t8_MUX_uxn_opcodes_h_l1209_c7_c1aa_iftrue,
t8_MUX_uxn_opcodes_h_l1209_c7_c1aa_iffalse,
t8_MUX_uxn_opcodes_h_l1209_c7_c1aa_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1214_c21_1ff6
BIN_OP_PLUS_uxn_opcodes_h_l1214_c21_1ff6 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1214_c21_1ff6_left,
BIN_OP_PLUS_uxn_opcodes_h_l1214_c21_1ff6_right,
BIN_OP_PLUS_uxn_opcodes_h_l1214_c21_1ff6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1216_c11_f3e0
BIN_OP_EQ_uxn_opcodes_h_l1216_c11_f3e0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1216_c11_f3e0_left,
BIN_OP_EQ_uxn_opcodes_h_l1216_c11_f3e0_right,
BIN_OP_EQ_uxn_opcodes_h_l1216_c11_f3e0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_21ce
result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_21ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_21ce_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_21ce_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_21ce_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_21ce_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_21ce
result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_21ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_21ce_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_21ce_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_21ce_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_21ce_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b61_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_d558_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c2_d558_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_d558_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1198_c2_d558_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_d558_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_d558_return_output,
 t8_MUX_uxn_opcodes_h_l1198_c2_d558_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1205_c11_56c4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output,
 t8_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output,
 sp_relative_shift_uxn_opcodes_h_l1207_c30_9972_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5984_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c1aa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c1aa_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1209_c7_c1aa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c1aa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c1aa_return_output,
 t8_MUX_uxn_opcodes_h_l1209_c7_c1aa_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1214_c21_1ff6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1216_c11_f3e0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_21ce_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_21ce_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b61_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b61_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b61_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_d558_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1202_c3_720b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_d558_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_d558_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_d558_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c2_d558_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c2_d558_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c2_d558_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c2_d558_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_d558_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_d558_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_d558_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_d558_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_d558_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_d558_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_d558_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_d558_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_d558_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_d558_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_d558_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_d558_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_d558_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_d558_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_d558_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_d558_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1198_c2_d558_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1198_c2_d558_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1198_c2_d558_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1198_c2_d558_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_56c4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_56c4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_56c4_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_7ab4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_7ab4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c1aa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_7ab4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c1aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_7ab4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_7ab4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c1aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_7ab4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1205_c7_7ab4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1205_c7_7ab4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1209_c7_c1aa_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1205_c7_7ab4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_7ab4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_7ab4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c1aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_7ab4_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1205_c7_7ab4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1205_c7_7ab4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1209_c7_c1aa_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1205_c7_7ab4_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1207_c30_9972_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1207_c30_9972_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1207_c30_9972_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1207_c30_9972_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5984_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5984_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5984_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c1aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c1aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c1aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c1aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c1aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_21ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c1aa_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1209_c7_c1aa_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_opcodes_h_l1214_c3_91bf : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1209_c7_c1aa_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1209_c7_c1aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c1aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c1aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_21ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c1aa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c1aa_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1213_c3_47c4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c1aa_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c1aa_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1209_c7_c1aa_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1209_c7_c1aa_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1209_c7_c1aa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1214_c21_1ff6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1214_c21_1ff6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1214_c21_1ff6_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_f3e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_f3e0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_f3e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_21ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_21ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_21ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_21ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_21ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_21ce_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1198_l1209_DUPLICATE_788f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1198_l1209_l1205_DUPLICATE_40e0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1198_l1205_DUPLICATE_080a_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1216_l1198_l1205_DUPLICATE_55e2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1209_l1205_DUPLICATE_77f1_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1216_l1209_l1205_DUPLICATE_f1f5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8d93_uxn_opcodes_h_l1221_l1194_DUPLICATE_edb4_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1202_c3_720b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_d558_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1202_c3_720b;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c1aa_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_d558_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_21ce_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b61_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c1aa_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1207_c30_9972_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_f3e0_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5984_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1207_c30_9972_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1213_c3_47c4 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c1aa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1213_c3_47c4;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1214_c21_1ff6_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_56c4_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_21ce_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1207_c30_9972_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b61_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_56c4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5984_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_f3e0_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1214_c21_1ff6_left := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1209_c7_c1aa_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1198_c2_d558_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1205_c7_7ab4_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1209_c7_c1aa_iffalse := t8;
     -- sp_relative_shift[uxn_opcodes_h_l1207_c30_9972] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1207_c30_9972_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1207_c30_9972_ins;
     sp_relative_shift_uxn_opcodes_h_l1207_c30_9972_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1207_c30_9972_x;
     sp_relative_shift_uxn_opcodes_h_l1207_c30_9972_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1207_c30_9972_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1207_c30_9972_return_output := sp_relative_shift_uxn_opcodes_h_l1207_c30_9972_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1198_l1209_l1205_DUPLICATE_40e0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1198_l1209_l1205_DUPLICATE_40e0_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1209_c11_5984] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5984_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5984_left;
     BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5984_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5984_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5984_return_output := BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5984_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1209_l1205_DUPLICATE_77f1 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1209_l1205_DUPLICATE_77f1_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1216_l1209_l1205_DUPLICATE_f1f5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1216_l1209_l1205_DUPLICATE_f1f5_return_output := result.is_opc_done;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1198_l1205_DUPLICATE_080a LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1198_l1205_DUPLICATE_080a_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1216_c11_f3e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1216_c11_f3e0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_f3e0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1216_c11_f3e0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_f3e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_f3e0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1216_c11_f3e0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1216_l1198_l1205_DUPLICATE_55e2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1216_l1198_l1205_DUPLICATE_55e2_return_output := result.is_stack_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1214_c21_1ff6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1214_c21_1ff6_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1214_c21_1ff6_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1214_c21_1ff6_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1214_c21_1ff6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1214_c21_1ff6_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1214_c21_1ff6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1205_c11_56c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1205_c11_56c4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_56c4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1205_c11_56c4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_56c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_56c4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1205_c11_56c4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1198_l1209_DUPLICATE_788f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1198_l1209_DUPLICATE_788f_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1198_c6_2b61] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b61_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b61_left;
     BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b61_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b61_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b61_return_output := BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b61_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_d558_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b61_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c2_d558_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b61_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_d558_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_d558_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b61_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_d558_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b61_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_d558_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b61_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1198_c2_d558_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1198_c6_2b61_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_7ab4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_56c4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_56c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_7ab4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_56c4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_56c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_7ab4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_56c4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1205_c7_7ab4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_56c4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1205_c7_7ab4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1205_c11_56c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c1aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5984_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c1aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5984_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c1aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5984_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c1aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5984_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1209_c7_c1aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5984_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1209_c7_c1aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1209_c11_5984_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_21ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_f3e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_21ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1216_c11_f3e0_return_output;
     VAR_result_u8_value_uxn_opcodes_h_l1214_c3_91bf := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1214_c21_1ff6_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_d558_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1198_l1205_DUPLICATE_080a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1198_l1205_DUPLICATE_080a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_7ab4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1216_l1209_l1205_DUPLICATE_f1f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c1aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1216_l1209_l1205_DUPLICATE_f1f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_21ce_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1216_l1209_l1205_DUPLICATE_f1f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c2_d558_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1198_l1209_DUPLICATE_788f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c1aa_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1198_l1209_DUPLICATE_788f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_d558_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1216_l1198_l1205_DUPLICATE_55e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_7ab4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1216_l1198_l1205_DUPLICATE_55e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_21ce_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1216_l1198_l1205_DUPLICATE_55e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_7ab4_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1209_l1205_DUPLICATE_77f1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c1aa_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1209_l1205_DUPLICATE_77f1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_d558_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1198_l1209_l1205_DUPLICATE_40e0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1205_c7_7ab4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1198_l1209_l1205_DUPLICATE_40e0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1209_c7_c1aa_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1198_l1209_l1205_DUPLICATE_40e0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1207_c30_9972_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1209_c7_c1aa_iftrue := VAR_result_u8_value_uxn_opcodes_h_l1214_c3_91bf;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1209_c7_c1aa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c1aa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c1aa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c1aa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c1aa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c1aa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c1aa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c1aa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c1aa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1216_c7_21ce] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_21ce_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_21ce_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_21ce_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_21ce_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_21ce_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_21ce_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_21ce_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_21ce_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1205_c7_7ab4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1216_c7_21ce] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_21ce_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_21ce_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_21ce_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_21ce_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_21ce_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_21ce_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_21ce_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_21ce_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1209_c7_c1aa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c1aa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c1aa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c1aa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c1aa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c1aa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c1aa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c1aa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c1aa_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1209_c7_c1aa] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1209_c7_c1aa_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1209_c7_c1aa_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1209_c7_c1aa_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1209_c7_c1aa_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1209_c7_c1aa_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1209_c7_c1aa_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1209_c7_c1aa_return_output := result_u8_value_MUX_uxn_opcodes_h_l1209_c7_c1aa_return_output;

     -- t8_MUX[uxn_opcodes_h_l1209_c7_c1aa] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1209_c7_c1aa_cond <= VAR_t8_MUX_uxn_opcodes_h_l1209_c7_c1aa_cond;
     t8_MUX_uxn_opcodes_h_l1209_c7_c1aa_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1209_c7_c1aa_iftrue;
     t8_MUX_uxn_opcodes_h_l1209_c7_c1aa_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1209_c7_c1aa_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1209_c7_c1aa_return_output := t8_MUX_uxn_opcodes_h_l1209_c7_c1aa_return_output;

     -- Submodule level 2
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c1aa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1216_c7_21ce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1209_c7_c1aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c1aa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1216_c7_21ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_d558_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_7ab4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1209_c7_c1aa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1205_c7_7ab4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1209_c7_c1aa_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1205_c7_7ab4_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1209_c7_c1aa_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1205_c7_7ab4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1205_c7_7ab4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1205_c7_7ab4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1205_c7_7ab4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1205_c7_7ab4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1205_c7_7ab4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1205_c7_7ab4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1198_c2_d558] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_d558_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_d558_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_d558_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_d558_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_d558_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_d558_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_d558_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_d558_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1205_c7_7ab4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_7ab4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_7ab4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_7ab4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_7ab4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_7ab4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_7ab4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1209_c7_c1aa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c1aa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c1aa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c1aa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c1aa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c1aa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c1aa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c1aa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c1aa_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1205_c7_7ab4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1209_c7_c1aa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c1aa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c1aa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c1aa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c1aa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c1aa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c1aa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c1aa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c1aa_return_output;

     -- t8_MUX[uxn_opcodes_h_l1205_c7_7ab4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1205_c7_7ab4_cond <= VAR_t8_MUX_uxn_opcodes_h_l1205_c7_7ab4_cond;
     t8_MUX_uxn_opcodes_h_l1205_c7_7ab4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1205_c7_7ab4_iftrue;
     t8_MUX_uxn_opcodes_h_l1205_c7_7ab4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1205_c7_7ab4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output := t8_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_7ab4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1209_c7_c1aa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c2_d558_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_7ab4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1209_c7_c1aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_d558_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_d558_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1198_c2_d558_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1205_c7_7ab4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_7ab4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_7ab4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_7ab4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_7ab4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_7ab4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_7ab4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output;

     -- t8_MUX[uxn_opcodes_h_l1198_c2_d558] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1198_c2_d558_cond <= VAR_t8_MUX_uxn_opcodes_h_l1198_c2_d558_cond;
     t8_MUX_uxn_opcodes_h_l1198_c2_d558_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1198_c2_d558_iftrue;
     t8_MUX_uxn_opcodes_h_l1198_c2_d558_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1198_c2_d558_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1198_c2_d558_return_output := t8_MUX_uxn_opcodes_h_l1198_c2_d558_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1198_c2_d558] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c2_d558_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c2_d558_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c2_d558_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c2_d558_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c2_d558_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c2_d558_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c2_d558_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c2_d558_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1198_c2_d558] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_d558_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_d558_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_d558_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_d558_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_d558_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_d558_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_d558_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_d558_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1205_c7_7ab4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_7ab4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_7ab4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_7ab4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_7ab4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_7ab4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_7ab4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1198_c2_d558] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1198_c2_d558_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_d558_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1198_c2_d558_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_d558_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1198_c2_d558_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_d558_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_d558_return_output := result_u8_value_MUX_uxn_opcodes_h_l1198_c2_d558_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_d558_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_d558_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1205_c7_7ab4_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1198_c2_d558_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1198_c2_d558] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_d558_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_d558_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_d558_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_d558_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_d558_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_d558_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_d558_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_d558_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1198_c2_d558] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_d558_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_d558_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_d558_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_d558_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_d558_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_d558_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_d558_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_d558_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8d93_uxn_opcodes_h_l1221_l1194_DUPLICATE_edb4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8d93_uxn_opcodes_h_l1221_l1194_DUPLICATE_edb4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8d93(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1198_c2_d558_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1198_c2_d558_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1198_c2_d558_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1198_c2_d558_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1198_c2_d558_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1198_c2_d558_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8d93_uxn_opcodes_h_l1221_l1194_DUPLICATE_edb4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8d93_uxn_opcodes_h_l1221_l1194_DUPLICATE_edb4_return_output;
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
