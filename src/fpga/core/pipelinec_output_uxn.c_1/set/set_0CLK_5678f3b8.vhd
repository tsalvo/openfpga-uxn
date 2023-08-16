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
entity set_0CLK_5678f3b8 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 mul : in unsigned(7 downto 0);
 add : in signed(7 downto 0);
 return_output : out unsigned(7 downto 0));
end set_0CLK_5678f3b8;
architecture arch of set_0CLK_5678f3b8 is
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
-- BIN_OP_GT[uxn_stack_h_l289_c6_929d]
signal BIN_OP_GT_uxn_stack_h_l289_c6_929d_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l289_c6_929d_right : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l289_c6_929d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l289_c1_65a5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_65a5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_65a5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_65a5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_65a5_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_stack_h_l289_c2_9f9a]
signal result_MUX_uxn_stack_h_l289_c2_9f9a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_stack_h_l289_c2_9f9a_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l289_c2_9f9a_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l289_c2_9f9a_return_output : unsigned(7 downto 0);

-- halt_return_MUX[uxn_stack_h_l289_c2_9f9a]
signal halt_return_MUX_uxn_stack_h_l289_c2_9f9a_cond : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l289_c2_9f9a_iftrue : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l289_c2_9f9a_iffalse : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l289_c2_9f9a_return_output : unsigned(0 downto 0);

-- halt[uxn_stack_h_l290_c12_ec78]
signal halt_uxn_stack_h_l290_c12_ec78_CLOCK_ENABLE : unsigned(0 downto 0);
signal halt_uxn_stack_h_l290_c12_ec78_ins : unsigned(7 downto 0);
signal halt_uxn_stack_h_l290_c12_ec78_err : unsigned(7 downto 0);
signal halt_uxn_stack_h_l290_c12_ec78_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_stack_h_l297_c13_a45a]
signal BIN_OP_AND_uxn_stack_h_l297_c13_a45a_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_stack_h_l297_c13_a45a_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_stack_h_l297_c13_a45a_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_stack_h_l297_c13_9fe2]
signal BIN_OP_PLUS_uxn_stack_h_l297_c13_9fe2_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l297_c13_9fe2_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l297_c13_9fe2_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_stack_h_l297_c13_09e9]
signal BIN_OP_PLUS_uxn_stack_h_l297_c13_09e9_left : signed(9 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l297_c13_09e9_right : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l297_c13_09e9_return_output : signed(10 downto 0);

-- BIN_OP_GT[uxn_stack_h_l298_c6_9dde]
signal BIN_OP_GT_uxn_stack_h_l298_c6_9dde_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l298_c6_9dde_right : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l298_c6_9dde_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l298_c1_e7bd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_e7bd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_e7bd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_e7bd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_e7bd_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_stack_h_l298_c2_7cd8]
signal result_MUX_uxn_stack_h_l298_c2_7cd8_cond : unsigned(0 downto 0);
signal result_MUX_uxn_stack_h_l298_c2_7cd8_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l298_c2_7cd8_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l298_c2_7cd8_return_output : unsigned(7 downto 0);

-- halt_return_MUX[uxn_stack_h_l298_c2_7cd8]
signal halt_return_MUX_uxn_stack_h_l298_c2_7cd8_cond : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l298_c2_7cd8_iftrue : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l298_c2_7cd8_iffalse : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l298_c2_7cd8_return_output : unsigned(0 downto 0);

-- halt[uxn_stack_h_l299_c12_66a7]
signal halt_uxn_stack_h_l299_c12_66a7_CLOCK_ENABLE : unsigned(0 downto 0);
signal halt_uxn_stack_h_l299_c12_66a7_ins : unsigned(7 downto 0);
signal halt_uxn_stack_h_l299_c12_66a7_err : unsigned(7 downto 0);
signal halt_uxn_stack_h_l299_c12_66a7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_stack_h_l303_c6_e0c7]
signal BIN_OP_EQ_uxn_stack_h_l303_c6_e0c7_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l303_c6_e0c7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l303_c6_e0c7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l303_c1_d618]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_d618_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_d618_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_d618_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_d618_return_output : unsigned(0 downto 0);

