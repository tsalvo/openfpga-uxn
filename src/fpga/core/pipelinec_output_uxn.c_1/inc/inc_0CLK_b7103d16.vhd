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
-- BIN_OP_EQ[uxn_opcodes_h_l1407_c6_9fa0]
signal BIN_OP_EQ_uxn_opcodes_h_l1407_c6_9fa0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1407_c6_9fa0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1407_c6_9fa0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1407_c1_741b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1407_c1_741b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1407_c1_741b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1407_c1_741b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1407_c1_741b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1407_c2_4dfb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c2_4dfb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c2_4dfb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c2_4dfb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1407_c2_4dfb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1407_c2_4dfb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c2_4dfb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c2_4dfb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c2_4dfb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1407_c2_4dfb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c2_4dfb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c2_4dfb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c2_4dfb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1407_c2_4dfb]
signal result_u8_value_MUX_uxn_opcodes_h_l1407_c2_4dfb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1407_c2_4dfb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1407_c2_4dfb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1407_c2_4dfb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l1407_c2_4dfb]
signal t8_MUX_uxn_opcodes_h_l1407_c2_4dfb_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1407_c2_4dfb_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1407_c2_4dfb_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1408_c3_5648[uxn_opcodes_h_l1408_c3_5648]
signal printf_uxn_opcodes_h_l1408_c3_5648_uxn_opcodes_h_l1408_c3_5648_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1412_c11_ff89]
signal BIN_OP_EQ_uxn_opcodes_h_l1412_c11_ff89_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1412_c11_ff89_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1412_c11_ff89_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1412_c7_25a8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c7_25a8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c7_25a8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c7_25a8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1412_c7_25a8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1412_c7_25a8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1412_c7_25a8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1412_c7_25a8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1412_c7_25a8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1412_c7_25a8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1412_c7_25a8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1412_c7_25a8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1412_c7_25a8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1412_c7_25a8]
signal result_u8_value_MUX_uxn_opcodes_h_l1412_c7_25a8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1412_c7_25a8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1412_c7_25a8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1412_c7_25a8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l1412_c7_25a8]
signal t8_MUX_uxn_opcodes_h_l1412_c7_25a8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1412_c7_25a8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1412_c7_25a8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1415_c11_e3b8]
signal BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e3b8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e3b8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e3b8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1415_c7_d635]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d635_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d635_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d635_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d635_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1415_c7_d635]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_d635_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_d635_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_d635_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_d635_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1415_c7_d635]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d635_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d635_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d635_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d635_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1415_c7_d635]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d635_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d635_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d635_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d635_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1415_c7_d635]
signal result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d635_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d635_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d635_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d635_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1415_c7_d635]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d635_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d635_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d635_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d635_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l1415_c7_d635]
signal t8_MUX_uxn_opcodes_h_l1415_c7_d635_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1415_c7_d635_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1415_c7_d635_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1415_c7_d635_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1418_c30_5ef0]
signal sp_relative_shift_uxn_opcodes_h_l1418_c30_5ef0_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1418_c30_5ef0_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1418_c30_5ef0_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1418_c30_5ef0_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1421_c21_8456]
signal BIN_OP_PLUS_uxn_opcodes_h_l1421_c21_8456_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1421_c21_8456_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1421_c21_8456_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1423_c11_8a84]
signal BIN_OP_EQ_uxn_opcodes_h_l1423_c11_8a84_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1423_c11_8a84_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1423_c11_8a84_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1423_c7_5043]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_5043_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_5043_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_5043_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_5043_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1423_c7_5043]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_5043_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_5043_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_5043_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_5043_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1423_c7_5043]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_5043_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_5043_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_5043_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_5043_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_641b( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1407_c6_9fa0
BIN_OP_EQ_uxn_opcodes_h_l1407_c6_9fa0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1407_c6_9fa0_left,
BIN_OP_EQ_uxn_opcodes_h_l1407_c6_9fa0_right,
BIN_OP_EQ_uxn_opcodes_h_l1407_c6_9fa0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1407_c1_741b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1407_c1_741b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1407_c1_741b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1407_c1_741b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1407_c1_741b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1407_c1_741b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c2_4dfb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c2_4dfb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c2_4dfb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c2_4dfb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c2_4dfb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb
result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1407_c2_4dfb
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c2_4dfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c2_4dfb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c2_4dfb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c2_4dfb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1407_c2_4dfb
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c2_4dfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c2_4dfb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c2_4dfb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c2_4dfb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1407_c2_4dfb
result_u8_value_MUX_uxn_opcodes_h_l1407_c2_4dfb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1407_c2_4dfb_cond,
result_u8_value_MUX_uxn_opcodes_h_l1407_c2_4dfb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1407_c2_4dfb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output);

