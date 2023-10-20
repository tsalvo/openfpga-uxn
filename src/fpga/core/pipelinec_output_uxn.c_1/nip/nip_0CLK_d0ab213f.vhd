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
-- Submodules: 30
entity nip_0CLK_d0ab213f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end nip_0CLK_d0ab213f;
architecture arch of nip_0CLK_d0ab213f is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2281_c6_c965]
signal BIN_OP_EQ_uxn_opcodes_h_l2281_c6_c965_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2281_c6_c965_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2281_c6_c965_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2281_c2_0228]
signal t8_MUX_uxn_opcodes_h_l2281_c2_0228_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2281_c2_0228_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2281_c2_0228_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2281_c2_0228_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2281_c2_0228]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c2_0228_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c2_0228_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c2_0228_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c2_0228_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2281_c2_0228]
signal result_u8_value_MUX_uxn_opcodes_h_l2281_c2_0228_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2281_c2_0228_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2281_c2_0228_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2281_c2_0228_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2281_c2_0228]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2281_c2_0228_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2281_c2_0228_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2281_c2_0228_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2281_c2_0228_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2281_c2_0228]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2281_c2_0228_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2281_c2_0228_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2281_c2_0228_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2281_c2_0228_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2281_c2_0228]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c2_0228_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c2_0228_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c2_0228_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c2_0228_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2281_c2_0228]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2281_c2_0228_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2281_c2_0228_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2281_c2_0228_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2281_c2_0228_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2286_c11_b550]
signal BIN_OP_EQ_uxn_opcodes_h_l2286_c11_b550_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2286_c11_b550_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2286_c11_b550_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2286_c7_f7f6]
signal t8_MUX_uxn_opcodes_h_l2286_c7_f7f6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2286_c7_f7f6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2286_c7_f7f6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2286_c7_f7f6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_f7f6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_f7f6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_f7f6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2286_c7_f7f6]
signal result_u8_value_MUX_uxn_opcodes_h_l2286_c7_f7f6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2286_c7_f7f6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2286_c7_f7f6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2286_c7_f7f6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_f7f6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_f7f6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_f7f6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2286_c7_f7f6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_f7f6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_f7f6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_f7f6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2286_c7_f7f6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2286_c7_f7f6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2289_c11_6a1b]
signal BIN_OP_EQ_uxn_opcodes_h_l2289_c11_6a1b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2289_c11_6a1b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2289_c11_6a1b_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2289_c7_a4dc]
signal t8_MUX_uxn_opcodes_h_l2289_c7_a4dc_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2289_c7_a4dc_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2289_c7_a4dc_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2289_c7_a4dc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_a4dc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_a4dc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_a4dc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2289_c7_a4dc]
signal result_u8_value_MUX_uxn_opcodes_h_l2289_c7_a4dc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2289_c7_a4dc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2289_c7_a4dc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2289_c7_a4dc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_a4dc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_a4dc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_a4dc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2289_c7_a4dc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_a4dc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_a4dc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_a4dc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2289_c7_a4dc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2289_c7_a4dc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2292_c30_741a]
signal sp_relative_shift_uxn_opcodes_h_l2292_c30_741a_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2292_c30_741a_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2292_c30_741a_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2292_c30_741a_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2297_c11_3c1b]
signal BIN_OP_EQ_uxn_opcodes_h_l2297_c11_3c1b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2297_c11_3c1b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2297_c11_3c1b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2297_c7_21ac]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_21ac_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_21ac_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_21ac_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_21ac_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2297_c7_21ac]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_21ac_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_21ac_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_21ac_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_21ac_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2297_c7_21ac]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_21ac_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_21ac_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_21ac_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_21ac_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_3345( ref_toks_0 : opcode_result_t;
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
      base.u8_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2281_c6_c965
BIN_OP_EQ_uxn_opcodes_h_l2281_c6_c965 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2281_c6_c965_left,
BIN_OP_EQ_uxn_opcodes_h_l2281_c6_c965_right,
BIN_OP_EQ_uxn_opcodes_h_l2281_c6_c965_return_output);

