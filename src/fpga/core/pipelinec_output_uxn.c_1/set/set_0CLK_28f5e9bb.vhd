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
-- BIN_OP_GT[uxn_stack_h_l289_c6_a60f]
signal BIN_OP_GT_uxn_stack_h_l289_c6_a60f_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l289_c6_a60f_right : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l289_c6_a60f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l289_c1_b519]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b519_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b519_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b519_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b519_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_stack_h_l289_c2_17e8]
signal result_MUX_uxn_stack_h_l289_c2_17e8_cond : unsigned(0 downto 0);
signal result_MUX_uxn_stack_h_l289_c2_17e8_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l289_c2_17e8_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l289_c2_17e8_return_output : unsigned(7 downto 0);

-- halt_return_MUX[uxn_stack_h_l289_c2_17e8]
signal halt_return_MUX_uxn_stack_h_l289_c2_17e8_cond : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l289_c2_17e8_iftrue : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l289_c2_17e8_iffalse : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l289_c2_17e8_return_output : unsigned(0 downto 0);

-- halt[uxn_stack_h_l290_c12_9f96]
signal halt_uxn_stack_h_l290_c12_9f96_CLOCK_ENABLE : unsigned(0 downto 0);
signal halt_uxn_stack_h_l290_c12_9f96_ins : unsigned(7 downto 0);
signal halt_uxn_stack_h_l290_c12_9f96_err : unsigned(7 downto 0);
signal halt_uxn_stack_h_l290_c12_9f96_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_stack_h_l297_c13_5b84]
signal BIN_OP_AND_uxn_stack_h_l297_c13_5b84_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_stack_h_l297_c13_5b84_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_stack_h_l297_c13_5b84_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_stack_h_l297_c13_5951]
signal BIN_OP_PLUS_uxn_stack_h_l297_c13_5951_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l297_c13_5951_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l297_c13_5951_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_stack_h_l297_c13_a5fa]
signal BIN_OP_PLUS_uxn_stack_h_l297_c13_a5fa_left : signed(9 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l297_c13_a5fa_right : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l297_c13_a5fa_return_output : signed(10 downto 0);

-- BIN_OP_GT[uxn_stack_h_l298_c6_262f]
signal BIN_OP_GT_uxn_stack_h_l298_c6_262f_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l298_c6_262f_right : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l298_c6_262f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l298_c1_3310]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3310_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3310_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3310_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3310_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_stack_h_l298_c2_5221]
signal result_MUX_uxn_stack_h_l298_c2_5221_cond : unsigned(0 downto 0);
signal result_MUX_uxn_stack_h_l298_c2_5221_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l298_c2_5221_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l298_c2_5221_return_output : unsigned(7 downto 0);

-- halt_return_MUX[uxn_stack_h_l298_c2_5221]
signal halt_return_MUX_uxn_stack_h_l298_c2_5221_cond : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l298_c2_5221_iftrue : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l298_c2_5221_iffalse : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l298_c2_5221_return_output : unsigned(0 downto 0);

-- halt[uxn_stack_h_l299_c12_4fd4]
signal halt_uxn_stack_h_l299_c12_4fd4_CLOCK_ENABLE : unsigned(0 downto 0);
signal halt_uxn_stack_h_l299_c12_4fd4_ins : unsigned(7 downto 0);
signal halt_uxn_stack_h_l299_c12_4fd4_err : unsigned(7 downto 0);
signal halt_uxn_stack_h_l299_c12_4fd4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_stack_h_l303_c6_b0cf]
signal BIN_OP_EQ_uxn_stack_h_l303_c6_b0cf_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l303_c6_b0cf_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l303_c6_b0cf_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l303_c1_66a0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_66a0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_66a0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_66a0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_66a0_return_output : unsigned(0 downto 0);

