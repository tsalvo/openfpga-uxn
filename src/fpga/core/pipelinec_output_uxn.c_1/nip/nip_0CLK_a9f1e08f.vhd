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
-- Submodules: 32
entity nip_0CLK_a9f1e08f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end nip_0CLK_a9f1e08f;
architecture arch of nip_0CLK_a9f1e08f is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2032_c6_5e10]
signal BIN_OP_EQ_uxn_opcodes_h_l2032_c6_5e10_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2032_c6_5e10_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2032_c6_5e10_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2032_c1_b6f9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_b6f9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_b6f9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_b6f9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_b6f9_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2032_c2_f2de]
signal t8_MUX_uxn_opcodes_h_l2032_c2_f2de_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2032_c2_f2de_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2032_c2_f2de_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2032_c2_f2de]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_f2de_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_f2de_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_f2de_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2032_c2_f2de]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_f2de_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_f2de_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_f2de_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2032_c2_f2de]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2032_c2_f2de]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2032_c2_f2de]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_f2de_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_f2de_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_f2de_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2032_c2_f2de]
signal result_u8_value_MUX_uxn_opcodes_h_l2032_c2_f2de_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2032_c2_f2de_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2032_c2_f2de_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2033_c3_648d[uxn_opcodes_h_l2033_c3_648d]
signal printf_uxn_opcodes_h_l2033_c3_648d_uxn_opcodes_h_l2033_c3_648d_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2037_c11_afbe]
signal BIN_OP_EQ_uxn_opcodes_h_l2037_c11_afbe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2037_c11_afbe_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2037_c11_afbe_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2037_c7_2850]
signal t8_MUX_uxn_opcodes_h_l2037_c7_2850_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2037_c7_2850_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2037_c7_2850_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2037_c7_2850_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2037_c7_2850]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_2850_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_2850_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_2850_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_2850_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2037_c7_2850]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_2850_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_2850_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_2850_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_2850_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2037_c7_2850]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_2850_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_2850_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_2850_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_2850_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2037_c7_2850]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_2850_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_2850_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_2850_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_2850_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2037_c7_2850]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_2850_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_2850_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_2850_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_2850_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2037_c7_2850]
signal result_u8_value_MUX_uxn_opcodes_h_l2037_c7_2850_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2037_c7_2850_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2037_c7_2850_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2037_c7_2850_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2040_c11_ffb3]
signal BIN_OP_EQ_uxn_opcodes_h_l2040_c11_ffb3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2040_c11_ffb3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2040_c11_ffb3_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2040_c7_0cfa]
signal t8_MUX_uxn_opcodes_h_l2040_c7_0cfa_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2040_c7_0cfa_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2040_c7_0cfa_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2040_c7_0cfa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0cfa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0cfa_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0cfa_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2040_c7_0cfa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0cfa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0cfa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0cfa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2040_c7_0cfa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2040_c7_0cfa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2040_c7_0cfa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0cfa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0cfa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0cfa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2040_c7_0cfa]
signal result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0cfa_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0cfa_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0cfa_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2043_c30_a155]
signal sp_relative_shift_uxn_opcodes_h_l2043_c30_a155_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2043_c30_a155_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2043_c30_a155_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2043_c30_a155_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2048_c11_e5f3]
signal BIN_OP_EQ_uxn_opcodes_h_l2048_c11_e5f3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2048_c11_e5f3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2048_c11_e5f3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2048_c7_634d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_634d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_634d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_634d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_634d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2048_c7_634d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_634d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_634d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_634d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_634d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2048_c7_634d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_634d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_634d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_634d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_634d_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_4e73( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2032_c6_5e10
BIN_OP_EQ_uxn_opcodes_h_l2032_c6_5e10 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2032_c6_5e10_left,
BIN_OP_EQ_uxn_opcodes_h_l2032_c6_5e10_right,
BIN_OP_EQ_uxn_opcodes_h_l2032_c6_5e10_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_b6f9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_b6f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_b6f9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_b6f9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_b6f9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_b6f9_return_output);

