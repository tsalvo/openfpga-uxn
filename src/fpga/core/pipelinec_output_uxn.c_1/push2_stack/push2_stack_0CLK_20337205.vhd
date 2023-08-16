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
entity push2_stack_0CLK_20337205 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 value : in unsigned(15 downto 0);
 return_output : out unsigned(7 downto 0));
end push2_stack_0CLK_20337205;
architecture arch of push2_stack_0CLK_20337205 is
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
-- stack_pointer_get[uxn_stack_h_l247_c6_e55f]
signal stack_pointer_get_uxn_stack_h_l247_c6_e55f_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l247_c6_e55f_stack_index : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l247_c6_e55f_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_stack_h_l247_c6_b294]
signal BIN_OP_GT_uxn_stack_h_l247_c6_b294_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l247_c6_b294_right : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_stack_h_l247_c6_b294_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l247_c1_e2de]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_e2de_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_e2de_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_e2de_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_e2de_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_stack_h_l247_c2_f062]
signal result_MUX_uxn_stack_h_l247_c2_f062_cond : unsigned(0 downto 0);
signal result_MUX_uxn_stack_h_l247_c2_f062_iftrue : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l247_c2_f062_iffalse : unsigned(7 downto 0);
signal result_MUX_uxn_stack_h_l247_c2_f062_return_output : unsigned(7 downto 0);

-- halt_return_MUX[uxn_stack_h_l247_c2_f062]
signal halt_return_MUX_uxn_stack_h_l247_c2_f062_cond : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l247_c2_f062_iftrue : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l247_c2_f062_iffalse : unsigned(0 downto 0);
signal halt_return_MUX_uxn_stack_h_l247_c2_f062_return_output : unsigned(0 downto 0);

-- halt[uxn_stack_h_l248_c12_596d]
signal halt_uxn_stack_h_l248_c12_596d_CLOCK_ENABLE : unsigned(0 downto 0);
signal halt_uxn_stack_h_l248_c12_596d_ins : unsigned(7 downto 0);
signal halt_uxn_stack_h_l248_c12_596d_err : unsigned(7 downto 0);
signal halt_uxn_stack_h_l248_c12_596d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_stack_h_l255_c6_ebf1]
signal BIN_OP_EQ_uxn_stack_h_l255_c6_ebf1_left : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l255_c6_ebf1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_stack_h_l255_c6_ebf1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l255_c1_e997]
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_e997_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_e997_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_e997_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_e997_return_output : unsigned(0 downto 0);

-- tmp_MUX[uxn_stack_h_l255_c2_450a]
signal tmp_MUX_uxn_stack_h_l255_c2_450a_cond : unsigned(0 downto 0);
signal tmp_MUX_uxn_stack_h_l255_c2_450a_iftrue : unsigned(15 downto 0);
signal tmp_MUX_uxn_stack_h_l255_c2_450a_iffalse : unsigned(15 downto 0);
signal tmp_MUX_uxn_stack_h_l255_c2_450a_return_output : unsigned(15 downto 0);

-- CONST_SR_8[uxn_stack_h_l257_c73_bc28]
signal CONST_SR_8_uxn_stack_h_l257_c73_bc28_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_stack_h_l257_c73_bc28_return_output : unsigned(15 downto 0);

-- stack_data_set[uxn_stack_h_l257_c3_c18b]
signal stack_data_set_uxn_stack_h_l257_c3_c18b_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l257_c3_c18b_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l257_c3_c18b_index : unsigned(7 downto 0);
signal stack_data_set_uxn_stack_h_l257_c3_c18b_value : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_stack_h_l258_c31_ea36]
signal BIN_OP_PLUS_uxn_stack_h_l258_c31_ea36_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l258_c31_ea36_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_stack_h_l258_c31_ea36_return_output : unsigned(8 downto 0);

-- stack_data_set[uxn_stack_h_l258_c3_c0db]
signal stack_data_set_uxn_stack_h_l258_c3_c0db_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l258_c3_c0db_stack_index : unsigned(0 downto 0);
signal stack_data_set_uxn_stack_h_l258_c3_c0db_index : unsigned(7 downto 0);
signal stack_data_set_uxn_stack_h_l258_c3_c0db_value : unsigned(7 downto 0);

