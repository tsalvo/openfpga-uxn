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
entity set_0CLK_082cb698 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 mul : in unsigned(7 downto 0);
 add : in signed(7 downto 0);
 return_output : out unsigned(7 downto 0));
end set_0CLK_082cb698;
architecture arch of set_0CLK_082cb698 is
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
-- BIN_OP_GT[uxn_stack_h_l314_c6_dde9]
signal BIN_OP_GT_uxn_stack_h_l314_c6_dde9_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l314_c6_dde9_right : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l314_c6_dde9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l314_c1_8a50]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_8a50_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_8a50_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_8a50_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_8a50_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_stack_h_l314_c2_f03a]
signal result_MUX_uxn_stack_h_l314_c2_f03a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_stack_h_l314_c2_f03a_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l314_c2_f03a_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l314_c2_f03a_return_output : unsigned(7 downto 0);

-- halt_return_MUX[uxn_stack_h_l314_c2_f03a]
signal halt_return_MUX_uxn_stack_h_l314_c2_f03a_cond : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l314_c2_f03a_iftrue : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l314_c2_f03a_iffalse : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l314_c2_f03a_return_output : unsigned(0 downto 0);

-- halt[uxn_stack_h_l315_c12_d1b3]
signal halt_uxn_stack_h_l315_c12_d1b3_CLOCK_ENABLE : unsigned(0 downto 0);
signal halt_uxn_stack_h_l315_c12_d1b3_ins : unsigned(7 downto 0);
signal halt_uxn_stack_h_l315_c12_d1b3_err : unsigned(7 downto 0);
signal halt_uxn_stack_h_l315_c12_d1b3_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_stack_h_l322_c13_737a]
signal BIN_OP_AND_uxn_stack_h_l322_c13_737a_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_stack_h_l322_c13_737a_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_stack_h_l322_c13_737a_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_stack_h_l322_c13_1787]
signal BIN_OP_PLUS_uxn_stack_h_l322_c13_1787_left : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l322_c13_1787_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l322_c13_1787_return_output : signed(9 downto 0);

-- BIN_OP_PLUS[uxn_stack_h_l322_c13_e6cf]
signal BIN_OP_PLUS_uxn_stack_h_l322_c13_e6cf_left : signed(9 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l322_c13_e6cf_right : signed(8 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l322_c13_e6cf_return_output : signed(10 downto 0);

-- BIN_OP_GT[uxn_stack_h_l323_c6_bffb]
signal BIN_OP_GT_uxn_stack_h_l323_c6_bffb_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l323_c6_bffb_right : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l323_c6_bffb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l323_c1_f279]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_f279_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_f279_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_f279_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_f279_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_stack_h_l323_c2_1e22]
signal result_MUX_uxn_stack_h_l323_c2_1e22_cond : unsigned(0 downto 0);
signal result_MUX_uxn_stack_h_l323_c2_1e22_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l323_c2_1e22_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l323_c2_1e22_return_output : unsigned(7 downto 0);

-- halt_return_MUX[uxn_stack_h_l323_c2_1e22]
signal halt_return_MUX_uxn_stack_h_l323_c2_1e22_cond : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l323_c2_1e22_iftrue : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l323_c2_1e22_iffalse : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l323_c2_1e22_return_output : unsigned(0 downto 0);

-- halt[uxn_stack_h_l324_c12_faae]
signal halt_uxn_stack_h_l324_c12_faae_CLOCK_ENABLE : unsigned(0 downto 0);
signal halt_uxn_stack_h_l324_c12_faae_ins : unsigned(7 downto 0);
signal halt_uxn_stack_h_l324_c12_faae_err : unsigned(7 downto 0);
signal halt_uxn_stack_h_l324_c12_faae_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_stack_h_l328_c6_41f1]
signal BIN_OP_EQ_uxn_stack_h_l328_c6_41f1_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l328_c6_41f1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l328_c6_41f1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l328_c1_8f3c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_8f3c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_8f3c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_8f3c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_8f3c_return_output : unsigned(0 downto 0);

-- stack_pointer_set[uxn_stack_h_l329_c3_1f97]
signal stack_pointer_set_uxn_stack_h_l329_c3_1f97_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_set_uxn_stack_h_l329_c3_1f97_stack_index : unsigned(0 downto 0);
signal stack_pointer_set_uxn_stack_h_l329_c3_1f97_value : unsigned(7 downto 0);

