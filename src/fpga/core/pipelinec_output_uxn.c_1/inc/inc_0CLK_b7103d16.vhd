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
-- BIN_OP_EQ[uxn_opcodes_h_l1254_c6_10c5]
signal BIN_OP_EQ_uxn_opcodes_h_l1254_c6_10c5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1254_c6_10c5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1254_c6_10c5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1254_c1_b130]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1254_c1_b130_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1254_c1_b130_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1254_c1_b130_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1254_c1_b130_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1254_c2_6826]
signal t8_MUX_uxn_opcodes_h_l1254_c2_6826_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1254_c2_6826_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1254_c2_6826_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1254_c2_6826_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1254_c2_6826]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1254_c2_6826_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1254_c2_6826_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1254_c2_6826_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1254_c2_6826_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1254_c2_6826]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c2_6826_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c2_6826_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c2_6826_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c2_6826_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1254_c2_6826]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c2_6826_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c2_6826_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c2_6826_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c2_6826_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1254_c2_6826]
signal result_u8_value_MUX_uxn_opcodes_h_l1254_c2_6826_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1254_c2_6826_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1254_c2_6826_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1254_c2_6826_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1254_c2_6826]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1254_c2_6826_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1254_c2_6826_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1254_c2_6826_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1254_c2_6826_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1254_c2_6826]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c2_6826_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c2_6826_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c2_6826_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c2_6826_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1255_c3_49d3[uxn_opcodes_h_l1255_c3_49d3]
signal printf_uxn_opcodes_h_l1255_c3_49d3_uxn_opcodes_h_l1255_c3_49d3_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1259_c11_c245]
signal BIN_OP_EQ_uxn_opcodes_h_l1259_c11_c245_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1259_c11_c245_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1259_c11_c245_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1259_c7_9014]
signal t8_MUX_uxn_opcodes_h_l1259_c7_9014_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1259_c7_9014_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1259_c7_9014_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1259_c7_9014_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1259_c7_9014]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9014_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9014_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9014_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9014_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1259_c7_9014]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9014_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9014_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9014_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9014_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1259_c7_9014]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9014_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9014_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9014_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9014_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1259_c7_9014]
signal result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9014_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9014_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9014_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9014_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1259_c7_9014]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9014_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9014_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9014_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9014_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1259_c7_9014]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_9014_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_9014_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_9014_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_9014_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1262_c11_732f]
signal BIN_OP_EQ_uxn_opcodes_h_l1262_c11_732f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1262_c11_732f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1262_c11_732f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1262_c7_2e55]
signal t8_MUX_uxn_opcodes_h_l1262_c7_2e55_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1262_c7_2e55_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1262_c7_2e55_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1262_c7_2e55]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_2e55_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_2e55_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_2e55_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1262_c7_2e55]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_2e55_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_2e55_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_2e55_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1262_c7_2e55]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1262_c7_2e55]
signal result_u8_value_MUX_uxn_opcodes_h_l1262_c7_2e55_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1262_c7_2e55_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1262_c7_2e55_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1262_c7_2e55]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_2e55_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_2e55_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_2e55_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1262_c7_2e55]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1265_c30_325e]
signal sp_relative_shift_uxn_opcodes_h_l1265_c30_325e_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1265_c30_325e_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1265_c30_325e_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1265_c30_325e_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1268_c21_0629]
signal BIN_OP_PLUS_uxn_opcodes_h_l1268_c21_0629_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1268_c21_0629_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1268_c21_0629_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1270_c11_d415]
signal BIN_OP_EQ_uxn_opcodes_h_l1270_c11_d415_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1270_c11_d415_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1270_c11_d415_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1270_c7_6f3b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_6f3b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_6f3b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_6f3b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_6f3b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1270_c7_6f3b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_6f3b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_6f3b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_6f3b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_6f3b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1270_c7_6f3b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_6f3b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_6f3b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_6f3b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_6f3b_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_c551( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1254_c6_10c5
BIN_OP_EQ_uxn_opcodes_h_l1254_c6_10c5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1254_c6_10c5_left,
BIN_OP_EQ_uxn_opcodes_h_l1254_c6_10c5_right,
BIN_OP_EQ_uxn_opcodes_h_l1254_c6_10c5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1254_c1_b130
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1254_c1_b130 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1254_c1_b130_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1254_c1_b130_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1254_c1_b130_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1254_c1_b130_return_output);