-- stack_pointer_move[uxn_stack_h_l259_c3_633c]
signal stack_pointer_move_uxn_stack_h_l259_c3_633c_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_move_uxn_stack_h_l259_c3_633c_stack_index : unsigned(0 downto 0);
signal stack_pointer_move_uxn_stack_h_l259_c3_633c_adjustment : unsigned(7 downto 0);
signal stack_pointer_move_uxn_stack_h_l259_c3_633c_is_negative : unsigned(0 downto 0);

-- stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_0c7e
signal stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_0c7e_CLOCK_ENABLE : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_0c7e_stack_index : unsigned(0 downto 0);
signal stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_0c7e_return_output : unsigned(7 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- stack_pointer_get_uxn_stack_h_l247_c6_e55f
stack_pointer_get_uxn_stack_h_l247_c6_e55f : entity work.stack_pointer_get_0CLK_c35c94f1 port map (
clk,
stack_pointer_get_uxn_stack_h_l247_c6_e55f_CLOCK_ENABLE,
stack_pointer_get_uxn_stack_h_l247_c6_e55f_stack_index,
stack_pointer_get_uxn_stack_h_l247_c6_e55f_return_output);

-- BIN_OP_GT_uxn_stack_h_l247_c6_b294
BIN_OP_GT_uxn_stack_h_l247_c6_b294 : entity work.BIN_OP_GT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_stack_h_l247_c6_b294_left,
BIN_OP_GT_uxn_stack_h_l247_c6_b294_right,
BIN_OP_GT_uxn_stack_h_l247_c6_b294_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_e2de
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_e2de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_e2de_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_e2de_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_e2de_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_e2de_return_output);

-- result_MUX_uxn_stack_h_l247_c2_f062
result_MUX_uxn_stack_h_l247_c2_f062 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_MUX_uxn_stack_h_l247_c2_f062_cond,
result_MUX_uxn_stack_h_l247_c2_f062_iftrue,
result_MUX_uxn_stack_h_l247_c2_f062_iffalse,
result_MUX_uxn_stack_h_l247_c2_f062_return_output);

-- halt_return_MUX_uxn_stack_h_l247_c2_f062
halt_return_MUX_uxn_stack_h_l247_c2_f062 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
halt_return_MUX_uxn_stack_h_l247_c2_f062_cond,
halt_return_MUX_uxn_stack_h_l247_c2_f062_iftrue,
halt_return_MUX_uxn_stack_h_l247_c2_f062_iffalse,
halt_return_MUX_uxn_stack_h_l247_c2_f062_return_output);

-- halt_uxn_stack_h_l248_c12_596d
halt_uxn_stack_h_l248_c12_596d : entity work.halt_0CLK_e55decfc port map (
clk,
halt_uxn_stack_h_l248_c12_596d_CLOCK_ENABLE,
halt_uxn_stack_h_l248_c12_596d_ins,
halt_uxn_stack_h_l248_c12_596d_err,
halt_uxn_stack_h_l248_c12_596d_return_output);

-- BIN_OP_EQ_uxn_stack_h_l255_c6_ebf1
BIN_OP_EQ_uxn_stack_h_l255_c6_ebf1 : entity work.BIN_OP_EQ_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_stack_h_l255_c6_ebf1_left,
BIN_OP_EQ_uxn_stack_h_l255_c6_ebf1_right,
BIN_OP_EQ_uxn_stack_h_l255_c6_ebf1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_e997
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_e997 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_e997_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_e997_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_e997_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_e997_return_output);

-- tmp_MUX_uxn_stack_h_l255_c2_450a
tmp_MUX_uxn_stack_h_l255_c2_450a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp_MUX_uxn_stack_h_l255_c2_450a_cond,
tmp_MUX_uxn_stack_h_l255_c2_450a_iftrue,
tmp_MUX_uxn_stack_h_l255_c2_450a_iffalse,
tmp_MUX_uxn_stack_h_l255_c2_450a_return_output);

