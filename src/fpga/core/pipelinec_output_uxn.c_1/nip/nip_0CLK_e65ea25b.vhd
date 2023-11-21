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
entity nip_0CLK_e65ea25b is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end nip_0CLK_e65ea25b;
architecture arch of nip_0CLK_e65ea25b is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1933_c6_6646]
signal BIN_OP_EQ_uxn_opcodes_h_l1933_c6_6646_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1933_c6_6646_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1933_c6_6646_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1933_c2_0fff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c2_0fff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c2_0fff_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c2_0fff_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1933_c2_0fff]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1933_c2_0fff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1933_c2_0fff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1933_c2_0fff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1933_c2_0fff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1933_c2_0fff]
signal result_u8_value_MUX_uxn_opcodes_h_l1933_c2_0fff_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1933_c2_0fff_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1933_c2_0fff_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1933_c2_0fff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1933_c2_0fff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1933_c2_0fff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1933_c2_0fff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1933_c2_0fff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1933_c2_0fff]
signal t8_MUX_uxn_opcodes_h_l1933_c2_0fff_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1933_c2_0fff_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1933_c2_0fff_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1940_c11_f4f7]
signal BIN_OP_EQ_uxn_opcodes_h_l1940_c11_f4f7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1940_c11_f4f7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1940_c11_f4f7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1940_c7_fd0d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_fd0d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_fd0d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_fd0d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1940_c7_fd0d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1940_c7_fd0d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_fd0d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_fd0d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_fd0d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1940_c7_fd0d]
signal result_u8_value_MUX_uxn_opcodes_h_l1940_c7_fd0d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1940_c7_fd0d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1940_c7_fd0d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1940_c7_fd0d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1940_c7_fd0d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_fd0d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_fd0d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_fd0d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1940_c7_fd0d]
signal t8_MUX_uxn_opcodes_h_l1940_c7_fd0d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1940_c7_fd0d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1940_c7_fd0d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1943_c30_397f]
signal sp_relative_shift_uxn_opcodes_h_l1943_c30_397f_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1943_c30_397f_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1943_c30_397f_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1943_c30_397f_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1945_c11_354a]
signal BIN_OP_EQ_uxn_opcodes_h_l1945_c11_354a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1945_c11_354a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1945_c11_354a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1945_c7_38af]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c7_38af_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c7_38af_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c7_38af_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c7_38af_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1945_c7_38af]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_38af_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_38af_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_38af_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_38af_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1945_c7_38af]
signal result_u8_value_MUX_uxn_opcodes_h_l1945_c7_38af_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1945_c7_38af_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1945_c7_38af_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1945_c7_38af_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1945_c7_38af]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_38af_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_38af_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_38af_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_38af_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1945_c7_38af]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_38af_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_38af_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_38af_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_38af_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l1945_c7_38af]
signal t8_MUX_uxn_opcodes_h_l1945_c7_38af_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1945_c7_38af_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1945_c7_38af_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1945_c7_38af_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1952_c11_2521]
signal BIN_OP_EQ_uxn_opcodes_h_l1952_c11_2521_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1952_c11_2521_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1952_c11_2521_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1952_c7_1dbc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1952_c7_1dbc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1952_c7_1dbc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1952_c7_1dbc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1952_c7_1dbc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1952_c7_1dbc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1952_c7_1dbc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1952_c7_1dbc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1952_c7_1dbc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1952_c7_1dbc_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1933_c6_6646
BIN_OP_EQ_uxn_opcodes_h_l1933_c6_6646 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1933_c6_6646_left,
BIN_OP_EQ_uxn_opcodes_h_l1933_c6_6646_right,
BIN_OP_EQ_uxn_opcodes_h_l1933_c6_6646_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c2_0fff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c2_0fff : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c2_0fff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c2_0fff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c2_0fff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1933_c2_0fff
result_is_sp_shift_MUX_uxn_opcodes_h_l1933_c2_0fff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1933_c2_0fff
result_is_opc_done_MUX_uxn_opcodes_h_l1933_c2_0fff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1933_c2_0fff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1933_c2_0fff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1933_c2_0fff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1933_c2_0fff
result_u8_value_MUX_uxn_opcodes_h_l1933_c2_0fff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1933_c2_0fff_cond,
result_u8_value_MUX_uxn_opcodes_h_l1933_c2_0fff_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1933_c2_0fff_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1933_c2_0fff
result_sp_relative_shift_MUX_uxn_opcodes_h_l1933_c2_0fff : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1933_c2_0fff
result_is_stack_write_MUX_uxn_opcodes_h_l1933_c2_0fff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1933_c2_0fff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1933_c2_0fff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1933_c2_0fff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output);