-- t8_MUX_uxn_opcodes_h_l1254_c2_6826
t8_MUX_uxn_opcodes_h_l1254_c2_6826 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1254_c2_6826_cond,
t8_MUX_uxn_opcodes_h_l1254_c2_6826_iftrue,
t8_MUX_uxn_opcodes_h_l1254_c2_6826_iffalse,
t8_MUX_uxn_opcodes_h_l1254_c2_6826_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1254_c2_6826
result_is_stack_write_MUX_uxn_opcodes_h_l1254_c2_6826 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1254_c2_6826_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1254_c2_6826_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1254_c2_6826_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1254_c2_6826_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c2_6826
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c2_6826 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c2_6826_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c2_6826_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c2_6826_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c2_6826_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c2_6826
result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c2_6826 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c2_6826_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c2_6826_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c2_6826_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c2_6826_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1254_c2_6826
result_u8_value_MUX_uxn_opcodes_h_l1254_c2_6826 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1254_c2_6826_cond,
result_u8_value_MUX_uxn_opcodes_h_l1254_c2_6826_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1254_c2_6826_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1254_c2_6826_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1254_c2_6826
result_is_opc_done_MUX_uxn_opcodes_h_l1254_c2_6826 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1254_c2_6826_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1254_c2_6826_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1254_c2_6826_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1254_c2_6826_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c2_6826
result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c2_6826 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c2_6826_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c2_6826_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c2_6826_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c2_6826_return_output);

-- printf_uxn_opcodes_h_l1255_c3_49d3_uxn_opcodes_h_l1255_c3_49d3
printf_uxn_opcodes_h_l1255_c3_49d3_uxn_opcodes_h_l1255_c3_49d3 : entity work.printf_uxn_opcodes_h_l1255_c3_49d3_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1255_c3_49d3_uxn_opcodes_h_l1255_c3_49d3_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1259_c11_c245
BIN_OP_EQ_uxn_opcodes_h_l1259_c11_c245 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1259_c11_c245_left,
BIN_OP_EQ_uxn_opcodes_h_l1259_c11_c245_right,
BIN_OP_EQ_uxn_opcodes_h_l1259_c11_c245_return_output);

-- t8_MUX_uxn_opcodes_h_l1259_c7_9014
t8_MUX_uxn_opcodes_h_l1259_c7_9014 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1259_c7_9014_cond,
t8_MUX_uxn_opcodes_h_l1259_c7_9014_iftrue,
t8_MUX_uxn_opcodes_h_l1259_c7_9014_iffalse,
t8_MUX_uxn_opcodes_h_l1259_c7_9014_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9014
result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9014 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9014_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9014_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9014_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9014_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9014
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9014 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9014_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9014_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9014_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9014_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9014
result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9014 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9014_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9014_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9014_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9014_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9014
result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9014 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9014_cond,
result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9014_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9014_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9014_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9014
result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9014 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9014_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9014_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9014_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9014_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_9014
result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_9014 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_9014_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_9014_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_9014_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_9014_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1262_c11_732f
BIN_OP_EQ_uxn_opcodes_h_l1262_c11_732f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1262_c11_732f_left,
BIN_OP_EQ_uxn_opcodes_h_l1262_c11_732f_right,
BIN_OP_EQ_uxn_opcodes_h_l1262_c11_732f_return_output);

