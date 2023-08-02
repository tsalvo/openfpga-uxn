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
entity set_0CLK_28f5e9bb is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 mul : in unsigned(7 downto 0);
 add : in signed(7 downto 0);
 return_output : out unsigned(7 downto 0));
end set_0CLK_28f5e9bb;
architecture arch of set_0CLK_28f5e9bb is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal result : unsigned(7 downto 0) := to_unsigned(0, 8);
signal set_tmp : unsigned(7 downto 0) := to_unsigned(0, 8);
signal halt_return : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_result : unsigned(7 downto 0);
signal REG_COMB_set_tmp : unsigned(7 downto 0);
signal REG_COMB_halt_return : unsigned(0 downto 0);

-- Each function instance gets signals
-- BIN_OP_GT[uxn_stack_h_l289_c6_a2d7]
signal BIN_OP_GT_uxn_stack_h_l289_c6_a2d7_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l289_c6_a2d7_right : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l289_c6_a2d7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l289_c1_499b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_499b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_499b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_499b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_499b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_stack_h_l289_c2_0c81]
signal result_MUX_uxn_stack_h_l289_c2_0c81_cond : unsigned(0 downto 0);
signal result_MUX_uxn_stack_h_l289_c2_0c81_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l289_c2_0c81_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l289_c2_0c81_return_output : unsigned(7 downto 0);

-- halt_return_MUX[uxn_stack_h_l289_c2_0c81]
signal halt_return_MUX_uxn_stack_h_l289_c2_0c81_cond : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l289_c2_0c81_iftrue : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l289_c2_0c81_iffalse : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l289_c2_0c81_return_output : unsigned(0 downto 0);

-- halt[uxn_stack_h_l290_c12_319f]
signal halt_uxn_stack_h_l290_c12_319f_CLOCK_ENABLE : unsigned(0 downto 0);
signal halt_uxn_stack_h_l290_c12_319f_ins : unsigned(7 downto 0);
signal halt_uxn_stack_h_l290_c12_319f_err : unsigned(7 downto 0);
signal halt_uxn_stack_h_l290_c12_319f_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_stack_h_l297_c13_e020]
signal BIN_OP_AND_uxn_stack_h_l297_c13_e020_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_stack_h_l297_c13_e020_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_stack_h_l297_c13_e020_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_stack_h_l297_c13_5ad4]
signal BIN_OP_PLUS_uxn_stack_h_l297_c13_5ad4_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l297_c13_5ad4_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l297_c13_5ad4_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_stack_h_l297_c13_e0d4]
signal BIN_OP_PLUS_uxn_stack_h_l297_c13_e0d4_left : signed(9 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l297_c13_e0d4_right : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l297_c13_e0d4_return_output : signed(10 downto 0);

-- BIN_OP_GT[uxn_stack_h_l298_c6_60c8]
signal BIN_OP_GT_uxn_stack_h_l298_c6_60c8_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l298_c6_60c8_right : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l298_c6_60c8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l298_c1_0424]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_0424_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_0424_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_0424_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_0424_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_stack_h_l298_c2_4693]
signal result_MUX_uxn_stack_h_l298_c2_4693_cond : unsigned(0 downto 0);
signal result_MUX_uxn_stack_h_l298_c2_4693_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l298_c2_4693_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l298_c2_4693_return_output : unsigned(7 downto 0);

-- halt_return_MUX[uxn_stack_h_l298_c2_4693]
signal halt_return_MUX_uxn_stack_h_l298_c2_4693_cond : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l298_c2_4693_iftrue : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l298_c2_4693_iffalse : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l298_c2_4693_return_output : unsigned(0 downto 0);

-- halt[uxn_stack_h_l299_c12_5338]
signal halt_uxn_stack_h_l299_c12_5338_CLOCK_ENABLE : unsigned(0 downto 0);
signal halt_uxn_stack_h_l299_c12_5338_ins : unsigned(7 downto 0);
signal halt_uxn_stack_h_l299_c12_5338_err : unsigned(7 downto 0);
signal halt_uxn_stack_h_l299_c12_5338_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_stack_h_l303_c6_398b]
signal BIN_OP_EQ_uxn_stack_h_l303_c6_398b_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l303_c6_398b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l303_c6_398b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l303_c1_44f1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_44f1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_44f1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_44f1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_44f1_return_output : unsigned(0 downto 0);

