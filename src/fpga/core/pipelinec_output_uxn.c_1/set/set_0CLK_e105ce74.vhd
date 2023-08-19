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
entity set_0CLK_e105ce74 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 mul : in unsigned(7 downto 0);
 add : in signed(7 downto 0);
 return_output : out unsigned(7 downto 0));
end set_0CLK_e105ce74;
architecture arch of set_0CLK_e105ce74 is
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
-- BIN_OP_GT[uxn_stack_h_l314_c6_3563]
signal BIN_OP_GT_uxn_stack_h_l314_c6_3563_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l314_c6_3563_right : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l314_c6_3563_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l314_c1_c469]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_c469_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_c469_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_c469_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_c469_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_stack_h_l314_c2_6fce]
signal result_MUX_uxn_stack_h_l314_c2_6fce_cond : unsigned(0 downto 0);
signal result_MUX_uxn_stack_h_l314_c2_6fce_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l314_c2_6fce_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l314_c2_6fce_return_output : unsigned(7 downto 0);

-- halt_return_MUX[uxn_stack_h_l314_c2_6fce]
signal halt_return_MUX_uxn_stack_h_l314_c2_6fce_cond : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l314_c2_6fce_iftrue : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l314_c2_6fce_iffalse : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l314_c2_6fce_return_output : unsigned(0 downto 0);

-- halt[uxn_stack_h_l315_c12_e349]
signal halt_uxn_stack_h_l315_c12_e349_CLOCK_ENABLE : unsigned(0 downto 0);
signal halt_uxn_stack_h_l315_c12_e349_ins : unsigned(7 downto 0);
signal halt_uxn_stack_h_l315_c12_e349_err : unsigned(7 downto 0);
signal halt_uxn_stack_h_l315_c12_e349_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_stack_h_l322_c13_9d86]
signal BIN_OP_AND_uxn_stack_h_l322_c13_9d86_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_stack_h_l322_c13_9d86_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_stack_h_l322_c13_9d86_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_stack_h_l322_c13_9b06]
signal BIN_OP_PLUS_uxn_stack_h_l322_c13_9b06_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l322_c13_9b06_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l322_c13_9b06_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_stack_h_l322_c13_16c8]
signal BIN_OP_PLUS_uxn_stack_h_l322_c13_16c8_left : signed(9 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l322_c13_16c8_right : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l322_c13_16c8_return_output : signed(10 downto 0);

-- BIN_OP_GT[uxn_stack_h_l323_c6_e52c]
signal BIN_OP_GT_uxn_stack_h_l323_c6_e52c_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l323_c6_e52c_right : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l323_c6_e52c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l323_c1_7e87]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_7e87_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_7e87_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_7e87_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_7e87_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_stack_h_l323_c2_bcd2]
signal result_MUX_uxn_stack_h_l323_c2_bcd2_cond : unsigned(0 downto 0);
signal result_MUX_uxn_stack_h_l323_c2_bcd2_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l323_c2_bcd2_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l323_c2_bcd2_return_output : unsigned(7 downto 0);

-- halt_return_MUX[uxn_stack_h_l323_c2_bcd2]
signal halt_return_MUX_uxn_stack_h_l323_c2_bcd2_cond : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l323_c2_bcd2_iftrue : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l323_c2_bcd2_iffalse : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l323_c2_bcd2_return_output : unsigned(0 downto 0);

-- halt[uxn_stack_h_l324_c12_85a5]
signal halt_uxn_stack_h_l324_c12_85a5_CLOCK_ENABLE : unsigned(0 downto 0);
signal halt_uxn_stack_h_l324_c12_85a5_ins : unsigned(7 downto 0);
signal halt_uxn_stack_h_l324_c12_85a5_err : unsigned(7 downto 0);
signal halt_uxn_stack_h_l324_c12_85a5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_stack_h_l328_c6_ea43]
signal BIN_OP_EQ_uxn_stack_h_l328_c6_ea43_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l328_c6_ea43_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l328_c6_ea43_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l328_c1_4c38]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_4c38_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_4c38_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_4c38_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_4c38_return_output : unsigned(0 downto 0);

-- stack_pointer_set[uxn_stack_h_l329_c3_5b3f]
signal stack_pointer_set_uxn_stack_h_l329_c3_5b3f_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_set_uxn_stack_h_l329_c3_5b3f_stack_index : unsigned(0 downto 0);
signal stack_pointer_set_uxn_stack_h_l329_c3_5b3f_value : unsigned(7 downto 0);

