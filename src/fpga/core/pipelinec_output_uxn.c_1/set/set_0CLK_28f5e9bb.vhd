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
-- BIN_OP_GT[uxn_stack_h_l289_c6_2891]
signal BIN_OP_GT_uxn_stack_h_l289_c6_2891_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l289_c6_2891_right : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l289_c6_2891_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l289_c1_b35a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b35a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b35a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b35a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b35a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_stack_h_l289_c2_2431]
signal result_MUX_uxn_stack_h_l289_c2_2431_cond : unsigned(0 downto 0);
signal result_MUX_uxn_stack_h_l289_c2_2431_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l289_c2_2431_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l289_c2_2431_return_output : unsigned(7 downto 0);

-- halt_return_MUX[uxn_stack_h_l289_c2_2431]
signal halt_return_MUX_uxn_stack_h_l289_c2_2431_cond : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l289_c2_2431_iftrue : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l289_c2_2431_iffalse : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l289_c2_2431_return_output : unsigned(0 downto 0);

-- halt[uxn_stack_h_l290_c12_289b]
signal halt_uxn_stack_h_l290_c12_289b_CLOCK_ENABLE : unsigned(0 downto 0);
signal halt_uxn_stack_h_l290_c12_289b_ins : unsigned(7 downto 0);
signal halt_uxn_stack_h_l290_c12_289b_err : unsigned(7 downto 0);
signal halt_uxn_stack_h_l290_c12_289b_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_stack_h_l297_c13_6bfb]
signal BIN_OP_AND_uxn_stack_h_l297_c13_6bfb_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_stack_h_l297_c13_6bfb_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_stack_h_l297_c13_6bfb_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_stack_h_l297_c13_311e]
signal BIN_OP_PLUS_uxn_stack_h_l297_c13_311e_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l297_c13_311e_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l297_c13_311e_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_stack_h_l297_c13_471a]
signal BIN_OP_PLUS_uxn_stack_h_l297_c13_471a_left : signed(9 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l297_c13_471a_right : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l297_c13_471a_return_output : signed(10 downto 0);

-- BIN_OP_GT[uxn_stack_h_l298_c6_6113]
signal BIN_OP_GT_uxn_stack_h_l298_c6_6113_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l298_c6_6113_right : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l298_c6_6113_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l298_c1_3b0a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3b0a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3b0a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3b0a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3b0a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_stack_h_l298_c2_5b91]
signal result_MUX_uxn_stack_h_l298_c2_5b91_cond : unsigned(0 downto 0);
signal result_MUX_uxn_stack_h_l298_c2_5b91_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l298_c2_5b91_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l298_c2_5b91_return_output : unsigned(7 downto 0);

-- halt_return_MUX[uxn_stack_h_l298_c2_5b91]
signal halt_return_MUX_uxn_stack_h_l298_c2_5b91_cond : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l298_c2_5b91_iftrue : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l298_c2_5b91_iffalse : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l298_c2_5b91_return_output : unsigned(0 downto 0);

-- halt[uxn_stack_h_l299_c12_9471]
signal halt_uxn_stack_h_l299_c12_9471_CLOCK_ENABLE : unsigned(0 downto 0);
signal halt_uxn_stack_h_l299_c12_9471_ins : unsigned(7 downto 0);
signal halt_uxn_stack_h_l299_c12_9471_err : unsigned(7 downto 0);
signal halt_uxn_stack_h_l299_c12_9471_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_stack_h_l303_c6_2a03]
signal BIN_OP_EQ_uxn_stack_h_l303_c6_2a03_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l303_c6_2a03_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l303_c6_2a03_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l303_c1_89a8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_89a8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_89a8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_89a8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_89a8_return_output : unsigned(0 downto 0);

-- stack_pointer_set[uxn_stack_h_l304_c3_c570]
signal stack_pointer_set_uxn_stack_h_l304_c3_c570_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_set_uxn_stack_h_l304_c3_c570_stack_index : unsigned(0 downto 0);
signal stack_pointer_set_uxn_stack_h_l304_c3_c570_value : unsigned(7 downto 0);

-- stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_e074
signal stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_e074_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_e074_stack_index : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_e074_return_output : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_GT_uxn_stack_h_l289_c6_2891
BIN_OP_GT_uxn_stack_h_l289_c6_2891 : entity work.BIN_OP_GT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_stack_h_l289_c6_2891_left,
BIN_OP_GT_uxn_stack_h_l289_c6_2891_right,
BIN_OP_GT_uxn_stack_h_l289_c6_2891_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b35a
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b35a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b35a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b35a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b35a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b35a_return_output);

-- result_MUX_uxn_stack_h_l289_c2_2431
result_MUX_uxn_stack_h_l289_c2_2431 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_stack_h_l289_c2_2431_cond,
result_MUX_uxn_stack_h_l289_c2_2431_iftrue,
result_MUX_uxn_stack_h_l289_c2_2431_iffalse,
result_MUX_uxn_stack_h_l289_c2_2431_return_output);

-- halt_return_MUX_uxn_stack_h_l289_c2_2431
halt_return_MUX_uxn_stack_h_l289_c2_2431 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
halt_return_MUX_uxn_stack_h_l289_c2_2431_cond,
halt_return_MUX_uxn_stack_h_l289_c2_2431_iftrue,
halt_return_MUX_uxn_stack_h_l289_c2_2431_iffalse,
halt_return_MUX_uxn_stack_h_l289_c2_2431_return_output);

-- halt_uxn_stack_h_l290_c12_289b
halt_uxn_stack_h_l290_c12_289b : entity work.halt_0CLK_1d3235af port map (
clk,
halt_uxn_stack_h_l290_c12_289b_CLOCK_ENABLE,
halt_uxn_stack_h_l290_c12_289b_ins,
halt_uxn_stack_h_l290_c12_289b_err,
halt_uxn_stack_h_l290_c12_289b_return_output);

-- BIN_OP_AND_uxn_stack_h_l297_c13_6bfb
BIN_OP_AND_uxn_stack_h_l297_c13_6bfb : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_stack_h_l297_c13_6bfb_left,
BIN_OP_AND_uxn_stack_h_l297_c13_6bfb_right,
BIN_OP_AND_uxn_stack_h_l297_c13_6bfb_return_output);

-- BIN_OP_PLUS_uxn_stack_h_l297_c13_311e
BIN_OP_PLUS_uxn_stack_h_l297_c13_311e : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_stack_h_l297_c13_311e_left,
BIN_OP_PLUS_uxn_stack_h_l297_c13_311e_right,
BIN_OP_PLUS_uxn_stack_h_l297_c13_311e_return_output);

-- BIN_OP_PLUS_uxn_stack_h_l297_c13_471a
BIN_OP_PLUS_uxn_stack_h_l297_c13_471a : entity work.BIN_OP_PLUS_int10_t_int9_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_stack_h_l297_c13_471a_left,
BIN_OP_PLUS_uxn_stack_h_l297_c13_471a_right,
BIN_OP_PLUS_uxn_stack_h_l297_c13_471a_return_output);

-- BIN_OP_GT_uxn_stack_h_l298_c6_6113
BIN_OP_GT_uxn_stack_h_l298_c6_6113 : entity work.BIN_OP_GT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_stack_h_l298_c6_6113_left,
BIN_OP_GT_uxn_stack_h_l298_c6_6113_right,
BIN_OP_GT_uxn_stack_h_l298_c6_6113_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3b0a
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3b0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3b0a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3b0a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3b0a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3b0a_return_output);

-- result_MUX_uxn_stack_h_l298_c2_5b91
result_MUX_uxn_stack_h_l298_c2_5b91 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_stack_h_l298_c2_5b91_cond,
result_MUX_uxn_stack_h_l298_c2_5b91_iftrue,
result_MUX_uxn_stack_h_l298_c2_5b91_iffalse,
result_MUX_uxn_stack_h_l298_c2_5b91_return_output);