-- t8_MUX_uxn_opcodes_h_l2281_c2_0228
t8_MUX_uxn_opcodes_h_l2281_c2_0228 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2281_c2_0228_cond,
t8_MUX_uxn_opcodes_h_l2281_c2_0228_iftrue,
t8_MUX_uxn_opcodes_h_l2281_c2_0228_iffalse,
t8_MUX_uxn_opcodes_h_l2281_c2_0228_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c2_0228
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c2_0228 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c2_0228_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c2_0228_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c2_0228_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c2_0228_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2281_c2_0228
result_u8_value_MUX_uxn_opcodes_h_l2281_c2_0228 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2281_c2_0228_cond,
result_u8_value_MUX_uxn_opcodes_h_l2281_c2_0228_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2281_c2_0228_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2281_c2_0228_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2281_c2_0228
result_is_stack_write_MUX_uxn_opcodes_h_l2281_c2_0228 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2281_c2_0228_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2281_c2_0228_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2281_c2_0228_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2281_c2_0228_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2281_c2_0228
result_is_opc_done_MUX_uxn_opcodes_h_l2281_c2_0228 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2281_c2_0228_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2281_c2_0228_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2281_c2_0228_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2281_c2_0228_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c2_0228
result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c2_0228 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c2_0228_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c2_0228_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c2_0228_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c2_0228_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2281_c2_0228
result_is_sp_shift_MUX_uxn_opcodes_h_l2281_c2_0228 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2281_c2_0228_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2281_c2_0228_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2281_c2_0228_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2281_c2_0228_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2286_c11_b550
BIN_OP_EQ_uxn_opcodes_h_l2286_c11_b550 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2286_c11_b550_left,
BIN_OP_EQ_uxn_opcodes_h_l2286_c11_b550_right,
BIN_OP_EQ_uxn_opcodes_h_l2286_c11_b550_return_output);

-- t8_MUX_uxn_opcodes_h_l2286_c7_f7f6
t8_MUX_uxn_opcodes_h_l2286_c7_f7f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2286_c7_f7f6_cond,
t8_MUX_uxn_opcodes_h_l2286_c7_f7f6_iftrue,
t8_MUX_uxn_opcodes_h_l2286_c7_f7f6_iffalse,
t8_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_f7f6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_f7f6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_f7f6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_f7f6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_f7f6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2286_c7_f7f6
result_u8_value_MUX_uxn_opcodes_h_l2286_c7_f7f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2286_c7_f7f6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2286_c7_f7f6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2286_c7_f7f6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_f7f6
result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_f7f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_f7f6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_f7f6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_f7f6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_f7f6
result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_f7f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_f7f6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_f7f6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_f7f6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6
result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2289_c11_6a1b
BIN_OP_EQ_uxn_opcodes_h_l2289_c11_6a1b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2289_c11_6a1b_left,
BIN_OP_EQ_uxn_opcodes_h_l2289_c11_6a1b_right,
BIN_OP_EQ_uxn_opcodes_h_l2289_c11_6a1b_return_output);

