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
entity set_0CLK_95f06e5a is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 mul : in unsigned(7 downto 0);
 add : in signed(7 downto 0);
 return_output : out unsigned(7 downto 0));
end set_0CLK_95f06e5a;
architecture arch of set_0CLK_95f06e5a is
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
-- BIN_OP_GT[uxn_stack_h_l320_c6_7f0f]
signal BIN_OP_GT_uxn_stack_h_l320_c6_7f0f_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l320_c6_7f0f_right : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l320_c6_7f0f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l320_c1_caf5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l320_c1_caf5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l320_c1_caf5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l320_c1_caf5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l320_c1_caf5_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_stack_h_l320_c2_41b9]
signal result_MUX_uxn_stack_h_l320_c2_41b9_cond : unsigned(0 downto 0);
signal result_MUX_uxn_stack_h_l320_c2_41b9_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l320_c2_41b9_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l320_c2_41b9_return_output : unsigned(7 downto 0);

-- halt_return_MUX[uxn_stack_h_l320_c2_41b9]
signal halt_return_MUX_uxn_stack_h_l320_c2_41b9_cond : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l320_c2_41b9_iftrue : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l320_c2_41b9_iffalse : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l320_c2_41b9_return_output : unsigned(0 downto 0);

-- halt[uxn_stack_h_l321_c12_6aa4]
signal halt_uxn_stack_h_l321_c12_6aa4_CLOCK_ENABLE : unsigned(0 downto 0);
signal halt_uxn_stack_h_l321_c12_6aa4_ins : unsigned(7 downto 0);
signal halt_uxn_stack_h_l321_c12_6aa4_err : unsigned(7 downto 0);
signal halt_uxn_stack_h_l321_c12_6aa4_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_stack_h_l328_c13_7ba4]
signal BIN_OP_AND_uxn_stack_h_l328_c13_7ba4_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_stack_h_l328_c13_7ba4_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_stack_h_l328_c13_7ba4_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_stack_h_l328_c13_6fa5]
signal BIN_OP_PLUS_uxn_stack_h_l328_c13_6fa5_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l328_c13_6fa5_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l328_c13_6fa5_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_stack_h_l328_c13_1fca]
signal BIN_OP_PLUS_uxn_stack_h_l328_c13_1fca_left : signed(9 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l328_c13_1fca_right : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l328_c13_1fca_return_output : signed(10 downto 0);

-- BIN_OP_GT[uxn_stack_h_l329_c6_27d2]
signal BIN_OP_GT_uxn_stack_h_l329_c6_27d2_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l329_c6_27d2_right : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l329_c6_27d2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l329_c1_8e8b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l329_c1_8e8b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l329_c1_8e8b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l329_c1_8e8b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l329_c1_8e8b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_stack_h_l329_c2_b627]
signal result_MUX_uxn_stack_h_l329_c2_b627_cond : unsigned(0 downto 0);
signal result_MUX_uxn_stack_h_l329_c2_b627_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l329_c2_b627_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l329_c2_b627_return_output : unsigned(7 downto 0);

-- halt_return_MUX[uxn_stack_h_l329_c2_b627]
signal halt_return_MUX_uxn_stack_h_l329_c2_b627_cond : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l329_c2_b627_iftrue : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l329_c2_b627_iffalse : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l329_c2_b627_return_output : unsigned(0 downto 0);

-- halt[uxn_stack_h_l330_c12_4e5d]
signal halt_uxn_stack_h_l330_c12_4e5d_CLOCK_ENABLE : unsigned(0 downto 0);
signal halt_uxn_stack_h_l330_c12_4e5d_ins : unsigned(7 downto 0);
signal halt_uxn_stack_h_l330_c12_4e5d_err : unsigned(7 downto 0);
signal halt_uxn_stack_h_l330_c12_4e5d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_stack_h_l334_c6_deae]
signal BIN_OP_EQ_uxn_stack_h_l334_c6_deae_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l334_c6_deae_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l334_c6_deae_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l334_c1_4a3c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l334_c1_4a3c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l334_c1_4a3c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l334_c1_4a3c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l334_c1_4a3c_return_output : unsigned(0 downto 0);