-- stack_pointer_get_uxn_stack_h_l314_l322_DUPLICATE_13bf
signal stack_pointer_get_uxn_stack_h_l314_l322_DUPLICATE_13bf_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l314_l322_DUPLICATE_13bf_stack_index : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l314_l322_DUPLICATE_13bf_return_output : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_GT_uxn_stack_h_l314_c6_3563
BIN_OP_GT_uxn_stack_h_l314_c6_3563 : entity work.BIN_OP_GT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_stack_h_l314_c6_3563_left,
BIN_OP_GT_uxn_stack_h_l314_c6_3563_right,
BIN_OP_GT_uxn_stack_h_l314_c6_3563_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_c469
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_c469 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_c469_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_c469_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_c469_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_c469_return_output);

-- result_MUX_uxn_stack_h_l314_c2_6fce
result_MUX_uxn_stack_h_l314_c2_6fce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_stack_h_l314_c2_6fce_cond,
result_MUX_uxn_stack_h_l314_c2_6fce_iftrue,
result_MUX_uxn_stack_h_l314_c2_6fce_iffalse,
result_MUX_uxn_stack_h_l314_c2_6fce_return_output);

-- halt_return_MUX_uxn_stack_h_l314_c2_6fce
halt_return_MUX_uxn_stack_h_l314_c2_6fce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
halt_return_MUX_uxn_stack_h_l314_c2_6fce_cond,
halt_return_MUX_uxn_stack_h_l314_c2_6fce_iftrue,
halt_return_MUX_uxn_stack_h_l314_c2_6fce_iffalse,
halt_return_MUX_uxn_stack_h_l314_c2_6fce_return_output);

-- halt_uxn_stack_h_l315_c12_e349
halt_uxn_stack_h_l315_c12_e349 : entity work.halt_0CLK_fd588851 port map (
clk,
halt_uxn_stack_h_l315_c12_e349_CLOCK_ENABLE,
halt_uxn_stack_h_l315_c12_e349_ins,
halt_uxn_stack_h_l315_c12_e349_err,
halt_uxn_stack_h_l315_c12_e349_return_output);

-- BIN_OP_AND_uxn_stack_h_l322_c13_9d86
BIN_OP_AND_uxn_stack_h_l322_c13_9d86 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_stack_h_l322_c13_9d86_left,
BIN_OP_AND_uxn_stack_h_l322_c13_9d86_right,
BIN_OP_AND_uxn_stack_h_l322_c13_9d86_return_output);

-- BIN_OP_PLUS_uxn_stack_h_l322_c13_9b06
BIN_OP_PLUS_uxn_stack_h_l322_c13_9b06 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_stack_h_l322_c13_9b06_left,
BIN_OP_PLUS_uxn_stack_h_l322_c13_9b06_right,
BIN_OP_PLUS_uxn_stack_h_l322_c13_9b06_return_output);

-- BIN_OP_PLUS_uxn_stack_h_l322_c13_16c8
BIN_OP_PLUS_uxn_stack_h_l322_c13_16c8 : entity work.BIN_OP_PLUS_int10_t_int9_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_stack_h_l322_c13_16c8_left,
BIN_OP_PLUS_uxn_stack_h_l322_c13_16c8_right,
BIN_OP_PLUS_uxn_stack_h_l322_c13_16c8_return_output);

-- BIN_OP_GT_uxn_stack_h_l323_c6_e52c
BIN_OP_GT_uxn_stack_h_l323_c6_e52c : entity work.BIN_OP_GT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_stack_h_l323_c6_e52c_left,
BIN_OP_GT_uxn_stack_h_l323_c6_e52c_right,
BIN_OP_GT_uxn_stack_h_l323_c6_e52c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_7e87
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_7e87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_7e87_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_7e87_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_7e87_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_7e87_return_output);

-- result_MUX_uxn_stack_h_l323_c2_bcd2
result_MUX_uxn_stack_h_l323_c2_bcd2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_stack_h_l323_c2_bcd2_cond,
result_MUX_uxn_stack_h_l323_c2_bcd2_iftrue,
result_MUX_uxn_stack_h_l323_c2_bcd2_iffalse,
result_MUX_uxn_stack_h_l323_c2_bcd2_return_output);

