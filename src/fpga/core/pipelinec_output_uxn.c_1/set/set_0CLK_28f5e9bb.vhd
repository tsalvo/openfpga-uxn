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
-- BIN_OP_GT[uxn_stack_h_l301_c6_694d]
signal BIN_OP_GT_uxn_stack_h_l301_c6_694d_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l301_c6_694d_right : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l301_c6_694d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l301_c1_1c3e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_1c3e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_1c3e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_1c3e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_1c3e_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_stack_h_l301_c2_0530]
signal result_MUX_uxn_stack_h_l301_c2_0530_cond : unsigned(0 downto 0);
signal result_MUX_uxn_stack_h_l301_c2_0530_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l301_c2_0530_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l301_c2_0530_return_output : unsigned(7 downto 0);

-- halt_return_MUX[uxn_stack_h_l301_c2_0530]
signal halt_return_MUX_uxn_stack_h_l301_c2_0530_cond : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l301_c2_0530_iftrue : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l301_c2_0530_iffalse : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l301_c2_0530_return_output : unsigned(0 downto 0);

-- halt[uxn_stack_h_l302_c12_8166]
signal halt_uxn_stack_h_l302_c12_8166_CLOCK_ENABLE : unsigned(0 downto 0);
signal halt_uxn_stack_h_l302_c12_8166_ins : unsigned(7 downto 0);
signal halt_uxn_stack_h_l302_c12_8166_err : unsigned(7 downto 0);
signal halt_uxn_stack_h_l302_c12_8166_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_stack_h_l309_c13_afae]
signal BIN_OP_AND_uxn_stack_h_l309_c13_afae_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_stack_h_l309_c13_afae_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_stack_h_l309_c13_afae_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_stack_h_l309_c13_14b7]
signal BIN_OP_PLUS_uxn_stack_h_l309_c13_14b7_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l309_c13_14b7_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l309_c13_14b7_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_stack_h_l309_c13_351b]
signal BIN_OP_PLUS_uxn_stack_h_l309_c13_351b_left : signed(9 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l309_c13_351b_right : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l309_c13_351b_return_output : signed(10 downto 0);

-- BIN_OP_GT[uxn_stack_h_l310_c6_490d]
signal BIN_OP_GT_uxn_stack_h_l310_c6_490d_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l310_c6_490d_right : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l310_c6_490d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l310_c1_dd22]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l310_c1_dd22_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l310_c1_dd22_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l310_c1_dd22_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l310_c1_dd22_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_stack_h_l310_c2_9f88]
signal result_MUX_uxn_stack_h_l310_c2_9f88_cond : unsigned(0 downto 0);
signal result_MUX_uxn_stack_h_l310_c2_9f88_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l310_c2_9f88_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l310_c2_9f88_return_output : unsigned(7 downto 0);

-- halt_return_MUX[uxn_stack_h_l310_c2_9f88]
signal halt_return_MUX_uxn_stack_h_l310_c2_9f88_cond : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l310_c2_9f88_iftrue : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l310_c2_9f88_iffalse : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l310_c2_9f88_return_output : unsigned(0 downto 0);

-- halt[uxn_stack_h_l311_c12_1f21]
signal halt_uxn_stack_h_l311_c12_1f21_CLOCK_ENABLE : unsigned(0 downto 0);
signal halt_uxn_stack_h_l311_c12_1f21_ins : unsigned(7 downto 0);
signal halt_uxn_stack_h_l311_c12_1f21_err : unsigned(7 downto 0);
signal halt_uxn_stack_h_l311_c12_1f21_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_stack_h_l315_c6_9ba3]
signal BIN_OP_EQ_uxn_stack_h_l315_c6_9ba3_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l315_c6_9ba3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l315_c6_9ba3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l315_c1_ba52]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l315_c1_ba52_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l315_c1_ba52_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l315_c1_ba52_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l315_c1_ba52_return_output : unsigned(0 downto 0);

-- stack_pointer_set[uxn_stack_h_l316_c3_8927]
signal stack_pointer_set_uxn_stack_h_l316_c3_8927_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_set_uxn_stack_h_l316_c3_8927_stack_index : unsigned(0 downto 0);
signal stack_pointer_set_uxn_stack_h_l316_c3_8927_value : unsigned(7 downto 0);