-- stack_pointer_set[uxn_stack_h_l304_c3_17c1]
signal stack_pointer_set_uxn_stack_h_l304_c3_17c1_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_set_uxn_stack_h_l304_c3_17c1_stack_index : unsigned(0 downto 0);
signal stack_pointer_set_uxn_stack_h_l304_c3_17c1_value : unsigned(7 downto 0);

-- stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_46cd
signal stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_46cd_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_46cd_stack_index : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_46cd_return_output : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_GT_uxn_stack_h_l289_c6_a60f
BIN_OP_GT_uxn_stack_h_l289_c6_a60f : entity work.BIN_OP_GT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_stack_h_l289_c6_a60f_left,
BIN_OP_GT_uxn_stack_h_l289_c6_a60f_right,
BIN_OP_GT_uxn_stack_h_l289_c6_a60f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b519
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b519 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b519_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b519_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b519_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b519_return_output);

-- result_MUX_uxn_stack_h_l289_c2_17e8
result_MUX_uxn_stack_h_l289_c2_17e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_stack_h_l289_c2_17e8_cond,
result_MUX_uxn_stack_h_l289_c2_17e8_iftrue,
result_MUX_uxn_stack_h_l289_c2_17e8_iffalse,
result_MUX_uxn_stack_h_l289_c2_17e8_return_output);

-- halt_return_MUX_uxn_stack_h_l289_c2_17e8
halt_return_MUX_uxn_stack_h_l289_c2_17e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
halt_return_MUX_uxn_stack_h_l289_c2_17e8_cond,
halt_return_MUX_uxn_stack_h_l289_c2_17e8_iftrue,
halt_return_MUX_uxn_stack_h_l289_c2_17e8_iffalse,
halt_return_MUX_uxn_stack_h_l289_c2_17e8_return_output);

-- halt_uxn_stack_h_l290_c12_9f96
halt_uxn_stack_h_l290_c12_9f96 : entity work.halt_0CLK_1d3235af port map (
clk,
halt_uxn_stack_h_l290_c12_9f96_CLOCK_ENABLE,
halt_uxn_stack_h_l290_c12_9f96_ins,
halt_uxn_stack_h_l290_c12_9f96_err,
halt_uxn_stack_h_l290_c12_9f96_return_output);

-- BIN_OP_AND_uxn_stack_h_l297_c13_5b84
BIN_OP_AND_uxn_stack_h_l297_c13_5b84 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_stack_h_l297_c13_5b84_left,
BIN_OP_AND_uxn_stack_h_l297_c13_5b84_right,
BIN_OP_AND_uxn_stack_h_l297_c13_5b84_return_output);

-- BIN_OP_PLUS_uxn_stack_h_l297_c13_5951
BIN_OP_PLUS_uxn_stack_h_l297_c13_5951 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_stack_h_l297_c13_5951_left,
BIN_OP_PLUS_uxn_stack_h_l297_c13_5951_right,
BIN_OP_PLUS_uxn_stack_h_l297_c13_5951_return_output);

-- BIN_OP_PLUS_uxn_stack_h_l297_c13_a5fa
BIN_OP_PLUS_uxn_stack_h_l297_c13_a5fa : entity work.BIN_OP_PLUS_int10_t_int9_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_stack_h_l297_c13_a5fa_left,
BIN_OP_PLUS_uxn_stack_h_l297_c13_a5fa_right,
BIN_OP_PLUS_uxn_stack_h_l297_c13_a5fa_return_output);

-- BIN_OP_GT_uxn_stack_h_l298_c6_262f
BIN_OP_GT_uxn_stack_h_l298_c6_262f : entity work.BIN_OP_GT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_stack_h_l298_c6_262f_left,
BIN_OP_GT_uxn_stack_h_l298_c6_262f_right,
BIN_OP_GT_uxn_stack_h_l298_c6_262f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3310
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3310 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3310_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3310_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3310_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3310_return_output);

-- result_MUX_uxn_stack_h_l298_c2_5221
result_MUX_uxn_stack_h_l298_c2_5221 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_stack_h_l298_c2_5221_cond,
result_MUX_uxn_stack_h_l298_c2_5221_iftrue,
result_MUX_uxn_stack_h_l298_c2_5221_iffalse,
result_MUX_uxn_stack_h_l298_c2_5221_return_output);

