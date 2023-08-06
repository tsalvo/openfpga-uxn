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
-- BIN_OP_GT[uxn_stack_h_l289_c6_7cbd]
signal BIN_OP_GT_uxn_stack_h_l289_c6_7cbd_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l289_c6_7cbd_right : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l289_c6_7cbd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l289_c1_6bcd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_6bcd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_6bcd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_6bcd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_6bcd_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_stack_h_l289_c2_1456]
signal result_MUX_uxn_stack_h_l289_c2_1456_cond : unsigned(0 downto 0);
signal result_MUX_uxn_stack_h_l289_c2_1456_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l289_c2_1456_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l289_c2_1456_return_output : unsigned(7 downto 0);

-- halt_return_MUX[uxn_stack_h_l289_c2_1456]
signal halt_return_MUX_uxn_stack_h_l289_c2_1456_cond : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l289_c2_1456_iftrue : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l289_c2_1456_iffalse : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l289_c2_1456_return_output : unsigned(0 downto 0);

-- halt[uxn_stack_h_l290_c12_5c76]
signal halt_uxn_stack_h_l290_c12_5c76_CLOCK_ENABLE : unsigned(0 downto 0);
signal halt_uxn_stack_h_l290_c12_5c76_ins : unsigned(7 downto 0);
signal halt_uxn_stack_h_l290_c12_5c76_err : unsigned(7 downto 0);
signal halt_uxn_stack_h_l290_c12_5c76_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_stack_h_l297_c13_417c]
signal BIN_OP_AND_uxn_stack_h_l297_c13_417c_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_stack_h_l297_c13_417c_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_stack_h_l297_c13_417c_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_stack_h_l297_c13_c0ea]
signal BIN_OP_PLUS_uxn_stack_h_l297_c13_c0ea_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l297_c13_c0ea_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l297_c13_c0ea_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_stack_h_l297_c13_ef60]
signal BIN_OP_PLUS_uxn_stack_h_l297_c13_ef60_left : signed(9 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l297_c13_ef60_right : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l297_c13_ef60_return_output : signed(10 downto 0);

-- BIN_OP_GT[uxn_stack_h_l298_c6_a1e5]
signal BIN_OP_GT_uxn_stack_h_l298_c6_a1e5_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l298_c6_a1e5_right : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l298_c6_a1e5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l298_c1_6c23]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_6c23_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_6c23_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_6c23_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_6c23_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_stack_h_l298_c2_21c6]
signal result_MUX_uxn_stack_h_l298_c2_21c6_cond : unsigned(0 downto 0);
signal result_MUX_uxn_stack_h_l298_c2_21c6_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l298_c2_21c6_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l298_c2_21c6_return_output : unsigned(7 downto 0);

-- halt_return_MUX[uxn_stack_h_l298_c2_21c6]
signal halt_return_MUX_uxn_stack_h_l298_c2_21c6_cond : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l298_c2_21c6_iftrue : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l298_c2_21c6_iffalse : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l298_c2_21c6_return_output : unsigned(0 downto 0);

-- halt[uxn_stack_h_l299_c12_be1d]
signal halt_uxn_stack_h_l299_c12_be1d_CLOCK_ENABLE : unsigned(0 downto 0);
signal halt_uxn_stack_h_l299_c12_be1d_ins : unsigned(7 downto 0);
signal halt_uxn_stack_h_l299_c12_be1d_err : unsigned(7 downto 0);
signal halt_uxn_stack_h_l299_c12_be1d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_stack_h_l303_c6_f1f8]
signal BIN_OP_EQ_uxn_stack_h_l303_c6_f1f8_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l303_c6_f1f8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l303_c6_f1f8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l303_c1_f8b5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_f8b5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_f8b5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_f8b5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_f8b5_return_output : unsigned(0 downto 0);

-- stack_pointer_set[uxn_stack_h_l304_c3_43fa]
signal stack_pointer_set_uxn_stack_h_l304_c3_43fa_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_set_uxn_stack_h_l304_c3_43fa_stack_index : unsigned(0 downto 0);
signal stack_pointer_set_uxn_stack_h_l304_c3_43fa_value : unsigned(7 downto 0);

-- stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_60f1
signal stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_60f1_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_60f1_stack_index : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_60f1_return_output : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_GT_uxn_stack_h_l289_c6_7cbd
BIN_OP_GT_uxn_stack_h_l289_c6_7cbd : entity work.BIN_OP_GT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_stack_h_l289_c6_7cbd_left,
BIN_OP_GT_uxn_stack_h_l289_c6_7cbd_right,
BIN_OP_GT_uxn_stack_h_l289_c6_7cbd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_6bcd
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_6bcd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_6bcd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_6bcd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_6bcd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_6bcd_return_output);

-- result_MUX_uxn_stack_h_l289_c2_1456
result_MUX_uxn_stack_h_l289_c2_1456 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_stack_h_l289_c2_1456_cond,
result_MUX_uxn_stack_h_l289_c2_1456_iftrue,
result_MUX_uxn_stack_h_l289_c2_1456_iffalse,
result_MUX_uxn_stack_h_l289_c2_1456_return_output);

-- halt_return_MUX_uxn_stack_h_l289_c2_1456
halt_return_MUX_uxn_stack_h_l289_c2_1456 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
halt_return_MUX_uxn_stack_h_l289_c2_1456_cond,
halt_return_MUX_uxn_stack_h_l289_c2_1456_iftrue,
halt_return_MUX_uxn_stack_h_l289_c2_1456_iffalse,
halt_return_MUX_uxn_stack_h_l289_c2_1456_return_output);

-- halt_uxn_stack_h_l290_c12_5c76
halt_uxn_stack_h_l290_c12_5c76 : entity work.halt_0CLK_1d3235af port map (
clk,
halt_uxn_stack_h_l290_c12_5c76_CLOCK_ENABLE,
halt_uxn_stack_h_l290_c12_5c76_ins,
halt_uxn_stack_h_l290_c12_5c76_err,
halt_uxn_stack_h_l290_c12_5c76_return_output);

-- BIN_OP_AND_uxn_stack_h_l297_c13_417c
BIN_OP_AND_uxn_stack_h_l297_c13_417c : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_stack_h_l297_c13_417c_left,
BIN_OP_AND_uxn_stack_h_l297_c13_417c_right,
BIN_OP_AND_uxn_stack_h_l297_c13_417c_return_output);

-- BIN_OP_PLUS_uxn_stack_h_l297_c13_c0ea
BIN_OP_PLUS_uxn_stack_h_l297_c13_c0ea : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_stack_h_l297_c13_c0ea_left,
BIN_OP_PLUS_uxn_stack_h_l297_c13_c0ea_right,
BIN_OP_PLUS_uxn_stack_h_l297_c13_c0ea_return_output);

-- BIN_OP_PLUS_uxn_stack_h_l297_c13_ef60
BIN_OP_PLUS_uxn_stack_h_l297_c13_ef60 : entity work.BIN_OP_PLUS_int10_t_int9_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_stack_h_l297_c13_ef60_left,
BIN_OP_PLUS_uxn_stack_h_l297_c13_ef60_right,
BIN_OP_PLUS_uxn_stack_h_l297_c13_ef60_return_output);

-- BIN_OP_GT_uxn_stack_h_l298_c6_a1e5
BIN_OP_GT_uxn_stack_h_l298_c6_a1e5 : entity work.BIN_OP_GT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_stack_h_l298_c6_a1e5_left,
BIN_OP_GT_uxn_stack_h_l298_c6_a1e5_right,
BIN_OP_GT_uxn_stack_h_l298_c6_a1e5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_6c23
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_6c23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_6c23_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_6c23_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_6c23_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_6c23_return_output);

-- result_MUX_uxn_stack_h_l298_c2_21c6
result_MUX_uxn_stack_h_l298_c2_21c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_stack_h_l298_c2_21c6_cond,
result_MUX_uxn_stack_h_l298_c2_21c6_iftrue,
result_MUX_uxn_stack_h_l298_c2_21c6_iffalse,
result_MUX_uxn_stack_h_l298_c2_21c6_return_output);

