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
-- Submodules: 17
entity push2_stack_0CLK_415a9aa2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 value : in unsigned(15 downto 0);
 return_output : out unsigned(7 downto 0));
end push2_stack_0CLK_415a9aa2;
architecture arch of push2_stack_0CLK_415a9aa2 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : unsigned(7 downto 0) := to_unsigned(0, 8);
signal halt_return : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_tmp : unsigned(15 downto 0);
signal REG_COMB_result : unsigned(7 downto 0);
signal REG_COMB_halt_return : unsigned(0 downto 0);

-- Each function instance gets signals
-- stack_pointer_get[uxn_stack_h_l247_c6_d78e]
signal stack_pointer_get_uxn_stack_h_l247_c6_d78e_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l247_c6_d78e_stack_index : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l247_c6_d78e_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_stack_h_l247_c6_5293]
signal BIN_OP_GT_uxn_stack_h_l247_c6_5293_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l247_c6_5293_right : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l247_c6_5293_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l247_c1_a8ca]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_a8ca_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_a8ca_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_a8ca_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_a8ca_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_stack_h_l247_c2_fcc8]
signal result_MUX_uxn_stack_h_l247_c2_fcc8_cond : unsigned(0 downto 0);
signal result_MUX_uxn_stack_h_l247_c2_fcc8_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l247_c2_fcc8_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l247_c2_fcc8_return_output : unsigned(7 downto 0);

-- halt_return_MUX[uxn_stack_h_l247_c2_fcc8]
signal halt_return_MUX_uxn_stack_h_l247_c2_fcc8_cond : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l247_c2_fcc8_iftrue : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l247_c2_fcc8_iffalse : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l247_c2_fcc8_return_output : unsigned(0 downto 0);

-- halt[uxn_stack_h_l248_c12_7437]
signal halt_uxn_stack_h_l248_c12_7437_CLOCK_ENABLE : unsigned(0 downto 0);
signal halt_uxn_stack_h_l248_c12_7437_ins : unsigned(7 downto 0);
signal halt_uxn_stack_h_l248_c12_7437_err : unsigned(7 downto 0);
signal halt_uxn_stack_h_l248_c12_7437_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_stack_h_l255_c6_eb80]
signal BIN_OP_EQ_uxn_stack_h_l255_c6_eb80_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l255_c6_eb80_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l255_c6_eb80_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l255_c1_aa37]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_aa37_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_aa37_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_aa37_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_aa37_return_output : unsigned(0 downto 0);

-- tmp_MUX[uxn_stack_h_l255_c2_397b]
signal tmp_MUX_uxn_stack_h_l255_c2_397b_cond : unsigned(0 downto 0);
signal tmp_MUX_uxn_stack_h_l255_c2_397b_iftrue : unsigned(15 downto 0);
signal tmp_MUX_uxn_stack_h_l255_c2_397b_iffalse : unsigned(15 downto 0);
signal tmp_MUX_uxn_stack_h_l255_c2_397b_return_output : unsigned(15 downto 0);

-- CONST_SR_8[uxn_stack_h_l257_c73_0410]
signal CONST_SR_8_uxn_stack_h_l257_c73_0410_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_stack_h_l257_c73_0410_return_output : unsigned(15 downto 0);

-- stack_data_set[uxn_stack_h_l257_c3_18bd]
signal stack_data_set_uxn_stack_h_l257_c3_18bd_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l257_c3_18bd_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l257_c3_18bd_index : unsigned(7 downto 0);
signal stack_data_set_uxn_stack_h_l257_c3_18bd_value : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_stack_h_l258_c31_807d]
signal BIN_OP_PLUS_uxn_stack_h_l258_c31_807d_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l258_c31_807d_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l258_c31_807d_return_output : unsigned(8 downto 0);

-- stack_data_set[uxn_stack_h_l258_c3_6f14]
signal stack_data_set_uxn_stack_h_l258_c3_6f14_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l258_c3_6f14_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l258_c3_6f14_index : unsigned(7 downto 0);
signal stack_data_set_uxn_stack_h_l258_c3_6f14_value : unsigned(7 downto 0);

-- stack_pointer_move[uxn_stack_h_l259_c3_6698]
signal stack_pointer_move_uxn_stack_h_l259_c3_6698_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_move_uxn_stack_h_l259_c3_6698_stack_index : unsigned(0 downto 0);
signal stack_pointer_move_uxn_stack_h_l259_c3_6698_adjustment : unsigned(7 downto 0);
signal stack_pointer_move_uxn_stack_h_l259_c3_6698_is_negative : unsigned(0 downto 0);