-- halt_return_MUX_uxn_stack_h_l298_c2_5b91
halt_return_MUX_uxn_stack_h_l298_c2_5b91 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
halt_return_MUX_uxn_stack_h_l298_c2_5b91_cond,
halt_return_MUX_uxn_stack_h_l298_c2_5b91_iftrue,
halt_return_MUX_uxn_stack_h_l298_c2_5b91_iffalse,
halt_return_MUX_uxn_stack_h_l298_c2_5b91_return_output);

-- halt_uxn_stack_h_l299_c12_9471
halt_uxn_stack_h_l299_c12_9471 : entity work.halt_0CLK_1d3235af port map (
clk,
halt_uxn_stack_h_l299_c12_9471_CLOCK_ENABLE,
halt_uxn_stack_h_l299_c12_9471_ins,
halt_uxn_stack_h_l299_c12_9471_err,
halt_uxn_stack_h_l299_c12_9471_return_output);

-- BIN_OP_EQ_uxn_stack_h_l303_c6_2a03
BIN_OP_EQ_uxn_stack_h_l303_c6_2a03 : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_stack_h_l303_c6_2a03_left,
BIN_OP_EQ_uxn_stack_h_l303_c6_2a03_right,
BIN_OP_EQ_uxn_stack_h_l303_c6_2a03_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_89a8
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_89a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_89a8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_89a8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_89a8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_89a8_return_output);

-- stack_pointer_set_uxn_stack_h_l304_c3_c570
stack_pointer_set_uxn_stack_h_l304_c3_c570 : entity work.stack_pointer_set_0CLK_88c0218f port map (
clk,
stack_pointer_set_uxn_stack_h_l304_c3_c570_CLOCK_ENABLE,
stack_pointer_set_uxn_stack_h_l304_c3_c570_stack_index,
stack_pointer_set_uxn_stack_h_l304_c3_c570_value);

-- stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_e074
stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_e074 : entity work.stack_pointer_get_0CLK_c35c94f1 port map (
clk,
stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_e074_CLOCK_ENABLE,
stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_e074_stack_index,
stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_e074_return_output);



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
 BIN_OP_GT_uxn_stack_h_l289_c6_2891_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b35a_return_output,
 result_MUX_uxn_stack_h_l289_c2_2431_return_output,
 halt_return_MUX_uxn_stack_h_l289_c2_2431_return_output,
 halt_uxn_stack_h_l290_c12_289b_return_output,
 BIN_OP_AND_uxn_stack_h_l297_c13_6bfb_return_output,
 BIN_OP_PLUS_uxn_stack_h_l297_c13_311e_return_output,
 BIN_OP_PLUS_uxn_stack_h_l297_c13_471a_return_output,
 BIN_OP_GT_uxn_stack_h_l298_c6_6113_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3b0a_return_output,
 result_MUX_uxn_stack_h_l298_c2_5b91_return_output,
 halt_return_MUX_uxn_stack_h_l298_c2_5b91_return_output,
 halt_uxn_stack_h_l299_c12_9471_return_output,
 BIN_OP_EQ_uxn_stack_h_l303_c6_2a03_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_89a8_return_output,
 stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_e074_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_mul : unsigned(7 downto 0);
 variable VAR_add : signed(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l289_c6_2891_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l289_c6_2891_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l289_c6_2891_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b35a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b35a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b35a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b35a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l289_c2_2431_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l289_c2_2431_iffalse : unsigned(7 downto 0);
 variable VAR_result_uxn_stack_h_l293_c3_915d : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l289_c2_2431_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l289_c2_2431_cond : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l289_c2_2431_iftrue : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l289_c2_2431_iffalse : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l289_c2_2431_return_output : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l289_c2_2431_cond : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l290_c12_289b_ins : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l290_c12_289b_err : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l290_c12_289b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l290_c12_289b_return_output : unsigned(7 downto 0);
 variable VAR_set_tmp_uxn_stack_h_l297_c2_f212 : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l297_c13_6bfb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l297_c13_6bfb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l297_c13_6bfb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_311e_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_311e_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_311e_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_471a_left : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_471a_right : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_471a_return_output : signed(10 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l298_c6_6113_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l298_c6_6113_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l298_c6_6113_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3b0a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3b0a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3b0a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3b0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l298_c2_5b91_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l298_c2_5b91_iffalse : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l298_c2_5b91_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l298_c2_5b91_cond : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l298_c2_5b91_iftrue : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l298_c2_5b91_iffalse : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l298_c2_5b91_return_output : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l298_c2_5b91_cond : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l299_c12_9471_ins : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l299_c12_9471_err : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l299_c12_9471_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l299_c12_9471_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l303_c6_2a03_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l303_c6_2a03_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l303_c6_2a03_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_89a8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_89a8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_89a8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_89a8_iffalse : unsigned(0 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l304_c3_c570_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l304_c3_c570_value : unsigned(7 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l304_c3_c570_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_e074_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_e074_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_e074_return_output : unsigned(7 downto 0);
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
     VAR_halt_return_MUX_uxn_stack_h_l298_c2_5b91_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3b0a_iffalse := to_unsigned(0, 1);
     VAR_halt_return_MUX_uxn_stack_h_l289_c2_2431_iftrue := to_unsigned(1, 1);
     VAR_result_uxn_stack_h_l293_c3_915d := resize(to_unsigned(0, 1), 8);
     VAR_result_MUX_uxn_stack_h_l289_c2_2431_iffalse := VAR_result_uxn_stack_h_l293_c3_915d;
     VAR_BIN_OP_EQ_uxn_stack_h_l303_c6_2a03_right := to_unsigned(0, 1);
     VAR_halt_uxn_stack_h_l290_c12_289b_err := resize(to_unsigned(1, 1), 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_89a8_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_stack_h_l298_c6_6113_right := to_unsigned(254, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b35a_iffalse := to_unsigned(0, 1);
     VAR_halt_return_MUX_uxn_stack_h_l289_c2_2431_iffalse := to_unsigned(0, 1);
     VAR_halt_uxn_stack_h_l299_c12_9471_err := resize(to_unsigned(2, 2), 8);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b35a_iftrue := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3b0a_iftrue := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_89a8_iftrue := VAR_CLOCK_ENABLE;
     VAR_stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_e074_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_311e_right := VAR_add;
     VAR_halt_uxn_stack_h_l290_c12_289b_ins := VAR_ins;
     VAR_halt_uxn_stack_h_l299_c12_9471_ins := VAR_ins;
     VAR_BIN_OP_AND_uxn_stack_h_l297_c13_6bfb_right := VAR_k;
     VAR_BIN_OP_AND_uxn_stack_h_l297_c13_6bfb_left := VAR_mul;
     VAR_BIN_OP_GT_uxn_stack_h_l289_c6_2891_left := VAR_mul;
     VAR_stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_e074_stack_index := VAR_stack_index;
     VAR_stack_pointer_set_uxn_stack_h_l304_c3_c570_stack_index := VAR_stack_index;
     -- BIN_OP_AND[uxn_stack_h_l297_c13_6bfb] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_stack_h_l297_c13_6bfb_left <= VAR_BIN_OP_AND_uxn_stack_h_l297_c13_6bfb_left;
     BIN_OP_AND_uxn_stack_h_l297_c13_6bfb_right <= VAR_BIN_OP_AND_uxn_stack_h_l297_c13_6bfb_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_stack_h_l297_c13_6bfb_return_output := BIN_OP_AND_uxn_stack_h_l297_c13_6bfb_return_output;

     -- stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_e074 LATENCY=0
     -- Clock enable
     stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_e074_CLOCK_ENABLE <= VAR_stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_e074_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_e074_stack_index <= VAR_stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_e074_stack_index;
     -- Outputs
     VAR_stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_e074_return_output := stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_e074_return_output;

     -- Submodule level 1
     VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_311e_left := signed(std_logic_vector(resize(VAR_BIN_OP_AND_uxn_stack_h_l297_c13_6bfb_return_output, 9)));
     VAR_BIN_OP_GT_uxn_stack_h_l289_c6_2891_right := VAR_stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_e074_return_output;
     VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_471a_right := signed(std_logic_vector(resize(VAR_stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_e074_return_output, 9)));
     -- BIN_OP_GT[uxn_stack_h_l289_c6_2891] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_stack_h_l289_c6_2891_left <= VAR_BIN_OP_GT_uxn_stack_h_l289_c6_2891_left;
     BIN_OP_GT_uxn_stack_h_l289_c6_2891_right <= VAR_BIN_OP_GT_uxn_stack_h_l289_c6_2891_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_stack_h_l289_c6_2891_return_output := BIN_OP_GT_uxn_stack_h_l289_c6_2891_return_output;

     -- BIN_OP_PLUS[uxn_stack_h_l297_c13_311e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_stack_h_l297_c13_311e_left <= VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_311e_left;
     BIN_OP_PLUS_uxn_stack_h_l297_c13_311e_right <= VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_311e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_311e_return_output := BIN_OP_PLUS_uxn_stack_h_l297_c13_311e_return_output;

     -- Submodule level 2
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b35a_cond := VAR_BIN_OP_GT_uxn_stack_h_l289_c6_2891_return_output;
     VAR_halt_return_MUX_uxn_stack_h_l289_c2_2431_cond := VAR_BIN_OP_GT_uxn_stack_h_l289_c6_2891_return_output;
     VAR_result_MUX_uxn_stack_h_l289_c2_2431_cond := VAR_BIN_OP_GT_uxn_stack_h_l289_c6_2891_return_output;
     VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_471a_left := VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_311e_return_output;
     -- BIN_OP_PLUS[uxn_stack_h_l297_c13_471a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_stack_h_l297_c13_471a_left <= VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_471a_left;
     BIN_OP_PLUS_uxn_stack_h_l297_c13_471a_right <= VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_471a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_471a_return_output := BIN_OP_PLUS_uxn_stack_h_l297_c13_471a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l289_c1_b35a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b35a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b35a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b35a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b35a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b35a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b35a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b35a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b35a_return_output;

     -- halt_return_MUX[uxn_stack_h_l289_c2_2431] LATENCY=0
     -- Inputs
     halt_return_MUX_uxn_stack_h_l289_c2_2431_cond <= VAR_halt_return_MUX_uxn_stack_h_l289_c2_2431_cond;
     halt_return_MUX_uxn_stack_h_l289_c2_2431_iftrue <= VAR_halt_return_MUX_uxn_stack_h_l289_c2_2431_iftrue;
     halt_return_MUX_uxn_stack_h_l289_c2_2431_iffalse <= VAR_halt_return_MUX_uxn_stack_h_l289_c2_2431_iffalse;
     -- Outputs
     VAR_halt_return_MUX_uxn_stack_h_l289_c2_2431_return_output := halt_return_MUX_uxn_stack_h_l289_c2_2431_return_output;

     -- Submodule level 3
     VAR_set_tmp_uxn_stack_h_l297_c2_f212 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_471a_return_output)),8);
     VAR_halt_uxn_stack_h_l290_c12_289b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_b35a_return_output;
     VAR_halt_return_MUX_uxn_stack_h_l298_c2_5b91_iffalse := VAR_halt_return_MUX_uxn_stack_h_l289_c2_2431_return_output;
     VAR_BIN_OP_GT_uxn_stack_h_l298_c6_6113_left := VAR_set_tmp_uxn_stack_h_l297_c2_f212;
     REG_VAR_set_tmp := VAR_set_tmp_uxn_stack_h_l297_c2_f212;
     VAR_stack_pointer_set_uxn_stack_h_l304_c3_c570_value := VAR_set_tmp_uxn_stack_h_l297_c2_f212;
     -- halt[uxn_stack_h_l290_c12_289b] LATENCY=0
     -- Clock enable
     halt_uxn_stack_h_l290_c12_289b_CLOCK_ENABLE <= VAR_halt_uxn_stack_h_l290_c12_289b_CLOCK_ENABLE;
     -- Inputs
     halt_uxn_stack_h_l290_c12_289b_ins <= VAR_halt_uxn_stack_h_l290_c12_289b_ins;
     halt_uxn_stack_h_l290_c12_289b_err <= VAR_halt_uxn_stack_h_l290_c12_289b_err;
     -- Outputs
     VAR_halt_uxn_stack_h_l290_c12_289b_return_output := halt_uxn_stack_h_l290_c12_289b_return_output;

     -- BIN_OP_GT[uxn_stack_h_l298_c6_6113] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_stack_h_l298_c6_6113_left <= VAR_BIN_OP_GT_uxn_stack_h_l298_c6_6113_left;
     BIN_OP_GT_uxn_stack_h_l298_c6_6113_right <= VAR_BIN_OP_GT_uxn_stack_h_l298_c6_6113_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_stack_h_l298_c6_6113_return_output := BIN_OP_GT_uxn_stack_h_l298_c6_6113_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3b0a_cond := VAR_BIN_OP_GT_uxn_stack_h_l298_c6_6113_return_output;
     VAR_halt_return_MUX_uxn_stack_h_l298_c2_5b91_cond := VAR_BIN_OP_GT_uxn_stack_h_l298_c6_6113_return_output;
     VAR_result_MUX_uxn_stack_h_l298_c2_5b91_cond := VAR_BIN_OP_GT_uxn_stack_h_l298_c6_6113_return_output;
     VAR_result_MUX_uxn_stack_h_l289_c2_2431_iftrue := VAR_halt_uxn_stack_h_l290_c12_289b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l298_c1_3b0a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3b0a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3b0a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3b0a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3b0a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3b0a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3b0a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3b0a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3b0a_return_output;

     -- halt_return_MUX[uxn_stack_h_l298_c2_5b91] LATENCY=0
     -- Inputs
     halt_return_MUX_uxn_stack_h_l298_c2_5b91_cond <= VAR_halt_return_MUX_uxn_stack_h_l298_c2_5b91_cond;
     halt_return_MUX_uxn_stack_h_l298_c2_5b91_iftrue <= VAR_halt_return_MUX_uxn_stack_h_l298_c2_5b91_iftrue;
     halt_return_MUX_uxn_stack_h_l298_c2_5b91_iffalse <= VAR_halt_return_MUX_uxn_stack_h_l298_c2_5b91_iffalse;
     -- Outputs
     VAR_halt_return_MUX_uxn_stack_h_l298_c2_5b91_return_output := halt_return_MUX_uxn_stack_h_l298_c2_5b91_return_output;

     -- result_MUX[uxn_stack_h_l289_c2_2431] LATENCY=0
     -- Inputs
     result_MUX_uxn_stack_h_l289_c2_2431_cond <= VAR_result_MUX_uxn_stack_h_l289_c2_2431_cond;
     result_MUX_uxn_stack_h_l289_c2_2431_iftrue <= VAR_result_MUX_uxn_stack_h_l289_c2_2431_iftrue;
     result_MUX_uxn_stack_h_l289_c2_2431_iffalse <= VAR_result_MUX_uxn_stack_h_l289_c2_2431_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_stack_h_l289_c2_2431_return_output := result_MUX_uxn_stack_h_l289_c2_2431_return_output;

     -- Submodule level 5
     VAR_halt_uxn_stack_h_l299_c12_9471_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_3b0a_return_output;
     VAR_BIN_OP_EQ_uxn_stack_h_l303_c6_2a03_left := VAR_halt_return_MUX_uxn_stack_h_l298_c2_5b91_return_output;
     REG_VAR_halt_return := VAR_halt_return_MUX_uxn_stack_h_l298_c2_5b91_return_output;
     VAR_result_MUX_uxn_stack_h_l298_c2_5b91_iffalse := VAR_result_MUX_uxn_stack_h_l289_c2_2431_return_output;
     -- halt[uxn_stack_h_l299_c12_9471] LATENCY=0
     -- Clock enable
     halt_uxn_stack_h_l299_c12_9471_CLOCK_ENABLE <= VAR_halt_uxn_stack_h_l299_c12_9471_CLOCK_ENABLE;
     -- Inputs
     halt_uxn_stack_h_l299_c12_9471_ins <= VAR_halt_uxn_stack_h_l299_c12_9471_ins;
     halt_uxn_stack_h_l299_c12_9471_err <= VAR_halt_uxn_stack_h_l299_c12_9471_err;
     -- Outputs
     VAR_halt_uxn_stack_h_l299_c12_9471_return_output := halt_uxn_stack_h_l299_c12_9471_return_output;

     -- BIN_OP_EQ[uxn_stack_h_l303_c6_2a03] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_stack_h_l303_c6_2a03_left <= VAR_BIN_OP_EQ_uxn_stack_h_l303_c6_2a03_left;
     BIN_OP_EQ_uxn_stack_h_l303_c6_2a03_right <= VAR_BIN_OP_EQ_uxn_stack_h_l303_c6_2a03_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_stack_h_l303_c6_2a03_return_output := BIN_OP_EQ_uxn_stack_h_l303_c6_2a03_return_output;

     -- Submodule level 6
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_89a8_cond := VAR_BIN_OP_EQ_uxn_stack_h_l303_c6_2a03_return_output;
     VAR_result_MUX_uxn_stack_h_l298_c2_5b91_iftrue := VAR_halt_uxn_stack_h_l299_c12_9471_return_output;
     -- result_MUX[uxn_stack_h_l298_c2_5b91] LATENCY=0
     -- Inputs
     result_MUX_uxn_stack_h_l298_c2_5b91_cond <= VAR_result_MUX_uxn_stack_h_l298_c2_5b91_cond;
     result_MUX_uxn_stack_h_l298_c2_5b91_iftrue <= VAR_result_MUX_uxn_stack_h_l298_c2_5b91_iftrue;
     result_MUX_uxn_stack_h_l298_c2_5b91_iffalse <= VAR_result_MUX_uxn_stack_h_l298_c2_5b91_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_stack_h_l298_c2_5b91_return_output := result_MUX_uxn_stack_h_l298_c2_5b91_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l303_c1_89a8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_89a8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_89a8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_89a8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_89a8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_89a8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_89a8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_89a8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_89a8_return_output;

     -- Submodule level 7
     VAR_stack_pointer_set_uxn_stack_h_l304_c3_c570_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_89a8_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_stack_h_l298_c2_5b91_return_output;
     VAR_return_output := VAR_result_MUX_uxn_stack_h_l298_c2_5b91_return_output;
     -- stack_pointer_set[uxn_stack_h_l304_c3_c570] LATENCY=0
     -- Clock enable
     stack_pointer_set_uxn_stack_h_l304_c3_c570_CLOCK_ENABLE <= VAR_stack_pointer_set_uxn_stack_h_l304_c3_c570_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_set_uxn_stack_h_l304_c3_c570_stack_index <= VAR_stack_pointer_set_uxn_stack_h_l304_c3_c570_stack_index;
     stack_pointer_set_uxn_stack_h_l304_c3_c570_value <= VAR_stack_pointer_set_uxn_stack_h_l304_c3_c570_value;
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