-- t8_MUX_uxn_opcodes_h_l2032_c2_f2de
t8_MUX_uxn_opcodes_h_l2032_c2_f2de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2032_c2_f2de_cond,
t8_MUX_uxn_opcodes_h_l2032_c2_f2de_iftrue,
t8_MUX_uxn_opcodes_h_l2032_c2_f2de_iffalse,
t8_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_f2de
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_f2de : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_f2de_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_f2de_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_f2de_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_f2de
result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_f2de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_f2de_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_f2de_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_f2de_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_f2de
result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_f2de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_f2de
result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_f2de : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_f2de
result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_f2de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_f2de_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_f2de_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_f2de_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2032_c2_f2de
result_u8_value_MUX_uxn_opcodes_h_l2032_c2_f2de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2032_c2_f2de_cond,
result_u8_value_MUX_uxn_opcodes_h_l2032_c2_f2de_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2032_c2_f2de_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output);

-- printf_uxn_opcodes_h_l2033_c3_648d_uxn_opcodes_h_l2033_c3_648d
printf_uxn_opcodes_h_l2033_c3_648d_uxn_opcodes_h_l2033_c3_648d : entity work.printf_uxn_opcodes_h_l2033_c3_648d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2033_c3_648d_uxn_opcodes_h_l2033_c3_648d_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2037_c11_afbe
BIN_OP_EQ_uxn_opcodes_h_l2037_c11_afbe : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2037_c11_afbe_left,
BIN_OP_EQ_uxn_opcodes_h_l2037_c11_afbe_right,
BIN_OP_EQ_uxn_opcodes_h_l2037_c11_afbe_return_output);

-- t8_MUX_uxn_opcodes_h_l2037_c7_2850
t8_MUX_uxn_opcodes_h_l2037_c7_2850 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2037_c7_2850_cond,
t8_MUX_uxn_opcodes_h_l2037_c7_2850_iftrue,
t8_MUX_uxn_opcodes_h_l2037_c7_2850_iffalse,
t8_MUX_uxn_opcodes_h_l2037_c7_2850_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_2850
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_2850 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_2850_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_2850_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_2850_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_2850_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_2850
result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_2850 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_2850_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_2850_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_2850_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_2850_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_2850
result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_2850 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_2850_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_2850_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_2850_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_2850_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_2850
result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_2850 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_2850_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_2850_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_2850_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_2850_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_2850
result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_2850 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_2850_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_2850_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_2850_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_2850_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2037_c7_2850
result_u8_value_MUX_uxn_opcodes_h_l2037_c7_2850 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2037_c7_2850_cond,
result_u8_value_MUX_uxn_opcodes_h_l2037_c7_2850_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2037_c7_2850_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2037_c7_2850_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2040_c11_ffb3
BIN_OP_EQ_uxn_opcodes_h_l2040_c11_ffb3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2040_c11_ffb3_left,
BIN_OP_EQ_uxn_opcodes_h_l2040_c11_ffb3_right,
BIN_OP_EQ_uxn_opcodes_h_l2040_c11_ffb3_return_output);