-- stack_pointer_set[uxn_stack_h_l304_c3_b493]
signal stack_pointer_set_uxn_stack_h_l304_c3_b493_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_set_uxn_stack_h_l304_c3_b493_stack_index : unsigned(0 downto 0);
signal stack_pointer_set_uxn_stack_h_l304_c3_b493_value : unsigned(7 downto 0);

-- stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_e187
signal stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_e187_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_e187_stack_index : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_e187_return_output : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_GT_uxn_stack_h_l289_c6_929d
BIN_OP_GT_uxn_stack_h_l289_c6_929d : entity work.BIN_OP_GT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_stack_h_l289_c6_929d_left,
BIN_OP_GT_uxn_stack_h_l289_c6_929d_right,
BIN_OP_GT_uxn_stack_h_l289_c6_929d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_65a5
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_65a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_65a5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_65a5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_65a5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_65a5_return_output);

-- result_MUX_uxn_stack_h_l289_c2_9f9a
result_MUX_uxn_stack_h_l289_c2_9f9a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_stack_h_l289_c2_9f9a_cond,
result_MUX_uxn_stack_h_l289_c2_9f9a_iftrue,
result_MUX_uxn_stack_h_l289_c2_9f9a_iffalse,
result_MUX_uxn_stack_h_l289_c2_9f9a_return_output);

-- halt_return_MUX_uxn_stack_h_l289_c2_9f9a
halt_return_MUX_uxn_stack_h_l289_c2_9f9a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
halt_return_MUX_uxn_stack_h_l289_c2_9f9a_cond,
halt_return_MUX_uxn_stack_h_l289_c2_9f9a_iftrue,
halt_return_MUX_uxn_stack_h_l289_c2_9f9a_iffalse,
halt_return_MUX_uxn_stack_h_l289_c2_9f9a_return_output);

-- halt_uxn_stack_h_l290_c12_ec78
halt_uxn_stack_h_l290_c12_ec78 : entity work.halt_0CLK_e55decfc port map (
clk,
halt_uxn_stack_h_l290_c12_ec78_CLOCK_ENABLE,
halt_uxn_stack_h_l290_c12_ec78_ins,
halt_uxn_stack_h_l290_c12_ec78_err,
halt_uxn_stack_h_l290_c12_ec78_return_output);

-- BIN_OP_AND_uxn_stack_h_l297_c13_a45a
BIN_OP_AND_uxn_stack_h_l297_c13_a45a : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_stack_h_l297_c13_a45a_left,
BIN_OP_AND_uxn_stack_h_l297_c13_a45a_right,
BIN_OP_AND_uxn_stack_h_l297_c13_a45a_return_output);

-- BIN_OP_PLUS_uxn_stack_h_l297_c13_9fe2
BIN_OP_PLUS_uxn_stack_h_l297_c13_9fe2 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_stack_h_l297_c13_9fe2_left,
BIN_OP_PLUS_uxn_stack_h_l297_c13_9fe2_right,
BIN_OP_PLUS_uxn_stack_h_l297_c13_9fe2_return_output);

-- BIN_OP_PLUS_uxn_stack_h_l297_c13_09e9
BIN_OP_PLUS_uxn_stack_h_l297_c13_09e9 : entity work.BIN_OP_PLUS_int10_t_int9_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_stack_h_l297_c13_09e9_left,
BIN_OP_PLUS_uxn_stack_h_l297_c13_09e9_right,
BIN_OP_PLUS_uxn_stack_h_l297_c13_09e9_return_output);

-- BIN_OP_GT_uxn_stack_h_l298_c6_9dde
BIN_OP_GT_uxn_stack_h_l298_c6_9dde : entity work.BIN_OP_GT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_stack_h_l298_c6_9dde_left,
BIN_OP_GT_uxn_stack_h_l298_c6_9dde_right,
BIN_OP_GT_uxn_stack_h_l298_c6_9dde_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_e7bd
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_e7bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_e7bd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_e7bd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_e7bd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_e7bd_return_output);

