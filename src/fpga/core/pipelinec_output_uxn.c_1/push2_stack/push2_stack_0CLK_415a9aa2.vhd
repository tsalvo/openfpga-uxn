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
-- stack_pointer_get[uxn_stack_h_l247_c6_15ed]
signal stack_pointer_get_uxn_stack_h_l247_c6_15ed_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l247_c6_15ed_stack_index : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l247_c6_15ed_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_stack_h_l247_c6_4287]
signal BIN_OP_GT_uxn_stack_h_l247_c6_4287_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l247_c6_4287_right : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l247_c6_4287_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l247_c1_8196]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_8196_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_8196_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_8196_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_8196_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_stack_h_l247_c2_f535]
signal result_MUX_uxn_stack_h_l247_c2_f535_cond : unsigned(0 downto 0);
signal result_MUX_uxn_stack_h_l247_c2_f535_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l247_c2_f535_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l247_c2_f535_return_output : unsigned(7 downto 0);

-- halt_return_MUX[uxn_stack_h_l247_c2_f535]
signal halt_return_MUX_uxn_stack_h_l247_c2_f535_cond : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l247_c2_f535_iftrue : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l247_c2_f535_iffalse : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l247_c2_f535_return_output : unsigned(0 downto 0);

-- halt[uxn_stack_h_l248_c12_b1b1]
signal halt_uxn_stack_h_l248_c12_b1b1_CLOCK_ENABLE : unsigned(0 downto 0);
signal halt_uxn_stack_h_l248_c12_b1b1_ins : unsigned(7 downto 0);
signal halt_uxn_stack_h_l248_c12_b1b1_err : unsigned(7 downto 0);
signal halt_uxn_stack_h_l248_c12_b1b1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_stack_h_l255_c6_3ff8]
signal BIN_OP_EQ_uxn_stack_h_l255_c6_3ff8_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l255_c6_3ff8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l255_c6_3ff8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l255_c1_63cb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_63cb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_63cb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_63cb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_63cb_return_output : unsigned(0 downto 0);

-- tmp_MUX[uxn_stack_h_l255_c2_c376]
signal tmp_MUX_uxn_stack_h_l255_c2_c376_cond : unsigned(0 downto 0);
signal tmp_MUX_uxn_stack_h_l255_c2_c376_iftrue : unsigned(15 downto 0);
signal tmp_MUX_uxn_stack_h_l255_c2_c376_iffalse : unsigned(15 downto 0);
signal tmp_MUX_uxn_stack_h_l255_c2_c376_return_output : unsigned(15 downto 0);

-- CONST_SR_8[uxn_stack_h_l257_c73_2983]
signal CONST_SR_8_uxn_stack_h_l257_c73_2983_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_stack_h_l257_c73_2983_return_output : unsigned(15 downto 0);

-- stack_data_set[uxn_stack_h_l257_c3_5a53]
signal stack_data_set_uxn_stack_h_l257_c3_5a53_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l257_c3_5a53_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l257_c3_5a53_index : unsigned(7 downto 0);
signal stack_data_set_uxn_stack_h_l257_c3_5a53_value : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_stack_h_l258_c31_9b4a]
signal BIN_OP_PLUS_uxn_stack_h_l258_c31_9b4a_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l258_c31_9b4a_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l258_c31_9b4a_return_output : unsigned(8 downto 0);

-- stack_data_set[uxn_stack_h_l258_c3_59b3]
signal stack_data_set_uxn_stack_h_l258_c3_59b3_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l258_c3_59b3_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l258_c3_59b3_index : unsigned(7 downto 0);
signal stack_data_set_uxn_stack_h_l258_c3_59b3_value : unsigned(7 downto 0);

-- stack_pointer_move[uxn_stack_h_l259_c3_99ae]
signal stack_pointer_move_uxn_stack_h_l259_c3_99ae_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_move_uxn_stack_h_l259_c3_99ae_stack_index : unsigned(0 downto 0);
signal stack_pointer_move_uxn_stack_h_l259_c3_99ae_adjustment : unsigned(7 downto 0);
signal stack_pointer_move_uxn_stack_h_l259_c3_99ae_is_negative : unsigned(0 downto 0);

-- stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_743e
signal stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_743e_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_743e_stack_index : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_743e_return_output : unsigned(7 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- stack_pointer_get_uxn_stack_h_l247_c6_15ed
stack_pointer_get_uxn_stack_h_l247_c6_15ed : entity work.stack_pointer_get_0CLK_c35c94f1 port map (
clk,
stack_pointer_get_uxn_stack_h_l247_c6_15ed_CLOCK_ENABLE,
stack_pointer_get_uxn_stack_h_l247_c6_15ed_stack_index,
stack_pointer_get_uxn_stack_h_l247_c6_15ed_return_output);

-- BIN_OP_GT_uxn_stack_h_l247_c6_4287
BIN_OP_GT_uxn_stack_h_l247_c6_4287 : entity work.BIN_OP_GT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_stack_h_l247_c6_4287_left,
BIN_OP_GT_uxn_stack_h_l247_c6_4287_right,
BIN_OP_GT_uxn_stack_h_l247_c6_4287_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_8196
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_8196 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_8196_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_8196_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_8196_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_8196_return_output);

-- result_MUX_uxn_stack_h_l247_c2_f535
result_MUX_uxn_stack_h_l247_c2_f535 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_stack_h_l247_c2_f535_cond,
result_MUX_uxn_stack_h_l247_c2_f535_iftrue,
result_MUX_uxn_stack_h_l247_c2_f535_iffalse,
result_MUX_uxn_stack_h_l247_c2_f535_return_output);

-- halt_return_MUX_uxn_stack_h_l247_c2_f535
halt_return_MUX_uxn_stack_h_l247_c2_f535 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
halt_return_MUX_uxn_stack_h_l247_c2_f535_cond,
halt_return_MUX_uxn_stack_h_l247_c2_f535_iftrue,
halt_return_MUX_uxn_stack_h_l247_c2_f535_iffalse,
halt_return_MUX_uxn_stack_h_l247_c2_f535_return_output);

-- halt_uxn_stack_h_l248_c12_b1b1
halt_uxn_stack_h_l248_c12_b1b1 : entity work.halt_0CLK_1d3235af port map (
clk,
halt_uxn_stack_h_l248_c12_b1b1_CLOCK_ENABLE,
halt_uxn_stack_h_l248_c12_b1b1_ins,
halt_uxn_stack_h_l248_c12_b1b1_err,
halt_uxn_stack_h_l248_c12_b1b1_return_output);

-- BIN_OP_EQ_uxn_stack_h_l255_c6_3ff8
BIN_OP_EQ_uxn_stack_h_l255_c6_3ff8 : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_stack_h_l255_c6_3ff8_left,
BIN_OP_EQ_uxn_stack_h_l255_c6_3ff8_right,
BIN_OP_EQ_uxn_stack_h_l255_c6_3ff8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_63cb
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_63cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_63cb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_63cb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_63cb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_63cb_return_output);

-- tmp_MUX_uxn_stack_h_l255_c2_c376
tmp_MUX_uxn_stack_h_l255_c2_c376 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp_MUX_uxn_stack_h_l255_c2_c376_cond,
tmp_MUX_uxn_stack_h_l255_c2_c376_iftrue,
tmp_MUX_uxn_stack_h_l255_c2_c376_iffalse,
tmp_MUX_uxn_stack_h_l255_c2_c376_return_output);

-- CONST_SR_8_uxn_stack_h_l257_c73_2983
CONST_SR_8_uxn_stack_h_l257_c73_2983 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_stack_h_l257_c73_2983_x,
CONST_SR_8_uxn_stack_h_l257_c73_2983_return_output);