-- stack_pointer_get_uxn_stack_h_l301_l309_DUPLICATE_2650
signal stack_pointer_get_uxn_stack_h_l301_l309_DUPLICATE_2650_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l301_l309_DUPLICATE_2650_stack_index : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l301_l309_DUPLICATE_2650_return_output : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_GT_uxn_stack_h_l301_c6_694d
BIN_OP_GT_uxn_stack_h_l301_c6_694d : entity work.BIN_OP_GT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_stack_h_l301_c6_694d_left,
BIN_OP_GT_uxn_stack_h_l301_c6_694d_right,
BIN_OP_GT_uxn_stack_h_l301_c6_694d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_1c3e
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_1c3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_1c3e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_1c3e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_1c3e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_1c3e_return_output);

-- result_MUX_uxn_stack_h_l301_c2_0530
result_MUX_uxn_stack_h_l301_c2_0530 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_stack_h_l301_c2_0530_cond,
result_MUX_uxn_stack_h_l301_c2_0530_iftrue,
result_MUX_uxn_stack_h_l301_c2_0530_iffalse,
result_MUX_uxn_stack_h_l301_c2_0530_return_output);

-- halt_return_MUX_uxn_stack_h_l301_c2_0530
halt_return_MUX_uxn_stack_h_l301_c2_0530 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
halt_return_MUX_uxn_stack_h_l301_c2_0530_cond,
halt_return_MUX_uxn_stack_h_l301_c2_0530_iftrue,
halt_return_MUX_uxn_stack_h_l301_c2_0530_iffalse,
halt_return_MUX_uxn_stack_h_l301_c2_0530_return_output);

-- halt_uxn_stack_h_l302_c12_8166
halt_uxn_stack_h_l302_c12_8166 : entity work.halt_0CLK_1d3235af port map (
clk,
halt_uxn_stack_h_l302_c12_8166_CLOCK_ENABLE,
halt_uxn_stack_h_l302_c12_8166_ins,
halt_uxn_stack_h_l302_c12_8166_err,
halt_uxn_stack_h_l302_c12_8166_return_output);

-- BIN_OP_AND_uxn_stack_h_l309_c13_afae
BIN_OP_AND_uxn_stack_h_l309_c13_afae : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_stack_h_l309_c13_afae_left,
BIN_OP_AND_uxn_stack_h_l309_c13_afae_right,
BIN_OP_AND_uxn_stack_h_l309_c13_afae_return_output);

-- BIN_OP_PLUS_uxn_stack_h_l309_c13_14b7
BIN_OP_PLUS_uxn_stack_h_l309_c13_14b7 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_stack_h_l309_c13_14b7_left,
BIN_OP_PLUS_uxn_stack_h_l309_c13_14b7_right,
BIN_OP_PLUS_uxn_stack_h_l309_c13_14b7_return_output);

-- BIN_OP_PLUS_uxn_stack_h_l309_c13_351b
BIN_OP_PLUS_uxn_stack_h_l309_c13_351b : entity work.BIN_OP_PLUS_int10_t_int9_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_stack_h_l309_c13_351b_left,
BIN_OP_PLUS_uxn_stack_h_l309_c13_351b_right,
BIN_OP_PLUS_uxn_stack_h_l309_c13_351b_return_output);

-- BIN_OP_GT_uxn_stack_h_l310_c6_490d
BIN_OP_GT_uxn_stack_h_l310_c6_490d : entity work.BIN_OP_GT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_stack_h_l310_c6_490d_left,
BIN_OP_GT_uxn_stack_h_l310_c6_490d_right,
BIN_OP_GT_uxn_stack_h_l310_c6_490d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l310_c1_dd22
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l310_c1_dd22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l310_c1_dd22_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l310_c1_dd22_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l310_c1_dd22_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l310_c1_dd22_return_output);

-- result_MUX_uxn_stack_h_l310_c2_9f88
result_MUX_uxn_stack_h_l310_c2_9f88 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_stack_h_l310_c2_9f88_cond,
result_MUX_uxn_stack_h_l310_c2_9f88_iftrue,
result_MUX_uxn_stack_h_l310_c2_9f88_iffalse,
result_MUX_uxn_stack_h_l310_c2_9f88_return_output);

-- halt_return_MUX_uxn_stack_h_l310_c2_9f88
halt_return_MUX_uxn_stack_h_l310_c2_9f88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
halt_return_MUX_uxn_stack_h_l310_c2_9f88_cond,
halt_return_MUX_uxn_stack_h_l310_c2_9f88_iftrue,
halt_return_MUX_uxn_stack_h_l310_c2_9f88_iffalse,
halt_return_MUX_uxn_stack_h_l310_c2_9f88_return_output);