-- stack_pointer_get_uxn_stack_h_l258_l257_DUPLICATE_0f8a
signal stack_pointer_get_uxn_stack_h_l258_l257_DUPLICATE_0f8a_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l258_l257_DUPLICATE_0f8a_stack_index : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l258_l257_DUPLICATE_0f8a_return_output : unsigned(7 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- stack_pointer_get_uxn_stack_h_l247_c6_d78e
stack_pointer_get_uxn_stack_h_l247_c6_d78e : entity work.stack_pointer_get_0CLK_c35c94f1 port map (
clk,
stack_pointer_get_uxn_stack_h_l247_c6_d78e_CLOCK_ENABLE,
stack_pointer_get_uxn_stack_h_l247_c6_d78e_stack_index,
stack_pointer_get_uxn_stack_h_l247_c6_d78e_return_output);

-- BIN_OP_GT_uxn_stack_h_l247_c6_5293
BIN_OP_GT_uxn_stack_h_l247_c6_5293 : entity work.BIN_OP_GT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_stack_h_l247_c6_5293_left,
BIN_OP_GT_uxn_stack_h_l247_c6_5293_right,
BIN_OP_GT_uxn_stack_h_l247_c6_5293_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_a8ca
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_a8ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_a8ca_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_a8ca_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_a8ca_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_a8ca_return_output);

-- result_MUX_uxn_stack_h_l247_c2_fcc8
result_MUX_uxn_stack_h_l247_c2_fcc8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_stack_h_l247_c2_fcc8_cond,
result_MUX_uxn_stack_h_l247_c2_fcc8_iftrue,
result_MUX_uxn_stack_h_l247_c2_fcc8_iffalse,
result_MUX_uxn_stack_h_l247_c2_fcc8_return_output);

-- halt_return_MUX_uxn_stack_h_l247_c2_fcc8
halt_return_MUX_uxn_stack_h_l247_c2_fcc8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
halt_return_MUX_uxn_stack_h_l247_c2_fcc8_cond,
halt_return_MUX_uxn_stack_h_l247_c2_fcc8_iftrue,
halt_return_MUX_uxn_stack_h_l247_c2_fcc8_iffalse,
halt_return_MUX_uxn_stack_h_l247_c2_fcc8_return_output);

-- halt_uxn_stack_h_l248_c12_7437
halt_uxn_stack_h_l248_c12_7437 : entity work.halt_0CLK_1d3235af port map (
clk,
halt_uxn_stack_h_l248_c12_7437_CLOCK_ENABLE,
halt_uxn_stack_h_l248_c12_7437_ins,
halt_uxn_stack_h_l248_c12_7437_err,
halt_uxn_stack_h_l248_c12_7437_return_output);

-- BIN_OP_EQ_uxn_stack_h_l255_c6_eb80
BIN_OP_EQ_uxn_stack_h_l255_c6_eb80 : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_stack_h_l255_c6_eb80_left,
BIN_OP_EQ_uxn_stack_h_l255_c6_eb80_right,
BIN_OP_EQ_uxn_stack_h_l255_c6_eb80_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_aa37
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_aa37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_aa37_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_aa37_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_aa37_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_aa37_return_output);

-- tmp_MUX_uxn_stack_h_l255_c2_397b
tmp_MUX_uxn_stack_h_l255_c2_397b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp_MUX_uxn_stack_h_l255_c2_397b_cond,
tmp_MUX_uxn_stack_h_l255_c2_397b_iftrue,
tmp_MUX_uxn_stack_h_l255_c2_397b_iffalse,
tmp_MUX_uxn_stack_h_l255_c2_397b_return_output);

-- CONST_SR_8_uxn_stack_h_l257_c73_0410
CONST_SR_8_uxn_stack_h_l257_c73_0410 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_stack_h_l257_c73_0410_x,
CONST_SR_8_uxn_stack_h_l257_c73_0410_return_output);