-- stack_pointer_set[uxn_stack_h_l304_c3_3f7f]
signal stack_pointer_set_uxn_stack_h_l304_c3_3f7f_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_set_uxn_stack_h_l304_c3_3f7f_stack_index : unsigned(0 downto 0);
signal stack_pointer_set_uxn_stack_h_l304_c3_3f7f_value : unsigned(7 downto 0);

-- stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_b45f
signal stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_b45f_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_b45f_stack_index : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_b45f_return_output : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_GT_uxn_stack_h_l289_c6_a2d7
BIN_OP_GT_uxn_stack_h_l289_c6_a2d7 : entity work.BIN_OP_GT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_stack_h_l289_c6_a2d7_left,
BIN_OP_GT_uxn_stack_h_l289_c6_a2d7_right,
BIN_OP_GT_uxn_stack_h_l289_c6_a2d7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_499b
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_499b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_499b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_499b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_499b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_499b_return_output);

-- result_MUX_uxn_stack_h_l289_c2_0c81
result_MUX_uxn_stack_h_l289_c2_0c81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_stack_h_l289_c2_0c81_cond,
result_MUX_uxn_stack_h_l289_c2_0c81_iftrue,
result_MUX_uxn_stack_h_l289_c2_0c81_iffalse,
result_MUX_uxn_stack_h_l289_c2_0c81_return_output);

-- halt_return_MUX_uxn_stack_h_l289_c2_0c81
halt_return_MUX_uxn_stack_h_l289_c2_0c81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
halt_return_MUX_uxn_stack_h_l289_c2_0c81_cond,
halt_return_MUX_uxn_stack_h_l289_c2_0c81_iftrue,
halt_return_MUX_uxn_stack_h_l289_c2_0c81_iffalse,
halt_return_MUX_uxn_stack_h_l289_c2_0c81_return_output);

-- halt_uxn_stack_h_l290_c12_319f
halt_uxn_stack_h_l290_c12_319f : entity work.halt_0CLK_1d3235af port map (
clk,
halt_uxn_stack_h_l290_c12_319f_CLOCK_ENABLE,
halt_uxn_stack_h_l290_c12_319f_ins,
halt_uxn_stack_h_l290_c12_319f_err,
halt_uxn_stack_h_l290_c12_319f_return_output);

-- BIN_OP_AND_uxn_stack_h_l297_c13_e020
BIN_OP_AND_uxn_stack_h_l297_c13_e020 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_stack_h_l297_c13_e020_left,
BIN_OP_AND_uxn_stack_h_l297_c13_e020_right,
BIN_OP_AND_uxn_stack_h_l297_c13_e020_return_output);

-- BIN_OP_PLUS_uxn_stack_h_l297_c13_5ad4
BIN_OP_PLUS_uxn_stack_h_l297_c13_5ad4 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_stack_h_l297_c13_5ad4_left,
BIN_OP_PLUS_uxn_stack_h_l297_c13_5ad4_right,
BIN_OP_PLUS_uxn_stack_h_l297_c13_5ad4_return_output);

-- BIN_OP_PLUS_uxn_stack_h_l297_c13_e0d4
BIN_OP_PLUS_uxn_stack_h_l297_c13_e0d4 : entity work.BIN_OP_PLUS_int10_t_int9_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_stack_h_l297_c13_e0d4_left,
BIN_OP_PLUS_uxn_stack_h_l297_c13_e0d4_right,
BIN_OP_PLUS_uxn_stack_h_l297_c13_e0d4_return_output);

-- BIN_OP_GT_uxn_stack_h_l298_c6_60c8
BIN_OP_GT_uxn_stack_h_l298_c6_60c8 : entity work.BIN_OP_GT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_stack_h_l298_c6_60c8_left,
BIN_OP_GT_uxn_stack_h_l298_c6_60c8_right,
BIN_OP_GT_uxn_stack_h_l298_c6_60c8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_0424
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_0424 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_0424_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_0424_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_0424_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_0424_return_output);