-- halt_return_MUX_uxn_stack_h_l323_c2_bcd2
halt_return_MUX_uxn_stack_h_l323_c2_bcd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
halt_return_MUX_uxn_stack_h_l323_c2_bcd2_cond,
halt_return_MUX_uxn_stack_h_l323_c2_bcd2_iftrue,
halt_return_MUX_uxn_stack_h_l323_c2_bcd2_iffalse,
halt_return_MUX_uxn_stack_h_l323_c2_bcd2_return_output);

-- halt_uxn_stack_h_l324_c12_85a5
halt_uxn_stack_h_l324_c12_85a5 : entity work.halt_0CLK_fd588851 port map (
clk,
halt_uxn_stack_h_l324_c12_85a5_CLOCK_ENABLE,
halt_uxn_stack_h_l324_c12_85a5_ins,
halt_uxn_stack_h_l324_c12_85a5_err,
halt_uxn_stack_h_l324_c12_85a5_return_output);

-- BIN_OP_EQ_uxn_stack_h_l328_c6_ea43
BIN_OP_EQ_uxn_stack_h_l328_c6_ea43 : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_stack_h_l328_c6_ea43_left,
BIN_OP_EQ_uxn_stack_h_l328_c6_ea43_right,
BIN_OP_EQ_uxn_stack_h_l328_c6_ea43_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_4c38
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_4c38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_4c38_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_4c38_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_4c38_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_4c38_return_output);

-- stack_pointer_set_uxn_stack_h_l329_c3_5b3f
stack_pointer_set_uxn_stack_h_l329_c3_5b3f : entity work.stack_pointer_set_0CLK_de264c78 port map (
stack_pointer_set_uxn_stack_h_l329_c3_5b3f_CLOCK_ENABLE,
stack_pointer_set_uxn_stack_h_l329_c3_5b3f_stack_index,
stack_pointer_set_uxn_stack_h_l329_c3_5b3f_value);

