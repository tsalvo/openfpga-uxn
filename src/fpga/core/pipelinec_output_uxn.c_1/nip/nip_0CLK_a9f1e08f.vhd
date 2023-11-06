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
-- BIN_OP_EQ[uxn_opcodes_h_l2032_c6_4826]
signal BIN_OP_EQ_uxn_opcodes_h_l2032_c6_4826_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2032_c6_4826_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2032_c6_4826_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2032_c1_3461]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_3461_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_3461_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_3461_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_3461_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2032_c2_67d1]
signal t8_MUX_uxn_opcodes_h_l2032_c2_67d1_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2032_c2_67d1_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2032_c2_67d1_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2032_c2_67d1]
signal result_u8_value_MUX_uxn_opcodes_h_l2032_c2_67d1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2032_c2_67d1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2032_c2_67d1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2032_c2_67d1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2032_c2_67d1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_67d1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_67d1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_67d1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2032_c2_67d1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_67d1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_67d1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_67d1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2032_c2_67d1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_67d1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_67d1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_67d1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2032_c2_67d1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output : signed(3 downto 0);

-- printf_uxn_opcodes_h_l2033_c3_a37d[uxn_opcodes_h_l2033_c3_a37d]
signal printf_uxn_opcodes_h_l2033_c3_a37d_uxn_opcodes_h_l2033_c3_a37d_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2037_c11_ce42]
signal BIN_OP_EQ_uxn_opcodes_h_l2037_c11_ce42_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2037_c11_ce42_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2037_c11_ce42_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2037_c7_b6a2]
signal t8_MUX_uxn_opcodes_h_l2037_c7_b6a2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2037_c7_b6a2_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2037_c7_b6a2_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2037_c7_b6a2]
signal result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b6a2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b6a2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b6a2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2037_c7_b6a2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2037_c7_b6a2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b6a2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b6a2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b6a2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2037_c7_b6a2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b6a2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b6a2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b6a2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2037_c7_b6a2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b6a2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b6a2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b6a2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2037_c7_b6a2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2040_c11_c69b]
signal BIN_OP_EQ_uxn_opcodes_h_l2040_c11_c69b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2040_c11_c69b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2040_c11_c69b_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2040_c7_9c16]
signal t8_MUX_uxn_opcodes_h_l2040_c7_9c16_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2040_c7_9c16_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2040_c7_9c16_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2040_c7_9c16]
signal result_u8_value_MUX_uxn_opcodes_h_l2040_c7_9c16_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2040_c7_9c16_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2040_c7_9c16_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2040_c7_9c16]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2040_c7_9c16]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_9c16_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_9c16_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_9c16_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2040_c7_9c16]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_9c16_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_9c16_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_9c16_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2040_c7_9c16]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_9c16_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_9c16_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_9c16_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2040_c7_9c16]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output : signed(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2043_c30_ccf7]
signal sp_relative_shift_uxn_opcodes_h_l2043_c30_ccf7_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2043_c30_ccf7_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2043_c30_ccf7_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2043_c30_ccf7_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2048_c11_9c9f]
signal BIN_OP_EQ_uxn_opcodes_h_l2048_c11_9c9f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2048_c11_9c9f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2048_c11_9c9f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2048_c7_d589]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_d589_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_d589_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_d589_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_d589_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2048_c7_d589]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_d589_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_d589_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_d589_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_d589_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2048_c7_d589]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_d589_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_d589_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_d589_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_d589_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2032_c6_4826
BIN_OP_EQ_uxn_opcodes_h_l2032_c6_4826 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2032_c6_4826_left,
BIN_OP_EQ_uxn_opcodes_h_l2032_c6_4826_right,
BIN_OP_EQ_uxn_opcodes_h_l2032_c6_4826_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_3461
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_3461 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_3461_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_3461_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_3461_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_3461_return_output);

-- t8_MUX_uxn_opcodes_h_l2032_c2_67d1
t8_MUX_uxn_opcodes_h_l2032_c2_67d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2032_c2_67d1_cond,
t8_MUX_uxn_opcodes_h_l2032_c2_67d1_iftrue,
t8_MUX_uxn_opcodes_h_l2032_c2_67d1_iffalse,
t8_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2032_c2_67d1
result_u8_value_MUX_uxn_opcodes_h_l2032_c2_67d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2032_c2_67d1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2032_c2_67d1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2032_c2_67d1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_67d1
result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_67d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_67d1
result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_67d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_67d1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_67d1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_67d1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_67d1
result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_67d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_67d1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_67d1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_67d1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_67d1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_67d1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_67d1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_67d1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_67d1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_67d1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_67d1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output);