-- result_MUX_uxn_stack_h_l298_c2_4693
result_MUX_uxn_stack_h_l298_c2_4693 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_stack_h_l298_c2_4693_cond,
result_MUX_uxn_stack_h_l298_c2_4693_iftrue,
result_MUX_uxn_stack_h_l298_c2_4693_iffalse,
result_MUX_uxn_stack_h_l298_c2_4693_return_output);

-- halt_return_MUX_uxn_stack_h_l298_c2_4693
halt_return_MUX_uxn_stack_h_l298_c2_4693 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
halt_return_MUX_uxn_stack_h_l298_c2_4693_cond,
halt_return_MUX_uxn_stack_h_l298_c2_4693_iftrue,
halt_return_MUX_uxn_stack_h_l298_c2_4693_iffalse,
halt_return_MUX_uxn_stack_h_l298_c2_4693_return_output);

-- halt_uxn_stack_h_l299_c12_5338
halt_uxn_stack_h_l299_c12_5338 : entity work.halt_0CLK_1d3235af port map (
clk,
halt_uxn_stack_h_l299_c12_5338_CLOCK_ENABLE,
halt_uxn_stack_h_l299_c12_5338_ins,
halt_uxn_stack_h_l299_c12_5338_err,
halt_uxn_stack_h_l299_c12_5338_return_output);

-- BIN_OP_EQ_uxn_stack_h_l303_c6_398b
BIN_OP_EQ_uxn_stack_h_l303_c6_398b : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_stack_h_l303_c6_398b_left,
BIN_OP_EQ_uxn_stack_h_l303_c6_398b_right,
BIN_OP_EQ_uxn_stack_h_l303_c6_398b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_44f1
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_44f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_44f1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_44f1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_44f1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_44f1_return_output);

-- stack_pointer_set_uxn_stack_h_l304_c3_3f7f
stack_pointer_set_uxn_stack_h_l304_c3_3f7f : entity work.stack_pointer_set_0CLK_88c0218f port map (
clk,
stack_pointer_set_uxn_stack_h_l304_c3_3f7f_CLOCK_ENABLE,
stack_pointer_set_uxn_stack_h_l304_c3_3f7f_stack_index,
stack_pointer_set_uxn_stack_h_l304_c3_3f7f_value);

-- stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_b45f
stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_b45f : entity work.stack_pointer_get_0CLK_c35c94f1 port map (
clk,
stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_b45f_CLOCK_ENABLE,
stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_b45f_stack_index,
stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_b45f_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 stack_index,
 ins,
 k,
 mul,
 add,
 -- Registers
 result,
 set_tmp,
 halt_return,
 -- All submodule outputs
 BIN_OP_GT_uxn_stack_h_l289_c6_a2d7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_499b_return_output,
 result_MUX_uxn_stack_h_l289_c2_0c81_return_output,
 halt_return_MUX_uxn_stack_h_l289_c2_0c81_return_output,
 halt_uxn_stack_h_l290_c12_319f_return_output,
 BIN_OP_AND_uxn_stack_h_l297_c13_e020_return_output,
 BIN_OP_PLUS_uxn_stack_h_l297_c13_5ad4_return_output,
 BIN_OP_PLUS_uxn_stack_h_l297_c13_e0d4_return_output,
 BIN_OP_GT_uxn_stack_h_l298_c6_60c8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_0424_return_output,
 result_MUX_uxn_stack_h_l298_c2_4693_return_output,
 halt_return_MUX_uxn_stack_h_l298_c2_4693_return_output,
 halt_uxn_stack_h_l299_c12_5338_return_output,
 BIN_OP_EQ_uxn_stack_h_l303_c6_398b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_44f1_return_output,
 stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_b45f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_mul : unsigned(7 downto 0);
 variable VAR_add : signed(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l289_c6_a2d7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l289_c6_a2d7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l289_c6_a2d7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_499b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_499b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_499b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_499b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l289_c2_0c81_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l289_c2_0c81_iffalse : unsigned(7 downto 0);
 variable VAR_result_uxn_stack_h_l293_c3_4bc1 : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l289_c2_0c81_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l289_c2_0c81_cond : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l289_c2_0c81_iftrue : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l289_c2_0c81_iffalse : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l289_c2_0c81_return_output : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l289_c2_0c81_cond : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l290_c12_319f_ins : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l290_c12_319f_err : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l290_c12_319f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l290_c12_319f_return_output : unsigned(7 downto 0);
 variable VAR_set_tmp_uxn_stack_h_l297_c2_9446 : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l297_c13_e020_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l297_c13_e020_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l297_c13_e020_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_5ad4_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_5ad4_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_5ad4_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_e0d4_left : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_e0d4_right : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_e0d4_return_output : signed(10 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l298_c6_60c8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l298_c6_60c8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l298_c6_60c8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_0424_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_0424_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_0424_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_0424_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l298_c2_4693_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l298_c2_4693_iffalse : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l298_c2_4693_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l298_c2_4693_cond : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l298_c2_4693_iftrue : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l298_c2_4693_iffalse : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l298_c2_4693_return_output : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l298_c2_4693_cond : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l299_c12_5338_ins : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l299_c12_5338_err : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l299_c12_5338_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l299_c12_5338_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l303_c6_398b_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l303_c6_398b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l303_c6_398b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_44f1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_44f1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_44f1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_44f1_iffalse : unsigned(0 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l304_c3_3f7f_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l304_c3_3f7f_value : unsigned(7 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l304_c3_3f7f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_b45f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_b45f_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_b45f_return_output : unsigned(7 downto 0);
 -- State registers comb logic variables
variable REG_VAR_result : unsigned(7 downto 0);
variable REG_VAR_set_tmp : unsigned(7 downto 0);
variable REG_VAR_halt_return : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_result := result;
  REG_VAR_set_tmp := set_tmp;
  REG_VAR_halt_return := halt_return;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_halt_return_MUX_uxn_stack_h_l289_c2_0c81_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_0424_iffalse := to_unsigned(0, 1);
     VAR_halt_return_MUX_uxn_stack_h_l289_c2_0c81_iffalse := to_unsigned(0, 1);
     VAR_result_uxn_stack_h_l293_c3_4bc1 := resize(to_unsigned(0, 1), 8);
     VAR_result_MUX_uxn_stack_h_l289_c2_0c81_iffalse := VAR_result_uxn_stack_h_l293_c3_4bc1;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_44f1_iffalse := to_unsigned(0, 1);
     VAR_halt_return_MUX_uxn_stack_h_l298_c2_4693_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_stack_h_l303_c6_398b_right := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_stack_h_l298_c6_60c8_right := to_unsigned(254, 8);
     VAR_halt_uxn_stack_h_l299_c12_5338_err := resize(to_unsigned(2, 2), 8);
     VAR_halt_uxn_stack_h_l290_c12_319f_err := resize(to_unsigned(1, 1), 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_499b_iffalse := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_stack_index := stack_index;
     VAR_ins := ins;
     VAR_k := k;
     VAR_mul := mul;
     VAR_add := add;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_499b_iftrue := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_0424_iftrue := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_44f1_iftrue := VAR_CLOCK_ENABLE;
     VAR_stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_b45f_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_5ad4_right := VAR_add;
     VAR_halt_uxn_stack_h_l290_c12_319f_ins := VAR_ins;
     VAR_halt_uxn_stack_h_l299_c12_5338_ins := VAR_ins;
     VAR_BIN_OP_AND_uxn_stack_h_l297_c13_e020_right := VAR_k;
     VAR_BIN_OP_AND_uxn_stack_h_l297_c13_e020_left := VAR_mul;
     VAR_BIN_OP_GT_uxn_stack_h_l289_c6_a2d7_left := VAR_mul;
     VAR_stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_b45f_stack_index := VAR_stack_index;
     VAR_stack_pointer_set_uxn_stack_h_l304_c3_3f7f_stack_index := VAR_stack_index;
     -- BIN_OP_AND[uxn_stack_h_l297_c13_e020] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_stack_h_l297_c13_e020_left <= VAR_BIN_OP_AND_uxn_stack_h_l297_c13_e020_left;
     BIN_OP_AND_uxn_stack_h_l297_c13_e020_right <= VAR_BIN_OP_AND_uxn_stack_h_l297_c13_e020_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_stack_h_l297_c13_e020_return_output := BIN_OP_AND_uxn_stack_h_l297_c13_e020_return_output;

     -- stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_b45f LATENCY=0
     -- Clock enable
     stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_b45f_CLOCK_ENABLE <= VAR_stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_b45f_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_b45f_stack_index <= VAR_stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_b45f_stack_index;
     -- Outputs
     VAR_stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_b45f_return_output := stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_b45f_return_output;

     -- Submodule level 1
     VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_5ad4_left := signed(std_logic_vector(resize(VAR_BIN_OP_AND_uxn_stack_h_l297_c13_e020_return_output, 9)));
     VAR_BIN_OP_GT_uxn_stack_h_l289_c6_a2d7_right := VAR_stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_b45f_return_output;
     VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_e0d4_right := signed(std_logic_vector(resize(VAR_stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_b45f_return_output, 9)));
     -- BIN_OP_PLUS[uxn_stack_h_l297_c13_5ad4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_stack_h_l297_c13_5ad4_left <= VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_5ad4_left;
     BIN_OP_PLUS_uxn_stack_h_l297_c13_5ad4_right <= VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_5ad4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_5ad4_return_output := BIN_OP_PLUS_uxn_stack_h_l297_c13_5ad4_return_output;

     -- BIN_OP_GT[uxn_stack_h_l289_c6_a2d7] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_stack_h_l289_c6_a2d7_left <= VAR_BIN_OP_GT_uxn_stack_h_l289_c6_a2d7_left;
     BIN_OP_GT_uxn_stack_h_l289_c6_a2d7_right <= VAR_BIN_OP_GT_uxn_stack_h_l289_c6_a2d7_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_stack_h_l289_c6_a2d7_return_output := BIN_OP_GT_uxn_stack_h_l289_c6_a2d7_return_output;

     -- Submodule level 2
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_499b_cond := VAR_BIN_OP_GT_uxn_stack_h_l289_c6_a2d7_return_output;
     VAR_halt_return_MUX_uxn_stack_h_l289_c2_0c81_cond := VAR_BIN_OP_GT_uxn_stack_h_l289_c6_a2d7_return_output;
     VAR_result_MUX_uxn_stack_h_l289_c2_0c81_cond := VAR_BIN_OP_GT_uxn_stack_h_l289_c6_a2d7_return_output;
     VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_e0d4_left := VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_5ad4_return_output;
     -- BIN_OP_PLUS[uxn_stack_h_l297_c13_e0d4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_stack_h_l297_c13_e0d4_left <= VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_e0d4_left;
     BIN_OP_PLUS_uxn_stack_h_l297_c13_e0d4_right <= VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_e0d4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_e0d4_return_output := BIN_OP_PLUS_uxn_stack_h_l297_c13_e0d4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l289_c1_499b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_499b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_499b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_499b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_499b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_499b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_499b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_499b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_499b_return_output;

     -- halt_return_MUX[uxn_stack_h_l289_c2_0c81] LATENCY=0
     -- Inputs
     halt_return_MUX_uxn_stack_h_l289_c2_0c81_cond <= VAR_halt_return_MUX_uxn_stack_h_l289_c2_0c81_cond;
     halt_return_MUX_uxn_stack_h_l289_c2_0c81_iftrue <= VAR_halt_return_MUX_uxn_stack_h_l289_c2_0c81_iftrue;
     halt_return_MUX_uxn_stack_h_l289_c2_0c81_iffalse <= VAR_halt_return_MUX_uxn_stack_h_l289_c2_0c81_iffalse;
     -- Outputs
     VAR_halt_return_MUX_uxn_stack_h_l289_c2_0c81_return_output := halt_return_MUX_uxn_stack_h_l289_c2_0c81_return_output;

     -- Submodule level 3
     VAR_set_tmp_uxn_stack_h_l297_c2_9446 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_e0d4_return_output)),8);
     VAR_halt_uxn_stack_h_l290_c12_319f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_499b_return_output;
     VAR_halt_return_MUX_uxn_stack_h_l298_c2_4693_iffalse := VAR_halt_return_MUX_uxn_stack_h_l289_c2_0c81_return_output;
     VAR_BIN_OP_GT_uxn_stack_h_l298_c6_60c8_left := VAR_set_tmp_uxn_stack_h_l297_c2_9446;
     REG_VAR_set_tmp := VAR_set_tmp_uxn_stack_h_l297_c2_9446;
     VAR_stack_pointer_set_uxn_stack_h_l304_c3_3f7f_value := VAR_set_tmp_uxn_stack_h_l297_c2_9446;
     -- halt[uxn_stack_h_l290_c12_319f] LATENCY=0
     -- Clock enable
     halt_uxn_stack_h_l290_c12_319f_CLOCK_ENABLE <= VAR_halt_uxn_stack_h_l290_c12_319f_CLOCK_ENABLE;
     -- Inputs
     halt_uxn_stack_h_l290_c12_319f_ins <= VAR_halt_uxn_stack_h_l290_c12_319f_ins;
     halt_uxn_stack_h_l290_c12_319f_err <= VAR_halt_uxn_stack_h_l290_c12_319f_err;
     -- Outputs
     VAR_halt_uxn_stack_h_l290_c12_319f_return_output := halt_uxn_stack_h_l290_c12_319f_return_output;

     -- BIN_OP_GT[uxn_stack_h_l298_c6_60c8] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_stack_h_l298_c6_60c8_left <= VAR_BIN_OP_GT_uxn_stack_h_l298_c6_60c8_left;
     BIN_OP_GT_uxn_stack_h_l298_c6_60c8_right <= VAR_BIN_OP_GT_uxn_stack_h_l298_c6_60c8_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_stack_h_l298_c6_60c8_return_output := BIN_OP_GT_uxn_stack_h_l298_c6_60c8_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_0424_cond := VAR_BIN_OP_GT_uxn_stack_h_l298_c6_60c8_return_output;
     VAR_halt_return_MUX_uxn_stack_h_l298_c2_4693_cond := VAR_BIN_OP_GT_uxn_stack_h_l298_c6_60c8_return_output;
     VAR_result_MUX_uxn_stack_h_l298_c2_4693_cond := VAR_BIN_OP_GT_uxn_stack_h_l298_c6_60c8_return_output;
     VAR_result_MUX_uxn_stack_h_l289_c2_0c81_iftrue := VAR_halt_uxn_stack_h_l290_c12_319f_return_output;
     -- halt_return_MUX[uxn_stack_h_l298_c2_4693] LATENCY=0
     -- Inputs
     halt_return_MUX_uxn_stack_h_l298_c2_4693_cond <= VAR_halt_return_MUX_uxn_stack_h_l298_c2_4693_cond;
     halt_return_MUX_uxn_stack_h_l298_c2_4693_iftrue <= VAR_halt_return_MUX_uxn_stack_h_l298_c2_4693_iftrue;
     halt_return_MUX_uxn_stack_h_l298_c2_4693_iffalse <= VAR_halt_return_MUX_uxn_stack_h_l298_c2_4693_iffalse;
     -- Outputs
     VAR_halt_return_MUX_uxn_stack_h_l298_c2_4693_return_output := halt_return_MUX_uxn_stack_h_l298_c2_4693_return_output;

     -- result_MUX[uxn_stack_h_l289_c2_0c81] LATENCY=0
     -- Inputs
     result_MUX_uxn_stack_h_l289_c2_0c81_cond <= VAR_result_MUX_uxn_stack_h_l289_c2_0c81_cond;
     result_MUX_uxn_stack_h_l289_c2_0c81_iftrue <= VAR_result_MUX_uxn_stack_h_l289_c2_0c81_iftrue;
     result_MUX_uxn_stack_h_l289_c2_0c81_iffalse <= VAR_result_MUX_uxn_stack_h_l289_c2_0c81_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_stack_h_l289_c2_0c81_return_output := result_MUX_uxn_stack_h_l289_c2_0c81_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l298_c1_0424] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_0424_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_0424_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_0424_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_0424_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_0424_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_0424_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_0424_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_0424_return_output;

     -- Submodule level 5
     VAR_halt_uxn_stack_h_l299_c12_5338_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_0424_return_output;
     VAR_BIN_OP_EQ_uxn_stack_h_l303_c6_398b_left := VAR_halt_return_MUX_uxn_stack_h_l298_c2_4693_return_output;
     REG_VAR_halt_return := VAR_halt_return_MUX_uxn_stack_h_l298_c2_4693_return_output;
     VAR_result_MUX_uxn_stack_h_l298_c2_4693_iffalse := VAR_result_MUX_uxn_stack_h_l289_c2_0c81_return_output;
     -- BIN_OP_EQ[uxn_stack_h_l303_c6_398b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_stack_h_l303_c6_398b_left <= VAR_BIN_OP_EQ_uxn_stack_h_l303_c6_398b_left;
     BIN_OP_EQ_uxn_stack_h_l303_c6_398b_right <= VAR_BIN_OP_EQ_uxn_stack_h_l303_c6_398b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_stack_h_l303_c6_398b_return_output := BIN_OP_EQ_uxn_stack_h_l303_c6_398b_return_output;

     -- halt[uxn_stack_h_l299_c12_5338] LATENCY=0
     -- Clock enable
     halt_uxn_stack_h_l299_c12_5338_CLOCK_ENABLE <= VAR_halt_uxn_stack_h_l299_c12_5338_CLOCK_ENABLE;
     -- Inputs
     halt_uxn_stack_h_l299_c12_5338_ins <= VAR_halt_uxn_stack_h_l299_c12_5338_ins;
     halt_uxn_stack_h_l299_c12_5338_err <= VAR_halt_uxn_stack_h_l299_c12_5338_err;
     -- Outputs
     VAR_halt_uxn_stack_h_l299_c12_5338_return_output := halt_uxn_stack_h_l299_c12_5338_return_output;

     -- Submodule level 6
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_44f1_cond := VAR_BIN_OP_EQ_uxn_stack_h_l303_c6_398b_return_output;
     VAR_result_MUX_uxn_stack_h_l298_c2_4693_iftrue := VAR_halt_uxn_stack_h_l299_c12_5338_return_output;
     -- result_MUX[uxn_stack_h_l298_c2_4693] LATENCY=0
     -- Inputs
     result_MUX_uxn_stack_h_l298_c2_4693_cond <= VAR_result_MUX_uxn_stack_h_l298_c2_4693_cond;
     result_MUX_uxn_stack_h_l298_c2_4693_iftrue <= VAR_result_MUX_uxn_stack_h_l298_c2_4693_iftrue;
     result_MUX_uxn_stack_h_l298_c2_4693_iffalse <= VAR_result_MUX_uxn_stack_h_l298_c2_4693_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_stack_h_l298_c2_4693_return_output := result_MUX_uxn_stack_h_l298_c2_4693_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l303_c1_44f1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_44f1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_44f1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_44f1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_44f1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_44f1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_44f1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_44f1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_44f1_return_output;

     -- Submodule level 7
     VAR_stack_pointer_set_uxn_stack_h_l304_c3_3f7f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_44f1_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_stack_h_l298_c2_4693_return_output;
     VAR_return_output := VAR_result_MUX_uxn_stack_h_l298_c2_4693_return_output;
     -- stack_pointer_set[uxn_stack_h_l304_c3_3f7f] LATENCY=0
     -- Clock enable
     stack_pointer_set_uxn_stack_h_l304_c3_3f7f_CLOCK_ENABLE <= VAR_stack_pointer_set_uxn_stack_h_l304_c3_3f7f_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_set_uxn_stack_h_l304_c3_3f7f_stack_index <= VAR_stack_pointer_set_uxn_stack_h_l304_c3_3f7f_stack_index;
     stack_pointer_set_uxn_stack_h_l304_c3_3f7f_value <= VAR_stack_pointer_set_uxn_stack_h_l304_c3_3f7f_value;
     -- Outputs

     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_result <= REG_VAR_result;
REG_COMB_set_tmp <= REG_VAR_set_tmp;
REG_COMB_halt_return <= REG_VAR_halt_return;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     result <= REG_COMB_result;
     set_tmp <= REG_COMB_set_tmp;
     halt_return <= REG_COMB_halt_return;
 end if;
 end if;
end process;

end arch;