-- t8_MUX_uxn_opcodes_h_l1933_c2_0fff
t8_MUX_uxn_opcodes_h_l1933_c2_0fff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1933_c2_0fff_cond,
t8_MUX_uxn_opcodes_h_l1933_c2_0fff_iftrue,
t8_MUX_uxn_opcodes_h_l1933_c2_0fff_iffalse,
t8_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1940_c11_f4f7
BIN_OP_EQ_uxn_opcodes_h_l1940_c11_f4f7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1940_c11_f4f7_left,
BIN_OP_EQ_uxn_opcodes_h_l1940_c11_f4f7_right,
BIN_OP_EQ_uxn_opcodes_h_l1940_c11_f4f7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_fd0d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_fd0d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_fd0d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_fd0d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_fd0d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d
result_is_sp_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_fd0d
result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_fd0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_fd0d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_fd0d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_fd0d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1940_c7_fd0d
result_u8_value_MUX_uxn_opcodes_h_l1940_c7_fd0d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1940_c7_fd0d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1940_c7_fd0d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1940_c7_fd0d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_fd0d
result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_fd0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_fd0d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_fd0d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_fd0d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output);

-- t8_MUX_uxn_opcodes_h_l1940_c7_fd0d
t8_MUX_uxn_opcodes_h_l1940_c7_fd0d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1940_c7_fd0d_cond,
t8_MUX_uxn_opcodes_h_l1940_c7_fd0d_iftrue,
t8_MUX_uxn_opcodes_h_l1940_c7_fd0d_iffalse,
t8_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1943_c30_397f
sp_relative_shift_uxn_opcodes_h_l1943_c30_397f : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1943_c30_397f_ins,
sp_relative_shift_uxn_opcodes_h_l1943_c30_397f_x,
sp_relative_shift_uxn_opcodes_h_l1943_c30_397f_y,
sp_relative_shift_uxn_opcodes_h_l1943_c30_397f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1945_c11_354a
BIN_OP_EQ_uxn_opcodes_h_l1945_c11_354a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1945_c11_354a_left,
BIN_OP_EQ_uxn_opcodes_h_l1945_c11_354a_right,
BIN_OP_EQ_uxn_opcodes_h_l1945_c11_354a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c7_38af
result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c7_38af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c7_38af_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c7_38af_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c7_38af_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c7_38af_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_38af
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_38af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_38af_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_38af_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_38af_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_38af_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1945_c7_38af
result_u8_value_MUX_uxn_opcodes_h_l1945_c7_38af : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1945_c7_38af_cond,
result_u8_value_MUX_uxn_opcodes_h_l1945_c7_38af_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1945_c7_38af_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1945_c7_38af_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_38af
result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_38af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_38af_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_38af_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_38af_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_38af_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_38af
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_38af : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_38af_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_38af_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_38af_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_38af_return_output);