-- printf_uxn_opcodes_h_l2033_c3_a37d_uxn_opcodes_h_l2033_c3_a37d
printf_uxn_opcodes_h_l2033_c3_a37d_uxn_opcodes_h_l2033_c3_a37d : entity work.printf_uxn_opcodes_h_l2033_c3_a37d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2033_c3_a37d_uxn_opcodes_h_l2033_c3_a37d_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2037_c11_ce42
BIN_OP_EQ_uxn_opcodes_h_l2037_c11_ce42 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2037_c11_ce42_left,
BIN_OP_EQ_uxn_opcodes_h_l2037_c11_ce42_right,
BIN_OP_EQ_uxn_opcodes_h_l2037_c11_ce42_return_output);

-- t8_MUX_uxn_opcodes_h_l2037_c7_b6a2
t8_MUX_uxn_opcodes_h_l2037_c7_b6a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2037_c7_b6a2_cond,
t8_MUX_uxn_opcodes_h_l2037_c7_b6a2_iftrue,
t8_MUX_uxn_opcodes_h_l2037_c7_b6a2_iffalse,
t8_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b6a2
result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b6a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b6a2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b6a2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b6a2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2
result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b6a2
result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b6a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b6a2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b6a2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b6a2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b6a2
result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b6a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b6a2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b6a2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b6a2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b6a2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b6a2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b6a2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b6a2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b6a2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2040_c11_c69b
BIN_OP_EQ_uxn_opcodes_h_l2040_c11_c69b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2040_c11_c69b_left,
BIN_OP_EQ_uxn_opcodes_h_l2040_c11_c69b_right,
BIN_OP_EQ_uxn_opcodes_h_l2040_c11_c69b_return_output);