-- stack_pointer_set[uxn_stack_h_l335_c3_778d]
signal stack_pointer_set_uxn_stack_h_l335_c3_778d_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_set_uxn_stack_h_l335_c3_778d_stack_index : unsigned(0 downto 0);
signal stack_pointer_set_uxn_stack_h_l335_c3_778d_value : unsigned(7 downto 0);

-- stack_pointer_get_uxn_stack_h_l320_l328_DUPLICATE_98b9
signal stack_pointer_get_uxn_stack_h_l320_l328_DUPLICATE_98b9_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l320_l328_DUPLICATE_98b9_stack_index : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l320_l328_DUPLICATE_98b9_return_output : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_GT_uxn_stack_h_l320_c6_7f0f
BIN_OP_GT_uxn_stack_h_l320_c6_7f0f : entity work.BIN_OP_GT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_stack_h_l320_c6_7f0f_left,
BIN_OP_GT_uxn_stack_h_l320_c6_7f0f_right,
BIN_OP_GT_uxn_stack_h_l320_c6_7f0f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l320_c1_caf5
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l320_c1_caf5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l320_c1_caf5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l320_c1_caf5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l320_c1_caf5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l320_c1_caf5_return_output);

-- result_MUX_uxn_stack_h_l320_c2_41b9
result_MUX_uxn_stack_h_l320_c2_41b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_stack_h_l320_c2_41b9_cond,
result_MUX_uxn_stack_h_l320_c2_41b9_iftrue,
result_MUX_uxn_stack_h_l320_c2_41b9_iffalse,
result_MUX_uxn_stack_h_l320_c2_41b9_return_output);

-- halt_return_MUX_uxn_stack_h_l320_c2_41b9
halt_return_MUX_uxn_stack_h_l320_c2_41b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
halt_return_MUX_uxn_stack_h_l320_c2_41b9_cond,
halt_return_MUX_uxn_stack_h_l320_c2_41b9_iftrue,
halt_return_MUX_uxn_stack_h_l320_c2_41b9_iffalse,
halt_return_MUX_uxn_stack_h_l320_c2_41b9_return_output);

-- halt_uxn_stack_h_l321_c12_6aa4
halt_uxn_stack_h_l321_c12_6aa4 : entity work.halt_0CLK_a61a57d5 port map (
clk,
halt_uxn_stack_h_l321_c12_6aa4_CLOCK_ENABLE,
halt_uxn_stack_h_l321_c12_6aa4_ins,
halt_uxn_stack_h_l321_c12_6aa4_err,
halt_uxn_stack_h_l321_c12_6aa4_return_output);

-- BIN_OP_AND_uxn_stack_h_l328_c13_7ba4
BIN_OP_AND_uxn_stack_h_l328_c13_7ba4 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_stack_h_l328_c13_7ba4_left,
BIN_OP_AND_uxn_stack_h_l328_c13_7ba4_right,
BIN_OP_AND_uxn_stack_h_l328_c13_7ba4_return_output);

-- BIN_OP_PLUS_uxn_stack_h_l328_c13_6fa5
BIN_OP_PLUS_uxn_stack_h_l328_c13_6fa5 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_stack_h_l328_c13_6fa5_left,
BIN_OP_PLUS_uxn_stack_h_l328_c13_6fa5_right,
BIN_OP_PLUS_uxn_stack_h_l328_c13_6fa5_return_output);

-- BIN_OP_PLUS_uxn_stack_h_l328_c13_1fca
BIN_OP_PLUS_uxn_stack_h_l328_c13_1fca : entity work.BIN_OP_PLUS_int10_t_int9_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_stack_h_l328_c13_1fca_left,
BIN_OP_PLUS_uxn_stack_h_l328_c13_1fca_right,
BIN_OP_PLUS_uxn_stack_h_l328_c13_1fca_return_output);