-- stack_pointer_get_uxn_stack_h_l322_l314_DUPLICATE_0e0f
signal stack_pointer_get_uxn_stack_h_l322_l314_DUPLICATE_0e0f_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l322_l314_DUPLICATE_0e0f_stack_index : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l322_l314_DUPLICATE_0e0f_return_output : unsigned(7 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_GT_uxn_stack_h_l314_c6_dde9
BIN_OP_GT_uxn_stack_h_l314_c6_dde9 : entity work.BIN_OP_GT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_stack_h_l314_c6_dde9_left,
BIN_OP_GT_uxn_stack_h_l314_c6_dde9_right,
BIN_OP_GT_uxn_stack_h_l314_c6_dde9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_8a50
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_8a50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_8a50_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_8a50_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_8a50_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_8a50_return_output);

-- result_MUX_uxn_stack_h_l314_c2_f03a
result_MUX_uxn_stack_h_l314_c2_f03a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_stack_h_l314_c2_f03a_cond,
result_MUX_uxn_stack_h_l314_c2_f03a_iftrue,
result_MUX_uxn_stack_h_l314_c2_f03a_iffalse,
result_MUX_uxn_stack_h_l314_c2_f03a_return_output);

-- halt_return_MUX_uxn_stack_h_l314_c2_f03a
halt_return_MUX_uxn_stack_h_l314_c2_f03a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
halt_return_MUX_uxn_stack_h_l314_c2_f03a_cond,
halt_return_MUX_uxn_stack_h_l314_c2_f03a_iftrue,
halt_return_MUX_uxn_stack_h_l314_c2_f03a_iffalse,
halt_return_MUX_uxn_stack_h_l314_c2_f03a_return_output);

-- halt_uxn_stack_h_l315_c12_d1b3
halt_uxn_stack_h_l315_c12_d1b3 : entity work.halt_0CLK_0b25530d port map (
clk,
halt_uxn_stack_h_l315_c12_d1b3_CLOCK_ENABLE,
halt_uxn_stack_h_l315_c12_d1b3_ins,
halt_uxn_stack_h_l315_c12_d1b3_err,
halt_uxn_stack_h_l315_c12_d1b3_return_output);

-- BIN_OP_AND_uxn_stack_h_l322_c13_737a
BIN_OP_AND_uxn_stack_h_l322_c13_737a : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_stack_h_l322_c13_737a_left,
BIN_OP_AND_uxn_stack_h_l322_c13_737a_right,
BIN_OP_AND_uxn_stack_h_l322_c13_737a_return_output);

-- BIN_OP_PLUS_uxn_stack_h_l322_c13_1787
BIN_OP_PLUS_uxn_stack_h_l322_c13_1787 : entity work.BIN_OP_PLUS_int9_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_stack_h_l322_c13_1787_left,
BIN_OP_PLUS_uxn_stack_h_l322_c13_1787_right,
BIN_OP_PLUS_uxn_stack_h_l322_c13_1787_return_output);

-- BIN_OP_PLUS_uxn_stack_h_l322_c13_e6cf
BIN_OP_PLUS_uxn_stack_h_l322_c13_e6cf : entity work.BIN_OP_PLUS_int10_t_int9_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_stack_h_l322_c13_e6cf_left,
BIN_OP_PLUS_uxn_stack_h_l322_c13_e6cf_right,
BIN_OP_PLUS_uxn_stack_h_l322_c13_e6cf_return_output);

-- BIN_OP_GT_uxn_stack_h_l323_c6_bffb
BIN_OP_GT_uxn_stack_h_l323_c6_bffb : entity work.BIN_OP_GT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_stack_h_l323_c6_bffb_left,
BIN_OP_GT_uxn_stack_h_l323_c6_bffb_right,
BIN_OP_GT_uxn_stack_h_l323_c6_bffb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_f279
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_f279 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_f279_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_f279_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_f279_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_f279_return_output);

-- result_MUX_uxn_stack_h_l323_c2_1e22
result_MUX_uxn_stack_h_l323_c2_1e22 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_stack_h_l323_c2_1e22_cond,
result_MUX_uxn_stack_h_l323_c2_1e22_iftrue,
result_MUX_uxn_stack_h_l323_c2_1e22_iffalse,
result_MUX_uxn_stack_h_l323_c2_1e22_return_output);