-- t8_MUX_uxn_opcodes_h_l2040_c7_0cfa
t8_MUX_uxn_opcodes_h_l2040_c7_0cfa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2040_c7_0cfa_cond,
t8_MUX_uxn_opcodes_h_l2040_c7_0cfa_iftrue,
t8_MUX_uxn_opcodes_h_l2040_c7_0cfa_iffalse,
t8_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0cfa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0cfa : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0cfa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0cfa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0cfa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0cfa
result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0cfa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0cfa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0cfa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0cfa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa
result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa
result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0cfa
result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0cfa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0cfa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0cfa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0cfa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0cfa
result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0cfa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0cfa_cond,
result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0cfa_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0cfa_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2043_c30_a155
sp_relative_shift_uxn_opcodes_h_l2043_c30_a155 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2043_c30_a155_ins,
sp_relative_shift_uxn_opcodes_h_l2043_c30_a155_x,
sp_relative_shift_uxn_opcodes_h_l2043_c30_a155_y,
sp_relative_shift_uxn_opcodes_h_l2043_c30_a155_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2048_c11_e5f3
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_e5f3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_e5f3_left,
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_e5f3_right,
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_e5f3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_634d
result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_634d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_634d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_634d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_634d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_634d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_634d
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_634d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_634d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_634d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_634d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_634d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_634d
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_634d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_634d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_634d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_634d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_634d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2032_c6_5e10_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_b6f9_return_output,
 t8_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2037_c11_afbe_return_output,
 t8_MUX_uxn_opcodes_h_l2037_c7_2850_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_2850_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_2850_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_2850_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_2850_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_2850_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2037_c7_2850_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2040_c11_ffb3_return_output,
 t8_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output,
 sp_relative_shift_uxn_opcodes_h_l2043_c30_a155_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2048_c11_e5f3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_634d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_634d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_634d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_5e10_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_5e10_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_5e10_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_b6f9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_b6f9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_b6f9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_b6f9_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2032_c2_f2de_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2032_c2_f2de_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2037_c7_2850_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2032_c2_f2de_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_f2de_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2034_c3_dff0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_f2de_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_2850_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_f2de_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_f2de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_f2de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_2850_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_f2de_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_2850_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_2850_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_f2de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_f2de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_2850_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_f2de_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c2_f2de_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c2_f2de_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_2850_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c2_f2de_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2033_c3_648d_uxn_opcodes_h_l2033_c3_648d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_afbe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_afbe_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_afbe_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2037_c7_2850_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2037_c7_2850_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2037_c7_2850_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_2850_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2038_c3_b9f8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_2850_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_2850_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_2850_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_2850_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_2850_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_2850_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_2850_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_2850_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_2850_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_2850_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_2850_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_2850_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_2850_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_2850_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_2850_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_2850_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_2850_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_ffb3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_ffb3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_ffb3_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2040_c7_0cfa_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2040_c7_0cfa_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2040_c7_0cfa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0cfa_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2045_c3_5e0a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0cfa_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2040_c7_0cfa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0cfa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0cfa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0cfa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_634d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0cfa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_634d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0cfa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0cfa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_634d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0cfa_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0cfa_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0cfa_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0cfa_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2043_c30_a155_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2043_c30_a155_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2043_c30_a155_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2043_c30_a155_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_e5f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_e5f3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_e5f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_634d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_634d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_634d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_634d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_634d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_634d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_634d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_634d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_634d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2032_l2048_l2037_DUPLICATE_ea7d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2032_l2048_l2037_DUPLICATE_39c0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2040_l2032_l2037_DUPLICATE_3ff4_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2040_l2032_l2037_DUPLICATE_c8b7_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2040_l2048_l2037_DUPLICATE_0a40_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l2054_l2028_DUPLICATE_a927_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_e5f3_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_afbe_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_f2de_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2045_c3_5e0a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0cfa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2045_c3_5e0a;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0cfa_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_b6f9_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_5e10_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_634d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2038_c3_b9f8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_2850_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2038_c3_b9f8;
     VAR_sp_relative_shift_uxn_opcodes_h_l2043_c30_a155_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2034_c3_dff0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_f2de_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2034_c3_dff0;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_ffb3_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2043_c30_a155_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_634d_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_634d_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_b6f9_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2043_c30_a155_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_5e10_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_afbe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_ffb3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_e5f3_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0cfa_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2040_c7_0cfa_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2032_c2_f2de_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2037_c7_2850_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2040_c7_0cfa_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l2040_c11_ffb3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2040_c11_ffb3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_ffb3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2040_c11_ffb3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_ffb3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_ffb3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2040_c11_ffb3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2032_l2048_l2037_DUPLICATE_ea7d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2032_l2048_l2037_DUPLICATE_ea7d_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l2043_c30_a155] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2043_c30_a155_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2043_c30_a155_ins;
     sp_relative_shift_uxn_opcodes_h_l2043_c30_a155_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2043_c30_a155_x;
     sp_relative_shift_uxn_opcodes_h_l2043_c30_a155_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2043_c30_a155_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2043_c30_a155_return_output := sp_relative_shift_uxn_opcodes_h_l2043_c30_a155_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2040_l2032_l2037_DUPLICATE_3ff4 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2040_l2032_l2037_DUPLICATE_3ff4_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2048_c11_e5f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2048_c11_e5f3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_e5f3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2048_c11_e5f3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_e5f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_e5f3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2048_c11_e5f3_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2040_c7_0cfa] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2040_c7_0cfa_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2040_l2048_l2037_DUPLICATE_0a40 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2040_l2048_l2037_DUPLICATE_0a40_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2037_c11_afbe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2037_c11_afbe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_afbe_left;
     BIN_OP_EQ_uxn_opcodes_h_l2037_c11_afbe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_afbe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_afbe_return_output := BIN_OP_EQ_uxn_opcodes_h_l2037_c11_afbe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2032_c6_5e10] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2032_c6_5e10_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_5e10_left;
     BIN_OP_EQ_uxn_opcodes_h_l2032_c6_5e10_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_5e10_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_5e10_return_output := BIN_OP_EQ_uxn_opcodes_h_l2032_c6_5e10_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2040_l2032_l2037_DUPLICATE_c8b7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2040_l2032_l2037_DUPLICATE_c8b7_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2032_l2048_l2037_DUPLICATE_39c0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2032_l2048_l2037_DUPLICATE_39c0_return_output := result.is_sp_shift;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_b6f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_5e10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_f2de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_5e10_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_5e10_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_f2de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_5e10_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_5e10_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_f2de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_5e10_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c2_f2de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_5e10_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2032_c2_f2de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_5e10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_2850_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_afbe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_2850_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_afbe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_2850_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_afbe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_2850_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_afbe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_2850_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_afbe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_2850_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_afbe_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2037_c7_2850_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_afbe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0cfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_ffb3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_ffb3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0cfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_ffb3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_ffb3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0cfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_ffb3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0cfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_ffb3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2040_c7_0cfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_ffb3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_634d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_e5f3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_634d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_e5f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_634d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_e5f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2040_l2032_l2037_DUPLICATE_3ff4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_2850_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2040_l2032_l2037_DUPLICATE_3ff4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2040_l2032_l2037_DUPLICATE_3ff4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_2850_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2040_l2048_l2037_DUPLICATE_0a40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0cfa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2040_l2048_l2037_DUPLICATE_0a40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_634d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2040_l2048_l2037_DUPLICATE_0a40_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2032_l2048_l2037_DUPLICATE_39c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_2850_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2032_l2048_l2037_DUPLICATE_39c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_634d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2032_l2048_l2037_DUPLICATE_39c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_f2de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2032_l2048_l2037_DUPLICATE_ea7d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_2850_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2032_l2048_l2037_DUPLICATE_ea7d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_634d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2032_l2048_l2037_DUPLICATE_ea7d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c2_f2de_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2040_l2032_l2037_DUPLICATE_c8b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_2850_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2040_l2032_l2037_DUPLICATE_c8b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0cfa_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2040_l2032_l2037_DUPLICATE_c8b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0cfa_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2040_c7_0cfa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2043_c30_a155_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2040_c7_0cfa] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0cfa_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0cfa_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0cfa_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0cfa_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0cfa_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0cfa_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output := result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2048_c7_634d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_634d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_634d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_634d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_634d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_634d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_634d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_634d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_634d_return_output;

     -- t8_MUX[uxn_opcodes_h_l2040_c7_0cfa] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2040_c7_0cfa_cond <= VAR_t8_MUX_uxn_opcodes_h_l2040_c7_0cfa_cond;
     t8_MUX_uxn_opcodes_h_l2040_c7_0cfa_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2040_c7_0cfa_iftrue;
     t8_MUX_uxn_opcodes_h_l2040_c7_0cfa_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2040_c7_0cfa_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output := t8_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2048_c7_634d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_634d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_634d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_634d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_634d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_634d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_634d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_634d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_634d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2048_c7_634d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_634d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_634d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_634d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_634d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_634d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_634d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_634d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_634d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2040_c7_0cfa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0cfa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0cfa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0cfa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0cfa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0cfa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0cfa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2032_c1_b6f9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_b6f9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_b6f9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_b6f9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_b6f9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_b6f9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_b6f9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_b6f9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_b6f9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2040_c7_0cfa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output;

     -- Submodule level 2
     VAR_printf_uxn_opcodes_h_l2033_c3_648d_uxn_opcodes_h_l2033_c3_648d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_b6f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0cfa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_634d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_634d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0cfa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_634d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_2850_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_2850_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_2850_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2037_c7_2850_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2040_c7_0cfa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0cfa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0cfa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0cfa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0cfa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0cfa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0cfa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2037_c7_2850] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_2850_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_2850_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_2850_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_2850_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_2850_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_2850_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_2850_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_2850_return_output;

     -- t8_MUX[uxn_opcodes_h_l2037_c7_2850] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2037_c7_2850_cond <= VAR_t8_MUX_uxn_opcodes_h_l2037_c7_2850_cond;
     t8_MUX_uxn_opcodes_h_l2037_c7_2850_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2037_c7_2850_iftrue;
     t8_MUX_uxn_opcodes_h_l2037_c7_2850_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2037_c7_2850_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2037_c7_2850_return_output := t8_MUX_uxn_opcodes_h_l2037_c7_2850_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2040_c7_0cfa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output;

     -- printf_uxn_opcodes_h_l2033_c3_648d[uxn_opcodes_h_l2033_c3_648d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2033_c3_648d_uxn_opcodes_h_l2033_c3_648d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2033_c3_648d_uxn_opcodes_h_l2033_c3_648d_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2040_c7_0cfa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0cfa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0cfa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0cfa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0cfa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0cfa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0cfa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2037_c7_2850] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_2850_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_2850_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_2850_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_2850_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_2850_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_2850_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_2850_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_2850_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2037_c7_2850] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2037_c7_2850_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_2850_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2037_c7_2850_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_2850_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2037_c7_2850_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_2850_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_2850_return_output := result_u8_value_MUX_uxn_opcodes_h_l2037_c7_2850_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_2850_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_2850_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_2850_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_0cfa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_2850_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_f2de_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_2850_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c2_f2de_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_2850_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2032_c2_f2de_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2037_c7_2850_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2032_c2_f2de] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2032_c2_f2de_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c2_f2de_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2032_c2_f2de_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c2_f2de_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2032_c2_f2de_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c2_f2de_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output := result_u8_value_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2037_c7_2850] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_2850_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_2850_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_2850_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_2850_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_2850_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_2850_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_2850_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_2850_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2037_c7_2850] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_2850_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_2850_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_2850_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_2850_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_2850_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_2850_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_2850_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_2850_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2037_c7_2850] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_2850_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_2850_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_2850_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_2850_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_2850_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_2850_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_2850_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_2850_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2032_c2_f2de] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2032_c2_f2de] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_f2de_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_f2de_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_f2de_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_f2de_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_f2de_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_f2de_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output;

     -- t8_MUX[uxn_opcodes_h_l2032_c2_f2de] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2032_c2_f2de_cond <= VAR_t8_MUX_uxn_opcodes_h_l2032_c2_f2de_cond;
     t8_MUX_uxn_opcodes_h_l2032_c2_f2de_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2032_c2_f2de_iftrue;
     t8_MUX_uxn_opcodes_h_l2032_c2_f2de_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2032_c2_f2de_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output := t8_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_f2de_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_2850_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_2850_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_f2de_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_2850_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2032_c2_f2de] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_f2de_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_f2de_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_f2de_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_f2de_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_f2de_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_f2de_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2032_c2_f2de] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2032_c2_f2de] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_f2de_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_f2de_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_f2de_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_f2de_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_f2de_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_f2de_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l2054_l2028_DUPLICATE_a927 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l2054_l2028_DUPLICATE_a927_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4e73(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c2_f2de_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l2054_l2028_DUPLICATE_a927_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4e73_uxn_opcodes_h_l2054_l2028_DUPLICATE_a927_return_output;
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