-- t8_MUX_uxn_opcodes_h_l1407_c2_4dfb
t8_MUX_uxn_opcodes_h_l1407_c2_4dfb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1407_c2_4dfb_cond,
t8_MUX_uxn_opcodes_h_l1407_c2_4dfb_iftrue,
t8_MUX_uxn_opcodes_h_l1407_c2_4dfb_iffalse,
t8_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output);

-- printf_uxn_opcodes_h_l1408_c3_5648_uxn_opcodes_h_l1408_c3_5648
printf_uxn_opcodes_h_l1408_c3_5648_uxn_opcodes_h_l1408_c3_5648 : entity work.printf_uxn_opcodes_h_l1408_c3_5648_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1408_c3_5648_uxn_opcodes_h_l1408_c3_5648_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1412_c11_ff89
BIN_OP_EQ_uxn_opcodes_h_l1412_c11_ff89 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1412_c11_ff89_left,
BIN_OP_EQ_uxn_opcodes_h_l1412_c11_ff89_right,
BIN_OP_EQ_uxn_opcodes_h_l1412_c11_ff89_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c7_25a8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c7_25a8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c7_25a8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c7_25a8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c7_25a8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c7_25a8
result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c7_25a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1412_c7_25a8
result_is_opc_done_MUX_uxn_opcodes_h_l1412_c7_25a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1412_c7_25a8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1412_c7_25a8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1412_c7_25a8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1412_c7_25a8
result_is_stack_write_MUX_uxn_opcodes_h_l1412_c7_25a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1412_c7_25a8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1412_c7_25a8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1412_c7_25a8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1412_c7_25a8
result_u8_value_MUX_uxn_opcodes_h_l1412_c7_25a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1412_c7_25a8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1412_c7_25a8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1412_c7_25a8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c7_25a8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c7_25a8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output);

-- t8_MUX_uxn_opcodes_h_l1412_c7_25a8
t8_MUX_uxn_opcodes_h_l1412_c7_25a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1412_c7_25a8_cond,
t8_MUX_uxn_opcodes_h_l1412_c7_25a8_iftrue,
t8_MUX_uxn_opcodes_h_l1412_c7_25a8_iffalse,
t8_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e3b8
BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e3b8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e3b8_left,
BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e3b8_right,
BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e3b8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d635
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d635 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d635_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d635_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d635_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d635_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_d635
result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_d635 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_d635_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_d635_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_d635_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_d635_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d635
result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d635 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d635_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d635_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d635_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d635_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d635
result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d635 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d635_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d635_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d635_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d635_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d635
result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d635 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d635_cond,
result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d635_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d635_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d635_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d635
result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d635 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d635_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d635_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d635_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d635_return_output);