-- halt_uxn_stack_h_l311_c12_1f21
halt_uxn_stack_h_l311_c12_1f21 : entity work.halt_0CLK_1d3235af port map (
clk,
halt_uxn_stack_h_l311_c12_1f21_CLOCK_ENABLE,
halt_uxn_stack_h_l311_c12_1f21_ins,
halt_uxn_stack_h_l311_c12_1f21_err,
halt_uxn_stack_h_l311_c12_1f21_return_output);

-- BIN_OP_EQ_uxn_stack_h_l315_c6_9ba3
BIN_OP_EQ_uxn_stack_h_l315_c6_9ba3 : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_stack_h_l315_c6_9ba3_left,
BIN_OP_EQ_uxn_stack_h_l315_c6_9ba3_right,
BIN_OP_EQ_uxn_stack_h_l315_c6_9ba3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l315_c1_ba52
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l315_c1_ba52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l315_c1_ba52_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l315_c1_ba52_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l315_c1_ba52_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l315_c1_ba52_return_output);

-- stack_pointer_set_uxn_stack_h_l316_c3_8927
stack_pointer_set_uxn_stack_h_l316_c3_8927 : entity work.stack_pointer_set_0CLK_88c0218f port map (
clk,
stack_pointer_set_uxn_stack_h_l316_c3_8927_CLOCK_ENABLE,
stack_pointer_set_uxn_stack_h_l316_c3_8927_stack_index,
stack_pointer_set_uxn_stack_h_l316_c3_8927_value);