-- t8_MUX_uxn_opcodes_h_l2040_c7_9c16
t8_MUX_uxn_opcodes_h_l2040_c7_9c16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2040_c7_9c16_cond,
t8_MUX_uxn_opcodes_h_l2040_c7_9c16_iftrue,
t8_MUX_uxn_opcodes_h_l2040_c7_9c16_iffalse,
t8_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2040_c7_9c16
result_u8_value_MUX_uxn_opcodes_h_l2040_c7_9c16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2040_c7_9c16_cond,
result_u8_value_MUX_uxn_opcodes_h_l2040_c7_9c16_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2040_c7_9c16_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_9c16
result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_9c16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_9c16
result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_9c16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_9c16_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_9c16_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_9c16_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_9c16
result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_9c16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_9c16_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_9c16_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_9c16_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_9c16
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_9c16 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_9c16_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_9c16_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_9c16_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_9c16
result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_9c16 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2043_c30_ccf7
sp_relative_shift_uxn_opcodes_h_l2043_c30_ccf7 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2043_c30_ccf7_ins,
sp_relative_shift_uxn_opcodes_h_l2043_c30_ccf7_x,
sp_relative_shift_uxn_opcodes_h_l2043_c30_ccf7_y,
sp_relative_shift_uxn_opcodes_h_l2043_c30_ccf7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2048_c11_9c9f
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_9c9f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_9c9f_left,
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_9c9f_right,
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_9c9f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_d589
result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_d589 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_d589_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_d589_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_d589_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_d589_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_d589
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_d589 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_d589_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_d589_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_d589_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_d589_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_d589
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_d589 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_d589_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_d589_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_d589_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_d589_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2032_c6_4826_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_3461_return_output,
 t8_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2037_c11_ce42_return_output,
 t8_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2040_c11_c69b_return_output,
 t8_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output,
 sp_relative_shift_uxn_opcodes_h_l2043_c30_ccf7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2048_c11_9c9f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_d589_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_d589_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_d589_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_4826_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_4826_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_4826_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_3461_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_3461_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_3461_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_3461_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2032_c2_67d1_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2032_c2_67d1_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2032_c2_67d1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c2_67d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c2_67d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c2_67d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_67d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_67d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_67d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_67d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_67d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_67d1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_67d1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2034_c3_f213 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_67d1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_67d1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2033_c3_a37d_uxn_opcodes_h_l2033_c3_a37d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_ce42_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_ce42_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_ce42_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2037_c7_b6a2_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2037_c7_b6a2_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2037_c7_b6a2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b6a2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b6a2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b6a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b6a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b6a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b6a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b6a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b6a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b6a2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b6a2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2038_c3_1323 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b6a2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b6a2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_c69b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_c69b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_c69b_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2040_c7_9c16_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2040_c7_9c16_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2040_c7_9c16_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_9c16_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_9c16_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_9c16_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_d589_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_9c16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_9c16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_d589_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_9c16_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_9c16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_9c16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_d589_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_9c16_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_9c16_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2045_c3_e293 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_9c16_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2040_c7_9c16_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_9c16_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2043_c30_ccf7_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2043_c30_ccf7_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2043_c30_ccf7_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2043_c30_ccf7_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_9c9f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_9c9f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_9c9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_d589_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_d589_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_d589_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_d589_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_d589_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_d589_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_d589_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_d589_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_d589_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2037_l2040_l2032_DUPLICATE_0375_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2048_l2037_l2032_DUPLICATE_32a4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2048_l2037_l2032_DUPLICATE_eed7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2037_l2040_l2032_DUPLICATE_91c8_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2048_l2037_l2040_DUPLICATE_0e60_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l2054_l2028_DUPLICATE_2280_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_9c9f_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2043_c30_ccf7_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_9c16_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2038_c3_1323 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b6a2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2038_c3_1323;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_d589_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2043_c30_ccf7_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_c69b_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_3461_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2045_c3_e293 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_9c16_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2045_c3_e293;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_d589_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_ce42_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2034_c3_f213 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_67d1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2034_c3_f213;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_67d1_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_d589_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_4826_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_3461_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2043_c30_ccf7_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_4826_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_ce42_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_c69b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_9c9f_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_9c16_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2040_c7_9c16_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2032_c2_67d1_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2037_c7_b6a2_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2040_c7_9c16_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l2040_c11_c69b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2040_c11_c69b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_c69b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2040_c11_c69b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_c69b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_c69b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2040_c11_c69b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2032_c6_4826] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2032_c6_4826_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_4826_left;
     BIN_OP_EQ_uxn_opcodes_h_l2032_c6_4826_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_4826_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_4826_return_output := BIN_OP_EQ_uxn_opcodes_h_l2032_c6_4826_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2037_l2040_l2032_DUPLICATE_91c8 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2037_l2040_l2032_DUPLICATE_91c8_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l2043_c30_ccf7] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2043_c30_ccf7_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2043_c30_ccf7_ins;
     sp_relative_shift_uxn_opcodes_h_l2043_c30_ccf7_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2043_c30_ccf7_x;
     sp_relative_shift_uxn_opcodes_h_l2043_c30_ccf7_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2043_c30_ccf7_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2043_c30_ccf7_return_output := sp_relative_shift_uxn_opcodes_h_l2043_c30_ccf7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2048_l2037_l2032_DUPLICATE_32a4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2048_l2037_l2032_DUPLICATE_32a4_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2037_c11_ce42] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2037_c11_ce42_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_ce42_left;
     BIN_OP_EQ_uxn_opcodes_h_l2037_c11_ce42_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_ce42_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_ce42_return_output := BIN_OP_EQ_uxn_opcodes_h_l2037_c11_ce42_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2048_l2037_l2032_DUPLICATE_eed7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2048_l2037_l2032_DUPLICATE_eed7_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2048_l2037_l2040_DUPLICATE_0e60 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2048_l2037_l2040_DUPLICATE_0e60_return_output := result.is_opc_done;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2040_c7_9c16] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2040_c7_9c16_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2048_c11_9c9f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2048_c11_9c9f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_9c9f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2048_c11_9c9f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_9c9f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_9c9f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2048_c11_9c9f_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2037_l2040_l2032_DUPLICATE_0375 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2037_l2040_l2032_DUPLICATE_0375_return_output := result.u8_value;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_3461_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_4826_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_67d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_4826_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_4826_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_67d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_4826_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_4826_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_67d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_4826_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c2_67d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_4826_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2032_c2_67d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2032_c6_4826_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b6a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_ce42_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_ce42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b6a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_ce42_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_ce42_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b6a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_ce42_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b6a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_ce42_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2037_c7_b6a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_ce42_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_9c16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_c69b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_c69b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_9c16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_c69b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_c69b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_9c16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_c69b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_9c16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_c69b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2040_c7_9c16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_c69b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_d589_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_9c9f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_d589_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_9c9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_d589_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_9c9f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2037_l2040_l2032_DUPLICATE_91c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2037_l2040_l2032_DUPLICATE_91c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2037_l2040_l2032_DUPLICATE_91c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b6a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2048_l2037_l2040_DUPLICATE_0e60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_9c16_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2048_l2037_l2040_DUPLICATE_0e60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_d589_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2048_l2037_l2040_DUPLICATE_0e60_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2048_l2037_l2032_DUPLICATE_32a4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2048_l2037_l2032_DUPLICATE_32a4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_d589_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2048_l2037_l2032_DUPLICATE_32a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_67d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2048_l2037_l2032_DUPLICATE_eed7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b6a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2048_l2037_l2032_DUPLICATE_eed7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_d589_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2048_l2037_l2032_DUPLICATE_eed7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c2_67d1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2037_l2040_l2032_DUPLICATE_0375_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b6a2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2037_l2040_l2032_DUPLICATE_0375_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_9c16_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2037_l2040_l2032_DUPLICATE_0375_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_9c16_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2040_c7_9c16_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2043_c30_ccf7_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2040_c7_9c16] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2040_c7_9c16_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_9c16_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2040_c7_9c16_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_9c16_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2040_c7_9c16_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_9c16_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output := result_u8_value_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output;

     -- t8_MUX[uxn_opcodes_h_l2040_c7_9c16] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2040_c7_9c16_cond <= VAR_t8_MUX_uxn_opcodes_h_l2040_c7_9c16_cond;
     t8_MUX_uxn_opcodes_h_l2040_c7_9c16_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2040_c7_9c16_iftrue;
     t8_MUX_uxn_opcodes_h_l2040_c7_9c16_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2040_c7_9c16_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output := t8_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2048_c7_d589] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_d589_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_d589_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_d589_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_d589_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_d589_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_d589_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_d589_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_d589_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2040_c7_9c16] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2048_c7_d589] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_d589_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_d589_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_d589_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_d589_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_d589_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_d589_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_d589_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_d589_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2032_c1_3461] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_3461_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_3461_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_3461_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_3461_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_3461_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_3461_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_3461_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_3461_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2040_c7_9c16] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_9c16_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_9c16_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_9c16_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_9c16_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_9c16_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_9c16_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2048_c7_d589] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_d589_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_d589_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_d589_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_d589_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_d589_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_d589_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_d589_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_d589_return_output;

     -- Submodule level 2
     VAR_printf_uxn_opcodes_h_l2033_c3_a37d_uxn_opcodes_h_l2033_c3_a37d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2032_c1_3461_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_9c16_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_d589_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_d589_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_9c16_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_d589_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b6a2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b6a2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2037_c7_b6a2_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2037_c7_b6a2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b6a2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b6a2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b6a2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b6a2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b6a2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b6a2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output;

     -- printf_uxn_opcodes_h_l2033_c3_a37d[uxn_opcodes_h_l2033_c3_a37d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2033_c3_a37d_uxn_opcodes_h_l2033_c3_a37d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2033_c3_a37d_uxn_opcodes_h_l2033_c3_a37d_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_u8_value_MUX[uxn_opcodes_h_l2037_c7_b6a2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b6a2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b6a2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b6a2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b6a2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b6a2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b6a2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2040_c7_9c16] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_9c16_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_9c16_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_9c16_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_9c16_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_9c16_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_9c16_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output;

     -- t8_MUX[uxn_opcodes_h_l2037_c7_b6a2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2037_c7_b6a2_cond <= VAR_t8_MUX_uxn_opcodes_h_l2037_c7_b6a2_cond;
     t8_MUX_uxn_opcodes_h_l2037_c7_b6a2_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2037_c7_b6a2_iftrue;
     t8_MUX_uxn_opcodes_h_l2037_c7_b6a2_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2037_c7_b6a2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output := t8_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2040_c7_9c16] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2040_c7_9c16] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_9c16_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_9c16_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_9c16_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_9c16_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_9c16_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_9c16_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2037_c7_b6a2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b6a2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b6a2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_9c16_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_67d1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c2_67d1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2032_c2_67d1_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2037_c7_b6a2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b6a2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b6a2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b6a2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b6a2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b6a2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b6a2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2032_c2_67d1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2032_c2_67d1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c2_67d1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2032_c2_67d1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c2_67d1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2032_c2_67d1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c2_67d1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2032_c2_67d1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_67d1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_67d1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_67d1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_67d1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_67d1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_67d1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2032_c2_67d1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output;

     -- t8_MUX[uxn_opcodes_h_l2032_c2_67d1] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2032_c2_67d1_cond <= VAR_t8_MUX_uxn_opcodes_h_l2032_c2_67d1_cond;
     t8_MUX_uxn_opcodes_h_l2032_c2_67d1_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2032_c2_67d1_iftrue;
     t8_MUX_uxn_opcodes_h_l2032_c2_67d1_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2032_c2_67d1_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output := t8_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2037_c7_b6a2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b6a2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b6a2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b6a2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b6a2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b6a2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b6a2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2037_c7_b6a2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_67d1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_67d1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_b6a2_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2032_c2_67d1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_67d1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_67d1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_67d1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_67d1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_67d1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_67d1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2032_c2_67d1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2032_c2_67d1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_67d1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_67d1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_67d1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_67d1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_67d1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_67d1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l2054_l2028_DUPLICATE_2280 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l2054_l2028_DUPLICATE_2280_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2032_c2_67d1_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l2054_l2028_DUPLICATE_2280_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l2054_l2028_DUPLICATE_2280_return_output;
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