-- BIN_OP_GT_uxn_stack_h_l329_c6_27d2
BIN_OP_GT_uxn_stack_h_l329_c6_27d2 : entity work.BIN_OP_GT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_stack_h_l329_c6_27d2_left,
BIN_OP_GT_uxn_stack_h_l329_c6_27d2_right,
BIN_OP_GT_uxn_stack_h_l329_c6_27d2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l329_c1_8e8b
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l329_c1_8e8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l329_c1_8e8b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l329_c1_8e8b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l329_c1_8e8b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l329_c1_8e8b_return_output);

-- result_MUX_uxn_stack_h_l329_c2_b627
result_MUX_uxn_stack_h_l329_c2_b627 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_stack_h_l329_c2_b627_cond,
result_MUX_uxn_stack_h_l329_c2_b627_iftrue,
result_MUX_uxn_stack_h_l329_c2_b627_iffalse,
result_MUX_uxn_stack_h_l329_c2_b627_return_output);

-- halt_return_MUX_uxn_stack_h_l329_c2_b627
halt_return_MUX_uxn_stack_h_l329_c2_b627 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
halt_return_MUX_uxn_stack_h_l329_c2_b627_cond,
halt_return_MUX_uxn_stack_h_l329_c2_b627_iftrue,
halt_return_MUX_uxn_stack_h_l329_c2_b627_iffalse,
halt_return_MUX_uxn_stack_h_l329_c2_b627_return_output);

-- halt_uxn_stack_h_l330_c12_4e5d
halt_uxn_stack_h_l330_c12_4e5d : entity work.halt_0CLK_a61a57d5 port map (
clk,
halt_uxn_stack_h_l330_c12_4e5d_CLOCK_ENABLE,
halt_uxn_stack_h_l330_c12_4e5d_ins,
halt_uxn_stack_h_l330_c12_4e5d_err,
halt_uxn_stack_h_l330_c12_4e5d_return_output);

-- BIN_OP_EQ_uxn_stack_h_l334_c6_deae
BIN_OP_EQ_uxn_stack_h_l334_c6_deae : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_stack_h_l334_c6_deae_left,
BIN_OP_EQ_uxn_stack_h_l334_c6_deae_right,
BIN_OP_EQ_uxn_stack_h_l334_c6_deae_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l334_c1_4a3c
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l334_c1_4a3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l334_c1_4a3c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l334_c1_4a3c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l334_c1_4a3c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l334_c1_4a3c_return_output);

-- stack_pointer_set_uxn_stack_h_l335_c3_778d
stack_pointer_set_uxn_stack_h_l335_c3_778d : entity work.stack_pointer_set_0CLK_88c0218f port map (
clk,
stack_pointer_set_uxn_stack_h_l335_c3_778d_CLOCK_ENABLE,
stack_pointer_set_uxn_stack_h_l335_c3_778d_stack_index,
stack_pointer_set_uxn_stack_h_l335_c3_778d_value);