-- result_MUX_uxn_stack_h_l298_c2_7cd8
result_MUX_uxn_stack_h_l298_c2_7cd8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_stack_h_l298_c2_7cd8_cond,
result_MUX_uxn_stack_h_l298_c2_7cd8_iftrue,
result_MUX_uxn_stack_h_l298_c2_7cd8_iffalse,
result_MUX_uxn_stack_h_l298_c2_7cd8_return_output);

-- halt_return_MUX_uxn_stack_h_l298_c2_7cd8
halt_return_MUX_uxn_stack_h_l298_c2_7cd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
halt_return_MUX_uxn_stack_h_l298_c2_7cd8_cond,
halt_return_MUX_uxn_stack_h_l298_c2_7cd8_iftrue,
halt_return_MUX_uxn_stack_h_l298_c2_7cd8_iffalse,
halt_return_MUX_uxn_stack_h_l298_c2_7cd8_return_output);

-- halt_uxn_stack_h_l299_c12_66a7
halt_uxn_stack_h_l299_c12_66a7 : entity work.halt_0CLK_e55decfc port map (
clk,
halt_uxn_stack_h_l299_c12_66a7_CLOCK_ENABLE,
halt_uxn_stack_h_l299_c12_66a7_ins,
halt_uxn_stack_h_l299_c12_66a7_err,
halt_uxn_stack_h_l299_c12_66a7_return_output);

-- BIN_OP_EQ_uxn_stack_h_l303_c6_e0c7
BIN_OP_EQ_uxn_stack_h_l303_c6_e0c7 : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_stack_h_l303_c6_e0c7_left,
BIN_OP_EQ_uxn_stack_h_l303_c6_e0c7_right,
BIN_OP_EQ_uxn_stack_h_l303_c6_e0c7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_d618
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_d618 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_d618_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_d618_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_d618_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_d618_return_output);

-- stack_pointer_set_uxn_stack_h_l304_c3_b493
stack_pointer_set_uxn_stack_h_l304_c3_b493 : entity work.stack_pointer_set_0CLK_88c0218f port map (
clk,
stack_pointer_set_uxn_stack_h_l304_c3_b493_CLOCK_ENABLE,
stack_pointer_set_uxn_stack_h_l304_c3_b493_stack_index,
stack_pointer_set_uxn_stack_h_l304_c3_b493_value);

-- stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_e187
stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_e187 : entity work.stack_pointer_get_0CLK_c35c94f1 port map (
clk,
stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_e187_CLOCK_ENABLE,
stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_e187_stack_index,
stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_e187_return_output);



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
 BIN_OP_GT_uxn_stack_h_l289_c6_929d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_65a5_return_output,
 result_MUX_uxn_stack_h_l289_c2_9f9a_return_output,
 halt_return_MUX_uxn_stack_h_l289_c2_9f9a_return_output,
 halt_uxn_stack_h_l290_c12_ec78_return_output,
 BIN_OP_AND_uxn_stack_h_l297_c13_a45a_return_output,
 BIN_OP_PLUS_uxn_stack_h_l297_c13_9fe2_return_output,
 BIN_OP_PLUS_uxn_stack_h_l297_c13_09e9_return_output,
 BIN_OP_GT_uxn_stack_h_l298_c6_9dde_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_e7bd_return_output,
 result_MUX_uxn_stack_h_l298_c2_7cd8_return_output,
 halt_return_MUX_uxn_stack_h_l298_c2_7cd8_return_output,
 halt_uxn_stack_h_l299_c12_66a7_return_output,
 BIN_OP_EQ_uxn_stack_h_l303_c6_e0c7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_d618_return_output,
 stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_e187_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_mul : unsigned(7 downto 0);
 variable VAR_add : signed(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l289_c6_929d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l289_c6_929d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l289_c6_929d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_65a5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_65a5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_65a5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_65a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l289_c2_9f9a_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l289_c2_9f9a_iffalse : unsigned(7 downto 0);
 variable VAR_result_uxn_stack_h_l293_c3_527f : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l289_c2_9f9a_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l289_c2_9f9a_cond : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l289_c2_9f9a_iftrue : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l289_c2_9f9a_iffalse : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l289_c2_9f9a_return_output : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l289_c2_9f9a_cond : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l290_c12_ec78_ins : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l290_c12_ec78_err : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l290_c12_ec78_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l290_c12_ec78_return_output : unsigned(7 downto 0);
 variable VAR_set_tmp_uxn_stack_h_l297_c2_5b13 : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l297_c13_a45a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l297_c13_a45a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l297_c13_a45a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_9fe2_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_9fe2_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_9fe2_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_09e9_left : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_09e9_right : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_09e9_return_output : signed(10 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l298_c6_9dde_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l298_c6_9dde_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l298_c6_9dde_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_e7bd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_e7bd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_e7bd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_e7bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l298_c2_7cd8_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l298_c2_7cd8_iffalse : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l298_c2_7cd8_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l298_c2_7cd8_cond : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l298_c2_7cd8_iftrue : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l298_c2_7cd8_iffalse : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l298_c2_7cd8_return_output : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l298_c2_7cd8_cond : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l299_c12_66a7_ins : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l299_c12_66a7_err : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l299_c12_66a7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l299_c12_66a7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l303_c6_e0c7_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l303_c6_e0c7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l303_c6_e0c7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_d618_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_d618_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_d618_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_d618_iffalse : unsigned(0 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l304_c3_b493_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l304_c3_b493_value : unsigned(7 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l304_c3_b493_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_e187_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_e187_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_e187_return_output : unsigned(7 downto 0);
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
     VAR_halt_return_MUX_uxn_stack_h_l298_c2_7cd8_iftrue := to_unsigned(1, 1);
     VAR_halt_return_MUX_uxn_stack_h_l289_c2_9f9a_iftrue := to_unsigned(1, 1);
     VAR_halt_return_MUX_uxn_stack_h_l289_c2_9f9a_iffalse := to_unsigned(0, 1);
     VAR_halt_uxn_stack_h_l290_c12_ec78_err := resize(to_unsigned(1, 1), 8);
     VAR_halt_uxn_stack_h_l299_c12_66a7_err := resize(to_unsigned(2, 2), 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_e7bd_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_stack_h_l303_c6_e0c7_right := to_unsigned(0, 1);
     VAR_result_uxn_stack_h_l293_c3_527f := resize(to_unsigned(0, 1), 8);
     VAR_result_MUX_uxn_stack_h_l289_c2_9f9a_iffalse := VAR_result_uxn_stack_h_l293_c3_527f;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_65a5_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_d618_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_stack_h_l298_c6_9dde_right := to_unsigned(254, 8);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_65a5_iftrue := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_e7bd_iftrue := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_d618_iftrue := VAR_CLOCK_ENABLE;
     VAR_stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_e187_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_9fe2_right := VAR_add;
     VAR_halt_uxn_stack_h_l290_c12_ec78_ins := VAR_ins;
     VAR_halt_uxn_stack_h_l299_c12_66a7_ins := VAR_ins;
     VAR_BIN_OP_AND_uxn_stack_h_l297_c13_a45a_right := VAR_k;
     VAR_BIN_OP_AND_uxn_stack_h_l297_c13_a45a_left := VAR_mul;
     VAR_BIN_OP_GT_uxn_stack_h_l289_c6_929d_left := VAR_mul;
     VAR_stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_e187_stack_index := VAR_stack_index;
     VAR_stack_pointer_set_uxn_stack_h_l304_c3_b493_stack_index := VAR_stack_index;
     -- stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_e187 LATENCY=0
     -- Clock enable
     stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_e187_CLOCK_ENABLE <= VAR_stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_e187_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_e187_stack_index <= VAR_stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_e187_stack_index;
     -- Outputs
     VAR_stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_e187_return_output := stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_e187_return_output;

     -- BIN_OP_AND[uxn_stack_h_l297_c13_a45a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_stack_h_l297_c13_a45a_left <= VAR_BIN_OP_AND_uxn_stack_h_l297_c13_a45a_left;
     BIN_OP_AND_uxn_stack_h_l297_c13_a45a_right <= VAR_BIN_OP_AND_uxn_stack_h_l297_c13_a45a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_stack_h_l297_c13_a45a_return_output := BIN_OP_AND_uxn_stack_h_l297_c13_a45a_return_output;

     -- Submodule level 1
     VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_9fe2_left := signed(std_logic_vector(resize(VAR_BIN_OP_AND_uxn_stack_h_l297_c13_a45a_return_output, 9)));
     VAR_BIN_OP_GT_uxn_stack_h_l289_c6_929d_right := VAR_stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_e187_return_output;
     VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_09e9_right := signed(std_logic_vector(resize(VAR_stack_pointer_get_uxn_stack_h_l297_l289_DUPLICATE_e187_return_output, 9)));
     -- BIN_OP_GT[uxn_stack_h_l289_c6_929d] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_stack_h_l289_c6_929d_left <= VAR_BIN_OP_GT_uxn_stack_h_l289_c6_929d_left;
     BIN_OP_GT_uxn_stack_h_l289_c6_929d_right <= VAR_BIN_OP_GT_uxn_stack_h_l289_c6_929d_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_stack_h_l289_c6_929d_return_output := BIN_OP_GT_uxn_stack_h_l289_c6_929d_return_output;

     -- BIN_OP_PLUS[uxn_stack_h_l297_c13_9fe2] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_stack_h_l297_c13_9fe2_left <= VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_9fe2_left;
     BIN_OP_PLUS_uxn_stack_h_l297_c13_9fe2_right <= VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_9fe2_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_9fe2_return_output := BIN_OP_PLUS_uxn_stack_h_l297_c13_9fe2_return_output;

     -- Submodule level 2
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_65a5_cond := VAR_BIN_OP_GT_uxn_stack_h_l289_c6_929d_return_output;
     VAR_halt_return_MUX_uxn_stack_h_l289_c2_9f9a_cond := VAR_BIN_OP_GT_uxn_stack_h_l289_c6_929d_return_output;
     VAR_result_MUX_uxn_stack_h_l289_c2_9f9a_cond := VAR_BIN_OP_GT_uxn_stack_h_l289_c6_929d_return_output;
     VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_09e9_left := VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_9fe2_return_output;
     -- halt_return_MUX[uxn_stack_h_l289_c2_9f9a] LATENCY=0
     -- Inputs
     halt_return_MUX_uxn_stack_h_l289_c2_9f9a_cond <= VAR_halt_return_MUX_uxn_stack_h_l289_c2_9f9a_cond;
     halt_return_MUX_uxn_stack_h_l289_c2_9f9a_iftrue <= VAR_halt_return_MUX_uxn_stack_h_l289_c2_9f9a_iftrue;
     halt_return_MUX_uxn_stack_h_l289_c2_9f9a_iffalse <= VAR_halt_return_MUX_uxn_stack_h_l289_c2_9f9a_iffalse;
     -- Outputs
     VAR_halt_return_MUX_uxn_stack_h_l289_c2_9f9a_return_output := halt_return_MUX_uxn_stack_h_l289_c2_9f9a_return_output;

     -- BIN_OP_PLUS[uxn_stack_h_l297_c13_09e9] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_stack_h_l297_c13_09e9_left <= VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_09e9_left;
     BIN_OP_PLUS_uxn_stack_h_l297_c13_09e9_right <= VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_09e9_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_09e9_return_output := BIN_OP_PLUS_uxn_stack_h_l297_c13_09e9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l289_c1_65a5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_65a5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_65a5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_65a5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_65a5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_65a5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_65a5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_65a5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_65a5_return_output;

     -- Submodule level 3
     VAR_set_tmp_uxn_stack_h_l297_c2_5b13 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_09e9_return_output)),8);
     VAR_halt_uxn_stack_h_l290_c12_ec78_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_65a5_return_output;
     VAR_halt_return_MUX_uxn_stack_h_l298_c2_7cd8_iffalse := VAR_halt_return_MUX_uxn_stack_h_l289_c2_9f9a_return_output;
     VAR_BIN_OP_GT_uxn_stack_h_l298_c6_9dde_left := VAR_set_tmp_uxn_stack_h_l297_c2_5b13;
     REG_VAR_set_tmp := VAR_set_tmp_uxn_stack_h_l297_c2_5b13;
     VAR_stack_pointer_set_uxn_stack_h_l304_c3_b493_value := VAR_set_tmp_uxn_stack_h_l297_c2_5b13;
     -- halt[uxn_stack_h_l290_c12_ec78] LATENCY=0
     -- Clock enable
     halt_uxn_stack_h_l290_c12_ec78_CLOCK_ENABLE <= VAR_halt_uxn_stack_h_l290_c12_ec78_CLOCK_ENABLE;
     -- Inputs
     halt_uxn_stack_h_l290_c12_ec78_ins <= VAR_halt_uxn_stack_h_l290_c12_ec78_ins;
     halt_uxn_stack_h_l290_c12_ec78_err <= VAR_halt_uxn_stack_h_l290_c12_ec78_err;
     -- Outputs
     VAR_halt_uxn_stack_h_l290_c12_ec78_return_output := halt_uxn_stack_h_l290_c12_ec78_return_output;

     -- BIN_OP_GT[uxn_stack_h_l298_c6_9dde] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_stack_h_l298_c6_9dde_left <= VAR_BIN_OP_GT_uxn_stack_h_l298_c6_9dde_left;
     BIN_OP_GT_uxn_stack_h_l298_c6_9dde_right <= VAR_BIN_OP_GT_uxn_stack_h_l298_c6_9dde_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_stack_h_l298_c6_9dde_return_output := BIN_OP_GT_uxn_stack_h_l298_c6_9dde_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_e7bd_cond := VAR_BIN_OP_GT_uxn_stack_h_l298_c6_9dde_return_output;
     VAR_halt_return_MUX_uxn_stack_h_l298_c2_7cd8_cond := VAR_BIN_OP_GT_uxn_stack_h_l298_c6_9dde_return_output;
     VAR_result_MUX_uxn_stack_h_l298_c2_7cd8_cond := VAR_BIN_OP_GT_uxn_stack_h_l298_c6_9dde_return_output;
     VAR_result_MUX_uxn_stack_h_l289_c2_9f9a_iftrue := VAR_halt_uxn_stack_h_l290_c12_ec78_return_output;
     -- result_MUX[uxn_stack_h_l289_c2_9f9a] LATENCY=0
     -- Inputs
     result_MUX_uxn_stack_h_l289_c2_9f9a_cond <= VAR_result_MUX_uxn_stack_h_l289_c2_9f9a_cond;
     result_MUX_uxn_stack_h_l289_c2_9f9a_iftrue <= VAR_result_MUX_uxn_stack_h_l289_c2_9f9a_iftrue;
     result_MUX_uxn_stack_h_l289_c2_9f9a_iffalse <= VAR_result_MUX_uxn_stack_h_l289_c2_9f9a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_stack_h_l289_c2_9f9a_return_output := result_MUX_uxn_stack_h_l289_c2_9f9a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l298_c1_e7bd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_e7bd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_e7bd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_e7bd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_e7bd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_e7bd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_e7bd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_e7bd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_e7bd_return_output;

     -- halt_return_MUX[uxn_stack_h_l298_c2_7cd8] LATENCY=0
     -- Inputs
     halt_return_MUX_uxn_stack_h_l298_c2_7cd8_cond <= VAR_halt_return_MUX_uxn_stack_h_l298_c2_7cd8_cond;
     halt_return_MUX_uxn_stack_h_l298_c2_7cd8_iftrue <= VAR_halt_return_MUX_uxn_stack_h_l298_c2_7cd8_iftrue;
     halt_return_MUX_uxn_stack_h_l298_c2_7cd8_iffalse <= VAR_halt_return_MUX_uxn_stack_h_l298_c2_7cd8_iffalse;
     -- Outputs
     VAR_halt_return_MUX_uxn_stack_h_l298_c2_7cd8_return_output := halt_return_MUX_uxn_stack_h_l298_c2_7cd8_return_output;

     -- Submodule level 5
     VAR_halt_uxn_stack_h_l299_c12_66a7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_e7bd_return_output;
     VAR_BIN_OP_EQ_uxn_stack_h_l303_c6_e0c7_left := VAR_halt_return_MUX_uxn_stack_h_l298_c2_7cd8_return_output;
     REG_VAR_halt_return := VAR_halt_return_MUX_uxn_stack_h_l298_c2_7cd8_return_output;
     VAR_result_MUX_uxn_stack_h_l298_c2_7cd8_iffalse := VAR_result_MUX_uxn_stack_h_l289_c2_9f9a_return_output;
     -- halt[uxn_stack_h_l299_c12_66a7] LATENCY=0
     -- Clock enable
     halt_uxn_stack_h_l299_c12_66a7_CLOCK_ENABLE <= VAR_halt_uxn_stack_h_l299_c12_66a7_CLOCK_ENABLE;
     -- Inputs
     halt_uxn_stack_h_l299_c12_66a7_ins <= VAR_halt_uxn_stack_h_l299_c12_66a7_ins;
     halt_uxn_stack_h_l299_c12_66a7_err <= VAR_halt_uxn_stack_h_l299_c12_66a7_err;
     -- Outputs
     VAR_halt_uxn_stack_h_l299_c12_66a7_return_output := halt_uxn_stack_h_l299_c12_66a7_return_output;

     -- BIN_OP_EQ[uxn_stack_h_l303_c6_e0c7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_stack_h_l303_c6_e0c7_left <= VAR_BIN_OP_EQ_uxn_stack_h_l303_c6_e0c7_left;
     BIN_OP_EQ_uxn_stack_h_l303_c6_e0c7_right <= VAR_BIN_OP_EQ_uxn_stack_h_l303_c6_e0c7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_stack_h_l303_c6_e0c7_return_output := BIN_OP_EQ_uxn_stack_h_l303_c6_e0c7_return_output;

     -- Submodule level 6
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_d618_cond := VAR_BIN_OP_EQ_uxn_stack_h_l303_c6_e0c7_return_output;
     VAR_result_MUX_uxn_stack_h_l298_c2_7cd8_iftrue := VAR_halt_uxn_stack_h_l299_c12_66a7_return_output;
     -- result_MUX[uxn_stack_h_l298_c2_7cd8] LATENCY=0
     -- Inputs
     result_MUX_uxn_stack_h_l298_c2_7cd8_cond <= VAR_result_MUX_uxn_stack_h_l298_c2_7cd8_cond;
     result_MUX_uxn_stack_h_l298_c2_7cd8_iftrue <= VAR_result_MUX_uxn_stack_h_l298_c2_7cd8_iftrue;
     result_MUX_uxn_stack_h_l298_c2_7cd8_iffalse <= VAR_result_MUX_uxn_stack_h_l298_c2_7cd8_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_stack_h_l298_c2_7cd8_return_output := result_MUX_uxn_stack_h_l298_c2_7cd8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l303_c1_d618] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_d618_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_d618_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_d618_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_d618_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_d618_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_d618_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_d618_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_d618_return_output;

     -- Submodule level 7
     VAR_stack_pointer_set_uxn_stack_h_l304_c3_b493_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_d618_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_stack_h_l298_c2_7cd8_return_output;
     VAR_return_output := VAR_result_MUX_uxn_stack_h_l298_c2_7cd8_return_output;
     -- stack_pointer_set[uxn_stack_h_l304_c3_b493] LATENCY=0
     -- Clock enable
     stack_pointer_set_uxn_stack_h_l304_c3_b493_CLOCK_ENABLE <= VAR_stack_pointer_set_uxn_stack_h_l304_c3_b493_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_set_uxn_stack_h_l304_c3_b493_stack_index <= VAR_stack_pointer_set_uxn_stack_h_l304_c3_b493_stack_index;
     stack_pointer_set_uxn_stack_h_l304_c3_b493_value <= VAR_stack_pointer_set_uxn_stack_h_l304_c3_b493_value;
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