-- stack_pointer_get_uxn_stack_h_l301_l309_DUPLICATE_2650
stack_pointer_get_uxn_stack_h_l301_l309_DUPLICATE_2650 : entity work.stack_pointer_get_0CLK_c35c94f1 port map (
clk,
stack_pointer_get_uxn_stack_h_l301_l309_DUPLICATE_2650_CLOCK_ENABLE,
stack_pointer_get_uxn_stack_h_l301_l309_DUPLICATE_2650_stack_index,
stack_pointer_get_uxn_stack_h_l301_l309_DUPLICATE_2650_return_output);



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
 BIN_OP_GT_uxn_stack_h_l301_c6_694d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_1c3e_return_output,
 result_MUX_uxn_stack_h_l301_c2_0530_return_output,
 halt_return_MUX_uxn_stack_h_l301_c2_0530_return_output,
 halt_uxn_stack_h_l302_c12_8166_return_output,
 BIN_OP_AND_uxn_stack_h_l309_c13_afae_return_output,
 BIN_OP_PLUS_uxn_stack_h_l309_c13_14b7_return_output,
 BIN_OP_PLUS_uxn_stack_h_l309_c13_351b_return_output,
 BIN_OP_GT_uxn_stack_h_l310_c6_490d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l310_c1_dd22_return_output,
 result_MUX_uxn_stack_h_l310_c2_9f88_return_output,
 halt_return_MUX_uxn_stack_h_l310_c2_9f88_return_output,
 halt_uxn_stack_h_l311_c12_1f21_return_output,
 BIN_OP_EQ_uxn_stack_h_l315_c6_9ba3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l315_c1_ba52_return_output,
 stack_pointer_get_uxn_stack_h_l301_l309_DUPLICATE_2650_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_mul : unsigned(7 downto 0);
 variable VAR_add : signed(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l301_c6_694d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l301_c6_694d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l301_c6_694d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_1c3e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_1c3e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_1c3e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_1c3e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l301_c2_0530_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l301_c2_0530_iffalse : unsigned(7 downto 0);
 variable VAR_result_uxn_stack_h_l305_c3_a440 : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l301_c2_0530_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l301_c2_0530_cond : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l301_c2_0530_iftrue : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l301_c2_0530_iffalse : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l301_c2_0530_return_output : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l301_c2_0530_cond : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l302_c12_8166_ins : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l302_c12_8166_err : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l302_c12_8166_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l302_c12_8166_return_output : unsigned(7 downto 0);
 variable VAR_set_tmp_uxn_stack_h_l309_c2_6e48 : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l309_c13_afae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l309_c13_afae_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l309_c13_afae_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l309_c13_14b7_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l309_c13_14b7_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l309_c13_14b7_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l309_c13_351b_left : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l309_c13_351b_right : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l309_c13_351b_return_output : signed(10 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l310_c6_490d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l310_c6_490d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l310_c6_490d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l310_c1_dd22_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l310_c1_dd22_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l310_c1_dd22_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l310_c1_dd22_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l310_c2_9f88_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l310_c2_9f88_iffalse : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l310_c2_9f88_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l310_c2_9f88_cond : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l310_c2_9f88_iftrue : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l310_c2_9f88_iffalse : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l310_c2_9f88_return_output : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l310_c2_9f88_cond : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l311_c12_1f21_ins : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l311_c12_1f21_err : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l311_c12_1f21_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l311_c12_1f21_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l315_c6_9ba3_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l315_c6_9ba3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l315_c6_9ba3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l315_c1_ba52_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l315_c1_ba52_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l315_c1_ba52_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l315_c1_ba52_iffalse : unsigned(0 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l316_c3_8927_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l316_c3_8927_value : unsigned(7 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l316_c3_8927_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l301_l309_DUPLICATE_2650_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l301_l309_DUPLICATE_2650_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l301_l309_DUPLICATE_2650_return_output : unsigned(7 downto 0);
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
     VAR_result_uxn_stack_h_l305_c3_a440 := resize(to_unsigned(0, 1), 8);
     VAR_result_MUX_uxn_stack_h_l301_c2_0530_iffalse := VAR_result_uxn_stack_h_l305_c3_a440;
     VAR_BIN_OP_EQ_uxn_stack_h_l315_c6_9ba3_right := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_stack_h_l310_c6_490d_right := to_unsigned(254, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l315_c1_ba52_iffalse := to_unsigned(0, 1);
     VAR_halt_return_MUX_uxn_stack_h_l301_c2_0530_iffalse := to_unsigned(0, 1);
     VAR_halt_uxn_stack_h_l311_c12_1f21_err := resize(to_unsigned(2, 2), 8);
     VAR_halt_return_MUX_uxn_stack_h_l301_c2_0530_iftrue := to_unsigned(1, 1);
     VAR_halt_uxn_stack_h_l302_c12_8166_err := resize(to_unsigned(1, 1), 8);
     VAR_halt_return_MUX_uxn_stack_h_l310_c2_9f88_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l310_c1_dd22_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_1c3e_iffalse := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_1c3e_iftrue := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l310_c1_dd22_iftrue := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l315_c1_ba52_iftrue := VAR_CLOCK_ENABLE;
     VAR_stack_pointer_get_uxn_stack_h_l301_l309_DUPLICATE_2650_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_stack_h_l309_c13_14b7_right := VAR_add;
     VAR_halt_uxn_stack_h_l302_c12_8166_ins := VAR_ins;
     VAR_halt_uxn_stack_h_l311_c12_1f21_ins := VAR_ins;
     VAR_BIN_OP_AND_uxn_stack_h_l309_c13_afae_right := VAR_k;
     VAR_BIN_OP_AND_uxn_stack_h_l309_c13_afae_left := VAR_mul;
     VAR_BIN_OP_GT_uxn_stack_h_l301_c6_694d_left := VAR_mul;
     VAR_stack_pointer_get_uxn_stack_h_l301_l309_DUPLICATE_2650_stack_index := VAR_stack_index;
     VAR_stack_pointer_set_uxn_stack_h_l316_c3_8927_stack_index := VAR_stack_index;
     -- stack_pointer_get_uxn_stack_h_l301_l309_DUPLICATE_2650 LATENCY=0
     -- Clock enable
     stack_pointer_get_uxn_stack_h_l301_l309_DUPLICATE_2650_CLOCK_ENABLE <= VAR_stack_pointer_get_uxn_stack_h_l301_l309_DUPLICATE_2650_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_get_uxn_stack_h_l301_l309_DUPLICATE_2650_stack_index <= VAR_stack_pointer_get_uxn_stack_h_l301_l309_DUPLICATE_2650_stack_index;
     -- Outputs
     VAR_stack_pointer_get_uxn_stack_h_l301_l309_DUPLICATE_2650_return_output := stack_pointer_get_uxn_stack_h_l301_l309_DUPLICATE_2650_return_output;

     -- BIN_OP_AND[uxn_stack_h_l309_c13_afae] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_stack_h_l309_c13_afae_left <= VAR_BIN_OP_AND_uxn_stack_h_l309_c13_afae_left;
     BIN_OP_AND_uxn_stack_h_l309_c13_afae_right <= VAR_BIN_OP_AND_uxn_stack_h_l309_c13_afae_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_stack_h_l309_c13_afae_return_output := BIN_OP_AND_uxn_stack_h_l309_c13_afae_return_output;

     -- Submodule level 1
     VAR_BIN_OP_PLUS_uxn_stack_h_l309_c13_14b7_left := signed(std_logic_vector(resize(VAR_BIN_OP_AND_uxn_stack_h_l309_c13_afae_return_output, 9)));
     VAR_BIN_OP_GT_uxn_stack_h_l301_c6_694d_right := VAR_stack_pointer_get_uxn_stack_h_l301_l309_DUPLICATE_2650_return_output;
     VAR_BIN_OP_PLUS_uxn_stack_h_l309_c13_351b_right := signed(std_logic_vector(resize(VAR_stack_pointer_get_uxn_stack_h_l301_l309_DUPLICATE_2650_return_output, 9)));
     -- BIN_OP_GT[uxn_stack_h_l301_c6_694d] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_stack_h_l301_c6_694d_left <= VAR_BIN_OP_GT_uxn_stack_h_l301_c6_694d_left;
     BIN_OP_GT_uxn_stack_h_l301_c6_694d_right <= VAR_BIN_OP_GT_uxn_stack_h_l301_c6_694d_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_stack_h_l301_c6_694d_return_output := BIN_OP_GT_uxn_stack_h_l301_c6_694d_return_output;

     -- BIN_OP_PLUS[uxn_stack_h_l309_c13_14b7] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_stack_h_l309_c13_14b7_left <= VAR_BIN_OP_PLUS_uxn_stack_h_l309_c13_14b7_left;
     BIN_OP_PLUS_uxn_stack_h_l309_c13_14b7_right <= VAR_BIN_OP_PLUS_uxn_stack_h_l309_c13_14b7_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_stack_h_l309_c13_14b7_return_output := BIN_OP_PLUS_uxn_stack_h_l309_c13_14b7_return_output;

     -- Submodule level 2
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_1c3e_cond := VAR_BIN_OP_GT_uxn_stack_h_l301_c6_694d_return_output;
     VAR_halt_return_MUX_uxn_stack_h_l301_c2_0530_cond := VAR_BIN_OP_GT_uxn_stack_h_l301_c6_694d_return_output;
     VAR_result_MUX_uxn_stack_h_l301_c2_0530_cond := VAR_BIN_OP_GT_uxn_stack_h_l301_c6_694d_return_output;
     VAR_BIN_OP_PLUS_uxn_stack_h_l309_c13_351b_left := VAR_BIN_OP_PLUS_uxn_stack_h_l309_c13_14b7_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l301_c1_1c3e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_1c3e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_1c3e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_1c3e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_1c3e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_1c3e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_1c3e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_1c3e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_1c3e_return_output;

     -- BIN_OP_PLUS[uxn_stack_h_l309_c13_351b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_stack_h_l309_c13_351b_left <= VAR_BIN_OP_PLUS_uxn_stack_h_l309_c13_351b_left;
     BIN_OP_PLUS_uxn_stack_h_l309_c13_351b_right <= VAR_BIN_OP_PLUS_uxn_stack_h_l309_c13_351b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_stack_h_l309_c13_351b_return_output := BIN_OP_PLUS_uxn_stack_h_l309_c13_351b_return_output;

     -- halt_return_MUX[uxn_stack_h_l301_c2_0530] LATENCY=0
     -- Inputs
     halt_return_MUX_uxn_stack_h_l301_c2_0530_cond <= VAR_halt_return_MUX_uxn_stack_h_l301_c2_0530_cond;
     halt_return_MUX_uxn_stack_h_l301_c2_0530_iftrue <= VAR_halt_return_MUX_uxn_stack_h_l301_c2_0530_iftrue;
     halt_return_MUX_uxn_stack_h_l301_c2_0530_iffalse <= VAR_halt_return_MUX_uxn_stack_h_l301_c2_0530_iffalse;
     -- Outputs
     VAR_halt_return_MUX_uxn_stack_h_l301_c2_0530_return_output := halt_return_MUX_uxn_stack_h_l301_c2_0530_return_output;

     -- Submodule level 3
     VAR_set_tmp_uxn_stack_h_l309_c2_6e48 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_stack_h_l309_c13_351b_return_output)),8);
     VAR_halt_uxn_stack_h_l302_c12_8166_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l301_c1_1c3e_return_output;
     VAR_halt_return_MUX_uxn_stack_h_l310_c2_9f88_iffalse := VAR_halt_return_MUX_uxn_stack_h_l301_c2_0530_return_output;
     VAR_BIN_OP_GT_uxn_stack_h_l310_c6_490d_left := VAR_set_tmp_uxn_stack_h_l309_c2_6e48;
     REG_VAR_set_tmp := VAR_set_tmp_uxn_stack_h_l309_c2_6e48;
     VAR_stack_pointer_set_uxn_stack_h_l316_c3_8927_value := VAR_set_tmp_uxn_stack_h_l309_c2_6e48;
     -- BIN_OP_GT[uxn_stack_h_l310_c6_490d] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_stack_h_l310_c6_490d_left <= VAR_BIN_OP_GT_uxn_stack_h_l310_c6_490d_left;
     BIN_OP_GT_uxn_stack_h_l310_c6_490d_right <= VAR_BIN_OP_GT_uxn_stack_h_l310_c6_490d_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_stack_h_l310_c6_490d_return_output := BIN_OP_GT_uxn_stack_h_l310_c6_490d_return_output;

     -- halt[uxn_stack_h_l302_c12_8166] LATENCY=0
     -- Clock enable
     halt_uxn_stack_h_l302_c12_8166_CLOCK_ENABLE <= VAR_halt_uxn_stack_h_l302_c12_8166_CLOCK_ENABLE;
     -- Inputs
     halt_uxn_stack_h_l302_c12_8166_ins <= VAR_halt_uxn_stack_h_l302_c12_8166_ins;
     halt_uxn_stack_h_l302_c12_8166_err <= VAR_halt_uxn_stack_h_l302_c12_8166_err;
     -- Outputs
     VAR_halt_uxn_stack_h_l302_c12_8166_return_output := halt_uxn_stack_h_l302_c12_8166_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l310_c1_dd22_cond := VAR_BIN_OP_GT_uxn_stack_h_l310_c6_490d_return_output;
     VAR_halt_return_MUX_uxn_stack_h_l310_c2_9f88_cond := VAR_BIN_OP_GT_uxn_stack_h_l310_c6_490d_return_output;
     VAR_result_MUX_uxn_stack_h_l310_c2_9f88_cond := VAR_BIN_OP_GT_uxn_stack_h_l310_c6_490d_return_output;
     VAR_result_MUX_uxn_stack_h_l301_c2_0530_iftrue := VAR_halt_uxn_stack_h_l302_c12_8166_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l310_c1_dd22] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l310_c1_dd22_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l310_c1_dd22_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l310_c1_dd22_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l310_c1_dd22_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l310_c1_dd22_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l310_c1_dd22_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l310_c1_dd22_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l310_c1_dd22_return_output;

     -- result_MUX[uxn_stack_h_l301_c2_0530] LATENCY=0
     -- Inputs
     result_MUX_uxn_stack_h_l301_c2_0530_cond <= VAR_result_MUX_uxn_stack_h_l301_c2_0530_cond;
     result_MUX_uxn_stack_h_l301_c2_0530_iftrue <= VAR_result_MUX_uxn_stack_h_l301_c2_0530_iftrue;
     result_MUX_uxn_stack_h_l301_c2_0530_iffalse <= VAR_result_MUX_uxn_stack_h_l301_c2_0530_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_stack_h_l301_c2_0530_return_output := result_MUX_uxn_stack_h_l301_c2_0530_return_output;

     -- halt_return_MUX[uxn_stack_h_l310_c2_9f88] LATENCY=0
     -- Inputs
     halt_return_MUX_uxn_stack_h_l310_c2_9f88_cond <= VAR_halt_return_MUX_uxn_stack_h_l310_c2_9f88_cond;
     halt_return_MUX_uxn_stack_h_l310_c2_9f88_iftrue <= VAR_halt_return_MUX_uxn_stack_h_l310_c2_9f88_iftrue;
     halt_return_MUX_uxn_stack_h_l310_c2_9f88_iffalse <= VAR_halt_return_MUX_uxn_stack_h_l310_c2_9f88_iffalse;
     -- Outputs
     VAR_halt_return_MUX_uxn_stack_h_l310_c2_9f88_return_output := halt_return_MUX_uxn_stack_h_l310_c2_9f88_return_output;

     -- Submodule level 5
     VAR_halt_uxn_stack_h_l311_c12_1f21_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l310_c1_dd22_return_output;
     VAR_BIN_OP_EQ_uxn_stack_h_l315_c6_9ba3_left := VAR_halt_return_MUX_uxn_stack_h_l310_c2_9f88_return_output;
     REG_VAR_halt_return := VAR_halt_return_MUX_uxn_stack_h_l310_c2_9f88_return_output;
     VAR_result_MUX_uxn_stack_h_l310_c2_9f88_iffalse := VAR_result_MUX_uxn_stack_h_l301_c2_0530_return_output;
     -- BIN_OP_EQ[uxn_stack_h_l315_c6_9ba3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_stack_h_l315_c6_9ba3_left <= VAR_BIN_OP_EQ_uxn_stack_h_l315_c6_9ba3_left;
     BIN_OP_EQ_uxn_stack_h_l315_c6_9ba3_right <= VAR_BIN_OP_EQ_uxn_stack_h_l315_c6_9ba3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_stack_h_l315_c6_9ba3_return_output := BIN_OP_EQ_uxn_stack_h_l315_c6_9ba3_return_output;

     -- halt[uxn_stack_h_l311_c12_1f21] LATENCY=0
     -- Clock enable
     halt_uxn_stack_h_l311_c12_1f21_CLOCK_ENABLE <= VAR_halt_uxn_stack_h_l311_c12_1f21_CLOCK_ENABLE;
     -- Inputs
     halt_uxn_stack_h_l311_c12_1f21_ins <= VAR_halt_uxn_stack_h_l311_c12_1f21_ins;
     halt_uxn_stack_h_l311_c12_1f21_err <= VAR_halt_uxn_stack_h_l311_c12_1f21_err;
     -- Outputs
     VAR_halt_uxn_stack_h_l311_c12_1f21_return_output := halt_uxn_stack_h_l311_c12_1f21_return_output;

     -- Submodule level 6
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l315_c1_ba52_cond := VAR_BIN_OP_EQ_uxn_stack_h_l315_c6_9ba3_return_output;
     VAR_result_MUX_uxn_stack_h_l310_c2_9f88_iftrue := VAR_halt_uxn_stack_h_l311_c12_1f21_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l315_c1_ba52] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l315_c1_ba52_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l315_c1_ba52_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l315_c1_ba52_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l315_c1_ba52_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l315_c1_ba52_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l315_c1_ba52_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l315_c1_ba52_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l315_c1_ba52_return_output;

     -- result_MUX[uxn_stack_h_l310_c2_9f88] LATENCY=0
     -- Inputs
     result_MUX_uxn_stack_h_l310_c2_9f88_cond <= VAR_result_MUX_uxn_stack_h_l310_c2_9f88_cond;
     result_MUX_uxn_stack_h_l310_c2_9f88_iftrue <= VAR_result_MUX_uxn_stack_h_l310_c2_9f88_iftrue;
     result_MUX_uxn_stack_h_l310_c2_9f88_iffalse <= VAR_result_MUX_uxn_stack_h_l310_c2_9f88_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_stack_h_l310_c2_9f88_return_output := result_MUX_uxn_stack_h_l310_c2_9f88_return_output;

     -- Submodule level 7
     VAR_stack_pointer_set_uxn_stack_h_l316_c3_8927_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l315_c1_ba52_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_stack_h_l310_c2_9f88_return_output;
     VAR_return_output := VAR_result_MUX_uxn_stack_h_l310_c2_9f88_return_output;
     -- stack_pointer_set[uxn_stack_h_l316_c3_8927] LATENCY=0
     -- Clock enable
     stack_pointer_set_uxn_stack_h_l316_c3_8927_CLOCK_ENABLE <= VAR_stack_pointer_set_uxn_stack_h_l316_c3_8927_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_set_uxn_stack_h_l316_c3_8927_stack_index <= VAR_stack_pointer_set_uxn_stack_h_l316_c3_8927_stack_index;
     stack_pointer_set_uxn_stack_h_l316_c3_8927_value <= VAR_stack_pointer_set_uxn_stack_h_l316_c3_8927_value;
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