-- t8_MUX_uxn_opcodes_h_l1415_c7_d635
t8_MUX_uxn_opcodes_h_l1415_c7_d635 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1415_c7_d635_cond,
t8_MUX_uxn_opcodes_h_l1415_c7_d635_iftrue,
t8_MUX_uxn_opcodes_h_l1415_c7_d635_iffalse,
t8_MUX_uxn_opcodes_h_l1415_c7_d635_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1418_c30_5ef0
sp_relative_shift_uxn_opcodes_h_l1418_c30_5ef0 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1418_c30_5ef0_ins,
sp_relative_shift_uxn_opcodes_h_l1418_c30_5ef0_x,
sp_relative_shift_uxn_opcodes_h_l1418_c30_5ef0_y,
sp_relative_shift_uxn_opcodes_h_l1418_c30_5ef0_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1421_c21_8456
BIN_OP_PLUS_uxn_opcodes_h_l1421_c21_8456 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1421_c21_8456_left,
BIN_OP_PLUS_uxn_opcodes_h_l1421_c21_8456_right,
BIN_OP_PLUS_uxn_opcodes_h_l1421_c21_8456_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1423_c11_8a84
BIN_OP_EQ_uxn_opcodes_h_l1423_c11_8a84 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1423_c11_8a84_left,
BIN_OP_EQ_uxn_opcodes_h_l1423_c11_8a84_right,
BIN_OP_EQ_uxn_opcodes_h_l1423_c11_8a84_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_5043
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_5043 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_5043_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_5043_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_5043_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_5043_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_5043
result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_5043 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_5043_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_5043_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_5043_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_5043_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_5043
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_5043 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_5043_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_5043_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_5043_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_5043_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1407_c6_9fa0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1407_c1_741b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output,
 t8_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1412_c11_ff89_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output,
 t8_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e3b8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d635_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_d635_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d635_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d635_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d635_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d635_return_output,
 t8_MUX_uxn_opcodes_h_l1415_c7_d635_return_output,
 sp_relative_shift_uxn_opcodes_h_l1418_c30_5ef0_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1421_c21_8456_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1423_c11_8a84_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_5043_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_5043_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_5043_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c6_9fa0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c6_9fa0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c6_9fa0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1407_c1_741b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1407_c1_741b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1407_c1_741b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1407_c1_741b_iffalse : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c2_4dfb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1409_c3_7f53 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c2_4dfb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c2_4dfb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c2_4dfb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c2_4dfb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c2_4dfb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c2_4dfb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c2_4dfb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c2_4dfb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c2_4dfb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c2_4dfb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c2_4dfb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1407_c2_4dfb_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1407_c2_4dfb_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1407_c2_4dfb_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1408_c3_5648_uxn_opcodes_h_l1408_c3_5648_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c11_ff89_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c11_ff89_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c11_ff89_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c7_25a8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1413_c3_0872 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c7_25a8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d635_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c7_25a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_d635_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1412_c7_25a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1412_c7_25a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d635_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1412_c7_25a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1412_c7_25a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1412_c7_25a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d635_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1412_c7_25a8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1412_c7_25a8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1412_c7_25a8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d635_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1412_c7_25a8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d635_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1412_c7_25a8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1412_c7_25a8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1415_c7_d635_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1412_c7_25a8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e3b8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e3b8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e3b8_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d635_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1420_c3_c2d7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d635_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1415_c7_d635_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d635_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_d635_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_d635_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_5043_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_d635_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d635_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d635_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_5043_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d635_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d635_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d635_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_5043_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d635_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d635_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_opcodes_h_l1421_c3_ab04 : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d635_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d635_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d635_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d635_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d635_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1415_c7_d635_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1415_c7_d635_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1415_c7_d635_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1418_c30_5ef0_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1418_c30_5ef0_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1418_c30_5ef0_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1418_c30_5ef0_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1421_c21_8456_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1421_c21_8456_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1421_c21_8456_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_8a84_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_8a84_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_8a84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_5043_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_5043_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_5043_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_5043_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_5043_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_5043_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_5043_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_5043_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_5043_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1407_l1423_l1412_DUPLICATE_d4cb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1407_l1423_l1412_DUPLICATE_a716_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1407_l1412_l1415_DUPLICATE_b5e4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1412_l1415_DUPLICATE_1238_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1423_l1412_l1415_DUPLICATE_c758_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l1429_l1403_DUPLICATE_2215_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l1418_c30_5ef0_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c6_9fa0_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c11_ff89_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_5043_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1409_c3_7f53 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c2_4dfb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1409_c3_7f53;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1413_c3_0872 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c7_25a8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1413_c3_0872;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e3b8_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_5043_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1421_c21_8456_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1407_c1_741b_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c2_4dfb_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_d635_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d635_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1420_c3_c2d7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d635_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1420_c3_c2d7;
     VAR_sp_relative_shift_uxn_opcodes_h_l1418_c30_5ef0_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_8a84_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_5043_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1407_c1_741b_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1418_c30_5ef0_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c6_9fa0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c11_ff89_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e3b8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_8a84_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1421_c21_8456_left := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1415_c7_d635_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1407_c2_4dfb_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1412_c7_25a8_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1415_c7_d635_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1423_l1412_l1415_DUPLICATE_c758 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1423_l1412_l1415_DUPLICATE_c758_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1412_c11_ff89] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1412_c11_ff89_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c11_ff89_left;
     BIN_OP_EQ_uxn_opcodes_h_l1412_c11_ff89_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c11_ff89_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c11_ff89_return_output := BIN_OP_EQ_uxn_opcodes_h_l1412_c11_ff89_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1423_c11_8a84] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1423_c11_8a84_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_8a84_left;
     BIN_OP_EQ_uxn_opcodes_h_l1423_c11_8a84_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_8a84_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_8a84_return_output := BIN_OP_EQ_uxn_opcodes_h_l1423_c11_8a84_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1418_c30_5ef0] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1418_c30_5ef0_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1418_c30_5ef0_ins;
     sp_relative_shift_uxn_opcodes_h_l1418_c30_5ef0_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1418_c30_5ef0_x;
     sp_relative_shift_uxn_opcodes_h_l1418_c30_5ef0_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1418_c30_5ef0_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1418_c30_5ef0_return_output := sp_relative_shift_uxn_opcodes_h_l1418_c30_5ef0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1415_c11_e3b8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e3b8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e3b8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e3b8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e3b8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e3b8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e3b8_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1415_c7_d635] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1415_c7_d635_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1412_l1415_DUPLICATE_1238 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1412_l1415_DUPLICATE_1238_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1407_l1423_l1412_DUPLICATE_a716 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1407_l1423_l1412_DUPLICATE_a716_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1407_l1423_l1412_DUPLICATE_d4cb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1407_l1423_l1412_DUPLICATE_d4cb_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1407_l1412_l1415_DUPLICATE_b5e4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1407_l1412_l1415_DUPLICATE_b5e4_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1407_c6_9fa0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1407_c6_9fa0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c6_9fa0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1407_c6_9fa0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c6_9fa0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c6_9fa0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1407_c6_9fa0_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1421_c21_8456] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1421_c21_8456_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1421_c21_8456_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1421_c21_8456_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1421_c21_8456_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1421_c21_8456_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1421_c21_8456_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1407_c1_741b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c6_9fa0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c2_4dfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c6_9fa0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c6_9fa0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c2_4dfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c6_9fa0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c6_9fa0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c2_4dfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c6_9fa0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c2_4dfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c6_9fa0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1407_c2_4dfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1407_c6_9fa0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1412_c7_25a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c11_ff89_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c11_ff89_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1412_c7_25a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c11_ff89_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c11_ff89_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c7_25a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c11_ff89_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1412_c7_25a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c11_ff89_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1412_c7_25a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c11_ff89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d635_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e3b8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_d635_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e3b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d635_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e3b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d635_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e3b8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d635_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e3b8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d635_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e3b8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1415_c7_d635_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1415_c11_e3b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_5043_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_8a84_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_5043_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_8a84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_5043_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_8a84_return_output;
     VAR_result_u8_value_uxn_opcodes_h_l1421_c3_ab04 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1421_c21_8456_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1412_l1415_DUPLICATE_1238_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1412_l1415_DUPLICATE_1238_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d635_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1407_l1412_l1415_DUPLICATE_1238_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1412_c7_25a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1423_l1412_l1415_DUPLICATE_c758_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d635_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1423_l1412_l1415_DUPLICATE_c758_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_5043_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1423_l1412_l1415_DUPLICATE_c758_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1407_l1423_l1412_DUPLICATE_d4cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1407_l1423_l1412_DUPLICATE_d4cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_5043_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1407_l1423_l1412_DUPLICATE_d4cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c2_4dfb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1407_l1423_l1412_DUPLICATE_a716_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1412_c7_25a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1407_l1423_l1412_DUPLICATE_a716_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_5043_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1407_l1423_l1412_DUPLICATE_a716_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c2_4dfb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1407_l1412_l1415_DUPLICATE_b5e4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1412_c7_25a8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1407_l1412_l1415_DUPLICATE_b5e4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d635_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1407_l1412_l1415_DUPLICATE_b5e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d635_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1415_c7_d635_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d635_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1418_c30_5ef0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d635_iftrue := VAR_result_u8_value_uxn_opcodes_h_l1421_c3_ab04;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1415_c7_d635] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d635_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d635_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d635_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d635_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d635_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d635_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d635_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d635_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1423_c7_5043] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_5043_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_5043_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_5043_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_5043_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_5043_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_5043_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_5043_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_5043_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1407_c1_741b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1407_c1_741b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1407_c1_741b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1407_c1_741b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1407_c1_741b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1407_c1_741b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1407_c1_741b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1407_c1_741b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1407_c1_741b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1423_c7_5043] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_5043_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_5043_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_5043_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_5043_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_5043_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_5043_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_5043_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_5043_return_output;

     -- t8_MUX[uxn_opcodes_h_l1415_c7_d635] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1415_c7_d635_cond <= VAR_t8_MUX_uxn_opcodes_h_l1415_c7_d635_cond;
     t8_MUX_uxn_opcodes_h_l1415_c7_d635_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1415_c7_d635_iftrue;
     t8_MUX_uxn_opcodes_h_l1415_c7_d635_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1415_c7_d635_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1415_c7_d635_return_output := t8_MUX_uxn_opcodes_h_l1415_c7_d635_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1415_c7_d635] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d635_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d635_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d635_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d635_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d635_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d635_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d635_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d635_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1415_c7_d635] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d635_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d635_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d635_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d635_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d635_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d635_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d635_return_output := result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d635_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1423_c7_5043] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_5043_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_5043_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_5043_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_5043_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_5043_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_5043_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_5043_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_5043_return_output;

     -- Submodule level 2
     VAR_printf_uxn_opcodes_h_l1408_c3_5648_uxn_opcodes_h_l1408_c3_5648_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1407_c1_741b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d635_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_5043_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_d635_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_5043_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d635_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_5043_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1415_c7_d635_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c7_25a8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1415_c7_d635_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1412_c7_25a8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1415_c7_d635_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1412_c7_25a8_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1415_c7_d635_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1415_c7_d635] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_d635_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_d635_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_d635_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_d635_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_d635_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_d635_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_d635_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_d635_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1412_c7_25a8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1412_c7_25a8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c7_25a8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c7_25a8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c7_25a8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c7_25a8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c7_25a8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c7_25a8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1412_c7_25a8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1412_c7_25a8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1412_c7_25a8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1412_c7_25a8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1412_c7_25a8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1412_c7_25a8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1412_c7_25a8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output;

     -- printf_uxn_opcodes_h_l1408_c3_5648[uxn_opcodes_h_l1408_c3_5648] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1408_c3_5648_uxn_opcodes_h_l1408_c3_5648_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1408_c3_5648_uxn_opcodes_h_l1408_c3_5648_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1415_c7_d635] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d635_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d635_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d635_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d635_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d635_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d635_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d635_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d635_return_output;

     -- t8_MUX[uxn_opcodes_h_l1412_c7_25a8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1412_c7_25a8_cond <= VAR_t8_MUX_uxn_opcodes_h_l1412_c7_25a8_cond;
     t8_MUX_uxn_opcodes_h_l1412_c7_25a8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1412_c7_25a8_iftrue;
     t8_MUX_uxn_opcodes_h_l1412_c7_25a8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1412_c7_25a8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output := t8_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1415_c7_d635] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d635_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d635_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d635_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d635_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d635_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d635_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d635_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d635_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1412_c7_25a8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1415_c7_d635_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1415_c7_d635_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1412_c7_25a8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1415_c7_d635_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c2_4dfb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c2_4dfb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1407_c2_4dfb_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output;
     -- t8_MUX[uxn_opcodes_h_l1407_c2_4dfb] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1407_c2_4dfb_cond <= VAR_t8_MUX_uxn_opcodes_h_l1407_c2_4dfb_cond;
     t8_MUX_uxn_opcodes_h_l1407_c2_4dfb_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1407_c2_4dfb_iftrue;
     t8_MUX_uxn_opcodes_h_l1407_c2_4dfb_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1407_c2_4dfb_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output := t8_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1407_c2_4dfb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1412_c7_25a8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1412_c7_25a8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1412_c7_25a8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1412_c7_25a8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1412_c7_25a8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1412_c7_25a8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1412_c7_25a8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1412_c7_25a8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1412_c7_25a8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1412_c7_25a8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1412_c7_25a8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1412_c7_25a8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1412_c7_25a8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1412_c7_25a8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1407_c2_4dfb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c2_4dfb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c2_4dfb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c2_4dfb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c2_4dfb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c2_4dfb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c2_4dfb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1412_c7_25a8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1407_c2_4dfb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1407_c2_4dfb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c2_4dfb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1407_c2_4dfb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c2_4dfb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1407_c2_4dfb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c2_4dfb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output := result_u8_value_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c2_4dfb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c2_4dfb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1412_c7_25a8_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1407_c2_4dfb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1407_c2_4dfb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1407_c2_4dfb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c2_4dfb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1407_c2_4dfb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c2_4dfb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1407_c2_4dfb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c2_4dfb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1407_c2_4dfb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1407_c2_4dfb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c2_4dfb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1407_c2_4dfb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c2_4dfb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1407_c2_4dfb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c2_4dfb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l1429_l1403_DUPLICATE_2215 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l1429_l1403_DUPLICATE_2215_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_641b(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1407_c2_4dfb_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l1429_l1403_DUPLICATE_2215_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l1429_l1403_DUPLICATE_2215_return_output;
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