-- stack_pointer_get_uxn_stack_h_l320_l328_DUPLICATE_98b9
stack_pointer_get_uxn_stack_h_l320_l328_DUPLICATE_98b9 : entity work.stack_pointer_get_0CLK_c35c94f1 port map (
clk,
stack_pointer_get_uxn_stack_h_l320_l328_DUPLICATE_98b9_CLOCK_ENABLE,
stack_pointer_get_uxn_stack_h_l320_l328_DUPLICATE_98b9_stack_index,
stack_pointer_get_uxn_stack_h_l320_l328_DUPLICATE_98b9_return_output);



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
 BIN_OP_GT_uxn_stack_h_l320_c6_7f0f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l320_c1_caf5_return_output,
 result_MUX_uxn_stack_h_l320_c2_41b9_return_output,
 halt_return_MUX_uxn_stack_h_l320_c2_41b9_return_output,
 halt_uxn_stack_h_l321_c12_6aa4_return_output,
 BIN_OP_AND_uxn_stack_h_l328_c13_7ba4_return_output,
 BIN_OP_PLUS_uxn_stack_h_l328_c13_6fa5_return_output,
 BIN_OP_PLUS_uxn_stack_h_l328_c13_1fca_return_output,
 BIN_OP_GT_uxn_stack_h_l329_c6_27d2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l329_c1_8e8b_return_output,
 result_MUX_uxn_stack_h_l329_c2_b627_return_output,
 halt_return_MUX_uxn_stack_h_l329_c2_b627_return_output,
 halt_uxn_stack_h_l330_c12_4e5d_return_output,
 BIN_OP_EQ_uxn_stack_h_l334_c6_deae_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l334_c1_4a3c_return_output,
 stack_pointer_get_uxn_stack_h_l320_l328_DUPLICATE_98b9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_mul : unsigned(7 downto 0);
 variable VAR_add : signed(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l320_c6_7f0f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l320_c6_7f0f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l320_c6_7f0f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l320_c1_caf5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l320_c1_caf5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l320_c1_caf5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l320_c1_caf5_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l320_c2_41b9_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l320_c2_41b9_iffalse : unsigned(7 downto 0);
 variable VAR_result_uxn_stack_h_l324_c3_227a : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l320_c2_41b9_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l320_c2_41b9_cond : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l320_c2_41b9_iftrue : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l320_c2_41b9_iffalse : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l320_c2_41b9_return_output : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l320_c2_41b9_cond : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l321_c12_6aa4_ins : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l321_c12_6aa4_err : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l321_c12_6aa4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l321_c12_6aa4_return_output : unsigned(7 downto 0);
 variable VAR_set_tmp_uxn_stack_h_l328_c2_7699 : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l328_c13_7ba4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l328_c13_7ba4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l328_c13_7ba4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l328_c13_6fa5_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l328_c13_6fa5_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l328_c13_6fa5_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l328_c13_1fca_left : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l328_c13_1fca_right : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l328_c13_1fca_return_output : signed(10 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l329_c6_27d2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l329_c6_27d2_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l329_c6_27d2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l329_c1_8e8b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l329_c1_8e8b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l329_c1_8e8b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l329_c1_8e8b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l329_c2_b627_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l329_c2_b627_iffalse : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l329_c2_b627_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l329_c2_b627_cond : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l329_c2_b627_iftrue : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l329_c2_b627_iffalse : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l329_c2_b627_return_output : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l329_c2_b627_cond : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l330_c12_4e5d_ins : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l330_c12_4e5d_err : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l330_c12_4e5d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l330_c12_4e5d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l334_c6_deae_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l334_c6_deae_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l334_c6_deae_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l334_c1_4a3c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l334_c1_4a3c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l334_c1_4a3c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l334_c1_4a3c_iffalse : unsigned(0 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l335_c3_778d_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l335_c3_778d_value : unsigned(7 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l335_c3_778d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l320_l328_DUPLICATE_98b9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l320_l328_DUPLICATE_98b9_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l320_l328_DUPLICATE_98b9_return_output : unsigned(7 downto 0);
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
     VAR_result_uxn_stack_h_l324_c3_227a := resize(to_unsigned(0, 1), 8);
     VAR_result_MUX_uxn_stack_h_l320_c2_41b9_iffalse := VAR_result_uxn_stack_h_l324_c3_227a;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l329_c1_8e8b_iffalse := to_unsigned(0, 1);
     VAR_halt_uxn_stack_h_l321_c12_6aa4_err := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_stack_h_l334_c6_deae_right := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_stack_h_l329_c6_27d2_right := to_unsigned(254, 8);
     VAR_halt_return_MUX_uxn_stack_h_l320_c2_41b9_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l320_c1_caf5_iffalse := to_unsigned(0, 1);
     VAR_halt_return_MUX_uxn_stack_h_l320_c2_41b9_iffalse := to_unsigned(0, 1);
     VAR_halt_return_MUX_uxn_stack_h_l329_c2_b627_iftrue := to_unsigned(1, 1);
     VAR_halt_uxn_stack_h_l330_c12_4e5d_err := resize(to_unsigned(2, 2), 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l334_c1_4a3c_iffalse := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l320_c1_caf5_iftrue := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l329_c1_8e8b_iftrue := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l334_c1_4a3c_iftrue := VAR_CLOCK_ENABLE;
     VAR_stack_pointer_get_uxn_stack_h_l320_l328_DUPLICATE_98b9_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_stack_h_l328_c13_6fa5_right := VAR_add;
     VAR_halt_uxn_stack_h_l321_c12_6aa4_ins := VAR_ins;
     VAR_halt_uxn_stack_h_l330_c12_4e5d_ins := VAR_ins;
     VAR_BIN_OP_AND_uxn_stack_h_l328_c13_7ba4_right := VAR_k;
     VAR_BIN_OP_AND_uxn_stack_h_l328_c13_7ba4_left := VAR_mul;
     VAR_BIN_OP_GT_uxn_stack_h_l320_c6_7f0f_left := VAR_mul;
     VAR_stack_pointer_get_uxn_stack_h_l320_l328_DUPLICATE_98b9_stack_index := VAR_stack_index;
     VAR_stack_pointer_set_uxn_stack_h_l335_c3_778d_stack_index := VAR_stack_index;
     -- BIN_OP_AND[uxn_stack_h_l328_c13_7ba4] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_stack_h_l328_c13_7ba4_left <= VAR_BIN_OP_AND_uxn_stack_h_l328_c13_7ba4_left;
     BIN_OP_AND_uxn_stack_h_l328_c13_7ba4_right <= VAR_BIN_OP_AND_uxn_stack_h_l328_c13_7ba4_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_stack_h_l328_c13_7ba4_return_output := BIN_OP_AND_uxn_stack_h_l328_c13_7ba4_return_output;

     -- stack_pointer_get_uxn_stack_h_l320_l328_DUPLICATE_98b9 LATENCY=0
     -- Clock enable
     stack_pointer_get_uxn_stack_h_l320_l328_DUPLICATE_98b9_CLOCK_ENABLE <= VAR_stack_pointer_get_uxn_stack_h_l320_l328_DUPLICATE_98b9_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_get_uxn_stack_h_l320_l328_DUPLICATE_98b9_stack_index <= VAR_stack_pointer_get_uxn_stack_h_l320_l328_DUPLICATE_98b9_stack_index;
     -- Outputs
     VAR_stack_pointer_get_uxn_stack_h_l320_l328_DUPLICATE_98b9_return_output := stack_pointer_get_uxn_stack_h_l320_l328_DUPLICATE_98b9_return_output;

     -- Submodule level 1
     VAR_BIN_OP_PLUS_uxn_stack_h_l328_c13_6fa5_left := signed(std_logic_vector(resize(VAR_BIN_OP_AND_uxn_stack_h_l328_c13_7ba4_return_output, 9)));
     VAR_BIN_OP_GT_uxn_stack_h_l320_c6_7f0f_right := VAR_stack_pointer_get_uxn_stack_h_l320_l328_DUPLICATE_98b9_return_output;
     VAR_BIN_OP_PLUS_uxn_stack_h_l328_c13_1fca_right := signed(std_logic_vector(resize(VAR_stack_pointer_get_uxn_stack_h_l320_l328_DUPLICATE_98b9_return_output, 9)));
     -- BIN_OP_PLUS[uxn_stack_h_l328_c13_6fa5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_stack_h_l328_c13_6fa5_left <= VAR_BIN_OP_PLUS_uxn_stack_h_l328_c13_6fa5_left;
     BIN_OP_PLUS_uxn_stack_h_l328_c13_6fa5_right <= VAR_BIN_OP_PLUS_uxn_stack_h_l328_c13_6fa5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_stack_h_l328_c13_6fa5_return_output := BIN_OP_PLUS_uxn_stack_h_l328_c13_6fa5_return_output;

     -- BIN_OP_GT[uxn_stack_h_l320_c6_7f0f] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_stack_h_l320_c6_7f0f_left <= VAR_BIN_OP_GT_uxn_stack_h_l320_c6_7f0f_left;
     BIN_OP_GT_uxn_stack_h_l320_c6_7f0f_right <= VAR_BIN_OP_GT_uxn_stack_h_l320_c6_7f0f_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_stack_h_l320_c6_7f0f_return_output := BIN_OP_GT_uxn_stack_h_l320_c6_7f0f_return_output;

     -- Submodule level 2
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l320_c1_caf5_cond := VAR_BIN_OP_GT_uxn_stack_h_l320_c6_7f0f_return_output;
     VAR_halt_return_MUX_uxn_stack_h_l320_c2_41b9_cond := VAR_BIN_OP_GT_uxn_stack_h_l320_c6_7f0f_return_output;
     VAR_result_MUX_uxn_stack_h_l320_c2_41b9_cond := VAR_BIN_OP_GT_uxn_stack_h_l320_c6_7f0f_return_output;
     VAR_BIN_OP_PLUS_uxn_stack_h_l328_c13_1fca_left := VAR_BIN_OP_PLUS_uxn_stack_h_l328_c13_6fa5_return_output;
     -- halt_return_MUX[uxn_stack_h_l320_c2_41b9] LATENCY=0
     -- Inputs
     halt_return_MUX_uxn_stack_h_l320_c2_41b9_cond <= VAR_halt_return_MUX_uxn_stack_h_l320_c2_41b9_cond;
     halt_return_MUX_uxn_stack_h_l320_c2_41b9_iftrue <= VAR_halt_return_MUX_uxn_stack_h_l320_c2_41b9_iftrue;
     halt_return_MUX_uxn_stack_h_l320_c2_41b9_iffalse <= VAR_halt_return_MUX_uxn_stack_h_l320_c2_41b9_iffalse;
     -- Outputs
     VAR_halt_return_MUX_uxn_stack_h_l320_c2_41b9_return_output := halt_return_MUX_uxn_stack_h_l320_c2_41b9_return_output;

     -- BIN_OP_PLUS[uxn_stack_h_l328_c13_1fca] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_stack_h_l328_c13_1fca_left <= VAR_BIN_OP_PLUS_uxn_stack_h_l328_c13_1fca_left;
     BIN_OP_PLUS_uxn_stack_h_l328_c13_1fca_right <= VAR_BIN_OP_PLUS_uxn_stack_h_l328_c13_1fca_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_stack_h_l328_c13_1fca_return_output := BIN_OP_PLUS_uxn_stack_h_l328_c13_1fca_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l320_c1_caf5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l320_c1_caf5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l320_c1_caf5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l320_c1_caf5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l320_c1_caf5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l320_c1_caf5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l320_c1_caf5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l320_c1_caf5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l320_c1_caf5_return_output;

     -- Submodule level 3
     VAR_set_tmp_uxn_stack_h_l328_c2_7699 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_stack_h_l328_c13_1fca_return_output)),8);
     VAR_halt_uxn_stack_h_l321_c12_6aa4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l320_c1_caf5_return_output;
     VAR_halt_return_MUX_uxn_stack_h_l329_c2_b627_iffalse := VAR_halt_return_MUX_uxn_stack_h_l320_c2_41b9_return_output;
     VAR_BIN_OP_GT_uxn_stack_h_l329_c6_27d2_left := VAR_set_tmp_uxn_stack_h_l328_c2_7699;
     REG_VAR_set_tmp := VAR_set_tmp_uxn_stack_h_l328_c2_7699;
     VAR_stack_pointer_set_uxn_stack_h_l335_c3_778d_value := VAR_set_tmp_uxn_stack_h_l328_c2_7699;
     -- BIN_OP_GT[uxn_stack_h_l329_c6_27d2] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_stack_h_l329_c6_27d2_left <= VAR_BIN_OP_GT_uxn_stack_h_l329_c6_27d2_left;
     BIN_OP_GT_uxn_stack_h_l329_c6_27d2_right <= VAR_BIN_OP_GT_uxn_stack_h_l329_c6_27d2_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_stack_h_l329_c6_27d2_return_output := BIN_OP_GT_uxn_stack_h_l329_c6_27d2_return_output;

     -- halt[uxn_stack_h_l321_c12_6aa4] LATENCY=0
     -- Clock enable
     halt_uxn_stack_h_l321_c12_6aa4_CLOCK_ENABLE <= VAR_halt_uxn_stack_h_l321_c12_6aa4_CLOCK_ENABLE;
     -- Inputs
     halt_uxn_stack_h_l321_c12_6aa4_ins <= VAR_halt_uxn_stack_h_l321_c12_6aa4_ins;
     halt_uxn_stack_h_l321_c12_6aa4_err <= VAR_halt_uxn_stack_h_l321_c12_6aa4_err;
     -- Outputs
     VAR_halt_uxn_stack_h_l321_c12_6aa4_return_output := halt_uxn_stack_h_l321_c12_6aa4_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l329_c1_8e8b_cond := VAR_BIN_OP_GT_uxn_stack_h_l329_c6_27d2_return_output;
     VAR_halt_return_MUX_uxn_stack_h_l329_c2_b627_cond := VAR_BIN_OP_GT_uxn_stack_h_l329_c6_27d2_return_output;
     VAR_result_MUX_uxn_stack_h_l329_c2_b627_cond := VAR_BIN_OP_GT_uxn_stack_h_l329_c6_27d2_return_output;
     VAR_result_MUX_uxn_stack_h_l320_c2_41b9_iftrue := VAR_halt_uxn_stack_h_l321_c12_6aa4_return_output;
     -- halt_return_MUX[uxn_stack_h_l329_c2_b627] LATENCY=0
     -- Inputs
     halt_return_MUX_uxn_stack_h_l329_c2_b627_cond <= VAR_halt_return_MUX_uxn_stack_h_l329_c2_b627_cond;
     halt_return_MUX_uxn_stack_h_l329_c2_b627_iftrue <= VAR_halt_return_MUX_uxn_stack_h_l329_c2_b627_iftrue;
     halt_return_MUX_uxn_stack_h_l329_c2_b627_iffalse <= VAR_halt_return_MUX_uxn_stack_h_l329_c2_b627_iffalse;
     -- Outputs
     VAR_halt_return_MUX_uxn_stack_h_l329_c2_b627_return_output := halt_return_MUX_uxn_stack_h_l329_c2_b627_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l329_c1_8e8b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l329_c1_8e8b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l329_c1_8e8b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l329_c1_8e8b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l329_c1_8e8b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l329_c1_8e8b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l329_c1_8e8b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l329_c1_8e8b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l329_c1_8e8b_return_output;

     -- result_MUX[uxn_stack_h_l320_c2_41b9] LATENCY=0
     -- Inputs
     result_MUX_uxn_stack_h_l320_c2_41b9_cond <= VAR_result_MUX_uxn_stack_h_l320_c2_41b9_cond;
     result_MUX_uxn_stack_h_l320_c2_41b9_iftrue <= VAR_result_MUX_uxn_stack_h_l320_c2_41b9_iftrue;
     result_MUX_uxn_stack_h_l320_c2_41b9_iffalse <= VAR_result_MUX_uxn_stack_h_l320_c2_41b9_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_stack_h_l320_c2_41b9_return_output := result_MUX_uxn_stack_h_l320_c2_41b9_return_output;

     -- Submodule level 5
     VAR_halt_uxn_stack_h_l330_c12_4e5d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l329_c1_8e8b_return_output;
     VAR_BIN_OP_EQ_uxn_stack_h_l334_c6_deae_left := VAR_halt_return_MUX_uxn_stack_h_l329_c2_b627_return_output;
     REG_VAR_halt_return := VAR_halt_return_MUX_uxn_stack_h_l329_c2_b627_return_output;
     VAR_result_MUX_uxn_stack_h_l329_c2_b627_iffalse := VAR_result_MUX_uxn_stack_h_l320_c2_41b9_return_output;
     -- BIN_OP_EQ[uxn_stack_h_l334_c6_deae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_stack_h_l334_c6_deae_left <= VAR_BIN_OP_EQ_uxn_stack_h_l334_c6_deae_left;
     BIN_OP_EQ_uxn_stack_h_l334_c6_deae_right <= VAR_BIN_OP_EQ_uxn_stack_h_l334_c6_deae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_stack_h_l334_c6_deae_return_output := BIN_OP_EQ_uxn_stack_h_l334_c6_deae_return_output;

     -- halt[uxn_stack_h_l330_c12_4e5d] LATENCY=0
     -- Clock enable
     halt_uxn_stack_h_l330_c12_4e5d_CLOCK_ENABLE <= VAR_halt_uxn_stack_h_l330_c12_4e5d_CLOCK_ENABLE;
     -- Inputs
     halt_uxn_stack_h_l330_c12_4e5d_ins <= VAR_halt_uxn_stack_h_l330_c12_4e5d_ins;
     halt_uxn_stack_h_l330_c12_4e5d_err <= VAR_halt_uxn_stack_h_l330_c12_4e5d_err;
     -- Outputs
     VAR_halt_uxn_stack_h_l330_c12_4e5d_return_output := halt_uxn_stack_h_l330_c12_4e5d_return_output;

     -- Submodule level 6
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l334_c1_4a3c_cond := VAR_BIN_OP_EQ_uxn_stack_h_l334_c6_deae_return_output;
     VAR_result_MUX_uxn_stack_h_l329_c2_b627_iftrue := VAR_halt_uxn_stack_h_l330_c12_4e5d_return_output;
     -- result_MUX[uxn_stack_h_l329_c2_b627] LATENCY=0
     -- Inputs
     result_MUX_uxn_stack_h_l329_c2_b627_cond <= VAR_result_MUX_uxn_stack_h_l329_c2_b627_cond;
     result_MUX_uxn_stack_h_l329_c2_b627_iftrue <= VAR_result_MUX_uxn_stack_h_l329_c2_b627_iftrue;
     result_MUX_uxn_stack_h_l329_c2_b627_iffalse <= VAR_result_MUX_uxn_stack_h_l329_c2_b627_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_stack_h_l329_c2_b627_return_output := result_MUX_uxn_stack_h_l329_c2_b627_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l334_c1_4a3c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l334_c1_4a3c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l334_c1_4a3c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l334_c1_4a3c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l334_c1_4a3c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l334_c1_4a3c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l334_c1_4a3c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l334_c1_4a3c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l334_c1_4a3c_return_output;

     -- Submodule level 7
     VAR_stack_pointer_set_uxn_stack_h_l335_c3_778d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l334_c1_4a3c_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_stack_h_l329_c2_b627_return_output;
     VAR_return_output := VAR_result_MUX_uxn_stack_h_l329_c2_b627_return_output;
     -- stack_pointer_set[uxn_stack_h_l335_c3_778d] LATENCY=0
     -- Clock enable
     stack_pointer_set_uxn_stack_h_l335_c3_778d_CLOCK_ENABLE <= VAR_stack_pointer_set_uxn_stack_h_l335_c3_778d_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_set_uxn_stack_h_l335_c3_778d_stack_index <= VAR_stack_pointer_set_uxn_stack_h_l335_c3_778d_stack_index;
     stack_pointer_set_uxn_stack_h_l335_c3_778d_value <= VAR_stack_pointer_set_uxn_stack_h_l335_c3_778d_value;
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