-- stack_pointer_get_uxn_stack_h_l314_l322_DUPLICATE_13bf
stack_pointer_get_uxn_stack_h_l314_l322_DUPLICATE_13bf : entity work.stack_pointer_get_0CLK_7bf2eff3 port map (
clk,
stack_pointer_get_uxn_stack_h_l314_l322_DUPLICATE_13bf_CLOCK_ENABLE,
stack_pointer_get_uxn_stack_h_l314_l322_DUPLICATE_13bf_stack_index,
stack_pointer_get_uxn_stack_h_l314_l322_DUPLICATE_13bf_return_output);



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
 BIN_OP_GT_uxn_stack_h_l314_c6_3563_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_c469_return_output,
 result_MUX_uxn_stack_h_l314_c2_6fce_return_output,
 halt_return_MUX_uxn_stack_h_l314_c2_6fce_return_output,
 halt_uxn_stack_h_l315_c12_e349_return_output,
 BIN_OP_AND_uxn_stack_h_l322_c13_9d86_return_output,
 BIN_OP_PLUS_uxn_stack_h_l322_c13_9b06_return_output,
 BIN_OP_PLUS_uxn_stack_h_l322_c13_16c8_return_output,
 BIN_OP_GT_uxn_stack_h_l323_c6_e52c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_7e87_return_output,
 result_MUX_uxn_stack_h_l323_c2_bcd2_return_output,
 halt_return_MUX_uxn_stack_h_l323_c2_bcd2_return_output,
 halt_uxn_stack_h_l324_c12_85a5_return_output,
 BIN_OP_EQ_uxn_stack_h_l328_c6_ea43_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_4c38_return_output,
 stack_pointer_get_uxn_stack_h_l314_l322_DUPLICATE_13bf_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_mul : unsigned(7 downto 0);
 variable VAR_add : signed(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l314_c6_3563_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l314_c6_3563_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l314_c6_3563_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_c469_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_c469_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_c469_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_c469_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l314_c2_6fce_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l314_c2_6fce_iffalse : unsigned(7 downto 0);
 variable VAR_result_uxn_stack_h_l318_c3_b38f : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l314_c2_6fce_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l314_c2_6fce_cond : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l314_c2_6fce_iftrue : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l314_c2_6fce_iffalse : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l314_c2_6fce_return_output : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l314_c2_6fce_cond : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l315_c12_e349_ins : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l315_c12_e349_err : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l315_c12_e349_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l315_c12_e349_return_output : unsigned(7 downto 0);
 variable VAR_set_tmp_uxn_stack_h_l322_c2_e6b6 : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l322_c13_9d86_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l322_c13_9d86_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l322_c13_9d86_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l322_c13_9b06_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l322_c13_9b06_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l322_c13_9b06_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l322_c13_16c8_left : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l322_c13_16c8_right : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l322_c13_16c8_return_output : signed(10 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l323_c6_e52c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l323_c6_e52c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l323_c6_e52c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_7e87_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_7e87_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_7e87_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_7e87_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l323_c2_bcd2_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l323_c2_bcd2_iffalse : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l323_c2_bcd2_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l323_c2_bcd2_cond : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l323_c2_bcd2_iftrue : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l323_c2_bcd2_iffalse : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l323_c2_bcd2_return_output : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l323_c2_bcd2_cond : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l324_c12_85a5_ins : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l324_c12_85a5_err : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l324_c12_85a5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l324_c12_85a5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l328_c6_ea43_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l328_c6_ea43_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l328_c6_ea43_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_4c38_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_4c38_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_4c38_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_4c38_iffalse : unsigned(0 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l329_c3_5b3f_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l329_c3_5b3f_value : unsigned(7 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l329_c3_5b3f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l314_l322_DUPLICATE_13bf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l314_l322_DUPLICATE_13bf_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l314_l322_DUPLICATE_13bf_return_output : unsigned(7 downto 0);
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
     VAR_halt_return_MUX_uxn_stack_h_l314_c2_6fce_iftrue := to_unsigned(1, 1);
     VAR_halt_uxn_stack_h_l315_c12_e349_err := resize(to_unsigned(1, 1), 8);
     VAR_result_uxn_stack_h_l318_c3_b38f := resize(to_unsigned(0, 1), 8);
     VAR_result_MUX_uxn_stack_h_l314_c2_6fce_iffalse := VAR_result_uxn_stack_h_l318_c3_b38f;
     VAR_halt_uxn_stack_h_l324_c12_85a5_err := resize(to_unsigned(2, 2), 8);
     VAR_halt_return_MUX_uxn_stack_h_l314_c2_6fce_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_c469_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_7e87_iffalse := to_unsigned(0, 1);
     VAR_halt_return_MUX_uxn_stack_h_l323_c2_bcd2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_stack_h_l323_c6_e52c_right := to_unsigned(254, 8);
     VAR_BIN_OP_EQ_uxn_stack_h_l328_c6_ea43_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_4c38_iffalse := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_c469_iftrue := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_7e87_iftrue := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_4c38_iftrue := VAR_CLOCK_ENABLE;
     VAR_stack_pointer_get_uxn_stack_h_l314_l322_DUPLICATE_13bf_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_stack_h_l322_c13_9b06_right := VAR_add;
     VAR_halt_uxn_stack_h_l315_c12_e349_ins := VAR_ins;
     VAR_halt_uxn_stack_h_l324_c12_85a5_ins := VAR_ins;
     VAR_BIN_OP_AND_uxn_stack_h_l322_c13_9d86_right := VAR_k;
     VAR_BIN_OP_AND_uxn_stack_h_l322_c13_9d86_left := VAR_mul;
     VAR_BIN_OP_GT_uxn_stack_h_l314_c6_3563_left := VAR_mul;
     VAR_stack_pointer_get_uxn_stack_h_l314_l322_DUPLICATE_13bf_stack_index := VAR_stack_index;
     VAR_stack_pointer_set_uxn_stack_h_l329_c3_5b3f_stack_index := VAR_stack_index;
     -- BIN_OP_AND[uxn_stack_h_l322_c13_9d86] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_stack_h_l322_c13_9d86_left <= VAR_BIN_OP_AND_uxn_stack_h_l322_c13_9d86_left;
     BIN_OP_AND_uxn_stack_h_l322_c13_9d86_right <= VAR_BIN_OP_AND_uxn_stack_h_l322_c13_9d86_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_stack_h_l322_c13_9d86_return_output := BIN_OP_AND_uxn_stack_h_l322_c13_9d86_return_output;

     -- stack_pointer_get_uxn_stack_h_l314_l322_DUPLICATE_13bf LATENCY=0
     -- Clock enable
     stack_pointer_get_uxn_stack_h_l314_l322_DUPLICATE_13bf_CLOCK_ENABLE <= VAR_stack_pointer_get_uxn_stack_h_l314_l322_DUPLICATE_13bf_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_get_uxn_stack_h_l314_l322_DUPLICATE_13bf_stack_index <= VAR_stack_pointer_get_uxn_stack_h_l314_l322_DUPLICATE_13bf_stack_index;
     -- Outputs
     VAR_stack_pointer_get_uxn_stack_h_l314_l322_DUPLICATE_13bf_return_output := stack_pointer_get_uxn_stack_h_l314_l322_DUPLICATE_13bf_return_output;

     -- Submodule level 1
     VAR_BIN_OP_PLUS_uxn_stack_h_l322_c13_9b06_left := signed(std_logic_vector(resize(VAR_BIN_OP_AND_uxn_stack_h_l322_c13_9d86_return_output, 9)));
     VAR_BIN_OP_GT_uxn_stack_h_l314_c6_3563_right := VAR_stack_pointer_get_uxn_stack_h_l314_l322_DUPLICATE_13bf_return_output;
     VAR_BIN_OP_PLUS_uxn_stack_h_l322_c13_16c8_right := signed(std_logic_vector(resize(VAR_stack_pointer_get_uxn_stack_h_l314_l322_DUPLICATE_13bf_return_output, 9)));
     -- BIN_OP_GT[uxn_stack_h_l314_c6_3563] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_stack_h_l314_c6_3563_left <= VAR_BIN_OP_GT_uxn_stack_h_l314_c6_3563_left;
     BIN_OP_GT_uxn_stack_h_l314_c6_3563_right <= VAR_BIN_OP_GT_uxn_stack_h_l314_c6_3563_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_stack_h_l314_c6_3563_return_output := BIN_OP_GT_uxn_stack_h_l314_c6_3563_return_output;

     -- BIN_OP_PLUS[uxn_stack_h_l322_c13_9b06] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_stack_h_l322_c13_9b06_left <= VAR_BIN_OP_PLUS_uxn_stack_h_l322_c13_9b06_left;
     BIN_OP_PLUS_uxn_stack_h_l322_c13_9b06_right <= VAR_BIN_OP_PLUS_uxn_stack_h_l322_c13_9b06_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_stack_h_l322_c13_9b06_return_output := BIN_OP_PLUS_uxn_stack_h_l322_c13_9b06_return_output;

     -- Submodule level 2
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_c469_cond := VAR_BIN_OP_GT_uxn_stack_h_l314_c6_3563_return_output;
     VAR_halt_return_MUX_uxn_stack_h_l314_c2_6fce_cond := VAR_BIN_OP_GT_uxn_stack_h_l314_c6_3563_return_output;
     VAR_result_MUX_uxn_stack_h_l314_c2_6fce_cond := VAR_BIN_OP_GT_uxn_stack_h_l314_c6_3563_return_output;
     VAR_BIN_OP_PLUS_uxn_stack_h_l322_c13_16c8_left := VAR_BIN_OP_PLUS_uxn_stack_h_l322_c13_9b06_return_output;
     -- halt_return_MUX[uxn_stack_h_l314_c2_6fce] LATENCY=0
     -- Inputs
     halt_return_MUX_uxn_stack_h_l314_c2_6fce_cond <= VAR_halt_return_MUX_uxn_stack_h_l314_c2_6fce_cond;
     halt_return_MUX_uxn_stack_h_l314_c2_6fce_iftrue <= VAR_halt_return_MUX_uxn_stack_h_l314_c2_6fce_iftrue;
     halt_return_MUX_uxn_stack_h_l314_c2_6fce_iffalse <= VAR_halt_return_MUX_uxn_stack_h_l314_c2_6fce_iffalse;
     -- Outputs
     VAR_halt_return_MUX_uxn_stack_h_l314_c2_6fce_return_output := halt_return_MUX_uxn_stack_h_l314_c2_6fce_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l314_c1_c469] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_c469_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_c469_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_c469_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_c469_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_c469_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_c469_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_c469_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_c469_return_output;

     -- BIN_OP_PLUS[uxn_stack_h_l322_c13_16c8] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_stack_h_l322_c13_16c8_left <= VAR_BIN_OP_PLUS_uxn_stack_h_l322_c13_16c8_left;
     BIN_OP_PLUS_uxn_stack_h_l322_c13_16c8_right <= VAR_BIN_OP_PLUS_uxn_stack_h_l322_c13_16c8_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_stack_h_l322_c13_16c8_return_output := BIN_OP_PLUS_uxn_stack_h_l322_c13_16c8_return_output;

     -- Submodule level 3
     VAR_set_tmp_uxn_stack_h_l322_c2_e6b6 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_stack_h_l322_c13_16c8_return_output)),8);
     VAR_halt_uxn_stack_h_l315_c12_e349_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_c469_return_output;
     VAR_halt_return_MUX_uxn_stack_h_l323_c2_bcd2_iffalse := VAR_halt_return_MUX_uxn_stack_h_l314_c2_6fce_return_output;
     VAR_BIN_OP_GT_uxn_stack_h_l323_c6_e52c_left := VAR_set_tmp_uxn_stack_h_l322_c2_e6b6;
     REG_VAR_set_tmp := VAR_set_tmp_uxn_stack_h_l322_c2_e6b6;
     VAR_stack_pointer_set_uxn_stack_h_l329_c3_5b3f_value := VAR_set_tmp_uxn_stack_h_l322_c2_e6b6;
     -- BIN_OP_GT[uxn_stack_h_l323_c6_e52c] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_stack_h_l323_c6_e52c_left <= VAR_BIN_OP_GT_uxn_stack_h_l323_c6_e52c_left;
     BIN_OP_GT_uxn_stack_h_l323_c6_e52c_right <= VAR_BIN_OP_GT_uxn_stack_h_l323_c6_e52c_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_stack_h_l323_c6_e52c_return_output := BIN_OP_GT_uxn_stack_h_l323_c6_e52c_return_output;

     -- halt[uxn_stack_h_l315_c12_e349] LATENCY=0
     -- Clock enable
     halt_uxn_stack_h_l315_c12_e349_CLOCK_ENABLE <= VAR_halt_uxn_stack_h_l315_c12_e349_CLOCK_ENABLE;
     -- Inputs
     halt_uxn_stack_h_l315_c12_e349_ins <= VAR_halt_uxn_stack_h_l315_c12_e349_ins;
     halt_uxn_stack_h_l315_c12_e349_err <= VAR_halt_uxn_stack_h_l315_c12_e349_err;
     -- Outputs
     VAR_halt_uxn_stack_h_l315_c12_e349_return_output := halt_uxn_stack_h_l315_c12_e349_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_7e87_cond := VAR_BIN_OP_GT_uxn_stack_h_l323_c6_e52c_return_output;
     VAR_halt_return_MUX_uxn_stack_h_l323_c2_bcd2_cond := VAR_BIN_OP_GT_uxn_stack_h_l323_c6_e52c_return_output;
     VAR_result_MUX_uxn_stack_h_l323_c2_bcd2_cond := VAR_BIN_OP_GT_uxn_stack_h_l323_c6_e52c_return_output;
     VAR_result_MUX_uxn_stack_h_l314_c2_6fce_iftrue := VAR_halt_uxn_stack_h_l315_c12_e349_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l323_c1_7e87] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_7e87_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_7e87_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_7e87_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_7e87_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_7e87_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_7e87_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_7e87_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_7e87_return_output;

     -- halt_return_MUX[uxn_stack_h_l323_c2_bcd2] LATENCY=0
     -- Inputs
     halt_return_MUX_uxn_stack_h_l323_c2_bcd2_cond <= VAR_halt_return_MUX_uxn_stack_h_l323_c2_bcd2_cond;
     halt_return_MUX_uxn_stack_h_l323_c2_bcd2_iftrue <= VAR_halt_return_MUX_uxn_stack_h_l323_c2_bcd2_iftrue;
     halt_return_MUX_uxn_stack_h_l323_c2_bcd2_iffalse <= VAR_halt_return_MUX_uxn_stack_h_l323_c2_bcd2_iffalse;
     -- Outputs
     VAR_halt_return_MUX_uxn_stack_h_l323_c2_bcd2_return_output := halt_return_MUX_uxn_stack_h_l323_c2_bcd2_return_output;

     -- result_MUX[uxn_stack_h_l314_c2_6fce] LATENCY=0
     -- Inputs
     result_MUX_uxn_stack_h_l314_c2_6fce_cond <= VAR_result_MUX_uxn_stack_h_l314_c2_6fce_cond;
     result_MUX_uxn_stack_h_l314_c2_6fce_iftrue <= VAR_result_MUX_uxn_stack_h_l314_c2_6fce_iftrue;
     result_MUX_uxn_stack_h_l314_c2_6fce_iffalse <= VAR_result_MUX_uxn_stack_h_l314_c2_6fce_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_stack_h_l314_c2_6fce_return_output := result_MUX_uxn_stack_h_l314_c2_6fce_return_output;

     -- Submodule level 5
     VAR_halt_uxn_stack_h_l324_c12_85a5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_7e87_return_output;
     VAR_BIN_OP_EQ_uxn_stack_h_l328_c6_ea43_left := VAR_halt_return_MUX_uxn_stack_h_l323_c2_bcd2_return_output;
     REG_VAR_halt_return := VAR_halt_return_MUX_uxn_stack_h_l323_c2_bcd2_return_output;
     VAR_result_MUX_uxn_stack_h_l323_c2_bcd2_iffalse := VAR_result_MUX_uxn_stack_h_l314_c2_6fce_return_output;
     -- BIN_OP_EQ[uxn_stack_h_l328_c6_ea43] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_stack_h_l328_c6_ea43_left <= VAR_BIN_OP_EQ_uxn_stack_h_l328_c6_ea43_left;
     BIN_OP_EQ_uxn_stack_h_l328_c6_ea43_right <= VAR_BIN_OP_EQ_uxn_stack_h_l328_c6_ea43_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_stack_h_l328_c6_ea43_return_output := BIN_OP_EQ_uxn_stack_h_l328_c6_ea43_return_output;

     -- halt[uxn_stack_h_l324_c12_85a5] LATENCY=0
     -- Clock enable
     halt_uxn_stack_h_l324_c12_85a5_CLOCK_ENABLE <= VAR_halt_uxn_stack_h_l324_c12_85a5_CLOCK_ENABLE;
     -- Inputs
     halt_uxn_stack_h_l324_c12_85a5_ins <= VAR_halt_uxn_stack_h_l324_c12_85a5_ins;
     halt_uxn_stack_h_l324_c12_85a5_err <= VAR_halt_uxn_stack_h_l324_c12_85a5_err;
     -- Outputs
     VAR_halt_uxn_stack_h_l324_c12_85a5_return_output := halt_uxn_stack_h_l324_c12_85a5_return_output;

     -- Submodule level 6
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_4c38_cond := VAR_BIN_OP_EQ_uxn_stack_h_l328_c6_ea43_return_output;
     VAR_result_MUX_uxn_stack_h_l323_c2_bcd2_iftrue := VAR_halt_uxn_stack_h_l324_c12_85a5_return_output;
     -- result_MUX[uxn_stack_h_l323_c2_bcd2] LATENCY=0
     -- Inputs
     result_MUX_uxn_stack_h_l323_c2_bcd2_cond <= VAR_result_MUX_uxn_stack_h_l323_c2_bcd2_cond;
     result_MUX_uxn_stack_h_l323_c2_bcd2_iftrue <= VAR_result_MUX_uxn_stack_h_l323_c2_bcd2_iftrue;
     result_MUX_uxn_stack_h_l323_c2_bcd2_iffalse <= VAR_result_MUX_uxn_stack_h_l323_c2_bcd2_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_stack_h_l323_c2_bcd2_return_output := result_MUX_uxn_stack_h_l323_c2_bcd2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l328_c1_4c38] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_4c38_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_4c38_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_4c38_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_4c38_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_4c38_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_4c38_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_4c38_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_4c38_return_output;

     -- Submodule level 7
     VAR_stack_pointer_set_uxn_stack_h_l329_c3_5b3f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_4c38_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_stack_h_l323_c2_bcd2_return_output;
     VAR_return_output := VAR_result_MUX_uxn_stack_h_l323_c2_bcd2_return_output;
     -- stack_pointer_set[uxn_stack_h_l329_c3_5b3f] LATENCY=0
     -- Clock enable
     stack_pointer_set_uxn_stack_h_l329_c3_5b3f_CLOCK_ENABLE <= VAR_stack_pointer_set_uxn_stack_h_l329_c3_5b3f_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_set_uxn_stack_h_l329_c3_5b3f_stack_index <= VAR_stack_pointer_set_uxn_stack_h_l329_c3_5b3f_stack_index;
     stack_pointer_set_uxn_stack_h_l329_c3_5b3f_value <= VAR_stack_pointer_set_uxn_stack_h_l329_c3_5b3f_value;
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