-- t8_MUX_uxn_opcodes_h_l1262_c7_2e55
t8_MUX_uxn_opcodes_h_l1262_c7_2e55 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1262_c7_2e55_cond,
t8_MUX_uxn_opcodes_h_l1262_c7_2e55_iftrue,
t8_MUX_uxn_opcodes_h_l1262_c7_2e55_iffalse,
t8_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_2e55
result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_2e55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_2e55_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_2e55_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_2e55_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_2e55
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_2e55 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_2e55_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_2e55_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_2e55_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_2e55
result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_2e55 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1262_c7_2e55
result_u8_value_MUX_uxn_opcodes_h_l1262_c7_2e55 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1262_c7_2e55_cond,
result_u8_value_MUX_uxn_opcodes_h_l1262_c7_2e55_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1262_c7_2e55_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_2e55
result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_2e55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_2e55_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_2e55_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_2e55_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_2e55
result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_2e55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1265_c30_325e
sp_relative_shift_uxn_opcodes_h_l1265_c30_325e : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1265_c30_325e_ins,
sp_relative_shift_uxn_opcodes_h_l1265_c30_325e_x,
sp_relative_shift_uxn_opcodes_h_l1265_c30_325e_y,
sp_relative_shift_uxn_opcodes_h_l1265_c30_325e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1268_c21_0629
BIN_OP_PLUS_uxn_opcodes_h_l1268_c21_0629 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1268_c21_0629_left,
BIN_OP_PLUS_uxn_opcodes_h_l1268_c21_0629_right,
BIN_OP_PLUS_uxn_opcodes_h_l1268_c21_0629_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1270_c11_d415
BIN_OP_EQ_uxn_opcodes_h_l1270_c11_d415 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1270_c11_d415_left,
BIN_OP_EQ_uxn_opcodes_h_l1270_c11_d415_right,
BIN_OP_EQ_uxn_opcodes_h_l1270_c11_d415_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_6f3b
result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_6f3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_6f3b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_6f3b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_6f3b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_6f3b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_6f3b
result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_6f3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_6f3b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_6f3b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_6f3b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_6f3b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_6f3b
result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_6f3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_6f3b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_6f3b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_6f3b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_6f3b_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1254_c6_10c5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1254_c1_b130_return_output,
 t8_MUX_uxn_opcodes_h_l1254_c2_6826_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1254_c2_6826_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c2_6826_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c2_6826_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1254_c2_6826_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1254_c2_6826_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c2_6826_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1259_c11_c245_return_output,
 t8_MUX_uxn_opcodes_h_l1259_c7_9014_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9014_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9014_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9014_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9014_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9014_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_9014_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1262_c11_732f_return_output,
 t8_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output,
 sp_relative_shift_uxn_opcodes_h_l1265_c30_325e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1268_c21_0629_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1270_c11_d415_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_6f3b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_6f3b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_6f3b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c6_10c5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c6_10c5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c6_10c5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1254_c1_b130_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1254_c1_b130_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1254_c1_b130_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1254_c1_b130_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1254_c2_6826_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1254_c2_6826_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1259_c7_9014_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1254_c2_6826_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1254_c2_6826_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1254_c2_6826_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1254_c2_6826_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9014_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1254_c2_6826_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1254_c2_6826_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c2_6826_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1256_c3_9319 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c2_6826_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9014_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c2_6826_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c2_6826_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c2_6826_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c2_6826_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9014_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c2_6826_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c2_6826_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1254_c2_6826_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1254_c2_6826_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9014_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1254_c2_6826_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1254_c2_6826_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1254_c2_6826_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1254_c2_6826_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9014_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1254_c2_6826_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1254_c2_6826_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c2_6826_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c2_6826_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_9014_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c2_6826_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c2_6826_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1255_c3_49d3_uxn_opcodes_h_l1255_c3_49d3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_c245_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_c245_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_c245_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1259_c7_9014_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1259_c7_9014_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1259_c7_9014_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9014_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9014_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9014_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9014_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1260_c3_5c2f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9014_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9014_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9014_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9014_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9014_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9014_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9014_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9014_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9014_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9014_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9014_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_9014_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_9014_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_9014_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_732f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_732f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_732f_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1262_c7_2e55_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1262_c7_2e55_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1262_c7_2e55_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_2e55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_2e55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_6f3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_2e55_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_2e55_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1267_c3_9a30 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_2e55_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1262_c7_2e55_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_2e55_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c7_2e55_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_opcodes_h_l1268_c3_d1ae : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c7_2e55_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c7_2e55_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_2e55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_2e55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_6f3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_2e55_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_6f3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1265_c30_325e_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1265_c30_325e_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1265_c30_325e_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1265_c30_325e_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1268_c21_0629_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1268_c21_0629_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1268_c21_0629_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_d415_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_d415_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_d415_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_6f3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_6f3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_6f3b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_6f3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_6f3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_6f3b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_6f3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_6f3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_6f3b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1254_l1270_l1259_DUPLICATE_0397_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1262_l1254_l1259_DUPLICATE_3500_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1262_l1254_l1259_DUPLICATE_3ea4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1254_l1270_l1259_DUPLICATE_cb5e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1262_l1270_l1259_DUPLICATE_2f9f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l1276_l1250_DUPLICATE_5c28_return_output : opcode_result_t;
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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1254_c1_b130_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1268_c21_0629_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1265_c30_325e_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_d415_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1265_c30_325e_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1260_c3_5c2f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9014_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1260_c3_5c2f;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_6f3b_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1267_c3_9a30 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_2e55_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1267_c3_9a30;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_732f_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1254_c2_6826_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_c245_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_6f3b_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_6f3b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c6_10c5_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1256_c3_9319 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c2_6826_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1256_c3_9319;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_2e55_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1254_c1_b130_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1265_c30_325e_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c6_10c5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_c245_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_732f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_d415_left := VAR_phase;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1268_c21_0629_left := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1262_c7_2e55_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1254_c2_6826_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1259_c7_9014_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1262_c7_2e55_iffalse := t8;
     -- BIN_OP_PLUS[uxn_opcodes_h_l1268_c21_0629] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1268_c21_0629_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1268_c21_0629_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1268_c21_0629_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1268_c21_0629_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1268_c21_0629_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1268_c21_0629_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1262_l1270_l1259_DUPLICATE_2f9f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1262_l1270_l1259_DUPLICATE_2f9f_return_output := result.is_opc_done;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1262_c7_2e55] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1262_c7_2e55_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1262_c11_732f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1262_c11_732f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_732f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1262_c11_732f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_732f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_732f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1262_c11_732f_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1262_l1254_l1259_DUPLICATE_3500 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1262_l1254_l1259_DUPLICATE_3500_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1254_c6_10c5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1254_c6_10c5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c6_10c5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1254_c6_10c5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c6_10c5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c6_10c5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1254_c6_10c5_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1262_l1254_l1259_DUPLICATE_3ea4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1262_l1254_l1259_DUPLICATE_3ea4_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1270_c11_d415] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1270_c11_d415_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_d415_left;
     BIN_OP_EQ_uxn_opcodes_h_l1270_c11_d415_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_d415_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_d415_return_output := BIN_OP_EQ_uxn_opcodes_h_l1270_c11_d415_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1254_l1270_l1259_DUPLICATE_cb5e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1254_l1270_l1259_DUPLICATE_cb5e_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1259_c11_c245] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1259_c11_c245_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_c245_left;
     BIN_OP_EQ_uxn_opcodes_h_l1259_c11_c245_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_c245_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_c245_return_output := BIN_OP_EQ_uxn_opcodes_h_l1259_c11_c245_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1254_l1270_l1259_DUPLICATE_0397 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1254_l1270_l1259_DUPLICATE_0397_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l1265_c30_325e] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1265_c30_325e_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1265_c30_325e_ins;
     sp_relative_shift_uxn_opcodes_h_l1265_c30_325e_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1265_c30_325e_x;
     sp_relative_shift_uxn_opcodes_h_l1265_c30_325e_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1265_c30_325e_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1265_c30_325e_return_output := sp_relative_shift_uxn_opcodes_h_l1265_c30_325e_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1254_c1_b130_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c6_10c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1254_c2_6826_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c6_10c5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c2_6826_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c6_10c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1254_c2_6826_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c6_10c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c2_6826_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c6_10c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c2_6826_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c6_10c5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1254_c2_6826_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c6_10c5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1254_c2_6826_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c6_10c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9014_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_c245_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_9014_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_c245_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9014_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_c245_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9014_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_c245_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9014_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_c245_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9014_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_c245_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1259_c7_9014_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1259_c11_c245_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_2e55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_732f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_732f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_2e55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_732f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_732f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_2e55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_732f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c7_2e55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_732f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1262_c7_2e55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c11_732f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_6f3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_d415_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_6f3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_d415_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_6f3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_d415_return_output;
     VAR_result_u8_value_uxn_opcodes_h_l1268_c3_d1ae := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1268_c21_0629_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c2_6826_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1262_l1254_l1259_DUPLICATE_3500_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9014_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1262_l1254_l1259_DUPLICATE_3500_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1262_l1254_l1259_DUPLICATE_3500_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9014_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1262_l1270_l1259_DUPLICATE_2f9f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_2e55_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1262_l1270_l1259_DUPLICATE_2f9f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_6f3b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1262_l1270_l1259_DUPLICATE_2f9f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c2_6826_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1254_l1270_l1259_DUPLICATE_cb5e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_9014_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1254_l1270_l1259_DUPLICATE_cb5e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_6f3b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1254_l1270_l1259_DUPLICATE_cb5e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1254_c2_6826_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1254_l1270_l1259_DUPLICATE_0397_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9014_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1254_l1270_l1259_DUPLICATE_0397_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_6f3b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1254_l1270_l1259_DUPLICATE_0397_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1254_c2_6826_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1262_l1254_l1259_DUPLICATE_3ea4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9014_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1262_l1254_l1259_DUPLICATE_3ea4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c7_2e55_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1262_l1254_l1259_DUPLICATE_3ea4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_2e55_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1262_c7_2e55_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1265_c30_325e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c7_2e55_iftrue := VAR_result_u8_value_uxn_opcodes_h_l1268_c3_d1ae;
     -- t8_MUX[uxn_opcodes_h_l1262_c7_2e55] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1262_c7_2e55_cond <= VAR_t8_MUX_uxn_opcodes_h_l1262_c7_2e55_cond;
     t8_MUX_uxn_opcodes_h_l1262_c7_2e55_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1262_c7_2e55_iftrue;
     t8_MUX_uxn_opcodes_h_l1262_c7_2e55_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1262_c7_2e55_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output := t8_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1254_c1_b130] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1254_c1_b130_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1254_c1_b130_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1254_c1_b130_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1254_c1_b130_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1254_c1_b130_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1254_c1_b130_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1254_c1_b130_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1254_c1_b130_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1262_c7_2e55] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_2e55_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_2e55_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_2e55_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_2e55_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_2e55_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_2e55_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1262_c7_2e55] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1262_c7_2e55] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1262_c7_2e55_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c7_2e55_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1262_c7_2e55_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c7_2e55_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1262_c7_2e55_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c7_2e55_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output := result_u8_value_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1270_c7_6f3b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_6f3b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_6f3b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_6f3b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_6f3b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_6f3b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_6f3b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_6f3b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_6f3b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1270_c7_6f3b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_6f3b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_6f3b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_6f3b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_6f3b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_6f3b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_6f3b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_6f3b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_6f3b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1270_c7_6f3b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_6f3b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_6f3b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_6f3b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_6f3b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_6f3b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_6f3b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_6f3b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_6f3b_return_output;

     -- Submodule level 2
     VAR_printf_uxn_opcodes_h_l1255_c3_49d3_uxn_opcodes_h_l1255_c3_49d3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1254_c1_b130_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_2e55_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_6f3b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_6f3b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_2e55_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_6f3b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9014_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9014_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9014_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1259_c7_9014_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1259_c7_9014] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9014_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9014_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9014_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9014_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9014_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9014_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9014_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9014_return_output;

     -- printf_uxn_opcodes_h_l1255_c3_49d3[uxn_opcodes_h_l1255_c3_49d3] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1255_c3_49d3_uxn_opcodes_h_l1255_c3_49d3_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1255_c3_49d3_uxn_opcodes_h_l1255_c3_49d3_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t8_MUX[uxn_opcodes_h_l1259_c7_9014] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1259_c7_9014_cond <= VAR_t8_MUX_uxn_opcodes_h_l1259_c7_9014_cond;
     t8_MUX_uxn_opcodes_h_l1259_c7_9014_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1259_c7_9014_iftrue;
     t8_MUX_uxn_opcodes_h_l1259_c7_9014_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1259_c7_9014_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1259_c7_9014_return_output := t8_MUX_uxn_opcodes_h_l1259_c7_9014_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1262_c7_2e55] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1262_c7_2e55] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_2e55_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_2e55_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_2e55_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_2e55_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_2e55_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_2e55_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1259_c7_9014] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9014_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9014_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9014_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9014_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9014_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9014_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9014_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9014_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1259_c7_9014] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9014_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9014_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9014_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9014_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9014_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9014_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9014_return_output := result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9014_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1262_c7_2e55] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_2e55_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_2e55_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_2e55_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_2e55_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_2e55_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_2e55_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9014_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_9014_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9014_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c7_2e55_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c2_6826_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1259_c7_9014_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c2_6826_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1259_c7_9014_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1254_c2_6826_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1259_c7_9014_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1254_c2_6826_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1259_c7_9014_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1259_c7_9014] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9014_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9014_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9014_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9014_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9014_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9014_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9014_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9014_return_output;

     -- t8_MUX[uxn_opcodes_h_l1254_c2_6826] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1254_c2_6826_cond <= VAR_t8_MUX_uxn_opcodes_h_l1254_c2_6826_cond;
     t8_MUX_uxn_opcodes_h_l1254_c2_6826_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1254_c2_6826_iftrue;
     t8_MUX_uxn_opcodes_h_l1254_c2_6826_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1254_c2_6826_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1254_c2_6826_return_output := t8_MUX_uxn_opcodes_h_l1254_c2_6826_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1259_c7_9014] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_9014_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_9014_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_9014_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_9014_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_9014_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_9014_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_9014_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_9014_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1254_c2_6826] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c2_6826_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c2_6826_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c2_6826_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c2_6826_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c2_6826_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c2_6826_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c2_6826_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c2_6826_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1254_c2_6826] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c2_6826_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c2_6826_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c2_6826_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c2_6826_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c2_6826_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c2_6826_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c2_6826_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c2_6826_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1254_c2_6826] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1254_c2_6826_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1254_c2_6826_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1254_c2_6826_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1254_c2_6826_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1254_c2_6826_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1254_c2_6826_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1254_c2_6826_return_output := result_u8_value_MUX_uxn_opcodes_h_l1254_c2_6826_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1259_c7_9014] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9014_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9014_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9014_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9014_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9014_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9014_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9014_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9014_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1254_c2_6826_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1259_c7_9014_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c2_6826_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1259_c7_9014_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1254_c2_6826_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1259_c7_9014_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1254_c2_6826_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1254_c2_6826] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c2_6826_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c2_6826_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c2_6826_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c2_6826_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c2_6826_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c2_6826_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c2_6826_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c2_6826_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1254_c2_6826] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1254_c2_6826_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1254_c2_6826_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1254_c2_6826_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1254_c2_6826_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1254_c2_6826_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1254_c2_6826_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1254_c2_6826_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1254_c2_6826_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1254_c2_6826] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1254_c2_6826_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1254_c2_6826_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1254_c2_6826_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1254_c2_6826_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1254_c2_6826_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1254_c2_6826_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1254_c2_6826_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1254_c2_6826_return_output;

     -- Submodule level 5
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l1276_l1250_DUPLICATE_5c28 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l1276_l1250_DUPLICATE_5c28_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c551(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1254_c2_6826_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1254_c2_6826_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1254_c2_6826_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1254_c2_6826_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1254_c2_6826_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1254_c2_6826_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l1276_l1250_DUPLICATE_5c28_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l1276_l1250_DUPLICATE_5c28_return_output;
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