-- CONST_SR_8_uxn_stack_h_l257_c73_bc28
CONST_SR_8_uxn_stack_h_l257_c73_bc28 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_stack_h_l257_c73_bc28_x,
CONST_SR_8_uxn_stack_h_l257_c73_bc28_return_output);

-- stack_data_set_uxn_stack_h_l257_c3_c18b
stack_data_set_uxn_stack_h_l257_c3_c18b : entity work.stack_data_set_0CLK_fa018dfc port map (
clk,
stack_data_set_uxn_stack_h_l257_c3_c18b_CLOCK_ENABLE,
stack_data_set_uxn_stack_h_l257_c3_c18b_stack_index,
stack_data_set_uxn_stack_h_l257_c3_c18b_index,
stack_data_set_uxn_stack_h_l257_c3_c18b_value);

-- BIN_OP_PLUS_uxn_stack_h_l258_c31_ea36
BIN_OP_PLUS_uxn_stack_h_l258_c31_ea36 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_stack_h_l258_c31_ea36_left,
BIN_OP_PLUS_uxn_stack_h_l258_c31_ea36_right,
BIN_OP_PLUS_uxn_stack_h_l258_c31_ea36_return_output);

-- stack_data_set_uxn_stack_h_l258_c3_c0db
stack_data_set_uxn_stack_h_l258_c3_c0db : entity work.stack_data_set_0CLK_fa018dfc port map (
clk,
stack_data_set_uxn_stack_h_l258_c3_c0db_CLOCK_ENABLE,
stack_data_set_uxn_stack_h_l258_c3_c0db_stack_index,
stack_data_set_uxn_stack_h_l258_c3_c0db_index,
stack_data_set_uxn_stack_h_l258_c3_c0db_value);

-- stack_pointer_move_uxn_stack_h_l259_c3_633c
stack_pointer_move_uxn_stack_h_l259_c3_633c : entity work.stack_pointer_move_0CLK_5da82025 port map (
clk,
stack_pointer_move_uxn_stack_h_l259_c3_633c_CLOCK_ENABLE,
stack_pointer_move_uxn_stack_h_l259_c3_633c_stack_index,
stack_pointer_move_uxn_stack_h_l259_c3_633c_adjustment,
stack_pointer_move_uxn_stack_h_l259_c3_633c_is_negative);

-- stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_0c7e
stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_0c7e : entity work.stack_pointer_get_0CLK_c35c94f1 port map (
clk,
stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_0c7e_CLOCK_ENABLE,
stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_0c7e_stack_index,
stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_0c7e_return_output);



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
 stack_pointer_get_uxn_stack_h_l247_c6_e55f_return_output,
 BIN_OP_GT_uxn_stack_h_l247_c6_b294_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_e2de_return_output,
 result_MUX_uxn_stack_h_l247_c2_f062_return_output,
 halt_return_MUX_uxn_stack_h_l247_c2_f062_return_output,
 halt_uxn_stack_h_l248_c12_596d_return_output,
 BIN_OP_EQ_uxn_stack_h_l255_c6_ebf1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_e997_return_output,
 tmp_MUX_uxn_stack_h_l255_c2_450a_return_output,
 CONST_SR_8_uxn_stack_h_l257_c73_bc28_return_output,
 BIN_OP_PLUS_uxn_stack_h_l258_c31_ea36_return_output,
 stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_0c7e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(7 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_value : unsigned(15 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l247_c6_e55f_stack_index : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l247_c6_b294_left : unsigned(7 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l247_c6_e55f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l247_c6_e55f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l247_c6_b294_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_stack_h_l247_c6_b294_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_e2de_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_e2de_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_e2de_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_e2de_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l247_c2_f062_iftrue : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l247_c2_f062_iffalse : unsigned(7 downto 0);
 variable VAR_result_uxn_stack_h_l251_c3_073f : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l247_c2_f062_return_output : unsigned(7 downto 0);
 variable VAR_result_MUX_uxn_stack_h_l247_c2_f062_cond : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l247_c2_f062_iftrue : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l247_c2_f062_iffalse : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l247_c2_f062_return_output : unsigned(0 downto 0);
 variable VAR_halt_return_MUX_uxn_stack_h_l247_c2_f062_cond : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l248_c12_596d_ins : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l248_c12_596d_err : unsigned(7 downto 0);
 variable VAR_halt_uxn_stack_h_l248_c12_596d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_halt_uxn_stack_h_l248_c12_596d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l255_c6_ebf1_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l255_c6_ebf1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_stack_h_l255_c6_ebf1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_e997_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_e997_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_e997_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_e997_iffalse : unsigned(0 downto 0);
 variable VAR_tmp_MUX_uxn_stack_h_l255_c2_450a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp_MUX_uxn_stack_h_l255_c2_450a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp_MUX_uxn_stack_h_l255_c2_450a_return_output : unsigned(15 downto 0);
 variable VAR_tmp_MUX_uxn_stack_h_l255_c2_450a_cond : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l257_c3_c18b_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l257_c3_c18b_index : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l257_c3_c18b_value : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uxn_stack_h_l257_c73_bc28_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_stack_h_l257_c73_bc28_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_stack_h_l257_c63_04fb_return_output : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l257_c3_c18b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l258_c3_c0db_stack_index : unsigned(0 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l258_c3_c0db_index : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l258_c3_c0db_value : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l258_c31_ea36_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l258_c31_ea36_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_stack_h_l258_c31_ea36_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_stack_h_l258_c67_acb2_return_output : unsigned(7 downto 0);
 variable VAR_stack_data_set_uxn_stack_h_l258_c3_c0db_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_move_uxn_stack_h_l259_c3_633c_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_move_uxn_stack_h_l259_c3_633c_adjustment : unsigned(7 downto 0);
 variable VAR_stack_pointer_move_uxn_stack_h_l259_c3_633c_is_negative : unsigned(0 downto 0);
 variable VAR_stack_pointer_move_uxn_stack_h_l259_c3_633c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_0c7e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_0c7e_stack_index : unsigned(0 downto 0);
 variable VAR_stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_0c7e_return_output : unsigned(7 downto 0);
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
     VAR_halt_return_MUX_uxn_stack_h_l247_c2_f062_iffalse := to_unsigned(0, 1);
     VAR_result_uxn_stack_h_l251_c3_073f := resize(to_unsigned(0, 1), 8);
     VAR_result_MUX_uxn_stack_h_l247_c2_f062_iffalse := VAR_result_uxn_stack_h_l251_c3_073f;
     VAR_halt_uxn_stack_h_l248_c12_596d_err := resize(to_unsigned(2, 2), 8);
     VAR_stack_pointer_move_uxn_stack_h_l259_c3_633c_adjustment := resize(to_unsigned(2, 2), 8);
     VAR_BIN_OP_GT_uxn_stack_h_l247_c6_b294_right := to_unsigned(253, 8);
     VAR_stack_pointer_move_uxn_stack_h_l259_c3_633c_is_negative := to_unsigned(0, 1);
     VAR_halt_return_MUX_uxn_stack_h_l247_c2_f062_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_e997_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_e2de_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_stack_h_l255_c6_ebf1_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_stack_h_l258_c31_ea36_right := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_e2de_iftrue := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_e997_iftrue := VAR_CLOCK_ENABLE;
     VAR_stack_pointer_get_uxn_stack_h_l247_c6_e55f_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_halt_uxn_stack_h_l248_c12_596d_ins := VAR_ins;
     VAR_stack_data_set_uxn_stack_h_l257_c3_c18b_stack_index := VAR_stack_index;
     VAR_stack_data_set_uxn_stack_h_l258_c3_c0db_stack_index := VAR_stack_index;
     VAR_stack_pointer_get_uxn_stack_h_l247_c6_e55f_stack_index := VAR_stack_index;
     VAR_stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_0c7e_stack_index := VAR_stack_index;
     VAR_stack_pointer_move_uxn_stack_h_l259_c3_633c_stack_index := VAR_stack_index;
     VAR_tmp_MUX_uxn_stack_h_l255_c2_450a_iffalse := tmp;
     VAR_CONST_SR_8_uxn_stack_h_l257_c73_bc28_x := VAR_value;
     VAR_tmp_MUX_uxn_stack_h_l255_c2_450a_iftrue := VAR_value;
     -- stack_pointer_get[uxn_stack_h_l247_c6_e55f] LATENCY=0
     -- Clock enable
     stack_pointer_get_uxn_stack_h_l247_c6_e55f_CLOCK_ENABLE <= VAR_stack_pointer_get_uxn_stack_h_l247_c6_e55f_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_get_uxn_stack_h_l247_c6_e55f_stack_index <= VAR_stack_pointer_get_uxn_stack_h_l247_c6_e55f_stack_index;
     -- Outputs
     VAR_stack_pointer_get_uxn_stack_h_l247_c6_e55f_return_output := stack_pointer_get_uxn_stack_h_l247_c6_e55f_return_output;

     -- CONST_SR_8[uxn_stack_h_l257_c73_bc28] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_stack_h_l257_c73_bc28_x <= VAR_CONST_SR_8_uxn_stack_h_l257_c73_bc28_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_stack_h_l257_c73_bc28_return_output := CONST_SR_8_uxn_stack_h_l257_c73_bc28_return_output;

     -- CAST_TO_uint8_t[uxn_stack_h_l258_c67_acb2] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_stack_h_l258_c67_acb2_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_value);

     -- Submodule level 1
     VAR_stack_data_set_uxn_stack_h_l258_c3_c0db_value := VAR_CAST_TO_uint8_t_uxn_stack_h_l258_c67_acb2_return_output;
     VAR_BIN_OP_GT_uxn_stack_h_l247_c6_b294_left := VAR_stack_pointer_get_uxn_stack_h_l247_c6_e55f_return_output;
     -- BIN_OP_GT[uxn_stack_h_l247_c6_b294] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_stack_h_l247_c6_b294_left <= VAR_BIN_OP_GT_uxn_stack_h_l247_c6_b294_left;
     BIN_OP_GT_uxn_stack_h_l247_c6_b294_right <= VAR_BIN_OP_GT_uxn_stack_h_l247_c6_b294_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_stack_h_l247_c6_b294_return_output := BIN_OP_GT_uxn_stack_h_l247_c6_b294_return_output;

     -- CAST_TO_uint8_t[uxn_stack_h_l257_c63_04fb] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_stack_h_l257_c63_04fb_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_stack_h_l257_c73_bc28_return_output);

     -- Submodule level 2
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_e2de_cond := VAR_BIN_OP_GT_uxn_stack_h_l247_c6_b294_return_output;
     VAR_halt_return_MUX_uxn_stack_h_l247_c2_f062_cond := VAR_BIN_OP_GT_uxn_stack_h_l247_c6_b294_return_output;
     VAR_result_MUX_uxn_stack_h_l247_c2_f062_cond := VAR_BIN_OP_GT_uxn_stack_h_l247_c6_b294_return_output;
     VAR_stack_data_set_uxn_stack_h_l257_c3_c18b_value := VAR_CAST_TO_uint8_t_uxn_stack_h_l257_c63_04fb_return_output;
     -- halt_return_MUX[uxn_stack_h_l247_c2_f062] LATENCY=0
     -- Inputs
     halt_return_MUX_uxn_stack_h_l247_c2_f062_cond <= VAR_halt_return_MUX_uxn_stack_h_l247_c2_f062_cond;
     halt_return_MUX_uxn_stack_h_l247_c2_f062_iftrue <= VAR_halt_return_MUX_uxn_stack_h_l247_c2_f062_iftrue;
     halt_return_MUX_uxn_stack_h_l247_c2_f062_iffalse <= VAR_halt_return_MUX_uxn_stack_h_l247_c2_f062_iffalse;
     -- Outputs
     VAR_halt_return_MUX_uxn_stack_h_l247_c2_f062_return_output := halt_return_MUX_uxn_stack_h_l247_c2_f062_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l247_c1_e2de] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_e2de_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_e2de_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_e2de_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_e2de_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_e2de_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_e2de_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_e2de_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_e2de_return_output;

     -- Submodule level 3
     VAR_halt_uxn_stack_h_l248_c12_596d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l247_c1_e2de_return_output;
     VAR_BIN_OP_EQ_uxn_stack_h_l255_c6_ebf1_left := VAR_halt_return_MUX_uxn_stack_h_l247_c2_f062_return_output;
     REG_VAR_halt_return := VAR_halt_return_MUX_uxn_stack_h_l247_c2_f062_return_output;
     -- halt[uxn_stack_h_l248_c12_596d] LATENCY=0
     -- Clock enable
     halt_uxn_stack_h_l248_c12_596d_CLOCK_ENABLE <= VAR_halt_uxn_stack_h_l248_c12_596d_CLOCK_ENABLE;
     -- Inputs
     halt_uxn_stack_h_l248_c12_596d_ins <= VAR_halt_uxn_stack_h_l248_c12_596d_ins;
     halt_uxn_stack_h_l248_c12_596d_err <= VAR_halt_uxn_stack_h_l248_c12_596d_err;
     -- Outputs
     VAR_halt_uxn_stack_h_l248_c12_596d_return_output := halt_uxn_stack_h_l248_c12_596d_return_output;

     -- BIN_OP_EQ[uxn_stack_h_l255_c6_ebf1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_stack_h_l255_c6_ebf1_left <= VAR_BIN_OP_EQ_uxn_stack_h_l255_c6_ebf1_left;
     BIN_OP_EQ_uxn_stack_h_l255_c6_ebf1_right <= VAR_BIN_OP_EQ_uxn_stack_h_l255_c6_ebf1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_stack_h_l255_c6_ebf1_return_output := BIN_OP_EQ_uxn_stack_h_l255_c6_ebf1_return_output;

     -- Submodule level 4
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_e997_cond := VAR_BIN_OP_EQ_uxn_stack_h_l255_c6_ebf1_return_output;
     VAR_tmp_MUX_uxn_stack_h_l255_c2_450a_cond := VAR_BIN_OP_EQ_uxn_stack_h_l255_c6_ebf1_return_output;
     VAR_result_MUX_uxn_stack_h_l247_c2_f062_iftrue := VAR_halt_uxn_stack_h_l248_c12_596d_return_output;
     -- result_MUX[uxn_stack_h_l247_c2_f062] LATENCY=0
     -- Inputs
     result_MUX_uxn_stack_h_l247_c2_f062_cond <= VAR_result_MUX_uxn_stack_h_l247_c2_f062_cond;
     result_MUX_uxn_stack_h_l247_c2_f062_iftrue <= VAR_result_MUX_uxn_stack_h_l247_c2_f062_iftrue;
     result_MUX_uxn_stack_h_l247_c2_f062_iffalse <= VAR_result_MUX_uxn_stack_h_l247_c2_f062_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_stack_h_l247_c2_f062_return_output := result_MUX_uxn_stack_h_l247_c2_f062_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_stack_h_l255_c1_e997] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_e997_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_e997_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_e997_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_e997_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_e997_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_e997_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_e997_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_e997_return_output;

     -- tmp_MUX[uxn_stack_h_l255_c2_450a] LATENCY=0
     -- Inputs
     tmp_MUX_uxn_stack_h_l255_c2_450a_cond <= VAR_tmp_MUX_uxn_stack_h_l255_c2_450a_cond;
     tmp_MUX_uxn_stack_h_l255_c2_450a_iftrue <= VAR_tmp_MUX_uxn_stack_h_l255_c2_450a_iftrue;
     tmp_MUX_uxn_stack_h_l255_c2_450a_iffalse <= VAR_tmp_MUX_uxn_stack_h_l255_c2_450a_iffalse;
     -- Outputs
     VAR_tmp_MUX_uxn_stack_h_l255_c2_450a_return_output := tmp_MUX_uxn_stack_h_l255_c2_450a_return_output;

     -- Submodule level 5
     VAR_stack_data_set_uxn_stack_h_l257_c3_c18b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_e997_return_output;
     VAR_stack_data_set_uxn_stack_h_l258_c3_c0db_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_e997_return_output;
     VAR_stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_0c7e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_e997_return_output;
     VAR_stack_pointer_move_uxn_stack_h_l259_c3_633c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_stack_h_l255_c1_e997_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_stack_h_l247_c2_f062_return_output;
     VAR_return_output := VAR_result_MUX_uxn_stack_h_l247_c2_f062_return_output;
     REG_VAR_tmp := VAR_tmp_MUX_uxn_stack_h_l255_c2_450a_return_output;
     -- stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_0c7e LATENCY=0
     -- Clock enable
     stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_0c7e_CLOCK_ENABLE <= VAR_stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_0c7e_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_0c7e_stack_index <= VAR_stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_0c7e_stack_index;
     -- Outputs
     VAR_stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_0c7e_return_output := stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_0c7e_return_output;

     -- stack_pointer_move[uxn_stack_h_l259_c3_633c] LATENCY=0
     -- Clock enable
     stack_pointer_move_uxn_stack_h_l259_c3_633c_CLOCK_ENABLE <= VAR_stack_pointer_move_uxn_stack_h_l259_c3_633c_CLOCK_ENABLE;
     -- Inputs
     stack_pointer_move_uxn_stack_h_l259_c3_633c_stack_index <= VAR_stack_pointer_move_uxn_stack_h_l259_c3_633c_stack_index;
     stack_pointer_move_uxn_stack_h_l259_c3_633c_adjustment <= VAR_stack_pointer_move_uxn_stack_h_l259_c3_633c_adjustment;
     stack_pointer_move_uxn_stack_h_l259_c3_633c_is_negative <= VAR_stack_pointer_move_uxn_stack_h_l259_c3_633c_is_negative;
     -- Outputs

     -- Submodule level 6
     VAR_BIN_OP_PLUS_uxn_stack_h_l258_c31_ea36_left := VAR_stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_0c7e_return_output;
     VAR_stack_data_set_uxn_stack_h_l257_c3_c18b_index := VAR_stack_pointer_get_uxn_stack_h_l257_l258_DUPLICATE_0c7e_return_output;
     -- stack_data_set[uxn_stack_h_l257_c3_c18b] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_stack_h_l257_c3_c18b_CLOCK_ENABLE <= VAR_stack_data_set_uxn_stack_h_l257_c3_c18b_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_stack_h_l257_c3_c18b_stack_index <= VAR_stack_data_set_uxn_stack_h_l257_c3_c18b_stack_index;
     stack_data_set_uxn_stack_h_l257_c3_c18b_index <= VAR_stack_data_set_uxn_stack_h_l257_c3_c18b_index;
     stack_data_set_uxn_stack_h_l257_c3_c18b_value <= VAR_stack_data_set_uxn_stack_h_l257_c3_c18b_value;
     -- Outputs

     -- BIN_OP_PLUS[uxn_stack_h_l258_c31_ea36] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_stack_h_l258_c31_ea36_left <= VAR_BIN_OP_PLUS_uxn_stack_h_l258_c31_ea36_left;
     BIN_OP_PLUS_uxn_stack_h_l258_c31_ea36_right <= VAR_BIN_OP_PLUS_uxn_stack_h_l258_c31_ea36_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_stack_h_l258_c31_ea36_return_output := BIN_OP_PLUS_uxn_stack_h_l258_c31_ea36_return_output;

     -- Submodule level 7
     VAR_stack_data_set_uxn_stack_h_l258_c3_c0db_index := resize(VAR_BIN_OP_PLUS_uxn_stack_h_l258_c31_ea36_return_output, 8);
     -- stack_data_set[uxn_stack_h_l258_c3_c0db] LATENCY=0
     -- Clock enable
     stack_data_set_uxn_stack_h_l258_c3_c0db_CLOCK_ENABLE <= VAR_stack_data_set_uxn_stack_h_l258_c3_c0db_CLOCK_ENABLE;
     -- Inputs
     stack_data_set_uxn_stack_h_l258_c3_c0db_stack_index <= VAR_stack_data_set_uxn_stack_h_l258_c3_c0db_stack_index;
     stack_data_set_uxn_stack_h_l258_c3_c0db_index <= VAR_stack_data_set_uxn_stack_h_l258_c3_c0db_index;
     stack_data_set_uxn_stack_h_l258_c3_c0db_value <= VAR_stack_data_set_uxn_stack_h_l258_c3_c0db_value;
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