-- halt_return_MUX_uxn_stack_h_l298_c2_5221
halt_return_MUX_uxn_stack_h_l298_c2_5221 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
halt_return_MUX_uxn_stack_h_l298_c2_5221_cond,
halt_return_MUX_uxn_stack_h_l298_c2_5221_iftrue,
halt_return_MUX_uxn_stack_h_l298_c2_5221_iffalse,
halt_return_MUX_uxn_stack_h_l298_c2_5221_return_output);

-- halt_uxn_stack_h_l299_c12_4fd4
halt_uxn_stack_h_l299_c12_4fd4 : entity work.halt_0CLK_1d3235af port map (
clk,
halt_uxn_stack_h_l299_c12_4fd4_CLOCK_ENABLE,
halt_uxn_stack_h_l299_c12_4fd4_ins,
halt_uxn_stack_h_l299_c12_4fd4_err,
halt_uxn_stack_h_l299_c12_4fd4_return_output);

-- BIN_OP_EQ_uxn_stack_h_l303_c6_b0cf
BIN_OP_EQ_uxn_stack_h_l303_c6_b0cf : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_stack_h_l303_c6_b0cf_left,
BIN_OP_EQ_uxn_stack_h_l303_c6_b0cf_right,
BIN_OP_EQ_uxn_stack_h_l303_c6_b0cf_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_66a0
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_66a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_66a0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_66a0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_66a0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_66a0_return_output);

-- stack_pointer_set_uxn_stack_h_l304_c3_17c1
stack_pointer_set_uxn_stack_h_l304_c3_17c1 : entity work.stack_pointer_set_0CLK_88c0218f port map (
clk,
stack_pointer_set_uxn_stack_h_l304_c3_17c1_CLOCK_ENABLE,
stack_pointer_set_uxn_stack_h_l304_c3_17c1_stack_index,
stack_pointer_set_uxn_stack_h_l304_c3_17c1_value);

-- stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_46cd
stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_46cd : entity work.stack_pointer_get_0CLK_c35c94f1 port map (
clk,
stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_46cd_CLOCK_ENABLE,
stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_46cd_stack_index,
stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_46cd_return_output);



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
 BIN_OP_GT_uxn_stack_h_l289_c6_a60f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b519_return_output,
 result_MUX_uxn_stack_h_l289_c2_17e8_return_output,
 halt_return_MUX_uxn_stack_h_l289_c2_17e8_return_output,
 halt_uxn_stack_h_l290_c12_9f96_return_output,
 BIN_OP_AND_uxn_stack_h_l297_c13_5b84_return_output,
 BIN_OP_PLUS_uxn_stack_h_l297_c13_5951_return_output,
 BIN_OP_PLUS_uxn_stack_h_l297_c13_a5fa_return_output,
 BIN_OP_GT_uxn_stack_h_l298_c6_262f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3310_return_output,
 result_MUX_uxn_stack_h_l298_c2_5221_return_output,
 halt_return_MUX_uxn_stack_h_l298_c2_5221_return_output,
 halt_uxn_stack_h_l299_c12_4fd4_return_output,
 BIN_OP_EQ_uxn_stack_h_l303_c6_b0cf_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_66a0_return_output,
 stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_46cd_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_mul : unsigned(7 downto 0);
 variable VAR_add : signed(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l289_c6_a60f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l289_c6_a60f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l289_c6_a60f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b519_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b519_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b519_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b519_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l289_c2_17e8_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l289_c2_17e8_iffalse : unsigned(7 downto 0);
 variable VAR_result_uxn_stack_h_l293_c3_3ace : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l289_c2_17e8_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l289_c2_17e8_cond : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l289_c2_17e8_iftrue : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l289_c2_17e8_iffalse : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l289_c2_17e8_return_output : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l289_c2_17e8_cond : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l290_c12_9f96_ins : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l290_c12_9f96_err : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l290_c12_9f96_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l290_c12_9f96_return_output : unsigned(7 downto 0);
 variable VAR_set_tmp_uxn_stack_h_l297_c2_9505 : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l297_c13_5b84_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l297_c13_5b84_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l297_c13_5b84_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_5951_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_5951_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_5951_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_a5fa_left : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_a5fa_right : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_a5fa_return_output : signed(10 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l298_c6_262f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l298_c6_262f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l298_c6_262f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3310_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3310_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3310_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3310_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l298_c2_5221_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l298_c2_5221_iffalse : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l298_c2_5221_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l298_c2_5221_cond : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l298_c2_5221_iftrue : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l298_c2_5221_iffalse : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l298_c2_5221_return_output : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l298_c2_5221_cond : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l299_c12_4fd4_ins : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l299_c12_4fd4_err : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l299_c12_4fd4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l299_c12_4fd4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l303_c6_b0cf_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l303_c6_b0cf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l303_c6_b0cf_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_66a0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_66a0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_66a0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_66a0_iffalse : unsigned(0 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l304_c3_17c1_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l304_c3_17c1_value : unsigned(7 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l304_c3_17c1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_46cd_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_46cd_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_46cd_return_output : unsigned(7 downto 0);
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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3310_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_66a0_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_stack_h_l298_c6_262f_right := to_unsigned(254, 8);
     VAR_halt_return_MUX_uxn_stack_h_l289_c2_17e8_iftrue := to_unsigned(1, 1);
     VAR_halt_return_MUX_uxn_stack_h_l298_c2_5221_iftrue := to_unsigned(1, 1);
     VAR_halt_uxn_stack_h_l299_c12_4fd4_err := resize(to_unsigned(2, 2), 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b519_iffalse := to_unsigned(0, 1);
     VAR_halt_return_MUX_uxn_stack_h_l289_c2_17e8_iffalse := to_unsigned(0, 1);
     VAR_result_uxn_stack_h_l293_c3_3ace := resize(to_unsigned(0, 1), 8);
     VAR_result_MUX_uxn_stack_h_l289_c2_17e8_iffalse := VAR_result_uxn_stack_h_l293_c3_3ace;
     VAR_halt_uxn_stack_h_l290_c12_9f96_err := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_stack_h_l303_c6_b0cf_right := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b519_iftrue := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3310_iftrue := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_66a0_iftrue := VAR_CLOCK_ENABLE;
     VAR_stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_46cd_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_5951_right := VAR_add;
     VAR_halt_uxn_stack_h_l290_c12_9f96_ins := VAR_ins;
     VAR_halt_uxn_stack_h_l299_c12_4fd4_ins := VAR_ins;
     VAR_BIN_OP_AND_uxn_stack_h_l297_c13_5b84_right := VAR_k;
     VAR_BIN_OP_AND_uxn_stack_h_l297_c13_5b84_left := VAR_mul;
     VAR_BIN_OP_GT_uxn_stack_h_l289_c6_a60f_left := VAR_mul;
     VAR_stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_46cd_stack_index := VAR_stack_index;
     VAR_stack_pointer_set_uxn_stack_h_l304_c3_17c1_stack_index := VAR_stack_index;
     -- BIN_OP_AND[uxn_stack_h_l297_c13_5b84] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_stack_h_l297_c13_5b84_left <= VAR_BIN_OP_AND_uxn_stack_h_l297_c13_5b84_left;
     BIN_OP_AND_uxn_stack_h_l297_c13_5b84_right <= VAR_BIN_OP_AND_uxn_stack_h_l297_c13_5b84_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_stack_h_l297_c13_5b84_return_output := BIN_OP_AND_uxn_stack_h_l297_c13_5b84_return_output;

     -- stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_46cd LATENCY=0
     -- Clock enable
     stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_46cd_CLOCK_ENABLE <= VAR_stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_46cd_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_46cd_stack_index <= VAR_stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_46cd_stack_index;
     -- Outputs
     VAR_stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_46cd_return_output := stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_46cd_return_output;

     -- Submodule level 1
     VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_5951_left := signed(std_logic_vector(resize(VAR_BIN_OP_AND_uxn_stack_h_l297_c13_5b84_return_output, 9)));
     VAR_BIN_OP_GT_uxn_stack_h_l289_c6_a60f_right := VAR_stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_46cd_return_output;
     VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_a5fa_right := signed(std_logic_vector(resize(VAR_stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_46cd_return_output, 9)));
     -- BIN_OP_PLUS[uxn_stack_h_l297_c13_5951] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_stack_h_l297_c13_5951_left <= VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_5951_left;
     BIN_OP_PLUS_uxn_stack_h_l297_c13_5951_right <= VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_5951_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_5951_return_output := BIN_OP_PLUS_uxn_stack_h_l297_c13_5951_return_output;

     -- BIN_OP_GT[uxn_stack_h_l289_c6_a60f] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_stack_h_l289_c6_a60f_left <= VAR_BIN_OP_GT_uxn_stack_h_l289_c6_a60f_left;
     BIN_OP_GT_uxn_stack_h_l289_c6_a60f_right <= VAR_BIN_OP_GT_uxn_stack_h_l289_c6_a60f_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_stack_h_l289_c6_a60f_return_output := BIN_OP_GT_uxn_stack_h_l289_c6_a60f_return_output;

     -- Submodule level 2
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b519_cond := VAR_BIN_OP_GT_uxn_stack_h_l289_c6_a60f_return_output;
     VAR_halt_return_MUX_uxn_stack_h_l289_c2_17e8_cond := VAR_BIN_OP_GT_uxn_stack_h_l289_c6_a60f_return_output;
     VAR_result_MUX_uxn_stack_h_l289_c2_17e8_cond := VAR_BIN_OP_GT_uxn_stack_h_l289_c6_a60f_return_output;
     VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_a5fa_left := VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_5951_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l289_c1_b519] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b519_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b519_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b519_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b519_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b519_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b519_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b519_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b519_return_output;

     -- BIN_OP_PLUS[uxn_stack_h_l297_c13_a5fa] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_stack_h_l297_c13_a5fa_left <= VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_a5fa_left;
     BIN_OP_PLUS_uxn_stack_h_l297_c13_a5fa_right <= VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_a5fa_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_a5fa_return_output := BIN_OP_PLUS_uxn_stack_h_l297_c13_a5fa_return_output;

     -- halt_return_MUX[uxn_stack_h_l289_c2_17e8] LATENCY=0
     -- Inputs
     halt_return_MUX_uxn_stack_h_l289_c2_17e8_cond <= VAR_halt_return_MUX_uxn_stack_h_l289_c2_17e8_cond;
     halt_return_MUX_uxn_stack_h_l289_c2_17e8_iftrue <= VAR_halt_return_MUX_uxn_stack_h_l289_c2_17e8_iftrue;
     halt_return_MUX_uxn_stack_h_l289_c2_17e8_iffalse <= VAR_halt_return_MUX_uxn_stack_h_l289_c2_17e8_iffalse;
     -- Outputs
     VAR_halt_return_MUX_uxn_stack_h_l289_c2_17e8_return_output := halt_return_MUX_uxn_stack_h_l289_c2_17e8_return_output;

     -- Submodule level 3
     VAR_set_tmp_uxn_stack_h_l297_c2_9505 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_a5fa_return_output)),8);
     VAR_halt_uxn_stack_h_l290_c12_9f96_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b519_return_output;
     VAR_halt_return_MUX_uxn_stack_h_l298_c2_5221_iffalse := VAR_halt_return_MUX_uxn_stack_h_l289_c2_17e8_return_output;
     VAR_BIN_OP_GT_uxn_stack_h_l298_c6_262f_left := VAR_set_tmp_uxn_stack_h_l297_c2_9505;
     REG_VAR_set_tmp := VAR_set_tmp_uxn_stack_h_l297_c2_9505;
     VAR_stack_pointer_set_uxn_stack_h_l304_c3_17c1_value := VAR_set_tmp_uxn_stack_h_l297_c2_9505;
     -- halt[uxn_stack_h_l290_c12_9f96] LATENCY=0
     -- Clock enable
     halt_uxn_stack_h_l290_c12_9f96_CLOCK_ENABLE <= VAR_halt_uxn_stack_h_l290_c12_9f96_CLOCK_ENABLE;
     -- Inputs
     halt_uxn_stack_h_l290_c12_9f96_ins <= VAR_halt_uxn_stack_h_l290_c12_9f96_ins;
     halt_uxn_stack_h_l290_c12_9f96_err <= VAR_halt_uxn_stack_h_l290_c12_9f96_err;
     -- Outputs
     VAR_halt_uxn_stack_h_l290_c12_9f96_return_output := halt_uxn_stack_h_l290_c12_9f96_return_output;

     -- BIN_OP_GT[uxn_stack_h_l298_c6_262f] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_stack_h_l298_c6_262f_left <= VAR_BIN_OP_GT_uxn_stack_h_l298_c6_262f_left;
     BIN_OP_GT_uxn_stack_h_l298_c6_262f_right <= VAR_BIN_OP_GT_uxn_stack_h_l298_c6_262f_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_stack_h_l298_c6_262f_return_output := BIN_OP_GT_uxn_stack_h_l298_c6_262f_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3310_cond := VAR_BIN_OP_GT_uxn_stack_h_l298_c6_262f_return_output;
     VAR_halt_return_MUX_uxn_stack_h_l298_c2_5221_cond := VAR_BIN_OP_GT_uxn_stack_h_l298_c6_262f_return_output;
     VAR_result_MUX_uxn_stack_h_l298_c2_5221_cond := VAR_BIN_OP_GT_uxn_stack_h_l298_c6_262f_return_output;
     VAR_result_MUX_uxn_stack_h_l289_c2_17e8_iftrue := VAR_halt_uxn_stack_h_l290_c12_9f96_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l298_c1_3310] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3310_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3310_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3310_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3310_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3310_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3310_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3310_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3310_return_output;

     -- halt_return_MUX[uxn_stack_h_l298_c2_5221] LATENCY=0
     -- Inputs
     halt_return_MUX_uxn_stack_h_l298_c2_5221_cond <= VAR_halt_return_MUX_uxn_stack_h_l298_c2_5221_cond;
     halt_return_MUX_uxn_stack_h_l298_c2_5221_iftrue <= VAR_halt_return_MUX_uxn_stack_h_l298_c2_5221_iftrue;
     halt_return_MUX_uxn_stack_h_l298_c2_5221_iffalse <= VAR_halt_return_MUX_uxn_stack_h_l298_c2_5221_iffalse;
     -- Outputs
     VAR_halt_return_MUX_uxn_stack_h_l298_c2_5221_return_output := halt_return_MUX_uxn_stack_h_l298_c2_5221_return_output;

     -- result_MUX[uxn_stack_h_l289_c2_17e8] LATENCY=0
     -- Inputs
     result_MUX_uxn_stack_h_l289_c2_17e8_cond <= VAR_result_MUX_uxn_stack_h_l289_c2_17e8_cond;
     result_MUX_uxn_stack_h_l289_c2_17e8_iftrue <= VAR_result_MUX_uxn_stack_h_l289_c2_17e8_iftrue;
     result_MUX_uxn_stack_h_l289_c2_17e8_iffalse <= VAR_result_MUX_uxn_stack_h_l289_c2_17e8_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_stack_h_l289_c2_17e8_return_output := result_MUX_uxn_stack_h_l289_c2_17e8_return_output;

     -- Submodule level 5
     VAR_halt_uxn_stack_h_l299_c12_4fd4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3310_return_output;
     VAR_BIN_OP_EQ_uxn_stack_h_l303_c6_b0cf_left := VAR_halt_return_MUX_uxn_stack_h_l298_c2_5221_return_output;
     REG_VAR_halt_return := VAR_halt_return_MUX_uxn_stack_h_l298_c2_5221_return_output;
     VAR_result_MUX_uxn_stack_h_l298_c2_5221_iffalse := VAR_result_MUX_uxn_stack_h_l289_c2_17e8_return_output;
     -- halt[uxn_stack_h_l299_c12_4fd4] LATENCY=0
     -- Clock enable
     halt_uxn_stack_h_l299_c12_4fd4_CLOCK_ENABLE <= VAR_halt_uxn_stack_h_l299_c12_4fd4_CLOCK_ENABLE;
     -- Inputs
     halt_uxn_stack_h_l299_c12_4fd4_ins <= VAR_halt_uxn_stack_h_l299_c12_4fd4_ins;
     halt_uxn_stack_h_l299_c12_4fd4_err <= VAR_halt_uxn_stack_h_l299_c12_4fd4_err;
     -- Outputs
     VAR_halt_uxn_stack_h_l299_c12_4fd4_return_output := halt_uxn_stack_h_l299_c12_4fd4_return_output;

     -- BIN_OP_EQ[uxn_stack_h_l303_c6_b0cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_stack_h_l303_c6_b0cf_left <= VAR_BIN_OP_EQ_uxn_stack_h_l303_c6_b0cf_left;
     BIN_OP_EQ_uxn_stack_h_l303_c6_b0cf_right <= VAR_BIN_OP_EQ_uxn_stack_h_l303_c6_b0cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_stack_h_l303_c6_b0cf_return_output := BIN_OP_EQ_uxn_stack_h_l303_c6_b0cf_return_output;

     -- Submodule level 6
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_66a0_cond := VAR_BIN_OP_EQ_uxn_stack_h_l303_c6_b0cf_return_output;
     VAR_result_MUX_uxn_stack_h_l298_c2_5221_iftrue := VAR_halt_uxn_stack_h_l299_c12_4fd4_return_output;
     -- result_MUX[uxn_stack_h_l298_c2_5221] LATENCY=0
     -- Inputs
     result_MUX_uxn_stack_h_l298_c2_5221_cond <= VAR_result_MUX_uxn_stack_h_l298_c2_5221_cond;
     result_MUX_uxn_stack_h_l298_c2_5221_iftrue <= VAR_result_MUX_uxn_stack_h_l298_c2_5221_iftrue;
     result_MUX_uxn_stack_h_l298_c2_5221_iffalse <= VAR_result_MUX_uxn_stack_h_l298_c2_5221_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_stack_h_l298_c2_5221_return_output := result_MUX_uxn_stack_h_l298_c2_5221_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l303_c1_66a0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_66a0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_66a0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_66a0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_66a0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_66a0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_66a0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_66a0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_66a0_return_output;

     -- Submodule level 7
     VAR_stack_pointer_set_uxn_stack_h_l304_c3_17c1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_66a0_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_stack_h_l298_c2_5221_return_output;
     VAR_return_output := VAR_result_MUX_uxn_stack_h_l298_c2_5221_return_output;
     -- stack_pointer_set[uxn_stack_h_l304_c3_17c1] LATENCY=0
     -- Clock enable
     stack_pointer_set_uxn_stack_h_l304_c3_17c1_CLOCK_ENABLE <= VAR_stack_pointer_set_uxn_stack_h_l304_c3_17c1_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_set_uxn_stack_h_l304_c3_17c1_stack_index <= VAR_stack_pointer_set_uxn_stack_h_l304_c3_17c1_stack_index;
     stack_pointer_set_uxn_stack_h_l304_c3_17c1_value <= VAR_stack_pointer_set_uxn_stack_h_l304_c3_17c1_value;
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