-- t8_MUX_uxn_opcodes_h_l1945_c7_38af
t8_MUX_uxn_opcodes_h_l1945_c7_38af : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1945_c7_38af_cond,
t8_MUX_uxn_opcodes_h_l1945_c7_38af_iftrue,
t8_MUX_uxn_opcodes_h_l1945_c7_38af_iffalse,
t8_MUX_uxn_opcodes_h_l1945_c7_38af_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1952_c11_2521
BIN_OP_EQ_uxn_opcodes_h_l1952_c11_2521 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1952_c11_2521_left,
BIN_OP_EQ_uxn_opcodes_h_l1952_c11_2521_right,
BIN_OP_EQ_uxn_opcodes_h_l1952_c11_2521_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1952_c7_1dbc
result_is_opc_done_MUX_uxn_opcodes_h_l1952_c7_1dbc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1952_c7_1dbc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1952_c7_1dbc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1952_c7_1dbc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1952_c7_1dbc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1952_c7_1dbc
result_is_stack_write_MUX_uxn_opcodes_h_l1952_c7_1dbc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1952_c7_1dbc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1952_c7_1dbc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1952_c7_1dbc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1952_c7_1dbc_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1933_c6_6646_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output,
 t8_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1940_c11_f4f7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output,
 t8_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output,
 sp_relative_shift_uxn_opcodes_h_l1943_c30_397f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1945_c11_354a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c7_38af_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_38af_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1945_c7_38af_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_38af_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_38af_return_output,
 t8_MUX_uxn_opcodes_h_l1945_c7_38af_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1952_c11_2521_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1952_c7_1dbc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1952_c7_1dbc_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c6_6646_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c6_6646_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c6_6646_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c2_0fff_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1937_c3_d2e5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c2_0fff_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c2_0fff_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c2_0fff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c2_0fff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c2_0fff_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1933_c2_0fff_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1933_c2_0fff_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1933_c2_0fff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c2_0fff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c2_0fff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c2_0fff_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1933_c2_0fff_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1933_c2_0fff_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1933_c2_0fff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_f4f7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_f4f7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_f4f7_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_fd0d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1941_c3_e0bc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_fd0d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_38af_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_fd0d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c7_38af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_fd0d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_fd0d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_38af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_fd0d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_fd0d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_fd0d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_38af_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_fd0d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_fd0d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_fd0d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_38af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_fd0d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1940_c7_fd0d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1940_c7_fd0d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1945_c7_38af_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1940_c7_fd0d_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1943_c30_397f_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1943_c30_397f_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1943_c30_397f_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1943_c30_397f_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_354a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_354a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_354a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c7_38af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c7_38af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c7_38af_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_38af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_38af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1952_c7_1dbc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_38af_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_38af_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_38af_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_38af_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_38af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_38af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1952_c7_1dbc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_38af_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_38af_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1949_c3_498d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_38af_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1945_c7_38af_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_38af_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1945_c7_38af_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1945_c7_38af_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1945_c7_38af_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1952_c11_2521_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1952_c11_2521_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1952_c11_2521_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1952_c7_1dbc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1952_c7_1dbc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1952_c7_1dbc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1952_c7_1dbc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1952_c7_1dbc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1952_c7_1dbc_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1933_l1945_DUPLICATE_ca2e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1933_l1940_l1945_DUPLICATE_f09f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1933_l1940_DUPLICATE_344b_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1933_l1952_l1940_DUPLICATE_0b67_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1952_l1940_l1945_DUPLICATE_0ff5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8d93_uxn_opcodes_h_l1957_l1929_DUPLICATE_6ed5_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1952_c7_1dbc_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1949_c3_498d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_38af_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1949_c3_498d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1941_c3_e0bc := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_fd0d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1941_c3_e0bc;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c2_0fff_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1943_c30_397f_y := resize(to_signed(-1, 2), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1937_c3_d2e5 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c2_0fff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1937_c3_d2e5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_f4f7_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1952_c7_1dbc_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c7_38af_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_38af_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1952_c11_2521_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c6_6646_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1943_c30_397f_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_354a_right := to_unsigned(2, 2);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1943_c30_397f_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c6_6646_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_f4f7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_354a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1952_c11_2521_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_38af_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1945_c7_38af_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1933_c2_0fff_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1940_c7_fd0d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1945_c7_38af_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1952_c11_2521] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1952_c11_2521_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1952_c11_2521_left;
     BIN_OP_EQ_uxn_opcodes_h_l1952_c11_2521_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1952_c11_2521_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1952_c11_2521_return_output := BIN_OP_EQ_uxn_opcodes_h_l1952_c11_2521_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1933_l1940_l1945_DUPLICATE_f09f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1933_l1940_l1945_DUPLICATE_f09f_return_output := result.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1933_l1940_DUPLICATE_344b LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1933_l1940_DUPLICATE_344b_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1952_l1940_l1945_DUPLICATE_0ff5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1952_l1940_l1945_DUPLICATE_0ff5_return_output := result.is_opc_done;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1945_c7_38af] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1945_c7_38af_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1933_c6_6646] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1933_c6_6646_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c6_6646_left;
     BIN_OP_EQ_uxn_opcodes_h_l1933_c6_6646_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c6_6646_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c6_6646_return_output := BIN_OP_EQ_uxn_opcodes_h_l1933_c6_6646_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1945_c11_354a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1945_c11_354a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_354a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1945_c11_354a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_354a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_354a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1945_c11_354a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1940_c11_f4f7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1940_c11_f4f7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_f4f7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1940_c11_f4f7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_f4f7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_f4f7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1940_c11_f4f7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1933_l1945_DUPLICATE_ca2e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1933_l1945_DUPLICATE_ca2e_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1933_l1952_l1940_DUPLICATE_0b67 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1933_l1952_l1940_DUPLICATE_0b67_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l1943_c30_397f] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1943_c30_397f_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1943_c30_397f_ins;
     sp_relative_shift_uxn_opcodes_h_l1943_c30_397f_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1943_c30_397f_x;
     sp_relative_shift_uxn_opcodes_h_l1943_c30_397f_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1943_c30_397f_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1943_c30_397f_return_output := sp_relative_shift_uxn_opcodes_h_l1943_c30_397f_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c2_0fff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c6_6646_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c6_6646_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c2_0fff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c6_6646_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c6_6646_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c2_0fff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c6_6646_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1933_c2_0fff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c6_6646_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1933_c2_0fff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1933_c6_6646_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_fd0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_f4f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_f4f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_fd0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_f4f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_f4f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_fd0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_f4f7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_fd0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_f4f7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1940_c7_fd0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1940_c11_f4f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_38af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_354a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c7_38af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_354a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_38af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_354a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_38af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_354a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_38af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_354a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1945_c7_38af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c11_354a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1952_c7_1dbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1952_c11_2521_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1952_c7_1dbc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1952_c11_2521_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1933_l1940_DUPLICATE_344b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1933_l1940_DUPLICATE_344b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_fd0d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1952_l1940_l1945_DUPLICATE_0ff5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_38af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1952_l1940_l1945_DUPLICATE_0ff5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1952_c7_1dbc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1952_l1940_l1945_DUPLICATE_0ff5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1933_l1945_DUPLICATE_ca2e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c7_38af_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1933_l1945_DUPLICATE_ca2e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c2_0fff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1933_l1952_l1940_DUPLICATE_0b67_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_fd0d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1933_l1952_l1940_DUPLICATE_0b67_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1952_c7_1dbc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1933_l1952_l1940_DUPLICATE_0b67_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1933_c2_0fff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1933_l1940_l1945_DUPLICATE_f09f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_fd0d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1933_l1940_l1945_DUPLICATE_f09f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_38af_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1933_l1940_l1945_DUPLICATE_f09f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_38af_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1945_c7_38af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1943_c30_397f_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1945_c7_38af] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c7_38af_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c7_38af_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c7_38af_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c7_38af_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c7_38af_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c7_38af_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c7_38af_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c7_38af_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1952_c7_1dbc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1952_c7_1dbc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1952_c7_1dbc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1952_c7_1dbc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1952_c7_1dbc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1952_c7_1dbc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1952_c7_1dbc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1952_c7_1dbc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1952_c7_1dbc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1940_c7_fd0d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output;

     -- t8_MUX[uxn_opcodes_h_l1945_c7_38af] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1945_c7_38af_cond <= VAR_t8_MUX_uxn_opcodes_h_l1945_c7_38af_cond;
     t8_MUX_uxn_opcodes_h_l1945_c7_38af_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1945_c7_38af_iftrue;
     t8_MUX_uxn_opcodes_h_l1945_c7_38af_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1945_c7_38af_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1945_c7_38af_return_output := t8_MUX_uxn_opcodes_h_l1945_c7_38af_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1952_c7_1dbc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1952_c7_1dbc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1952_c7_1dbc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1952_c7_1dbc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1952_c7_1dbc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1952_c7_1dbc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1952_c7_1dbc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1952_c7_1dbc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1952_c7_1dbc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1945_c7_38af] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_38af_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_38af_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_38af_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_38af_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_38af_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_38af_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_38af_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_38af_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1945_c7_38af] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1945_c7_38af_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_38af_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1945_c7_38af_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_38af_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1945_c7_38af_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_38af_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_38af_return_output := result_u8_value_MUX_uxn_opcodes_h_l1945_c7_38af_return_output;

     -- Submodule level 2
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_38af_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1952_c7_1dbc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c7_38af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_38af_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1952_c7_1dbc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_fd0d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c7_38af_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_fd0d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1945_c7_38af_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1940_c7_fd0d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1945_c7_38af_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1933_c2_0fff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1940_c7_fd0d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output;

     -- t8_MUX[uxn_opcodes_h_l1940_c7_fd0d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1940_c7_fd0d_cond <= VAR_t8_MUX_uxn_opcodes_h_l1940_c7_fd0d_cond;
     t8_MUX_uxn_opcodes_h_l1940_c7_fd0d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1940_c7_fd0d_iftrue;
     t8_MUX_uxn_opcodes_h_l1940_c7_fd0d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1940_c7_fd0d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output := t8_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1940_c7_fd0d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_fd0d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_fd0d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_fd0d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_fd0d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_fd0d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_fd0d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1940_c7_fd0d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1940_c7_fd0d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_fd0d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1940_c7_fd0d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_fd0d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1940_c7_fd0d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_fd0d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1945_c7_38af] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_38af_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_38af_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_38af_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_38af_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_38af_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_38af_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_38af_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_38af_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1945_c7_38af] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_38af_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_38af_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_38af_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_38af_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_38af_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_38af_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_38af_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_38af_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_fd0d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c7_38af_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_fd0d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1945_c7_38af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c2_0fff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1933_c2_0fff_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1933_c2_0fff_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1940_c7_fd0d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_fd0d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_fd0d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_fd0d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_fd0d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_fd0d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_fd0d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output;

     -- t8_MUX[uxn_opcodes_h_l1933_c2_0fff] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1933_c2_0fff_cond <= VAR_t8_MUX_uxn_opcodes_h_l1933_c2_0fff_cond;
     t8_MUX_uxn_opcodes_h_l1933_c2_0fff_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1933_c2_0fff_iftrue;
     t8_MUX_uxn_opcodes_h_l1933_c2_0fff_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1933_c2_0fff_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output := t8_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1933_c2_0fff] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1940_c7_fd0d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_fd0d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_fd0d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_fd0d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_fd0d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_fd0d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_fd0d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1933_c2_0fff] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1933_c2_0fff_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1933_c2_0fff_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1933_c2_0fff_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1933_c2_0fff_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1933_c2_0fff_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1933_c2_0fff_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output := result_u8_value_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1933_c2_0fff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c2_0fff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c2_0fff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c2_0fff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c2_0fff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c2_0fff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c2_0fff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c2_0fff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c2_0fff_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1940_c7_fd0d_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1933_c2_0fff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1933_c2_0fff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c2_0fff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1933_c2_0fff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c2_0fff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1933_c2_0fff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c2_0fff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1933_c2_0fff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1933_c2_0fff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c2_0fff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1933_c2_0fff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c2_0fff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1933_c2_0fff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c2_0fff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8d93_uxn_opcodes_h_l1957_l1929_DUPLICATE_6ed5 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8d93_uxn_opcodes_h_l1957_l1929_DUPLICATE_6ed5_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8d93(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1933_c2_0fff_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8d93_uxn_opcodes_h_l1957_l1929_DUPLICATE_6ed5_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8d93_uxn_opcodes_h_l1957_l1929_DUPLICATE_6ed5_return_output;
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