-- t8_MUX_uxn_opcodes_h_l2289_c7_a4dc
t8_MUX_uxn_opcodes_h_l2289_c7_a4dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2289_c7_a4dc_cond,
t8_MUX_uxn_opcodes_h_l2289_c7_a4dc_iftrue,
t8_MUX_uxn_opcodes_h_l2289_c7_a4dc_iffalse,
t8_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_a4dc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_a4dc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_a4dc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_a4dc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_a4dc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2289_c7_a4dc
result_u8_value_MUX_uxn_opcodes_h_l2289_c7_a4dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2289_c7_a4dc_cond,
result_u8_value_MUX_uxn_opcodes_h_l2289_c7_a4dc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2289_c7_a4dc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_a4dc
result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_a4dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_a4dc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_a4dc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_a4dc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_a4dc
result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_a4dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_a4dc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_a4dc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_a4dc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc
result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc
result_is_sp_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2292_c30_741a
sp_relative_shift_uxn_opcodes_h_l2292_c30_741a : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2292_c30_741a_ins,
sp_relative_shift_uxn_opcodes_h_l2292_c30_741a_x,
sp_relative_shift_uxn_opcodes_h_l2292_c30_741a_y,
sp_relative_shift_uxn_opcodes_h_l2292_c30_741a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2297_c11_3c1b
BIN_OP_EQ_uxn_opcodes_h_l2297_c11_3c1b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2297_c11_3c1b_left,
BIN_OP_EQ_uxn_opcodes_h_l2297_c11_3c1b_right,
BIN_OP_EQ_uxn_opcodes_h_l2297_c11_3c1b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_21ac
result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_21ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_21ac_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_21ac_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_21ac_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_21ac_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_21ac
result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_21ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_21ac_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_21ac_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_21ac_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_21ac_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_21ac
result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_21ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_21ac_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_21ac_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_21ac_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_21ac_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2281_c6_c965_return_output,
 t8_MUX_uxn_opcodes_h_l2281_c2_0228_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c2_0228_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2281_c2_0228_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2281_c2_0228_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2281_c2_0228_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c2_0228_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2281_c2_0228_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2286_c11_b550_return_output,
 t8_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2289_c11_6a1b_return_output,
 t8_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output,
 sp_relative_shift_uxn_opcodes_h_l2292_c30_741a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2297_c11_3c1b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_21ac_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_21ac_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_21ac_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c6_c965_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c6_c965_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c6_c965_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2281_c2_0228_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2281_c2_0228_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2281_c2_0228_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2281_c2_0228_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c2_0228_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2283_c3_4c27 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c2_0228_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c2_0228_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c2_0228_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2281_c2_0228_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2281_c2_0228_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2281_c2_0228_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2281_c2_0228_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2281_c2_0228_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2281_c2_0228_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2281_c2_0228_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2281_c2_0228_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2281_c2_0228_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2281_c2_0228_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2281_c2_0228_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2281_c2_0228_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c2_0228_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c2_0228_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c2_0228_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c2_0228_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2281_c2_0228_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2281_c2_0228_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2281_c2_0228_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2281_c2_0228_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_b550_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_b550_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_b550_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2286_c7_f7f6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2286_c7_f7f6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2286_c7_f7f6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_f7f6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2287_c3_1699 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_f7f6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_f7f6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2286_c7_f7f6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2286_c7_f7f6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2286_c7_f7f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_f7f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_f7f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_f7f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_f7f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_f7f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_f7f6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2289_c11_6a1b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2289_c11_6a1b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2289_c11_6a1b_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2289_c7_a4dc_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2289_c7_a4dc_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2289_c7_a4dc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_a4dc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2294_c3_5fec : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_a4dc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2289_c7_a4dc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_a4dc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2289_c7_a4dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2289_c7_a4dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2289_c7_a4dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_a4dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_a4dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_21ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_a4dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_a4dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_a4dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_21ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_a4dc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_21ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2292_c30_741a_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2292_c30_741a_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2292_c30_741a_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2292_c30_741a_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_3c1b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_3c1b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_3c1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_21ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_21ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_21ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_21ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_21ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_21ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_21ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_21ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_21ac_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2286_l2289_l2281_DUPLICATE_351d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2297_l2286_l2281_DUPLICATE_9cfd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2286_l2289_l2281_DUPLICATE_e728_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2297_l2286_l2281_DUPLICATE_95c1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2297_l2286_l2289_DUPLICATE_17d8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2277_l2303_DUPLICATE_e97d_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_21ac_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_b550_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c6_c965_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_a4dc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_3c1b_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_21ac_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2294_c3_5fec := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_a4dc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2294_c3_5fec;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2289_c11_6a1b_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_21ac_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2292_c30_741a_y := resize(to_signed(-1, 2), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2287_c3_1699 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_f7f6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2287_c3_1699;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2281_c2_0228_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2292_c30_741a_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2283_c3_4c27 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c2_0228_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2283_c3_4c27;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2292_c30_741a_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c6_c965_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_b550_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2289_c11_6a1b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_3c1b_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2289_c7_a4dc_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2289_c7_a4dc_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2281_c2_0228_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2286_c7_f7f6_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2289_c7_a4dc_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l2286_c11_b550] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2286_c11_b550_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_b550_left;
     BIN_OP_EQ_uxn_opcodes_h_l2286_c11_b550_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_b550_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_b550_return_output := BIN_OP_EQ_uxn_opcodes_h_l2286_c11_b550_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2281_c6_c965] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2281_c6_c965_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c6_c965_left;
     BIN_OP_EQ_uxn_opcodes_h_l2281_c6_c965_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c6_c965_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c6_c965_return_output := BIN_OP_EQ_uxn_opcodes_h_l2281_c6_c965_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2286_l2289_l2281_DUPLICATE_e728 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2286_l2289_l2281_DUPLICATE_e728_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2297_l2286_l2281_DUPLICATE_95c1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2297_l2286_l2281_DUPLICATE_95c1_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2289_c11_6a1b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2289_c11_6a1b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2289_c11_6a1b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2289_c11_6a1b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2289_c11_6a1b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2289_c11_6a1b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2289_c11_6a1b_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2289_c7_a4dc] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2289_c7_a4dc_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l2292_c30_741a] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2292_c30_741a_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2292_c30_741a_ins;
     sp_relative_shift_uxn_opcodes_h_l2292_c30_741a_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2292_c30_741a_x;
     sp_relative_shift_uxn_opcodes_h_l2292_c30_741a_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2292_c30_741a_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2292_c30_741a_return_output := sp_relative_shift_uxn_opcodes_h_l2292_c30_741a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2297_l2286_l2289_DUPLICATE_17d8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2297_l2286_l2289_DUPLICATE_17d8_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2297_l2286_l2281_DUPLICATE_9cfd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2297_l2286_l2281_DUPLICATE_9cfd_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2286_l2289_l2281_DUPLICATE_351d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2286_l2289_l2281_DUPLICATE_351d_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2297_c11_3c1b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2297_c11_3c1b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_3c1b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2297_c11_3c1b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_3c1b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_3c1b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2297_c11_3c1b_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2281_c2_0228_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c6_c965_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2281_c2_0228_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c6_c965_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2281_c2_0228_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c6_c965_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c2_0228_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c6_c965_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c2_0228_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c6_c965_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2281_c2_0228_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c6_c965_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2281_c2_0228_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c6_c965_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_f7f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_b550_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_b550_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_f7f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_b550_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_b550_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_f7f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_b550_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2286_c7_f7f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_b550_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2286_c7_f7f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2286_c11_b550_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_a4dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2289_c11_6a1b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2289_c11_6a1b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_a4dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2289_c11_6a1b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2289_c11_6a1b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_a4dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2289_c11_6a1b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2289_c7_a4dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2289_c11_6a1b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2289_c7_a4dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2289_c11_6a1b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_21ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_3c1b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_21ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_3c1b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_21ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2297_c11_3c1b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c2_0228_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2286_l2289_l2281_DUPLICATE_e728_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2286_l2289_l2281_DUPLICATE_e728_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2286_l2289_l2281_DUPLICATE_e728_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_f7f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2297_l2286_l2289_DUPLICATE_17d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_a4dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2297_l2286_l2289_DUPLICATE_17d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_21ac_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2297_l2286_l2289_DUPLICATE_17d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2281_c2_0228_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2297_l2286_l2281_DUPLICATE_95c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2297_l2286_l2281_DUPLICATE_95c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_21ac_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2297_l2286_l2281_DUPLICATE_95c1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2281_c2_0228_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2297_l2286_l2281_DUPLICATE_9cfd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_f7f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2297_l2286_l2281_DUPLICATE_9cfd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_21ac_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2297_l2286_l2281_DUPLICATE_9cfd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2281_c2_0228_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2286_l2289_l2281_DUPLICATE_351d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2286_c7_f7f6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2286_l2289_l2281_DUPLICATE_351d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2289_c7_a4dc_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2286_l2289_l2281_DUPLICATE_351d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_a4dc_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2289_c7_a4dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2292_c30_741a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2297_c7_21ac] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_21ac_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_21ac_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_21ac_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_21ac_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_21ac_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_21ac_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_21ac_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_21ac_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2297_c7_21ac] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_21ac_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_21ac_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_21ac_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_21ac_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_21ac_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_21ac_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_21ac_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_21ac_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2297_c7_21ac] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_21ac_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_21ac_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_21ac_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_21ac_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_21ac_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_21ac_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_21ac_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_21ac_return_output;

     -- t8_MUX[uxn_opcodes_h_l2289_c7_a4dc] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2289_c7_a4dc_cond <= VAR_t8_MUX_uxn_opcodes_h_l2289_c7_a4dc_cond;
     t8_MUX_uxn_opcodes_h_l2289_c7_a4dc_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2289_c7_a4dc_iftrue;
     t8_MUX_uxn_opcodes_h_l2289_c7_a4dc_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2289_c7_a4dc_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output := t8_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2289_c7_a4dc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2289_c7_a4dc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2289_c7_a4dc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2289_c7_a4dc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2289_c7_a4dc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2289_c7_a4dc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2289_c7_a4dc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output := result_u8_value_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2289_c7_a4dc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_a4dc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_a4dc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_a4dc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_a4dc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_a4dc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_a4dc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2289_c7_a4dc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output;

     -- Submodule level 2
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_a4dc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2297_c7_21ac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2297_c7_21ac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_a4dc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2297_c7_21ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_f7f6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2286_c7_f7f6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2286_c7_f7f6_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2289_c7_a4dc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_a4dc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_a4dc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_a4dc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_a4dc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_a4dc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_a4dc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2289_c7_a4dc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2286_c7_f7f6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2286_c7_f7f6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2286_c7_f7f6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2286_c7_f7f6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2286_c7_f7f6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2286_c7_f7f6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2286_c7_f7f6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2286_c7_f7f6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2289_c7_a4dc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_a4dc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_a4dc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_a4dc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_a4dc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_a4dc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_a4dc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2286_c7_f7f6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_f7f6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_f7f6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_f7f6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_f7f6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_f7f6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_f7f6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output;

     -- t8_MUX[uxn_opcodes_h_l2286_c7_f7f6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2286_c7_f7f6_cond <= VAR_t8_MUX_uxn_opcodes_h_l2286_c7_f7f6_cond;
     t8_MUX_uxn_opcodes_h_l2286_c7_f7f6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2286_c7_f7f6_iftrue;
     t8_MUX_uxn_opcodes_h_l2286_c7_f7f6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2286_c7_f7f6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output := t8_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_f7f6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_f7f6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2289_c7_a4dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c2_0228_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c2_0228_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2281_c2_0228_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2281_c2_0228_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output;
     -- t8_MUX[uxn_opcodes_h_l2281_c2_0228] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2281_c2_0228_cond <= VAR_t8_MUX_uxn_opcodes_h_l2281_c2_0228_cond;
     t8_MUX_uxn_opcodes_h_l2281_c2_0228_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2281_c2_0228_iftrue;
     t8_MUX_uxn_opcodes_h_l2281_c2_0228_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2281_c2_0228_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2281_c2_0228_return_output := t8_MUX_uxn_opcodes_h_l2281_c2_0228_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2286_c7_f7f6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_f7f6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_f7f6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_f7f6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_f7f6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_f7f6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_f7f6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2281_c2_0228] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2281_c2_0228_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2281_c2_0228_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2281_c2_0228_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2281_c2_0228_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2281_c2_0228_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2281_c2_0228_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2281_c2_0228_return_output := result_u8_value_MUX_uxn_opcodes_h_l2281_c2_0228_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2281_c2_0228] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c2_0228_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c2_0228_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c2_0228_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c2_0228_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c2_0228_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c2_0228_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c2_0228_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c2_0228_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2281_c2_0228] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c2_0228_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c2_0228_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c2_0228_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c2_0228_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c2_0228_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c2_0228_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c2_0228_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c2_0228_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2286_c7_f7f6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_f7f6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_f7f6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_f7f6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_f7f6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_f7f6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_f7f6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2286_c7_f7f6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2281_c2_0228_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2281_c2_0228_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2281_c2_0228_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2286_c7_f7f6_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2281_c2_0228_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2281_c2_0228] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2281_c2_0228_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2281_c2_0228_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2281_c2_0228_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2281_c2_0228_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2281_c2_0228_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2281_c2_0228_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2281_c2_0228_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2281_c2_0228_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2281_c2_0228] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2281_c2_0228_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2281_c2_0228_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2281_c2_0228_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2281_c2_0228_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2281_c2_0228_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2281_c2_0228_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2281_c2_0228_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2281_c2_0228_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2281_c2_0228] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2281_c2_0228_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2281_c2_0228_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2281_c2_0228_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2281_c2_0228_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2281_c2_0228_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2281_c2_0228_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2281_c2_0228_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2281_c2_0228_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2277_l2303_DUPLICATE_e97d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2277_l2303_DUPLICATE_e97d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3345(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c2_0228_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2281_c2_0228_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2281_c2_0228_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2281_c2_0228_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c2_0228_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2281_c2_0228_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2277_l2303_DUPLICATE_e97d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2277_l2303_DUPLICATE_e97d_return_output;
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