-- stack_data_set_uxn_stack_h_l257_c3_18bd
stack_data_set_uxn_stack_h_l257_c3_18bd : entity work.stack_data_set_0CLK_fa018dfc port map (
clk,
stack_data_set_uxn_stack_h_l257_c3_18bd_CLOCK_ENABLE,
stack_data_set_uxn_stack_h_l257_c3_18bd_stack_index,
stack_data_set_uxn_stack_h_l257_c3_18bd_index,
stack_data_set_uxn_stack_h_l257_c3_18bd_value);

-- BIN_OP_PLUS_uxn_stack_h_l258_c31_807d
BIN_OP_PLUS_uxn_stack_h_l258_c31_807d : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_stack_h_l258_c31_807d_left,
BIN_OP_PLUS_uxn_stack_h_l258_c31_807d_right,
BIN_OP_PLUS_uxn_stack_h_l258_c31_807d_return_output);

-- stack_data_set_uxn_stack_h_l258_c3_6f14
stack_data_set_uxn_stack_h_l258_c3_6f14 : entity work.stack_data_set_0CLK_fa018dfc port map (
clk,
stack_data_set_uxn_stack_h_l258_c3_6f14_CLOCK_ENABLE,
stack_data_set_uxn_stack_h_l258_c3_6f14_stack_index,
stack_data_set_uxn_stack_h_l258_c3_6f14_index,
stack_data_set_uxn_stack_h_l258_c3_6f14_value);

-- stack_pointer_move_uxn_stack_h_l259_c3_6698
stack_pointer_move_uxn_stack_h_l259_c3_6698 : entity work.stack_pointer_move_0CLK_5da82025 port map (
clk,
stack_pointer_move_uxn_stack_h_l259_c3_6698_CLOCK_ENABLE,
stack_pointer_move_uxn_stack_h_l259_c3_6698_stack_index,
stack_pointer_move_uxn_stack_h_l259_c3_6698_adjustment,
stack_pointer_move_uxn_stack_h_l259_c3_6698_is_negative);