-- halt_return_MUX_uxn_stack_h_l298_c2_21c6
halt_return_MUX_uxn_stack_h_l298_c2_21c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
halt_return_MUX_uxn_stack_h_l298_c2_21c6_cond,
halt_return_MUX_uxn_stack_h_l298_c2_21c6_iftrue,
halt_return_MUX_uxn_stack_h_l298_c2_21c6_iffalse,
halt_return_MUX_uxn_stack_h_l298_c2_21c6_return_output);

-- halt_uxn_stack_h_l299_c12_be1d
halt_uxn_stack_h_l299_c12_be1d : entity work.halt_0CLK_1d3235af port map (
clk,
halt_uxn_stack_h_l299_c12_be1d_CLOCK_ENABLE,
halt_uxn_stack_h_l299_c12_be1d_ins,
halt_uxn_stack_h_l299_c12_be1d_err,
halt_uxn_stack_h_l299_c12_be1d_return_output);

-- BIN_OP_EQ_uxn_stack_h_l303_c6_f1f8
BIN_OP_EQ_uxn_stack_h_l303_c6_f1f8 : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_stack_h_l303_c6_f1f8_left,
BIN_OP_EQ_uxn_stack_h_l303_c6_f1f8_right,
BIN_OP_EQ_uxn_stack_h_l303_c6_f1f8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_f8b5
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_f8b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_f8b5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_f8b5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_f8b5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_f8b5_return_output);

-- stack_pointer_set_uxn_stack_h_l304_c3_43fa
stack_pointer_set_uxn_stack_h_l304_c3_43fa : entity work.stack_pointer_set_0CLK_88c0218f port map (
clk,
stack_pointer_set_uxn_stack_h_l304_c3_43fa_CLOCK_ENABLE,
stack_pointer_set_uxn_stack_h_l304_c3_43fa_stack_index,
stack_pointer_set_uxn_stack_h_l304_c3_43fa_value);

-- stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_60f1
stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_60f1 : entity work.stack_pointer_get_0CLK_c35c94f1 port map (
clk,
stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_60f1_CLOCK_ENABLE,
stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_60f1_stack_index,
stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_60f1_return_output);



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
 BIN_OP_GT_uxn_stack_h_l289_c6_7cbd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_6bcd_return_output,
 result_MUX_uxn_stack_h_l289_c2_1456_return_output,
 halt_return_MUX_uxn_stack_h_l289_c2_1456_return_output,
 halt_uxn_stack_h_l290_c12_5c76_return_output,
 BIN_OP_AND_uxn_stack_h_l297_c13_417c_return_output,
 BIN_OP_PLUS_uxn_stack_h_l297_c13_c0ea_return_output,
 BIN_OP_PLUS_uxn_stack_h_l297_c13_ef60_return_output,
 BIN_OP_GT_uxn_stack_h_l298_c6_a1e5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_6c23_return_output,
 result_MUX_uxn_stack_h_l298_c2_21c6_return_output,
 halt_return_MUX_uxn_stack_h_l298_c2_21c6_return_output,
 halt_uxn_stack_h_l299_c12_be1d_return_output,
 BIN_OP_EQ_uxn_stack_h_l303_c6_f1f8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_f8b5_return_output,
 stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_60f1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_mul : unsigned(7 downto 0);
 variable VAR_add : signed(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l289_c6_7cbd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l289_c6_7cbd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l289_c6_7cbd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_6bcd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_6bcd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_6bcd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_6bcd_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l289_c2_1456_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l289_c2_1456_iffalse : unsigned(7 downto 0);
 variable VAR_result_uxn_stack_h_l293_c3_abc4 : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l289_c2_1456_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l289_c2_1456_cond : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l289_c2_1456_iftrue : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l289_c2_1456_iffalse : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l289_c2_1456_return_output : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l289_c2_1456_cond : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l290_c12_5c76_ins : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l290_c12_5c76_err : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l290_c12_5c76_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l290_c12_5c76_return_output : unsigned(7 downto 0);
 variable VAR_set_tmp_uxn_stack_h_l297_c2_7a1f : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l297_c13_417c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l297_c13_417c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l297_c13_417c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_c0ea_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_c0ea_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_c0ea_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_ef60_left : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_ef60_right : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_ef60_return_output : signed(10 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l298_c6_a1e5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l298_c6_a1e5_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l298_c6_a1e5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_6c23_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_6c23_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_6c23_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_6c23_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l298_c2_21c6_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l298_c2_21c6_iffalse : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l298_c2_21c6_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l298_c2_21c6_cond : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l298_c2_21c6_iftrue : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l298_c2_21c6_iffalse : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l298_c2_21c6_return_output : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l298_c2_21c6_cond : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l299_c12_be1d_ins : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l299_c12_be1d_err : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l299_c12_be1d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l299_c12_be1d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l303_c6_f1f8_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l303_c6_f1f8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l303_c6_f1f8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_f8b5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_f8b5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_f8b5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_f8b5_iffalse : unsigned(0 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l304_c3_43fa_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l304_c3_43fa_value : unsigned(7 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l304_c3_43fa_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_60f1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_60f1_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_60f1_return_output : unsigned(7 downto 0);
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
     VAR_result_uxn_stack_h_l293_c3_abc4 := resize(to_unsigned(0, 1), 8);
     VAR_result_MUX_uxn_stack_h_l289_c2_1456_iffalse := VAR_result_uxn_stack_h_l293_c3_abc4;
     VAR_halt_return_MUX_uxn_stack_h_l289_c2_1456_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_f8b5_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_6c23_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_stack_h_l303_c6_f1f8_right := to_unsigned(0, 1);
     VAR_halt_return_MUX_uxn_stack_h_l289_c2_1456_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_6bcd_iffalse := to_unsigned(0, 1);
     VAR_halt_return_MUX_uxn_stack_h_l298_c2_21c6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_stack_h_l298_c6_a1e5_right := to_unsigned(254, 8);
     VAR_halt_uxn_stack_h_l299_c12_be1d_err := resize(to_unsigned(2, 2), 8);
     VAR_halt_uxn_stack_h_l290_c12_5c76_err := resize(to_unsigned(1, 1), 8);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_6bcd_iftrue := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_6c23_iftrue := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_f8b5_iftrue := VAR_CLOCK_ENABLE;
     VAR_stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_60f1_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_c0ea_right := VAR_add;
     VAR_halt_uxn_stack_h_l290_c12_5c76_ins := VAR_ins;
     VAR_halt_uxn_stack_h_l299_c12_be1d_ins := VAR_ins;
     VAR_BIN_OP_AND_uxn_stack_h_l297_c13_417c_right := VAR_k;
     VAR_BIN_OP_AND_uxn_stack_h_l297_c13_417c_left := VAR_mul;
     VAR_BIN_OP_GT_uxn_stack_h_l289_c6_7cbd_left := VAR_mul;
     VAR_stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_60f1_stack_index := VAR_stack_index;
     VAR_stack_pointer_set_uxn_stack_h_l304_c3_43fa_stack_index := VAR_stack_index;
     -- BIN_OP_AND[uxn_stack_h_l297_c13_417c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_stack_h_l297_c13_417c_left <= VAR_BIN_OP_AND_uxn_stack_h_l297_c13_417c_left;
     BIN_OP_AND_uxn_stack_h_l297_c13_417c_right <= VAR_BIN_OP_AND_uxn_stack_h_l297_c13_417c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_stack_h_l297_c13_417c_return_output := BIN_OP_AND_uxn_stack_h_l297_c13_417c_return_output;

     -- stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_60f1 LATENCY=0
     -- Clock enable
     stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_60f1_CLOCK_ENABLE <= VAR_stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_60f1_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_60f1_stack_index <= VAR_stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_60f1_stack_index;
     -- Outputs
     VAR_stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_60f1_return_output := stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_60f1_return_output;

     -- Submodule level 1
     VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_c0ea_left := signed(std_logic_vector(resize(VAR_BIN_OP_AND_uxn_stack_h_l297_c13_417c_return_output, 9)));
     VAR_BIN_OP_GT_uxn_stack_h_l289_c6_7cbd_right := VAR_stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_60f1_return_output;
     VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_ef60_right := signed(std_logic_vector(resize(VAR_stack_pointer_get_uxn_stack_h_l289_l297_DUPLICATE_60f1_return_output, 9)));
     -- BIN_OP_GT[uxn_stack_h_l289_c6_7cbd] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_stack_h_l289_c6_7cbd_left <= VAR_BIN_OP_GT_uxn_stack_h_l289_c6_7cbd_left;
     BIN_OP_GT_uxn_stack_h_l289_c6_7cbd_right <= VAR_BIN_OP_GT_uxn_stack_h_l289_c6_7cbd_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_stack_h_l289_c6_7cbd_return_output := BIN_OP_GT_uxn_stack_h_l289_c6_7cbd_return_output;

     -- BIN_OP_PLUS[uxn_stack_h_l297_c13_c0ea] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_stack_h_l297_c13_c0ea_left <= VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_c0ea_left;
     BIN_OP_PLUS_uxn_stack_h_l297_c13_c0ea_right <= VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_c0ea_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_c0ea_return_output := BIN_OP_PLUS_uxn_stack_h_l297_c13_c0ea_return_output;

     -- Submodule level 2
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_6bcd_cond := VAR_BIN_OP_GT_uxn_stack_h_l289_c6_7cbd_return_output;
     VAR_halt_return_MUX_uxn_stack_h_l289_c2_1456_cond := VAR_BIN_OP_GT_uxn_stack_h_l289_c6_7cbd_return_output;
     VAR_result_MUX_uxn_stack_h_l289_c2_1456_cond := VAR_BIN_OP_GT_uxn_stack_h_l289_c6_7cbd_return_output;
     VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_ef60_left := VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_c0ea_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l289_c1_6bcd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_6bcd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_6bcd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_6bcd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_6bcd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_6bcd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_6bcd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_6bcd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_6bcd_return_output;

     -- halt_return_MUX[uxn_stack_h_l289_c2_1456] LATENCY=0
     -- Inputs
     halt_return_MUX_uxn_stack_h_l289_c2_1456_cond <= VAR_halt_return_MUX_uxn_stack_h_l289_c2_1456_cond;
     halt_return_MUX_uxn_stack_h_l289_c2_1456_iftrue <= VAR_halt_return_MUX_uxn_stack_h_l289_c2_1456_iftrue;
     halt_return_MUX_uxn_stack_h_l289_c2_1456_iffalse <= VAR_halt_return_MUX_uxn_stack_h_l289_c2_1456_iffalse;
     -- Outputs
     VAR_halt_return_MUX_uxn_stack_h_l289_c2_1456_return_output := halt_return_MUX_uxn_stack_h_l289_c2_1456_return_output;

     -- BIN_OP_PLUS[uxn_stack_h_l297_c13_ef60] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_stack_h_l297_c13_ef60_left <= VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_ef60_left;
     BIN_OP_PLUS_uxn_stack_h_l297_c13_ef60_right <= VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_ef60_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_ef60_return_output := BIN_OP_PLUS_uxn_stack_h_l297_c13_ef60_return_output;

     -- Submodule level 3
     VAR_set_tmp_uxn_stack_h_l297_c2_7a1f := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_stack_h_l297_c13_ef60_return_output)),8);
     VAR_halt_uxn_stack_h_l290_c12_5c76_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l289_c1_6bcd_return_output;
     VAR_halt_return_MUX_uxn_stack_h_l298_c2_21c6_iffalse := VAR_halt_return_MUX_uxn_stack_h_l289_c2_1456_return_output;
     VAR_BIN_OP_GT_uxn_stack_h_l298_c6_a1e5_left := VAR_set_tmp_uxn_stack_h_l297_c2_7a1f;
     REG_VAR_set_tmp := VAR_set_tmp_uxn_stack_h_l297_c2_7a1f;
     VAR_stack_pointer_set_uxn_stack_h_l304_c3_43fa_value := VAR_set_tmp_uxn_stack_h_l297_c2_7a1f;
     -- BIN_OP_GT[uxn_stack_h_l298_c6_a1e5] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_stack_h_l298_c6_a1e5_left <= VAR_BIN_OP_GT_uxn_stack_h_l298_c6_a1e5_left;
     BIN_OP_GT_uxn_stack_h_l298_c6_a1e5_right <= VAR_BIN_OP_GT_uxn_stack_h_l298_c6_a1e5_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_stack_h_l298_c6_a1e5_return_output := BIN_OP_GT_uxn_stack_h_l298_c6_a1e5_return_output;

     -- halt[uxn_stack_h_l290_c12_5c76] LATENCY=0
     -- Clock enable
     halt_uxn_stack_h_l290_c12_5c76_CLOCK_ENABLE <= VAR_halt_uxn_stack_h_l290_c12_5c76_CLOCK_ENABLE;
     -- Inputs
     halt_uxn_stack_h_l290_c12_5c76_ins <= VAR_halt_uxn_stack_h_l290_c12_5c76_ins;
     halt_uxn_stack_h_l290_c12_5c76_err <= VAR_halt_uxn_stack_h_l290_c12_5c76_err;
     -- Outputs
     VAR_halt_uxn_stack_h_l290_c12_5c76_return_output := halt_uxn_stack_h_l290_c12_5c76_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_6c23_cond := VAR_BIN_OP_GT_uxn_stack_h_l298_c6_a1e5_return_output;
     VAR_halt_return_MUX_uxn_stack_h_l298_c2_21c6_cond := VAR_BIN_OP_GT_uxn_stack_h_l298_c6_a1e5_return_output;
     VAR_result_MUX_uxn_stack_h_l298_c2_21c6_cond := VAR_BIN_OP_GT_uxn_stack_h_l298_c6_a1e5_return_output;
     VAR_result_MUX_uxn_stack_h_l289_c2_1456_iftrue := VAR_halt_uxn_stack_h_l290_c12_5c76_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l298_c1_6c23] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_6c23_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_6c23_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_6c23_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_6c23_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_6c23_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_6c23_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_6c23_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_6c23_return_output;

     -- result_MUX[uxn_stack_h_l289_c2_1456] LATENCY=0
     -- Inputs
     result_MUX_uxn_stack_h_l289_c2_1456_cond <= VAR_result_MUX_uxn_stack_h_l289_c2_1456_cond;
     result_MUX_uxn_stack_h_l289_c2_1456_iftrue <= VAR_result_MUX_uxn_stack_h_l289_c2_1456_iftrue;
     result_MUX_uxn_stack_h_l289_c2_1456_iffalse <= VAR_result_MUX_uxn_stack_h_l289_c2_1456_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_stack_h_l289_c2_1456_return_output := result_MUX_uxn_stack_h_l289_c2_1456_return_output;

     -- halt_return_MUX[uxn_stack_h_l298_c2_21c6] LATENCY=0
     -- Inputs
     halt_return_MUX_uxn_stack_h_l298_c2_21c6_cond <= VAR_halt_return_MUX_uxn_stack_h_l298_c2_21c6_cond;
     halt_return_MUX_uxn_stack_h_l298_c2_21c6_iftrue <= VAR_halt_return_MUX_uxn_stack_h_l298_c2_21c6_iftrue;
     halt_return_MUX_uxn_stack_h_l298_c2_21c6_iffalse <= VAR_halt_return_MUX_uxn_stack_h_l298_c2_21c6_iffalse;
     -- Outputs
     VAR_halt_return_MUX_uxn_stack_h_l298_c2_21c6_return_output := halt_return_MUX_uxn_stack_h_l298_c2_21c6_return_output;

     -- Submodule level 5
     VAR_halt_uxn_stack_h_l299_c12_be1d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l298_c1_6c23_return_output;
     VAR_BIN_OP_EQ_uxn_stack_h_l303_c6_f1f8_left := VAR_halt_return_MUX_uxn_stack_h_l298_c2_21c6_return_output;
     REG_VAR_halt_return := VAR_halt_return_MUX_uxn_stack_h_l298_c2_21c6_return_output;
     VAR_result_MUX_uxn_stack_h_l298_c2_21c6_iffalse := VAR_result_MUX_uxn_stack_h_l289_c2_1456_return_output;
     -- halt[uxn_stack_h_l299_c12_be1d] LATENCY=0
     -- Clock enable
     halt_uxn_stack_h_l299_c12_be1d_CLOCK_ENABLE <= VAR_halt_uxn_stack_h_l299_c12_be1d_CLOCK_ENABLE;
     -- Inputs
     halt_uxn_stack_h_l299_c12_be1d_ins <= VAR_halt_uxn_stack_h_l299_c12_be1d_ins;
     halt_uxn_stack_h_l299_c12_be1d_err <= VAR_halt_uxn_stack_h_l299_c12_be1d_err;
     -- Outputs
     VAR_halt_uxn_stack_h_l299_c12_be1d_return_output := halt_uxn_stack_h_l299_c12_be1d_return_output;

     -- BIN_OP_EQ[uxn_stack_h_l303_c6_f1f8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_stack_h_l303_c6_f1f8_left <= VAR_BIN_OP_EQ_uxn_stack_h_l303_c6_f1f8_left;
     BIN_OP_EQ_uxn_stack_h_l303_c6_f1f8_right <= VAR_BIN_OP_EQ_uxn_stack_h_l303_c6_f1f8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_stack_h_l303_c6_f1f8_return_output := BIN_OP_EQ_uxn_stack_h_l303_c6_f1f8_return_output;

     -- Submodule level 6
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_f8b5_cond := VAR_BIN_OP_EQ_uxn_stack_h_l303_c6_f1f8_return_output;
     VAR_result_MUX_uxn_stack_h_l298_c2_21c6_iftrue := VAR_halt_uxn_stack_h_l299_c12_be1d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l303_c1_f8b5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_f8b5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_f8b5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_f8b5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_f8b5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_f8b5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_f8b5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_f8b5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_f8b5_return_output;

     -- result_MUX[uxn_stack_h_l298_c2_21c6] LATENCY=0
     -- Inputs
     result_MUX_uxn_stack_h_l298_c2_21c6_cond <= VAR_result_MUX_uxn_stack_h_l298_c2_21c6_cond;
     result_MUX_uxn_stack_h_l298_c2_21c6_iftrue <= VAR_result_MUX_uxn_stack_h_l298_c2_21c6_iftrue;
     result_MUX_uxn_stack_h_l298_c2_21c6_iffalse <= VAR_result_MUX_uxn_stack_h_l298_c2_21c6_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_stack_h_l298_c2_21c6_return_output := result_MUX_uxn_stack_h_l298_c2_21c6_return_output;

     -- Submodule level 7
     VAR_stack_pointer_set_uxn_stack_h_l304_c3_43fa_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l303_c1_f8b5_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_stack_h_l298_c2_21c6_return_output;
     VAR_return_output := VAR_result_MUX_uxn_stack_h_l298_c2_21c6_return_output;
     -- stack_pointer_set[uxn_stack_h_l304_c3_43fa] LATENCY=0
     -- Clock enable
     stack_pointer_set_uxn_stack_h_l304_c3_43fa_CLOCK_ENABLE <= VAR_stack_pointer_set_uxn_stack_h_l304_c3_43fa_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_set_uxn_stack_h_l304_c3_43fa_stack_index <= VAR_stack_pointer_set_uxn_stack_h_l304_c3_43fa_stack_index;
     stack_pointer_set_uxn_stack_h_l304_c3_43fa_value <= VAR_stack_pointer_set_uxn_stack_h_l304_c3_43fa_value;
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