-- stack_data_set_uxn_stack_h_l257_c3_5a53
stack_data_set_uxn_stack_h_l257_c3_5a53 : entity work.stack_data_set_0CLK_fa018dfc port map (
clk,
stack_data_set_uxn_stack_h_l257_c3_5a53_CLOCK_ENABLE,
stack_data_set_uxn_stack_h_l257_c3_5a53_stack_index,
stack_data_set_uxn_stack_h_l257_c3_5a53_index,
stack_data_set_uxn_stack_h_l257_c3_5a53_value);

-- BIN_OP_PLUS_uxn_stack_h_l258_c31_9b4a
BIN_OP_PLUS_uxn_stack_h_l258_c31_9b4a : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_stack_h_l258_c31_9b4a_left,
BIN_OP_PLUS_uxn_stack_h_l258_c31_9b4a_right,
BIN_OP_PLUS_uxn_stack_h_l258_c31_9b4a_return_output);

-- stack_data_set_uxn_stack_h_l258_c3_59b3
stack_data_set_uxn_stack_h_l258_c3_59b3 : entity work.stack_data_set_0CLK_fa018dfc port map (
clk,
stack_data_set_uxn_stack_h_l258_c3_59b3_CLOCK_ENABLE,
stack_data_set_uxn_stack_h_l258_c3_59b3_stack_index,
stack_data_set_uxn_stack_h_l258_c3_59b3_index,
stack_data_set_uxn_stack_h_l258_c3_59b3_value);

-- stack_pointer_move_uxn_stack_h_l259_c3_99ae
stack_pointer_move_uxn_stack_h_l259_c3_99ae : entity work.stack_pointer_move_0CLK_5da82025 port map (
clk,
stack_pointer_move_uxn_stack_h_l259_c3_99ae_CLOCK_ENABLE,
stack_pointer_move_uxn_stack_h_l259_c3_99ae_stack_index,
stack_pointer_move_uxn_stack_h_l259_c3_99ae_adjustment,
stack_pointer_move_uxn_stack_h_l259_c3_99ae_is_negative);

-- stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_743e
stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_743e : entity work.stack_pointer_get_0CLK_c35c94f1 port map (
clk,
stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_743e_CLOCK_ENABLE,
stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_743e_stack_index,
stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_743e_return_output);



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
 stack_pointer_get_uxn_stack_h_l247_c6_15ed_return_output,
 BIN_OP_GT_uxn_stack_h_l247_c6_4287_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_8196_return_output,
 result_MUX_uxn_stack_h_l247_c2_f535_return_output,
 halt_return_MUX_uxn_stack_h_l247_c2_f535_return_output,
 halt_uxn_stack_h_l248_c12_b1b1_return_output,
 BIN_OP_EQ_uxn_stack_h_l255_c6_3ff8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_63cb_return_output,
 tmp_MUX_uxn_stack_h_l255_c2_c376_return_output,
 CONST_SR_8_uxn_stack_h_l257_c73_2983_return_output,
 BIN_OP_PLUS_uxn_stack_h_l258_c31_9b4a_return_output,
 stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_743e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_value : unsigned(15 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l247_c6_15ed_stack_index : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l247_c6_4287_left : unsigned(7 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l247_c6_15ed_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l247_c6_15ed_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l247_c6_4287_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l247_c6_4287_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_8196_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_8196_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_8196_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_8196_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l247_c2_f535_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l247_c2_f535_iffalse : unsigned(7 downto 0);
 variable VAR_result_uxn_stack_h_l251_c3_0b27 : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l247_c2_f535_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l247_c2_f535_cond : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l247_c2_f535_iftrue : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l247_c2_f535_iffalse : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l247_c2_f535_return_output : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l247_c2_f535_cond : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l248_c12_b1b1_ins : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l248_c12_b1b1_err : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l248_c12_b1b1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l248_c12_b1b1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l255_c6_3ff8_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l255_c6_3ff8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l255_c6_3ff8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_63cb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_63cb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_63cb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_63cb_iffalse : unsigned(0 downto 0);
 variable VAR_tmp_MUX_uxn_stack_h_l255_c2_c376_iftrue : unsigned(15 downto 0);
 variable VAR_tmp_MUX_uxn_stack_h_l255_c2_c376_iffalse : unsigned(15 downto 0);
 variable VAR_tmp_MUX_uxn_stack_h_l255_c2_c376_return_output : unsigned(15 downto 0);
 variable VAR_tmp_MUX_uxn_stack_h_l255_c2_c376_cond : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l257_c3_5a53_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l257_c3_5a53_index : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l257_c3_5a53_value : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uxn_stack_h_l257_c73_2983_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_stack_h_l257_c73_2983_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_stack_h_l257_c63_699d_return_output : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l257_c3_5a53_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l258_c3_59b3_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l258_c3_59b3_index : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l258_c3_59b3_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l258_c31_9b4a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l258_c31_9b4a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l258_c31_9b4a_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_stack_h_l258_c67_79ed_return_output : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l258_c3_59b3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_move_uxn_stack_h_l259_c3_99ae_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_move_uxn_stack_h_l259_c3_99ae_adjustment : unsigned(7 downto 0);
 variable VAR_stack_pointer_move_uxn_stack_h_l259_c3_99ae_is_negative : unsigned(0 downto 0);
 variable VAR_stack_pointer_move_uxn_stack_h_l259_c3_99ae_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_743e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_743e_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_743e_return_output : unsigned(7 downto 0);
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
     VAR_halt_uxn_stack_h_l248_c12_b1b1_err := resize(to_unsigned(2, 2), 8);
     VAR_stack_pointer_move_uxn_stack_h_l259_c3_99ae_is_negative := to_unsigned(0, 1);
     VAR_result_uxn_stack_h_l251_c3_0b27 := resize(to_unsigned(0, 1), 8);
     VAR_result_MUX_uxn_stack_h_l247_c2_f535_iffalse := VAR_result_uxn_stack_h_l251_c3_0b27;
     VAR_halt_return_MUX_uxn_stack_h_l247_c2_f535_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_stack_h_l247_c6_4287_right := to_unsigned(253, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_8196_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_stack_h_l258_c31_9b4a_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_stack_h_l255_c6_3ff8_right := to_unsigned(0, 1);
     VAR_stack_pointer_move_uxn_stack_h_l259_c3_99ae_adjustment := resize(to_unsigned(2, 2), 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_63cb_iffalse := to_unsigned(0, 1);
     VAR_halt_return_MUX_uxn_stack_h_l247_c2_f535_iffalse := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_8196_iftrue := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_63cb_iftrue := VAR_CLOCK_ENABLE;
     VAR_stack_pointer_get_uxn_stack_h_l247_c6_15ed_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_halt_uxn_stack_h_l248_c12_b1b1_ins := VAR_ins;
     VAR_stack_data_set_uxn_stack_h_l257_c3_5a53_stack_index := VAR_stack_index;
     VAR_stack_data_set_uxn_stack_h_l258_c3_59b3_stack_index := VAR_stack_index;
     VAR_stack_pointer_get_uxn_stack_h_l247_c6_15ed_stack_index := VAR_stack_index;
     VAR_stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_743e_stack_index := VAR_stack_index;
     VAR_stack_pointer_move_uxn_stack_h_l259_c3_99ae_stack_index := VAR_stack_index;
     VAR_tmp_MUX_uxn_stack_h_l255_c2_c376_iffalse := tmp;
     VAR_CONST_SR_8_uxn_stack_h_l257_c73_2983_x := VAR_value;
     VAR_tmp_MUX_uxn_stack_h_l255_c2_c376_iftrue := VAR_value;
     -- CAST_TO_uint8_t[uxn_stack_h_l258_c67_79ed] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_stack_h_l258_c67_79ed_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_value);

     -- CONST_SR_8[uxn_stack_h_l257_c73_2983] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_stack_h_l257_c73_2983_x <= VAR_CONST_SR_8_uxn_stack_h_l257_c73_2983_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_stack_h_l257_c73_2983_return_output := CONST_SR_8_uxn_stack_h_l257_c73_2983_return_output;

     -- stack_pointer_get[uxn_stack_h_l247_c6_15ed] LATENCY=0
     -- Clock enable
     stack_pointer_get_uxn_stack_h_l247_c6_15ed_CLOCK_ENABLE <= VAR_stack_pointer_get_uxn_stack_h_l247_c6_15ed_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_get_uxn_stack_h_l247_c6_15ed_stack_index <= VAR_stack_pointer_get_uxn_stack_h_l247_c6_15ed_stack_index;
     -- Outputs
     VAR_stack_pointer_get_uxn_stack_h_l247_c6_15ed_return_output := stack_pointer_get_uxn_stack_h_l247_c6_15ed_return_output;

     -- Submodule level 1
     VAR_stack_data_set_uxn_stack_h_l258_c3_59b3_value := VAR_CAST_TO_uint8_t_uxn_stack_h_l258_c67_79ed_return_output;
     VAR_BIN_OP_GT_uxn_stack_h_l247_c6_4287_left := VAR_stack_pointer_get_uxn_stack_h_l247_c6_15ed_return_output;
     -- CAST_TO_uint8_t[uxn_stack_h_l257_c63_699d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_stack_h_l257_c63_699d_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_stack_h_l257_c73_2983_return_output);

     -- BIN_OP_GT[uxn_stack_h_l247_c6_4287] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_stack_h_l247_c6_4287_left <= VAR_BIN_OP_GT_uxn_stack_h_l247_c6_4287_left;
     BIN_OP_GT_uxn_stack_h_l247_c6_4287_right <= VAR_BIN_OP_GT_uxn_stack_h_l247_c6_4287_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_stack_h_l247_c6_4287_return_output := BIN_OP_GT_uxn_stack_h_l247_c6_4287_return_output;

     -- Submodule level 2
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_8196_cond := VAR_BIN_OP_GT_uxn_stack_h_l247_c6_4287_return_output;
     VAR_halt_return_MUX_uxn_stack_h_l247_c2_f535_cond := VAR_BIN_OP_GT_uxn_stack_h_l247_c6_4287_return_output;
     VAR_result_MUX_uxn_stack_h_l247_c2_f535_cond := VAR_BIN_OP_GT_uxn_stack_h_l247_c6_4287_return_output;
     VAR_stack_data_set_uxn_stack_h_l257_c3_5a53_value := VAR_CAST_TO_uint8_t_uxn_stack_h_l257_c63_699d_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l247_c1_8196] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_8196_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_8196_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_8196_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_8196_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_8196_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_8196_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_8196_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_8196_return_output;

     -- halt_return_MUX[uxn_stack_h_l247_c2_f535] LATENCY=0
     -- Inputs
     halt_return_MUX_uxn_stack_h_l247_c2_f535_cond <= VAR_halt_return_MUX_uxn_stack_h_l247_c2_f535_cond;
     halt_return_MUX_uxn_stack_h_l247_c2_f535_iftrue <= VAR_halt_return_MUX_uxn_stack_h_l247_c2_f535_iftrue;
     halt_return_MUX_uxn_stack_h_l247_c2_f535_iffalse <= VAR_halt_return_MUX_uxn_stack_h_l247_c2_f535_iffalse;
     -- Outputs
     VAR_halt_return_MUX_uxn_stack_h_l247_c2_f535_return_output := halt_return_MUX_uxn_stack_h_l247_c2_f535_return_output;

     -- Submodule level 3
     VAR_halt_uxn_stack_h_l248_c12_b1b1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_8196_return_output;
     VAR_BIN_OP_EQ_uxn_stack_h_l255_c6_3ff8_left := VAR_halt_return_MUX_uxn_stack_h_l247_c2_f535_return_output;
     REG_VAR_halt_return := VAR_halt_return_MUX_uxn_stack_h_l247_c2_f535_return_output;
     -- BIN_OP_EQ[uxn_stack_h_l255_c6_3ff8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_stack_h_l255_c6_3ff8_left <= VAR_BIN_OP_EQ_uxn_stack_h_l255_c6_3ff8_left;
     BIN_OP_EQ_uxn_stack_h_l255_c6_3ff8_right <= VAR_BIN_OP_EQ_uxn_stack_h_l255_c6_3ff8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_stack_h_l255_c6_3ff8_return_output := BIN_OP_EQ_uxn_stack_h_l255_c6_3ff8_return_output;

     -- halt[uxn_stack_h_l248_c12_b1b1] LATENCY=0
     -- Clock enable
     halt_uxn_stack_h_l248_c12_b1b1_CLOCK_ENABLE <= VAR_halt_uxn_stack_h_l248_c12_b1b1_CLOCK_ENABLE;
     -- Inputs
     halt_uxn_stack_h_l248_c12_b1b1_ins <= VAR_halt_uxn_stack_h_l248_c12_b1b1_ins;
     halt_uxn_stack_h_l248_c12_b1b1_err <= VAR_halt_uxn_stack_h_l248_c12_b1b1_err;
     -- Outputs
     VAR_halt_uxn_stack_h_l248_c12_b1b1_return_output := halt_uxn_stack_h_l248_c12_b1b1_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_63cb_cond := VAR_BIN_OP_EQ_uxn_stack_h_l255_c6_3ff8_return_output;
     VAR_tmp_MUX_uxn_stack_h_l255_c2_c376_cond := VAR_BIN_OP_EQ_uxn_stack_h_l255_c6_3ff8_return_output;
     VAR_result_MUX_uxn_stack_h_l247_c2_f535_iftrue := VAR_halt_uxn_stack_h_l248_c12_b1b1_return_output;
     -- result_MUX[uxn_stack_h_l247_c2_f535] LATENCY=0
     -- Inputs
     result_MUX_uxn_stack_h_l247_c2_f535_cond <= VAR_result_MUX_uxn_stack_h_l247_c2_f535_cond;
     result_MUX_uxn_stack_h_l247_c2_f535_iftrue <= VAR_result_MUX_uxn_stack_h_l247_c2_f535_iftrue;
     result_MUX_uxn_stack_h_l247_c2_f535_iffalse <= VAR_result_MUX_uxn_stack_h_l247_c2_f535_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_stack_h_l247_c2_f535_return_output := result_MUX_uxn_stack_h_l247_c2_f535_return_output;

     -- tmp_MUX[uxn_stack_h_l255_c2_c376] LATENCY=0
     -- Inputs
     tmp_MUX_uxn_stack_h_l255_c2_c376_cond <= VAR_tmp_MUX_uxn_stack_h_l255_c2_c376_cond;
     tmp_MUX_uxn_stack_h_l255_c2_c376_iftrue <= VAR_tmp_MUX_uxn_stack_h_l255_c2_c376_iftrue;
     tmp_MUX_uxn_stack_h_l255_c2_c376_iffalse <= VAR_tmp_MUX_uxn_stack_h_l255_c2_c376_iffalse;
     -- Outputs
     VAR_tmp_MUX_uxn_stack_h_l255_c2_c376_return_output := tmp_MUX_uxn_stack_h_l255_c2_c376_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l255_c1_63cb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_63cb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_63cb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_63cb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_63cb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_63cb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_63cb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_63cb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_63cb_return_output;

     -- Submodule level 5
     VAR_stack_data_set_uxn_stack_h_l257_c3_5a53_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_63cb_return_output;
     VAR_stack_data_set_uxn_stack_h_l258_c3_59b3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_63cb_return_output;
     VAR_stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_743e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_63cb_return_output;
     VAR_stack_pointer_move_uxn_stack_h_l259_c3_99ae_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_63cb_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_stack_h_l247_c2_f535_return_output;
     VAR_return_output := VAR_result_MUX_uxn_stack_h_l247_c2_f535_return_output;
     REG_VAR_tmp := VAR_tmp_MUX_uxn_stack_h_l255_c2_c376_return_output;
     -- stack_pointer_move[uxn_stack_h_l259_c3_99ae] LATENCY=0
     -- Clock enable
     stack_pointer_move_uxn_stack_h_l259_c3_99ae_CLOCK_ENABLE <= VAR_stack_pointer_move_uxn_stack_h_l259_c3_99ae_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_move_uxn_stack_h_l259_c3_99ae_stack_index <= VAR_stack_pointer_move_uxn_stack_h_l259_c3_99ae_stack_index;
     stack_pointer_move_uxn_stack_h_l259_c3_99ae_adjustment <= VAR_stack_pointer_move_uxn_stack_h_l259_c3_99ae_adjustment;
     stack_pointer_move_uxn_stack_h_l259_c3_99ae_is_negative <= VAR_stack_pointer_move_uxn_stack_h_l259_c3_99ae_is_negative;
     -- Outputs

     -- stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_743e LATENCY=0
     -- Clock enable
     stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_743e_CLOCK_ENABLE <= VAR_stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_743e_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_743e_stack_index <= VAR_stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_743e_stack_index;
     -- Outputs
     VAR_stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_743e_return_output := stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_743e_return_output;

     -- Submodule level 6
     VAR_BIN_OP_PLUS_uxn_stack_h_l258_c31_9b4a_left := VAR_stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_743e_return_output;
     VAR_stack_data_set_uxn_stack_h_l257_c3_5a53_index := VAR_stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_743e_return_output;
     -- stack_data_set[uxn_stack_h_l257_c3_5a53] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_stack_h_l257_c3_5a53_CLOCK_ENABLE <= VAR_stack_data_set_uxn_stack_h_l257_c3_5a53_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_stack_h_l257_c3_5a53_stack_index <= VAR_stack_data_set_uxn_stack_h_l257_c3_5a53_stack_index;
     stack_data_set_uxn_stack_h_l257_c3_5a53_index <= VAR_stack_data_set_uxn_stack_h_l257_c3_5a53_index;
     stack_data_set_uxn_stack_h_l257_c3_5a53_value <= VAR_stack_data_set_uxn_stack_h_l257_c3_5a53_value;
     -- Outputs

     -- BIN_OP_PLUS[uxn_stack_h_l258_c31_9b4a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_stack_h_l258_c31_9b4a_left <= VAR_BIN_OP_PLUS_uxn_stack_h_l258_c31_9b4a_left;
     BIN_OP_PLUS_uxn_stack_h_l258_c31_9b4a_right <= VAR_BIN_OP_PLUS_uxn_stack_h_l258_c31_9b4a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_stack_h_l258_c31_9b4a_return_output := BIN_OP_PLUS_uxn_stack_h_l258_c31_9b4a_return_output;

     -- Submodule level 7
     VAR_stack_data_set_uxn_stack_h_l258_c3_59b3_index := resize(VAR_BIN_OP_PLUS_uxn_stack_h_l258_c31_9b4a_return_output, 8);
     -- stack_data_set[uxn_stack_h_l258_c3_59b3] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_stack_h_l258_c3_59b3_CLOCK_ENABLE <= VAR_stack_data_set_uxn_stack_h_l258_c3_59b3_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_stack_h_l258_c3_59b3_stack_index <= VAR_stack_data_set_uxn_stack_h_l258_c3_59b3_stack_index;
     stack_data_set_uxn_stack_h_l258_c3_59b3_index <= VAR_stack_data_set_uxn_stack_h_l258_c3_59b3_index;
     stack_data_set_uxn_stack_h_l258_c3_59b3_value <= VAR_stack_data_set_uxn_stack_h_l258_c3_59b3_value;
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