-- stack_pointer_get_uxn_stack_h_l258_l257_DUPLICATE_0f8a
stack_pointer_get_uxn_stack_h_l258_l257_DUPLICATE_0f8a : entity work.stack_pointer_get_0CLK_c35c94f1 port map (
clk,
stack_pointer_get_uxn_stack_h_l258_l257_DUPLICATE_0f8a_CLOCK_ENABLE,
stack_pointer_get_uxn_stack_h_l258_l257_DUPLICATE_0f8a_stack_index,
stack_pointer_get_uxn_stack_h_l258_l257_DUPLICATE_0f8a_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 ins,
 value,
 -- Registers
 tmp,
 result,
 halt_return,
 -- All submodule outputs
 stack_pointer_get_uxn_stack_h_l247_c6_d78e_return_output,
 BIN_OP_GT_uxn_stack_h_l247_c6_5293_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_a8ca_return_output,
 result_MUX_uxn_stack_h_l247_c2_fcc8_return_output,
 halt_return_MUX_uxn_stack_h_l247_c2_fcc8_return_output,
 halt_uxn_stack_h_l248_c12_7437_return_output,
 BIN_OP_EQ_uxn_stack_h_l255_c6_eb80_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_aa37_return_output,
 tmp_MUX_uxn_stack_h_l255_c2_397b_return_output,
 CONST_SR_8_uxn_stack_h_l257_c73_0410_return_output,
 BIN_OP_PLUS_uxn_stack_h_l258_c31_807d_return_output,
 stack_pointer_get_uxn_stack_h_l258_l257_DUPLICATE_0f8a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_value : unsigned(15 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l247_c6_d78e_stack_index : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l247_c6_5293_left : unsigned(7 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l247_c6_d78e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l247_c6_d78e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l247_c6_5293_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l247_c6_5293_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_a8ca_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_a8ca_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_a8ca_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_a8ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l247_c2_fcc8_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l247_c2_fcc8_iffalse : unsigned(7 downto 0);
 variable VAR_result_uxn_stack_h_l251_c3_c5b7 : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l247_c2_fcc8_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l247_c2_fcc8_cond : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l247_c2_fcc8_iftrue : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l247_c2_fcc8_iffalse : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l247_c2_fcc8_return_output : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l247_c2_fcc8_cond : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l248_c12_7437_ins : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l248_c12_7437_err : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l248_c12_7437_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l248_c12_7437_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l255_c6_eb80_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l255_c6_eb80_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l255_c6_eb80_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_aa37_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_aa37_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_aa37_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_aa37_iffalse : unsigned(0 downto 0);
 variable VAR_tmp_MUX_uxn_stack_h_l255_c2_397b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp_MUX_uxn_stack_h_l255_c2_397b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp_MUX_uxn_stack_h_l255_c2_397b_return_output : unsigned(15 downto 0);
 variable VAR_tmp_MUX_uxn_stack_h_l255_c2_397b_cond : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l257_c3_18bd_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l257_c3_18bd_index : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l257_c3_18bd_value : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uxn_stack_h_l257_c73_0410_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_stack_h_l257_c73_0410_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_stack_h_l257_c63_291a_return_output : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l257_c3_18bd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l258_c3_6f14_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l258_c3_6f14_index : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l258_c3_6f14_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l258_c31_807d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l258_c31_807d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l258_c31_807d_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_stack_h_l258_c67_7cf7_return_output : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l258_c3_6f14_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_move_uxn_stack_h_l259_c3_6698_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_move_uxn_stack_h_l259_c3_6698_adjustment : unsigned(7 downto 0);
 variable VAR_stack_pointer_move_uxn_stack_h_l259_c3_6698_is_negative : unsigned(0 downto 0);
 variable VAR_stack_pointer_move_uxn_stack_h_l259_c3_6698_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l258_l257_DUPLICATE_0f8a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l258_l257_DUPLICATE_0f8a_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l258_l257_DUPLICATE_0f8a_return_output : unsigned(7 downto 0);
 -- State registers comb logic variables
variable REG_VAR_tmp : unsigned(15 downto 0);
variable REG_VAR_result : unsigned(7 downto 0);
variable REG_VAR_halt_return : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp := tmp;
  REG_VAR_result := result;
  REG_VAR_halt_return := halt_return;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_stack_pointer_move_uxn_stack_h_l259_c3_6698_adjustment := resize(to_unsigned(2, 2), 8);
     VAR_BIN_OP_PLUS_uxn_stack_h_l258_c31_807d_right := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_stack_h_l247_c6_5293_right := to_unsigned(253, 8);
     VAR_BIN_OP_EQ_uxn_stack_h_l255_c6_eb80_right := to_unsigned(0, 1);
     VAR_result_uxn_stack_h_l251_c3_c5b7 := resize(to_unsigned(0, 1), 8);
     VAR_result_MUX_uxn_stack_h_l247_c2_fcc8_iffalse := VAR_result_uxn_stack_h_l251_c3_c5b7;
     VAR_stack_pointer_move_uxn_stack_h_l259_c3_6698_is_negative := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_a8ca_iffalse := to_unsigned(0, 1);
     VAR_halt_return_MUX_uxn_stack_h_l247_c2_fcc8_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_aa37_iffalse := to_unsigned(0, 1);
     VAR_halt_return_MUX_uxn_stack_h_l247_c2_fcc8_iffalse := to_unsigned(0, 1);
     VAR_halt_uxn_stack_h_l248_c12_7437_err := resize(to_unsigned(2, 2), 8);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_stack_index := stack_index;
     VAR_ins := ins;
     VAR_value := value;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_a8ca_iftrue := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_aa37_iftrue := VAR_CLOCK_ENABLE;
     VAR_stack_pointer_get_uxn_stack_h_l247_c6_d78e_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_halt_uxn_stack_h_l248_c12_7437_ins := VAR_ins;
     VAR_stack_data_set_uxn_stack_h_l257_c3_18bd_stack_index := VAR_stack_index;
     VAR_stack_data_set_uxn_stack_h_l258_c3_6f14_stack_index := VAR_stack_index;
     VAR_stack_pointer_get_uxn_stack_h_l247_c6_d78e_stack_index := VAR_stack_index;
     VAR_stack_pointer_get_uxn_stack_h_l258_l257_DUPLICATE_0f8a_stack_index := VAR_stack_index;
     VAR_stack_pointer_move_uxn_stack_h_l259_c3_6698_stack_index := VAR_stack_index;
     VAR_tmp_MUX_uxn_stack_h_l255_c2_397b_iffalse := tmp;
     VAR_CONST_SR_8_uxn_stack_h_l257_c73_0410_x := VAR_value;
     VAR_tmp_MUX_uxn_stack_h_l255_c2_397b_iftrue := VAR_value;
     -- CONST_SR_8[uxn_stack_h_l257_c73_0410] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_stack_h_l257_c73_0410_x <= VAR_CONST_SR_8_uxn_stack_h_l257_c73_0410_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_stack_h_l257_c73_0410_return_output := CONST_SR_8_uxn_stack_h_l257_c73_0410_return_output;

     -- CAST_TO_uint8_t[uxn_stack_h_l258_c67_7cf7] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_stack_h_l258_c67_7cf7_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_value);

     -- stack_pointer_get[uxn_stack_h_l247_c6_d78e] LATENCY=0
     -- Clock enable
     stack_pointer_get_uxn_stack_h_l247_c6_d78e_CLOCK_ENABLE <= VAR_stack_pointer_get_uxn_stack_h_l247_c6_d78e_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_get_uxn_stack_h_l247_c6_d78e_stack_index <= VAR_stack_pointer_get_uxn_stack_h_l247_c6_d78e_stack_index;
     -- Outputs
     VAR_stack_pointer_get_uxn_stack_h_l247_c6_d78e_return_output := stack_pointer_get_uxn_stack_h_l247_c6_d78e_return_output;

     -- Submodule level 1
     VAR_stack_data_set_uxn_stack_h_l258_c3_6f14_value := VAR_CAST_TO_uint8_t_uxn_stack_h_l258_c67_7cf7_return_output;
     VAR_BIN_OP_GT_uxn_stack_h_l247_c6_5293_left := VAR_stack_pointer_get_uxn_stack_h_l247_c6_d78e_return_output;
     -- CAST_TO_uint8_t[uxn_stack_h_l257_c63_291a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_stack_h_l257_c63_291a_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_stack_h_l257_c73_0410_return_output);

     -- BIN_OP_GT[uxn_stack_h_l247_c6_5293] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_stack_h_l247_c6_5293_left <= VAR_BIN_OP_GT_uxn_stack_h_l247_c6_5293_left;
     BIN_OP_GT_uxn_stack_h_l247_c6_5293_right <= VAR_BIN_OP_GT_uxn_stack_h_l247_c6_5293_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_stack_h_l247_c6_5293_return_output := BIN_OP_GT_uxn_stack_h_l247_c6_5293_return_output;

     -- Submodule level 2
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_a8ca_cond := VAR_BIN_OP_GT_uxn_stack_h_l247_c6_5293_return_output;
     VAR_halt_return_MUX_uxn_stack_h_l247_c2_fcc8_cond := VAR_BIN_OP_GT_uxn_stack_h_l247_c6_5293_return_output;
     VAR_result_MUX_uxn_stack_h_l247_c2_fcc8_cond := VAR_BIN_OP_GT_uxn_stack_h_l247_c6_5293_return_output;
     VAR_stack_data_set_uxn_stack_h_l257_c3_18bd_value := VAR_CAST_TO_uint8_t_uxn_stack_h_l257_c63_291a_return_output;
     -- halt_return_MUX[uxn_stack_h_l247_c2_fcc8] LATENCY=0
     -- Inputs
     halt_return_MUX_uxn_stack_h_l247_c2_fcc8_cond <= VAR_halt_return_MUX_uxn_stack_h_l247_c2_fcc8_cond;
     halt_return_MUX_uxn_stack_h_l247_c2_fcc8_iftrue <= VAR_halt_return_MUX_uxn_stack_h_l247_c2_fcc8_iftrue;
     halt_return_MUX_uxn_stack_h_l247_c2_fcc8_iffalse <= VAR_halt_return_MUX_uxn_stack_h_l247_c2_fcc8_iffalse;
     -- Outputs
     VAR_halt_return_MUX_uxn_stack_h_l247_c2_fcc8_return_output := halt_return_MUX_uxn_stack_h_l247_c2_fcc8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l247_c1_a8ca] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_a8ca_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_a8ca_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_a8ca_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_a8ca_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_a8ca_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_a8ca_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_a8ca_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_a8ca_return_output;

     -- Submodule level 3
     VAR_halt_uxn_stack_h_l248_c12_7437_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_a8ca_return_output;
     VAR_BIN_OP_EQ_uxn_stack_h_l255_c6_eb80_left := VAR_halt_return_MUX_uxn_stack_h_l247_c2_fcc8_return_output;
     REG_VAR_halt_return := VAR_halt_return_MUX_uxn_stack_h_l247_c2_fcc8_return_output;
     -- halt[uxn_stack_h_l248_c12_7437] LATENCY=0
     -- Clock enable
     halt_uxn_stack_h_l248_c12_7437_CLOCK_ENABLE <= VAR_halt_uxn_stack_h_l248_c12_7437_CLOCK_ENABLE;
     -- Inputs
     halt_uxn_stack_h_l248_c12_7437_ins <= VAR_halt_uxn_stack_h_l248_c12_7437_ins;
     halt_uxn_stack_h_l248_c12_7437_err <= VAR_halt_uxn_stack_h_l248_c12_7437_err;
     -- Outputs
     VAR_halt_uxn_stack_h_l248_c12_7437_return_output := halt_uxn_stack_h_l248_c12_7437_return_output;

     -- BIN_OP_EQ[uxn_stack_h_l255_c6_eb80] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_stack_h_l255_c6_eb80_left <= VAR_BIN_OP_EQ_uxn_stack_h_l255_c6_eb80_left;
     BIN_OP_EQ_uxn_stack_h_l255_c6_eb80_right <= VAR_BIN_OP_EQ_uxn_stack_h_l255_c6_eb80_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_stack_h_l255_c6_eb80_return_output := BIN_OP_EQ_uxn_stack_h_l255_c6_eb80_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_aa37_cond := VAR_BIN_OP_EQ_uxn_stack_h_l255_c6_eb80_return_output;
     VAR_tmp_MUX_uxn_stack_h_l255_c2_397b_cond := VAR_BIN_OP_EQ_uxn_stack_h_l255_c6_eb80_return_output;
     VAR_result_MUX_uxn_stack_h_l247_c2_fcc8_iftrue := VAR_halt_uxn_stack_h_l248_c12_7437_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l255_c1_aa37] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_aa37_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_aa37_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_aa37_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_aa37_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_aa37_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_aa37_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_aa37_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_aa37_return_output;

     -- tmp_MUX[uxn_stack_h_l255_c2_397b] LATENCY=0
     -- Inputs
     tmp_MUX_uxn_stack_h_l255_c2_397b_cond <= VAR_tmp_MUX_uxn_stack_h_l255_c2_397b_cond;
     tmp_MUX_uxn_stack_h_l255_c2_397b_iftrue <= VAR_tmp_MUX_uxn_stack_h_l255_c2_397b_iftrue;
     tmp_MUX_uxn_stack_h_l255_c2_397b_iffalse <= VAR_tmp_MUX_uxn_stack_h_l255_c2_397b_iffalse;
     -- Outputs
     VAR_tmp_MUX_uxn_stack_h_l255_c2_397b_return_output := tmp_MUX_uxn_stack_h_l255_c2_397b_return_output;

     -- result_MUX[uxn_stack_h_l247_c2_fcc8] LATENCY=0
     -- Inputs
     result_MUX_uxn_stack_h_l247_c2_fcc8_cond <= VAR_result_MUX_uxn_stack_h_l247_c2_fcc8_cond;
     result_MUX_uxn_stack_h_l247_c2_fcc8_iftrue <= VAR_result_MUX_uxn_stack_h_l247_c2_fcc8_iftrue;
     result_MUX_uxn_stack_h_l247_c2_fcc8_iffalse <= VAR_result_MUX_uxn_stack_h_l247_c2_fcc8_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_stack_h_l247_c2_fcc8_return_output := result_MUX_uxn_stack_h_l247_c2_fcc8_return_output;

     -- Submodule level 5
     VAR_stack_data_set_uxn_stack_h_l257_c3_18bd_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_aa37_return_output;
     VAR_stack_data_set_uxn_stack_h_l258_c3_6f14_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_aa37_return_output;
     VAR_stack_pointer_get_uxn_stack_h_l258_l257_DUPLICATE_0f8a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_aa37_return_output;
     VAR_stack_pointer_move_uxn_stack_h_l259_c3_6698_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_aa37_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_stack_h_l247_c2_fcc8_return_output;
     VAR_return_output := VAR_result_MUX_uxn_stack_h_l247_c2_fcc8_return_output;
     REG_VAR_tmp := VAR_tmp_MUX_uxn_stack_h_l255_c2_397b_return_output;
     -- stack_pointer_get_uxn_stack_h_l258_l257_DUPLICATE_0f8a LATENCY=0
     -- Clock enable
     stack_pointer_get_uxn_stack_h_l258_l257_DUPLICATE_0f8a_CLOCK_ENABLE <= VAR_stack_pointer_get_uxn_stack_h_l258_l257_DUPLICATE_0f8a_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_get_uxn_stack_h_l258_l257_DUPLICATE_0f8a_stack_index <= VAR_stack_pointer_get_uxn_stack_h_l258_l257_DUPLICATE_0f8a_stack_index;
     -- Outputs
     VAR_stack_pointer_get_uxn_stack_h_l258_l257_DUPLICATE_0f8a_return_output := stack_pointer_get_uxn_stack_h_l258_l257_DUPLICATE_0f8a_return_output;

     -- stack_pointer_move[uxn_stack_h_l259_c3_6698] LATENCY=0
     -- Clock enable
     stack_pointer_move_uxn_stack_h_l259_c3_6698_CLOCK_ENABLE <= VAR_stack_pointer_move_uxn_stack_h_l259_c3_6698_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_move_uxn_stack_h_l259_c3_6698_stack_index <= VAR_stack_pointer_move_uxn_stack_h_l259_c3_6698_stack_index;
     stack_pointer_move_uxn_stack_h_l259_c3_6698_adjustment <= VAR_stack_pointer_move_uxn_stack_h_l259_c3_6698_adjustment;
     stack_pointer_move_uxn_stack_h_l259_c3_6698_is_negative <= VAR_stack_pointer_move_uxn_stack_h_l259_c3_6698_is_negative;
     -- Outputs

     -- Submodule level 6
     VAR_BIN_OP_PLUS_uxn_stack_h_l258_c31_807d_left := VAR_stack_pointer_get_uxn_stack_h_l258_l257_DUPLICATE_0f8a_return_output;
     VAR_stack_data_set_uxn_stack_h_l257_c3_18bd_index := VAR_stack_pointer_get_uxn_stack_h_l258_l257_DUPLICATE_0f8a_return_output;
     -- stack_data_set[uxn_stack_h_l257_c3_18bd] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_stack_h_l257_c3_18bd_CLOCK_ENABLE <= VAR_stack_data_set_uxn_stack_h_l257_c3_18bd_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_stack_h_l257_c3_18bd_stack_index <= VAR_stack_data_set_uxn_stack_h_l257_c3_18bd_stack_index;
     stack_data_set_uxn_stack_h_l257_c3_18bd_index <= VAR_stack_data_set_uxn_stack_h_l257_c3_18bd_index;
     stack_data_set_uxn_stack_h_l257_c3_18bd_value <= VAR_stack_data_set_uxn_stack_h_l257_c3_18bd_value;
     -- Outputs

     -- BIN_OP_PLUS[uxn_stack_h_l258_c31_807d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_stack_h_l258_c31_807d_left <= VAR_BIN_OP_PLUS_uxn_stack_h_l258_c31_807d_left;
     BIN_OP_PLUS_uxn_stack_h_l258_c31_807d_right <= VAR_BIN_OP_PLUS_uxn_stack_h_l258_c31_807d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_stack_h_l258_c31_807d_return_output := BIN_OP_PLUS_uxn_stack_h_l258_c31_807d_return_output;

     -- Submodule level 7
     VAR_stack_data_set_uxn_stack_h_l258_c3_6f14_index := resize(VAR_BIN_OP_PLUS_uxn_stack_h_l258_c31_807d_return_output, 8);
     -- stack_data_set[uxn_stack_h_l258_c3_6f14] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_stack_h_l258_c3_6f14_CLOCK_ENABLE <= VAR_stack_data_set_uxn_stack_h_l258_c3_6f14_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_stack_h_l258_c3_6f14_stack_index <= VAR_stack_data_set_uxn_stack_h_l258_c3_6f14_stack_index;
     stack_data_set_uxn_stack_h_l258_c3_6f14_index <= VAR_stack_data_set_uxn_stack_h_l258_c3_6f14_index;
     stack_data_set_uxn_stack_h_l258_c3_6f14_value <= VAR_stack_data_set_uxn_stack_h_l258_c3_6f14_value;
     -- Outputs

     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp <= REG_VAR_tmp;
REG_COMB_result <= REG_VAR_result;
REG_COMB_halt_return <= REG_VAR_halt_return;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp <= REG_COMB_tmp;
     result <= REG_COMB_result;
     halt_return <= REG_COMB_halt_return;
 end if;
 end if;
end process;

end arch;