-- halt_return_MUX_uxn_stack_h_l323_c2_1e22
halt_return_MUX_uxn_stack_h_l323_c2_1e22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
halt_return_MUX_uxn_stack_h_l323_c2_1e22_cond,
halt_return_MUX_uxn_stack_h_l323_c2_1e22_iftrue,
halt_return_MUX_uxn_stack_h_l323_c2_1e22_iffalse,
halt_return_MUX_uxn_stack_h_l323_c2_1e22_return_output);

-- halt_uxn_stack_h_l324_c12_faae
halt_uxn_stack_h_l324_c12_faae : entity work.halt_0CLK_0b25530d port map (
clk,
halt_uxn_stack_h_l324_c12_faae_CLOCK_ENABLE,
halt_uxn_stack_h_l324_c12_faae_ins,
halt_uxn_stack_h_l324_c12_faae_err,
halt_uxn_stack_h_l324_c12_faae_return_output);

-- BIN_OP_EQ_uxn_stack_h_l328_c6_41f1
BIN_OP_EQ_uxn_stack_h_l328_c6_41f1 : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_stack_h_l328_c6_41f1_left,
BIN_OP_EQ_uxn_stack_h_l328_c6_41f1_right,
BIN_OP_EQ_uxn_stack_h_l328_c6_41f1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_8f3c
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_8f3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_8f3c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_8f3c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_8f3c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_8f3c_return_output);

-- stack_pointer_set_uxn_stack_h_l329_c3_1f97
stack_pointer_set_uxn_stack_h_l329_c3_1f97 : entity work.stack_pointer_set_0CLK_de264c78 port map (
stack_pointer_set_uxn_stack_h_l329_c3_1f97_CLOCK_ENABLE,
stack_pointer_set_uxn_stack_h_l329_c3_1f97_stack_index,
stack_pointer_set_uxn_stack_h_l329_c3_1f97_value);

-- stack_pointer_get_uxn_stack_h_l322_l314_DUPLICATE_0e0f
stack_pointer_get_uxn_stack_h_l322_l314_DUPLICATE_0e0f : entity work.stack_pointer_get_0CLK_7bf2eff3 port map (
clk,
stack_pointer_get_uxn_stack_h_l322_l314_DUPLICATE_0e0f_CLOCK_ENABLE,
stack_pointer_get_uxn_stack_h_l322_l314_DUPLICATE_0e0f_stack_index,
stack_pointer_get_uxn_stack_h_l322_l314_DUPLICATE_0e0f_return_output);



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
 BIN_OP_GT_uxn_stack_h_l314_c6_dde9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_8a50_return_output,
 result_MUX_uxn_stack_h_l314_c2_f03a_return_output,
 halt_return_MUX_uxn_stack_h_l314_c2_f03a_return_output,
 halt_uxn_stack_h_l315_c12_d1b3_return_output,
 BIN_OP_AND_uxn_stack_h_l322_c13_737a_return_output,
 BIN_OP_PLUS_uxn_stack_h_l322_c13_1787_return_output,
 BIN_OP_PLUS_uxn_stack_h_l322_c13_e6cf_return_output,
 BIN_OP_GT_uxn_stack_h_l323_c6_bffb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_f279_return_output,
 result_MUX_uxn_stack_h_l323_c2_1e22_return_output,
 halt_return_MUX_uxn_stack_h_l323_c2_1e22_return_output,
 halt_uxn_stack_h_l324_c12_faae_return_output,
 BIN_OP_EQ_uxn_stack_h_l328_c6_41f1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_8f3c_return_output,
 stack_pointer_get_uxn_stack_h_l322_l314_DUPLICATE_0e0f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_mul : unsigned(7 downto 0);
 variable VAR_add : signed(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l314_c6_dde9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l314_c6_dde9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l314_c6_dde9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_8a50_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_8a50_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_8a50_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_8a50_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l314_c2_f03a_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l314_c2_f03a_iffalse : unsigned(7 downto 0);
 variable VAR_result_uxn_stack_h_l318_c3_499a : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l314_c2_f03a_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l314_c2_f03a_cond : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l314_c2_f03a_iftrue : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l314_c2_f03a_iffalse : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l314_c2_f03a_return_output : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l314_c2_f03a_cond : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l315_c12_d1b3_ins : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l315_c12_d1b3_err : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l315_c12_d1b3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l315_c12_d1b3_return_output : unsigned(7 downto 0);
 variable VAR_set_tmp_uxn_stack_h_l322_c2_e07c : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l322_c13_737a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l322_c13_737a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_stack_h_l322_c13_737a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l322_c13_1787_left : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l322_c13_1787_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l322_c13_1787_return_output : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l322_c13_e6cf_left : signed(9 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l322_c13_e6cf_right : signed(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l322_c13_e6cf_return_output : signed(10 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l323_c6_bffb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l323_c6_bffb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l323_c6_bffb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_f279_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_f279_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_f279_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_f279_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l323_c2_1e22_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l323_c2_1e22_iffalse : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l323_c2_1e22_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l323_c2_1e22_cond : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l323_c2_1e22_iftrue : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l323_c2_1e22_iffalse : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l323_c2_1e22_return_output : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l323_c2_1e22_cond : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l324_c12_faae_ins : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l324_c12_faae_err : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l324_c12_faae_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l324_c12_faae_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l328_c6_41f1_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l328_c6_41f1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l328_c6_41f1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_8f3c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_8f3c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_8f3c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_8f3c_iffalse : unsigned(0 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l329_c3_1f97_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l329_c3_1f97_value : unsigned(7 downto 0);
 variable VAR_stack_pointer_set_uxn_stack_h_l329_c3_1f97_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l322_l314_DUPLICATE_0e0f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l322_l314_DUPLICATE_0e0f_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l322_l314_DUPLICATE_0e0f_return_output : unsigned(7 downto 0);
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
     VAR_BIN_OP_EQ_uxn_stack_h_l328_c6_41f1_right := to_unsigned(0, 1);
     VAR_halt_uxn_stack_h_l324_c12_faae_err := resize(to_unsigned(2, 2), 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_8a50_iffalse := to_unsigned(0, 1);
     VAR_result_uxn_stack_h_l318_c3_499a := resize(to_unsigned(0, 1), 8);
     VAR_result_MUX_uxn_stack_h_l314_c2_f03a_iffalse := VAR_result_uxn_stack_h_l318_c3_499a;
     VAR_halt_return_MUX_uxn_stack_h_l314_c2_f03a_iftrue := to_unsigned(1, 1);
     VAR_halt_return_MUX_uxn_stack_h_l323_c2_1e22_iftrue := to_unsigned(1, 1);
     VAR_halt_return_MUX_uxn_stack_h_l314_c2_f03a_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_8f3c_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_f279_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_stack_h_l323_c6_bffb_right := to_unsigned(254, 8);
     VAR_halt_uxn_stack_h_l315_c12_d1b3_err := resize(to_unsigned(1, 1), 8);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_8a50_iftrue := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_f279_iftrue := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_8f3c_iftrue := VAR_CLOCK_ENABLE;
     VAR_stack_pointer_get_uxn_stack_h_l322_l314_DUPLICATE_0e0f_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_stack_h_l322_c13_1787_right := VAR_add;
     VAR_halt_uxn_stack_h_l315_c12_d1b3_ins := VAR_ins;
     VAR_halt_uxn_stack_h_l324_c12_faae_ins := VAR_ins;
     VAR_BIN_OP_AND_uxn_stack_h_l322_c13_737a_right := VAR_k;
     VAR_BIN_OP_AND_uxn_stack_h_l322_c13_737a_left := VAR_mul;
     VAR_BIN_OP_GT_uxn_stack_h_l314_c6_dde9_left := VAR_mul;
     VAR_stack_pointer_get_uxn_stack_h_l322_l314_DUPLICATE_0e0f_stack_index := VAR_stack_index;
     VAR_stack_pointer_set_uxn_stack_h_l329_c3_1f97_stack_index := VAR_stack_index;
     -- stack_pointer_get_uxn_stack_h_l322_l314_DUPLICATE_0e0f LATENCY=0
     -- Clock enable
     stack_pointer_get_uxn_stack_h_l322_l314_DUPLICATE_0e0f_CLOCK_ENABLE <= VAR_stack_pointer_get_uxn_stack_h_l322_l314_DUPLICATE_0e0f_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_get_uxn_stack_h_l322_l314_DUPLICATE_0e0f_stack_index <= VAR_stack_pointer_get_uxn_stack_h_l322_l314_DUPLICATE_0e0f_stack_index;
     -- Outputs
     VAR_stack_pointer_get_uxn_stack_h_l322_l314_DUPLICATE_0e0f_return_output := stack_pointer_get_uxn_stack_h_l322_l314_DUPLICATE_0e0f_return_output;

     -- BIN_OP_AND[uxn_stack_h_l322_c13_737a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_stack_h_l322_c13_737a_left <= VAR_BIN_OP_AND_uxn_stack_h_l322_c13_737a_left;
     BIN_OP_AND_uxn_stack_h_l322_c13_737a_right <= VAR_BIN_OP_AND_uxn_stack_h_l322_c13_737a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_stack_h_l322_c13_737a_return_output := BIN_OP_AND_uxn_stack_h_l322_c13_737a_return_output;

     -- Submodule level 1
     VAR_BIN_OP_PLUS_uxn_stack_h_l322_c13_1787_left := signed(std_logic_vector(resize(VAR_BIN_OP_AND_uxn_stack_h_l322_c13_737a_return_output, 9)));
     VAR_BIN_OP_GT_uxn_stack_h_l314_c6_dde9_right := VAR_stack_pointer_get_uxn_stack_h_l322_l314_DUPLICATE_0e0f_return_output;
     VAR_BIN_OP_PLUS_uxn_stack_h_l322_c13_e6cf_right := signed(std_logic_vector(resize(VAR_stack_pointer_get_uxn_stack_h_l322_l314_DUPLICATE_0e0f_return_output, 9)));
     -- BIN_OP_PLUS[uxn_stack_h_l322_c13_1787] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_stack_h_l322_c13_1787_left <= VAR_BIN_OP_PLUS_uxn_stack_h_l322_c13_1787_left;
     BIN_OP_PLUS_uxn_stack_h_l322_c13_1787_right <= VAR_BIN_OP_PLUS_uxn_stack_h_l322_c13_1787_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_stack_h_l322_c13_1787_return_output := BIN_OP_PLUS_uxn_stack_h_l322_c13_1787_return_output;

     -- BIN_OP_GT[uxn_stack_h_l314_c6_dde9] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_stack_h_l314_c6_dde9_left <= VAR_BIN_OP_GT_uxn_stack_h_l314_c6_dde9_left;
     BIN_OP_GT_uxn_stack_h_l314_c6_dde9_right <= VAR_BIN_OP_GT_uxn_stack_h_l314_c6_dde9_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_stack_h_l314_c6_dde9_return_output := BIN_OP_GT_uxn_stack_h_l314_c6_dde9_return_output;

     -- Submodule level 2
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_8a50_cond := VAR_BIN_OP_GT_uxn_stack_h_l314_c6_dde9_return_output;
     VAR_halt_return_MUX_uxn_stack_h_l314_c2_f03a_cond := VAR_BIN_OP_GT_uxn_stack_h_l314_c6_dde9_return_output;
     VAR_result_MUX_uxn_stack_h_l314_c2_f03a_cond := VAR_BIN_OP_GT_uxn_stack_h_l314_c6_dde9_return_output;
     VAR_BIN_OP_PLUS_uxn_stack_h_l322_c13_e6cf_left := VAR_BIN_OP_PLUS_uxn_stack_h_l322_c13_1787_return_output;
     -- BIN_OP_PLUS[uxn_stack_h_l322_c13_e6cf] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_stack_h_l322_c13_e6cf_left <= VAR_BIN_OP_PLUS_uxn_stack_h_l322_c13_e6cf_left;
     BIN_OP_PLUS_uxn_stack_h_l322_c13_e6cf_right <= VAR_BIN_OP_PLUS_uxn_stack_h_l322_c13_e6cf_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_stack_h_l322_c13_e6cf_return_output := BIN_OP_PLUS_uxn_stack_h_l322_c13_e6cf_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l314_c1_8a50] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_8a50_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_8a50_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_8a50_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_8a50_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_8a50_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_8a50_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_8a50_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_8a50_return_output;

     -- halt_return_MUX[uxn_stack_h_l314_c2_f03a] LATENCY=0
     -- Inputs
     halt_return_MUX_uxn_stack_h_l314_c2_f03a_cond <= VAR_halt_return_MUX_uxn_stack_h_l314_c2_f03a_cond;
     halt_return_MUX_uxn_stack_h_l314_c2_f03a_iftrue <= VAR_halt_return_MUX_uxn_stack_h_l314_c2_f03a_iftrue;
     halt_return_MUX_uxn_stack_h_l314_c2_f03a_iffalse <= VAR_halt_return_MUX_uxn_stack_h_l314_c2_f03a_iffalse;
     -- Outputs
     VAR_halt_return_MUX_uxn_stack_h_l314_c2_f03a_return_output := halt_return_MUX_uxn_stack_h_l314_c2_f03a_return_output;

     -- Submodule level 3
     VAR_set_tmp_uxn_stack_h_l322_c2_e07c := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_stack_h_l322_c13_e6cf_return_output)),8);
     VAR_halt_uxn_stack_h_l315_c12_d1b3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l314_c1_8a50_return_output;
     VAR_halt_return_MUX_uxn_stack_h_l323_c2_1e22_iffalse := VAR_halt_return_MUX_uxn_stack_h_l314_c2_f03a_return_output;
     VAR_BIN_OP_GT_uxn_stack_h_l323_c6_bffb_left := VAR_set_tmp_uxn_stack_h_l322_c2_e07c;
     REG_VAR_set_tmp := VAR_set_tmp_uxn_stack_h_l322_c2_e07c;
     VAR_stack_pointer_set_uxn_stack_h_l329_c3_1f97_value := VAR_set_tmp_uxn_stack_h_l322_c2_e07c;
     -- BIN_OP_GT[uxn_stack_h_l323_c6_bffb] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_stack_h_l323_c6_bffb_left <= VAR_BIN_OP_GT_uxn_stack_h_l323_c6_bffb_left;
     BIN_OP_GT_uxn_stack_h_l323_c6_bffb_right <= VAR_BIN_OP_GT_uxn_stack_h_l323_c6_bffb_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_stack_h_l323_c6_bffb_return_output := BIN_OP_GT_uxn_stack_h_l323_c6_bffb_return_output;

     -- halt[uxn_stack_h_l315_c12_d1b3] LATENCY=0
     -- Clock enable
     halt_uxn_stack_h_l315_c12_d1b3_CLOCK_ENABLE <= VAR_halt_uxn_stack_h_l315_c12_d1b3_CLOCK_ENABLE;
     -- Inputs
     halt_uxn_stack_h_l315_c12_d1b3_ins <= VAR_halt_uxn_stack_h_l315_c12_d1b3_ins;
     halt_uxn_stack_h_l315_c12_d1b3_err <= VAR_halt_uxn_stack_h_l315_c12_d1b3_err;
     -- Outputs
     VAR_halt_uxn_stack_h_l315_c12_d1b3_return_output := halt_uxn_stack_h_l315_c12_d1b3_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_f279_cond := VAR_BIN_OP_GT_uxn_stack_h_l323_c6_bffb_return_output;
     VAR_halt_return_MUX_uxn_stack_h_l323_c2_1e22_cond := VAR_BIN_OP_GT_uxn_stack_h_l323_c6_bffb_return_output;
     VAR_result_MUX_uxn_stack_h_l323_c2_1e22_cond := VAR_BIN_OP_GT_uxn_stack_h_l323_c6_bffb_return_output;
     VAR_result_MUX_uxn_stack_h_l314_c2_f03a_iftrue := VAR_halt_uxn_stack_h_l315_c12_d1b3_return_output;
     -- result_MUX[uxn_stack_h_l314_c2_f03a] LATENCY=0
     -- Inputs
     result_MUX_uxn_stack_h_l314_c2_f03a_cond <= VAR_result_MUX_uxn_stack_h_l314_c2_f03a_cond;
     result_MUX_uxn_stack_h_l314_c2_f03a_iftrue <= VAR_result_MUX_uxn_stack_h_l314_c2_f03a_iftrue;
     result_MUX_uxn_stack_h_l314_c2_f03a_iffalse <= VAR_result_MUX_uxn_stack_h_l314_c2_f03a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_stack_h_l314_c2_f03a_return_output := result_MUX_uxn_stack_h_l314_c2_f03a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l323_c1_f279] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_f279_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_f279_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_f279_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_f279_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_f279_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_f279_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_f279_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_f279_return_output;

     -- halt_return_MUX[uxn_stack_h_l323_c2_1e22] LATENCY=0
     -- Inputs
     halt_return_MUX_uxn_stack_h_l323_c2_1e22_cond <= VAR_halt_return_MUX_uxn_stack_h_l323_c2_1e22_cond;
     halt_return_MUX_uxn_stack_h_l323_c2_1e22_iftrue <= VAR_halt_return_MUX_uxn_stack_h_l323_c2_1e22_iftrue;
     halt_return_MUX_uxn_stack_h_l323_c2_1e22_iffalse <= VAR_halt_return_MUX_uxn_stack_h_l323_c2_1e22_iffalse;
     -- Outputs
     VAR_halt_return_MUX_uxn_stack_h_l323_c2_1e22_return_output := halt_return_MUX_uxn_stack_h_l323_c2_1e22_return_output;

     -- Submodule level 5
     VAR_halt_uxn_stack_h_l324_c12_faae_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l323_c1_f279_return_output;
     VAR_BIN_OP_EQ_uxn_stack_h_l328_c6_41f1_left := VAR_halt_return_MUX_uxn_stack_h_l323_c2_1e22_return_output;
     REG_VAR_halt_return := VAR_halt_return_MUX_uxn_stack_h_l323_c2_1e22_return_output;
     VAR_result_MUX_uxn_stack_h_l323_c2_1e22_iffalse := VAR_result_MUX_uxn_stack_h_l314_c2_f03a_return_output;
     -- halt[uxn_stack_h_l324_c12_faae] LATENCY=0
     -- Clock enable
     halt_uxn_stack_h_l324_c12_faae_CLOCK_ENABLE <= VAR_halt_uxn_stack_h_l324_c12_faae_CLOCK_ENABLE;
     -- Inputs
     halt_uxn_stack_h_l324_c12_faae_ins <= VAR_halt_uxn_stack_h_l324_c12_faae_ins;
     halt_uxn_stack_h_l324_c12_faae_err <= VAR_halt_uxn_stack_h_l324_c12_faae_err;
     -- Outputs
     VAR_halt_uxn_stack_h_l324_c12_faae_return_output := halt_uxn_stack_h_l324_c12_faae_return_output;

     -- BIN_OP_EQ[uxn_stack_h_l328_c6_41f1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_stack_h_l328_c6_41f1_left <= VAR_BIN_OP_EQ_uxn_stack_h_l328_c6_41f1_left;
     BIN_OP_EQ_uxn_stack_h_l328_c6_41f1_right <= VAR_BIN_OP_EQ_uxn_stack_h_l328_c6_41f1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_stack_h_l328_c6_41f1_return_output := BIN_OP_EQ_uxn_stack_h_l328_c6_41f1_return_output;

     -- Submodule level 6
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_8f3c_cond := VAR_BIN_OP_EQ_uxn_stack_h_l328_c6_41f1_return_output;
     VAR_result_MUX_uxn_stack_h_l323_c2_1e22_iftrue := VAR_halt_uxn_stack_h_l324_c12_faae_return_output;
     -- result_MUX[uxn_stack_h_l323_c2_1e22] LATENCY=0
     -- Inputs
     result_MUX_uxn_stack_h_l323_c2_1e22_cond <= VAR_result_MUX_uxn_stack_h_l323_c2_1e22_cond;
     result_MUX_uxn_stack_h_l323_c2_1e22_iftrue <= VAR_result_MUX_uxn_stack_h_l323_c2_1e22_iftrue;
     result_MUX_uxn_stack_h_l323_c2_1e22_iffalse <= VAR_result_MUX_uxn_stack_h_l323_c2_1e22_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_stack_h_l323_c2_1e22_return_output := result_MUX_uxn_stack_h_l323_c2_1e22_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l328_c1_8f3c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_8f3c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_8f3c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_8f3c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_8f3c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_8f3c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_8f3c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_8f3c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_8f3c_return_output;

     -- Submodule level 7
     VAR_stack_pointer_set_uxn_stack_h_l329_c3_1f97_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l328_c1_8f3c_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_stack_h_l323_c2_1e22_return_output;
     VAR_return_output := VAR_result_MUX_uxn_stack_h_l323_c2_1e22_return_output;
     -- stack_pointer_set[uxn_stack_h_l329_c3_1f97] LATENCY=0
     -- Clock enable
     stack_pointer_set_uxn_stack_h_l329_c3_1f97_CLOCK_ENABLE <= VAR_stack_pointer_set_uxn_stack_h_l329_c3_1f97_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_set_uxn_stack_h_l329_c3_1f97_stack_index <= VAR_stack_pointer_set_uxn_stack_h_l329_c3_1f97_stack_index;
     stack_pointer_set_uxn_stack_h_l329_c3_1f97_value <= VAR_stack_pointer_set_uxn_stack_h_l329_c3_1f97_value;
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
